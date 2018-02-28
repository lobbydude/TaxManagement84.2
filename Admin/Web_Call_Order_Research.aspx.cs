using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Web.UI.HtmlControls;


public partial class Admin_Web_Call_Order_Research : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
    int Count;
    Hashtable htselect = new Hashtable();
    DataTable dtselect = new DataTable();
    Genral gen = new Genral();
    int BRANCH_ID;
    int client_Id, Subprocess_id;
    string My_Orders, User_Orders, Operations, User_Role_Id;
    DataTable dtsearch = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {

            Response.Redirect("~/Login.aspx");
        }
        else
        {

            userid = int.Parse(Session["userid"].ToString());
            Empname = Session["Empname"].ToString();
            BRANCH_ID = int.Parse(Session["Branch_id"].ToString());
            User_Role_Id = Session["Role_Id"].ToString();
        }
        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }
        if (!IsPostBack)
        {

                Get_Count_Of_Orders();
                btn_My_Order_Click(sender, e);
                if (User_Role_Id == "2")
                {

                    btn_User_Order.Visible = false;
                }
                else
                {

                    btn_User_Order.Visible = true;
                }
            
               
               
        }

    }

    protected void Get_Count_Of_Orders()
    {
        
       
        Hashtable htMyweb = new Hashtable();
        DataTable dtMyweb = new System.Data.DataTable();
        htMyweb.Add("@Trans", "TOT_USER_WEB_FOR_WORK");
        htMyweb.Add("@User_Id", userid);

        dtMyweb = dataaccess.ExecuteSP("Sp_Order_Count", htMyweb);
        if (dtMyweb.Rows.Count > 0)
        {
            My_Orders = "My Orders  "  +  "(" +dtMyweb.Rows[0]["count"].ToString()+")";
            btn_My_Order.Text = My_Orders.ToString();

        }
        else
        {

            My_Orders = "My Orders  " + "(" + "0" + ")";
            btn_My_Order.Text = My_Orders.ToString();
        }

        Hashtable htUserWeb = new Hashtable();
        DataTable dtUserWeb = new System.Data.DataTable();
        htUserWeb.Add("@Trans", "TOT_EXCLUDE_USER_WEB_FOR_WORK");
        htUserWeb.Add("@User_Id", userid);
        dtUserWeb = dataaccess.ExecuteSP("Sp_Order_Count", htUserWeb);

        if (dtUserWeb.Rows.Count > 0)
        {
            User_Orders = "User Orders  " + "(" + dtUserWeb.Rows[0]["count"].ToString() + ")";
            btn_User_Order.Text = User_Orders.ToString();
          

        }
        else
        {

            User_Orders = "User Orders  "  + "(" + "0" + ")";
            btn_User_Order.Text = User_Orders.ToString();
        }

      

    }
    protected void Gridview_Bind_Assigned_Orders()
    {
    
            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            if (Operations == "My_Orders")
            {
                htuser.Add("@Trans", "GET_WEB_SEARCH_ORDERS_USERWISE");
            }
            else if (Operations == "User_Orders")
            {
                htuser.Add("@Trans", "GET_WEB_SEARCH_ORDERS_EXCLUDE_USERWISE");

            }
            htuser.Add("@User_Id",userid);
            dtuser = dataaccess.ExecuteSP("Sp_Web_Mail_Qc_Order", htuser);
            ViewState["Data"] = dtuser;
            if (dtuser.Rows.Count > 0)
            {
                //ex2.Visible = true;
                grd_Assigned_Orders.Visible = true;
                grd_Assigned_Orders.DataSource = dtuser;
                grd_Assigned_Orders.DataBind();

            }
            else
            {

                grd_Assigned_Orders.DataSource = null;
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }
      
    }

    
    protected void Gridview_Bind_Pending_Orders()
    {

        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();
        if (Operations == "My_Orders")
        {
            htuser.Add("@Trans", "GET_WEB_PENDING_ORDERS_USER_WISE");
        }
        else if (Operations == "User_Orders")
        {
            htuser.Add("@Trans", "GET_WEB_PENDING_ORDERS_EXCLUDE_USER_WISE");

        }
        else if (Operations == "My_Orders")
        {
            htuser.Add("@Trans", "GET_WEB_PENDING_ORDERS_EXCLUDE_USER_WISE");
        }

        else if (Operations == "User_Orders")
        {
            htuser.Add("@Trans", "USER_EXCLUDE_ASSIGNED_ORDER");

        }
      
        htuser.Add("@User_Id", userid);
        dtuser = dataaccess.ExecuteSP("Sp_Web_Mail_Qc_Order", htuser);
        ViewState["Data1"] = dtuser;
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Pending_Orders.Visible = true;
            grd_Pending_Orders.DataSource = dtuser;
            grd_Pending_Orders.DataBind();

        }
        else
        {

            grd_Pending_Orders.DataSource = null;
            grd_Pending_Orders.EmptyDataText = "No Orders Are Avilable";
            grd_Pending_Orders.DataBind();

        }

    }
    protected void btn_Reallocate_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {

    }
   
    protected void btn_My_Order_Click(object sender, EventArgs e)
    {
        Operations = "My_Orders";
        ViewState["Operation"] = Operations.ToString();
        Gridview_Bind_Assigned_Orders();
        Gridview_Bind_Pending_Orders();
    }
    protected void btn_User_Order_Click(object sender, EventArgs e)
    {
        Operations = "User_Orders";
        ViewState["Operation"] = Operations.ToString();
        Gridview_Bind_Assigned_Orders();
        Gridview_Bind_Pending_Orders();
    }
    protected void grd_Assigned_Orders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SelectDetails")
        {

            if (User_Role_Id == "1" && ViewState["Operation"].ToString() == "User_Orders")
            {

                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
                Label lbl_Subprocess_Id = (Label)row.FindControl("lbl_Subrocessid");
                Label lbl_Clientid = (Label)row.FindControl("lbl_Clientid");
                Session["order_id"] = lbl_Order_ID.Text;
                Session["Order_Type"] = "Web/Call";

                Response.Redirect("~/Admin/Order_View.aspx");
            }
            else
            {


                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
                Label lbl_Subprocess_Id = (Label)row.FindControl("lbl_Subrocessid");
                Label lbl_Clientid = (Label)row.FindControl("lbl_Clientid");
                Label lblProduct_Type_Id = (Label)row.FindControl("lblProduct_Type_Id");
                Session["order_id"] = lbl_Order_ID.Text;
                Session["Order_Type"] = 1;

                Subprocess_id = int.Parse(lbl_Subprocess_Id.Text);
                //if (Subprocess_id == 4)
                //{
                //    Session["order_id"] = lbl_Order_ID.Text;

                Session["Order_Type"] = "Web/Call";
                Session["client_Id"] = lbl_Clientid.Text;
                Session["subProcess_id"] = lbl_Subprocess_Id.Text;
                if (lblProduct_Type_Id.Text == "1")
                {
                    Response.Redirect("~/Tax_Entry/Tax_Entry.aspx");
                }
                else if (lblProduct_Type_Id.Text == "2")
                {

                    Response.Redirect("~/Tax_Entry/Code_Violation.aspx");
                }


                //    }
                //    else if (Subprocess_id == 6)
                //    {



                //        Session["order_id"] = lbl_Order_ID.Text;

                //        Session["Order_Type"] = "Web/Call";
                //        Session["client_Id"] = lbl_Clientid.Text;
                //        Session["subProcess_id"] = lbl_Subprocess_Id.Text;

                //        Response.Redirect("~/Lereta/Tax_Entry.aspx");
                //    }
                //    else
                //    {

                //        Session["order_id"] = lbl_Order_ID.Text;
                //        Session["Order_Type"] = "Web/Call";
                //        Response.Redirect("~/Admin/Web_Order_Tax_Create.aspx");

                //    }
                //}
            }
        }
    }
    protected void grd_Pending_Orders_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (User_Role_Id == "1" && ViewState["Operation"].ToString() == "User_Orders")
        {

            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lblPendingOrder_id = (Label)row.FindControl("lblPendingOrder_id");
            Label lbl_PendigSubrocessid = (Label)row.FindControl("lbl_PendigSubrocessid");
            Label lbl_PendigClient_id = (Label)row.FindControl("lblPendingCustomer_Id");
            Session["order_id"] = lblPendingOrder_id.Text;
            Session["Order_Type"] = "Web/Call";
            Response.Redirect("~/Admin/Order_View.aspx");
        }
        else
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lblPendingOrder_id = (Label)row.FindControl("lblPendingOrder_id");
            Label lbl_PendigSubrocessid = (Label)row.FindControl("lbl_PendigSubrocessid");
            Label lbl_PendigClient_id = (Label)row.FindControl("lblPendingCustomer_Id");
            Label lblProduct_Type_Id = (Label)row.FindControl("lblPendProduct_Type_Id");
            Subprocess_id = int.Parse(lbl_PendigSubrocessid.Text);


            //if (Subprocess_id == 4)
            //{
                Session["order_id"] = lblPendingOrder_id.Text;


                Session["Order_Type"] = "Web/Call";

                Session["client_Id"] = lbl_PendigClient_id.Text;
                Session["subProcess_id"] = lbl_PendigSubrocessid.Text;


                if (lblProduct_Type_Id.Text == "1")
                {
                    Response.Redirect("~/Tax_Entry/Tax_Entry.aspx");
                }
                else if (lblProduct_Type_Id.Text == "2")
                {

                    Response.Redirect("~/Tax_Entry/Code_Violation.aspx");
                }

            //}
            //else if (Subprocess_id == 6)
            //{


            //    Session["order_id"] = lblPendingOrder_id.Text;


            //    Session["Order_Type"] = "Web/Call";

            //    Session["client_Id"] = lbl_PendigClient_id.Text;
            //    Session["subProcess_id"] = lbl_PendigSubrocessid.Text;
            //    //Response.Redirect("~/Gls/Gls_Orders_Tax_Entry.aspx");
            //    Response.Redirect("~/Lereta/Tax_Entry.aspx");

            //}
            //else
            //{

            //    Session["order_id"] = lblPendingOrder_id.Text;
            //    Session["Order_Type"] = "Web/Call";
            //    Response.Redirect("~/Admin/Web_Order_Tax_Create.aspx");

            //}
        }
    }
    protected void grd_Assigned_Orders_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            Label lbl_customerName = (Label)e.Row.FindControl("lblCustomer");
            Label lbl_Sub_ProcessName = (Label)e.Row.FindControl("lblSubProcess");
            Label lbl_customer_Code = (Label)e.Row.FindControl("lblCustomerCode");
            Label lbl_sub_process_Code = (Label)e.Row.FindControl("lblSubProcessCode");


            Label lbl_Btn = (Label)e.Row.FindControl("lblOrder_Type");
            Button btn_ClientOrder_Number = (Button)e.Row.FindControl("btn_ClientOrder_Number");
            if (lbl_Btn.Text == "Tax Certificate")
            {

                btn_ClientOrder_Number.CssClass = "WebHRButtons_Blue";

                //img_Btn_Priority.Visible = true;
                //img_Btn_Priority.ImageUrl = "~/img/Priority_Rush.png";
                //img_Btn_Priority.ToolTip = "Rush Priority Order";


            }
            else if (lbl_Btn.Text == "Code Violation")
            {

                btn_ClientOrder_Number.CssClass = "orange";
            }
            else
            {


            }

        if (User_Role_Id == "1")
        {

            //lbl_customer_Code.Visible = false;
            //lbl_sub_process_Code.Visible = false;
            grd_Assigned_Orders.Columns[4].Visible = false;
            grd_Assigned_Orders.Columns[5].Visible = false;

           


        }
        else if (User_Role_Id == "2")
        {

            //lbl_customerName.Visible = false;
            //lbl_Sub_ProcessName.Visible = false;
            grd_Assigned_Orders.Columns[2].Visible = false;
            grd_Assigned_Orders.Columns[3].Visible = false;

        }
        }

    }
    protected void grd_Pending_Orders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            Label lbl_customerName = (Label)e.Row.FindControl("lblPendingCustomer");
            Label lbl_Sub_ProcessName = (Label)e.Row.FindControl("lblPendingSubProcess");
            Label lbl_customer_Code = (Label)e.Row.FindControl("lblPendingCustomer_Code");
            Label lbl_sub_process_Code = (Label)e.Row.FindControl("lblPendingSubProcess_Code");

            if (User_Role_Id == "1")
            {



                grd_Pending_Orders.Columns[4].Visible = false;
                grd_Pending_Orders.Columns[5].Visible = false;




            }
            else if (User_Role_Id == "2")
            {
                grd_Pending_Orders.Columns[2].Visible = false;
                grd_Pending_Orders.Columns[3].Visible = false;

              

            }

            Label lbl_Btn = (Label)e.Row.FindControl("lblPendingOrder_Type");
            Button btn_ClientOrder_Number = (Button)e.Row.FindControl("btnPending_ClientOrder_Number");
            if (lbl_Btn.Text == "Tax Certificate")
            {

                btn_ClientOrder_Number.CssClass = "WebHRButtons_Blue";

                //img_Btn_Priority.Visible = true;
                //img_Btn_Priority.ImageUrl = "~/img/Priority_Rush.png";
                //img_Btn_Priority.ToolTip = "Rush Priority Order";


            }
            else if (lbl_Btn.Text == "Code Violation")
            {

                btn_ClientOrder_Number.CssClass = "orange";
            }
            else
            {


            }
        }
    }
    protected void txt_Search_By_TextChanged(object sender, EventArgs e)
    {
        string search = txt_Search_By.Text.ToString();


        dtsearch = (DataTable)ViewState["Data"];
        DataView dvserch = new DataView(dtsearch);

        if (search != "")
        {

            dvserch.RowFilter = "Client_Order_Number like '" + search.ToString() + "%' or Date like '" + search.ToString() + "%' or  Client_Name like '" + search.ToString() + "%' or Sub_ProcessName like '" + search.ToString() + "%' or Order_Status like '" + search.ToString() + "%' or User_Name like '" + search.ToString() + "%' or Product_Type like '" + search.ToString() + "%'  ";

            DataTable dt = dvserch.ToTable();


            if (dt.Rows.Count > 0)
            {

                grd_Assigned_Orders.DataSource = dvserch;
                grd_Assigned_Orders.DataBind();
                dtsearch.Clear();
            }
            else
            {
                Gridview_Bind_Assigned_Orders();

            }
        }

    }
    protected void txt_Pending_Search_TextChanged(object sender, EventArgs e)
    {
        string search = txt_Search_By.Text.ToString();


        dtsearch = (DataTable)ViewState["Data1"];
        DataView dvserch = new DataView(dtsearch);

        if (search != "")
        {

            dvserch.RowFilter = "Client_Order_Number like '" + search.ToString() + "%' or Date like '" + search.ToString() + "%' or  Client_Name like '" + search.ToString() + "%' or Sub_ProcessName like '" + search.ToString() + "%' or Order_Status like '" + search.ToString() + "%' or User_Name like '" + search.ToString() + "%' or Product_Type like '" + search.ToString() + "%'  ";

            DataTable dt = dvserch.ToTable();


            if (dt.Rows.Count > 0)
            {

                grd_Pending_Orders.DataSource = dvserch;
                grd_Pending_Orders.DataBind();
                dtsearch.Clear();
            }
            else
            {
                Gridview_Bind_Pending_Orders();
                 

            }




        }
    }
}