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
using System.Globalization;

public partial class AdminHome : System.Web.UI.Page
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
    string User_Role_Id;
    int client_Id, Subprocess_id;
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
          
            
        }
    }
   
    

    protected void Get_Count_Of_Orders()
    {
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new System.Data.DataTable();
        if (Session["s_id"].ToString() != "0")
        {
            Subprocess_id = int.Parse(Session["s_id"].ToString());

        }
        else if (Session["subProcess_id"].ToString() != "")
        {

            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());
        }
        else
        {

            Subprocess_id = 0;
        }


        
        Hashtable htwebreaserch = new Hashtable();
        DataTable dtwebresearch = new System.Data.DataTable();
        if (User_Role_Id == "2")
        {

            htwebreaserch.Add("@Trans", "TOT_USER_WEB_FOR_WORK");
            htwebreaserch.Add("@User_Id", userid);
        }
        else
        {
            htwebreaserch.Add("@Trans", "TOT_WEB_FOR_WORK");
        }

        dtwebresearch = dataaccess.ExecuteSP("Sp_Order_Count", htwebreaserch);
        if (dtwebresearch.Rows.Count > 0)
        {
            div_Web_Work.Visible = true;
            lbl_web_cal_reaserch_count.Text = dtwebresearch.Rows[0]["count"].ToString();

        }
        else
        {

            div_Web_Work.Visible = false;
        }
        Hashtable htmail_Reasrch = new Hashtable();
        DataTable dtmail_Research = new System.Data.DataTable();
        if (User_Role_Id == "2")
        {
            htmail_Reasrch.Add("@Trans", "TOT_USER_MAIL_FOR_WORK");
            htmail_Reasrch.Add("@User_Id", userid);
        }
        else
        {
            htmail_Reasrch.Add("@Trans", "TOT_MAIL_FOR_WORK");
        }

        dtmail_Research = dataaccess.ExecuteSP("Sp_Order_Count", htmail_Reasrch);
        if (dtmail_Research.Rows.Count > 0)
        {
            div_mail_work.Visible = true;
            lbl_count_mail_Fax_Que_count.Text = dtmail_Research.Rows[0]["count"].ToString();

        }
        else
        {

            div_mail_work.Visible = false;
        }
        Hashtable htqcWork = new Hashtable();
        DataTable dtqcwork = new System.Data.DataTable();

        if (User_Role_Id == "2")
        {
            htqcWork.Add("@Trans", "TOT_USER_QC_FOR_WORK");
            htqcWork.Add("@User_Id", userid);

        }

        else
        {
            htqcWork.Add("@Trans", "TOT_QC_FOR_WORK");
        }


        dtqcwork = dataaccess.ExecuteSP("Sp_Order_Count", htqcWork);
        if (dtqcwork.Rows.Count > 0)
        {
            div_Count_Qc_Que.Visible = true;
            lbl_Count_Qc_Que.Text = dtqcwork.Rows[0]["count"].ToString();

        }
        else
        {

            div_Count_Qc_Que.Visible = false;
        }



        if (User_Role_Id != "2")
        {


            htselect.Add("@Trans", "TOT_WEB_CALL_ORDERS");

            dtselect = dataaccess.ExecuteSP("Sp_Order_Count", htselect);
            if (dtselect.Rows.Count > 0)
            {
                div_web.Visible = true;
                lb_count.Text = dtselect.Rows[0]["count"].ToString();

            }
            else
            {

                //div_web.Visible = false;
            }




            Hashtable htmail = new Hashtable();
            DataTable dtmail = new System.Data.DataTable();
            htmail.Add("@Trans", "TOT_FAX_MAIL_ORDERS");

            dtmail = dataaccess.ExecuteSP("Sp_Order_Count", htmail);

            if (dtmail.Rows.Count > 0)
            {
                div_mail.Visible = true;
                lbl_count_mail_fax_Allocation.Text = dtmail.Rows[0]["count"].ToString();

            }
            else
            {

                div_mail.Visible = false;
            }



            Hashtable htqcAllocated = new Hashtable();
            DataTable dtqcAllocated = new System.Data.DataTable();
            htqcAllocated.Add("@Trans", "TOT_No_OF_WEB_CAL_MAIL_FAX_QC_ORDERS");

            dtqcAllocated = dataaccess.ExecuteSP("Sp_Order_Count", htqcAllocated);
            if (dtqcAllocated.Rows.Count > 0)
            {
                div_Qc_Allocated_Count.Visible = true;
                lbl_Qc_Allocated_Count.Text = dtqcAllocated.Rows[0]["count"].ToString();

            }
            else
            {

                div_Qc_Allocated_Count.Visible = false;
            }




            Hashtable htexport = new Hashtable();
            DataTable dtexport = new System.Data.DataTable();
            htexport.Add("@Trans", "TOT_NO_ORDERS_EXPORT");

            dtexport = dataaccess.ExecuteSP("Sp_Order_Count", htexport);
            if (dtexport.Rows.Count > 0)
            {
                div_Order_Export_Count.Visible = true;
                lbl_Order_Export_Count.Text = dtexport.Rows[0]["count"].ToString();

            }
            else
            {

                div_Order_Export_Count.Visible = false;
            }

            Hashtable hthold = new Hashtable();
            DataTable dthold = new System.Data.DataTable();
            hthold.Add("@Trans", "TOTAL_CLIENT_HOLD_ORDERS");

            dthold = dataaccess.ExecuteSP("Sp_Order_Count", hthold);
            if (dtexport.Rows.Count > 0)
            {
                div_Client_Hold.Visible = true;
                lbl_Client_Hold.Text = dthold.Rows[0]["count"].ToString();

            }
            else
            {

                div_Client_Hold.Visible = false;
            }



            Hashtable htclari = new Hashtable();
            DataTable dtclari = new System.Data.DataTable();
            htclari.Add("@Trans", "TOTAL_CLARIFICATION_ORDERS");

            dtclari = dataaccess.ExecuteSP("Sp_Order_Count", htclari);
            if (dtexport.Rows.Count > 0)
            {
                div_clarification.Visible = true;
                lbl_Clarification.Text = dtclari.Rows[0]["count"].ToString();

            }
            else
            {

                div_clarification.Visible = false;
            }

            Hashtable htcancelled = new Hashtable();
            DataTable dtcancelled = new System.Data.DataTable();
            htcancelled.Add("@Trans", "TOTAL_CANCELLED_ORDERS");

            dtcancelled = dataaccess.ExecuteSP("Sp_Order_Count", htcancelled);
            if (dtexport.Rows.Count > 0)
            {
                divcancelled.Visible = true;

                lbl_Cancelled.Text = dtcancelled.Rows[0]["count"].ToString();

            }
            else
            {

                divcancelled.Visible = false;
            }
        }
        else
        {
            lb_count.Text = "0";
            lbl_count_mail_fax_Allocation.Text = "0";
            lbl_Qc_Allocated_Count.Text = "0";
            lbl_Clarification.Text = "0";
            lbl_Cancelled.Text = "0";
            lbl_Client_Hold.Text = "0";

            lnk_webcall_allocation.Enabled = false;
            lnk_webcall_allocation1.Enabled = false;

            LinkMailFaxAllocate.Enabled = false;
            LinkMailFaxAllocate1.Enabled = false;

            LinkQualityAllocate.Enabled = false;
            LinkQualityAllocate1.Enabled = false;

            lnk_Client_Hold.Enabled = false;
            lnk_Client_Hold_Allocatiion.Enabled = false;
           
            lnk_Clarification_Allocation.Enabled = false;
            lnk_Clarifica_Alloc.Enabled = false;

            lnk_Cancelled.Enabled = false;
            lnk_Cancelled_Allocation.Enabled = false;

        }
    }



    
    
   
    public override void VerifyRenderingInServerForm(Control control)
    {
        // return;
    }
  

    protected void LinkExport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Order_Export.aspx");
    }
    protected void lnk_webcall_allocation_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Web/Call";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void LinkMailFaxAllocate_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Mail/Fax";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void LinkQualityAllocate_Click(object sender, EventArgs e)
    {
        Session["OrderType"] = "QC";//Hear it will take all the Four Type of Orders
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void LinkBtn_Order_search_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/Order_Search.aspx");
    }

 
    protected void btn_refresh_Click(object sender, EventArgs e)
    {
     
        Get_Count_Of_Orders();
     
    }
    protected void ddl_ordertype_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddl_ordertype.SelectedIndex > 0)
        //{

        //    ddl_ordersTask.SelectedValue = ddl_ordertype.SelectedValue.ToString();
        //}
        //else
        //{
        //    ddl_ordersTask.SelectedIndex = 0;

        //}
    }

    protected void lnk_webcall_allocation1_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Web/Call";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void LinkMailFaxAllocate1_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Mail/Fax";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void LinkQualityAllocate1_Click(object sender, EventArgs e)
    {
        Session["OrderType"] = "QC";//Hear it will take all the Four Type of Orders
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void LinkExport1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Order_Export.aspx");
    }
    protected void btn_DashBoard_Click(object sender, EventArgs e)
    {
        //Order_Que.Visible = false;
        //Dashboard.Visible = true;
        //td_orderque.Attributes.Add("class", "tab_border");
        //td_dash.Attributes.Add("class", "tab_actborder");
    }
    protected void btn_OrderQueue_Click(object sender, EventArgs e)
    {
        //Order_Que.Visible = true;
        //Dashboard.Visible = false;
        //td_dash.Attributes.Add("class", "tab_border");
        //td_orderque.Attributes.Add("class", "tab_actborder");
    }

    
    protected void li_dash_Click(object sender, EventArgs e)
    {

    }
    
    protected void lnk_Client_Hold_Allocatiion_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Hold";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void lnk_Clarification_Allocation_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Clarification";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void lnk_Clarifica_Alloc_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Clarification";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void lnk_Cancelled_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Cancelled";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void lnk_Cancelled_Allocation_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Cancelled";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
}