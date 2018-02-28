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

public partial class Admin_Order_View : System.Web.UI.Page
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
    int Order_Id;
    string Order_Type;
    protected void Page_Load(object sender, EventArgs e)
    {
        User_Role_Id = Session["Role_Id"].ToString();
        if (Session["userid"] == null)
        {

            Response.Redirect("~/Login.aspx");
        }
        else
        {

            userid = int.Parse(Session["userid"].ToString());
            Order_Id = int.Parse(Session["order_id"].ToString());
            Empname = Session["Empname"].ToString();
            Order_Type = Session["Order_Type"].ToString();
            BRANCH_ID = int.Parse(Session["Branch_id"].ToString());
        }
        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }
        if (!IsPostBack)
        {
            DivCreate.Visible = true;
          
         
            dbc.BindClientName(ddl_ClientName);
            dbc.BindState(ddl_State);
            dbc.BindOrderType(ddl_ordertype);
            dbc.BindOrderStatus(ddl_orderstatus);
            dbc.BindOrderTask(ddl_ordersTask);
            Bind_Order_Details();
        }

    }
    protected void Bind_Order_Details()
    {

        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
        htselect.Add("@Trans", "SELECT_ORDER_WISE");
        htselect.Add("@Order_ID",Order_Id);
        dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
        if (dtselect.Rows.Count > 0)
        {

            txt_OrderNumber.Text = dtselect.Rows[0]["Client_Order_Number"].ToString();

            ddl_ordertype.SelectedValue = dtselect.Rows[0]["Order_Type"].ToString();
            ddl_ordersTask.SelectedValue = dtselect.Rows[0]["Order_Task_Id"].ToString();
            ddl_ClientName.SelectedValue = dtselect.Rows[0]["Client_Id"].ToString();
            dbc.BindSubProcessName(ddl_SubProcess, int.Parse(ddl_ClientName.SelectedValue.ToString()));
            ddl_SubProcess.SelectedValue = dtselect.Rows[0]["Sub_ProcessId"].ToString();
            txt_PhoneNumber.Text = dtselect.Rows[0]["Phone_Number"].ToString();
            txt_ParcelNumber.Text = dtselect.Rows[0]["Parecel_Id"].ToString();
            txt_ContractNumber.Text = dtselect.Rows[0]["Contract_Number"].ToString();
            txt_BatchNumber.Text = dtselect.Rows[0]["Batch_Number"].ToString();
            txt_LoanNumber.Text = dtselect.Rows[0]["Loan_Number"].ToString();
            txt_ZipCode.Text = dtselect.Rows[0]["Barrower_Zip"].ToString();
            txt_City.Text = dtselect.Rows[0]["Barrower_City"].ToString();
            ddl_State.SelectedValue = dtselect.Rows[0]["Barrower_State"].ToString();
            dbc.BindCounty(ddl_County, int.Parse(ddl_State.SelectedValue.ToString()));
            ddl_County.SelectedValue = dtselect.Rows[0]["Barrower_County"].ToString();
            ddl_orderstatus.SelectedValue = dtselect.Rows[0]["Order_Status"].ToString();
            txt_BorrowerFirstname.Text = dtselect.Rows[0]["Borrower_Name"].ToString();
            txt_BorrowerLastname.Text = dtselect.Rows[0]["Last_Name"].ToString();
            txt_Date.Text = dtselect.Rows[0]["Date"].ToString();
            txt_Notes.Text = dtselect.Rows[0]["Notes"].ToString();
            txt_BarrowerAddress.Text = dtselect.Rows[0]["Barrower_Address"].ToString();

            grd_Bind_Order_Task_Details();
            grd_Bind_Comment_Details();
        }

    }
    protected void grd_Bind_Order_Task_Details()
    {
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htuser.Add("@Trans", "GET_ORDER_TASK_INFO");
        htuser.Add("@Order_ID", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Order_Task.Visible = true;
            grd_Order_Task.DataSource = dtuser;
            grd_Order_Task.DataBind();

        }
        else
        {

            grd_Order_Task.DataSource = null;
            grd_Order_Task.EmptyDataText = "No Records Found";
            grd_Order_Task.DataBind();

        }

    }
    protected void grd_Bind_Comment_Details()
    {
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htuser.Add("@Trans", "SELECT_COMMENT_INFO_ORDER_WISE");
        htuser.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Order_Comments", htuser);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Order_Comments.Visible = true;
            grd_Order_Comments.DataSource = dtuser;
            grd_Order_Comments.DataBind();

        }
        else
        {

            grd_Order_Comments.DataSource = null;
            grd_Order_Comments.EmptyDataText = "No Records Found";
            grd_Order_Comments.DataBind();

        }

    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        if (Order_Type == "Web/Call")
        {

            Response.Redirect("~/Admin/Web_Call_Order_Research.aspx");
        
        }
        else if (Order_Type == "Mail/fax")
        {
            Response.Redirect("~/Admin/Mail_Fax_Order_Que.aspx");

        }
        else if (Order_Type == "Qc")
        {
            Response.Redirect("~/Admin/QualityQue.aspx");

        }
        else if (Order_Type == "Web/Call Orders Allocation")
        {
            Session["Ordertype"] = "Web/Call";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");

        }
        else if (Order_Type == "Mail/Fax Order Allocation")
        {

            Session["Ordertype"] = "Mail/Fax";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");


        }
        else if (Order_Type == "QC Orders Allocation")
        {
            Session["OrderType"] = "QC";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");


        }
        else if (Order_Type == "Client Hold Orders Allocation")
        {
            Session["Ordertype"] = "Hold";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");


        }
        else if (Order_Type == "Clarification Orders Allocation")
        {
            Session["Ordertype"] = "Clarification";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");


        }
        else if (Order_Type == "Cancelled Orders Allocation")
        {
            Session["Ordertype"] = "Cancelled";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");


        }
        else if (Order_Type == "Completed Orders Allocation")
        {
            Session["Ordertype"] = "Completed";
            Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");

        }

        else
        {

            Response.Redirect("~/Tax_Admin_Home.aspx");
        }
    }
    protected void ddl_ClientName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_ClientName.SelectedIndex > 0)
        {

            dbc.BindSubProcessName(ddl_SubProcess, int.Parse(ddl_ClientName.SelectedValue.ToString()));
        }
    }
    protected void ddl_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_State.SelectedIndex > 0)
        {

            dbc.BindCounty(ddl_County, int.Parse(ddl_State.SelectedValue.ToString()));
        }
    }
    private bool Validation()
    {

        if (txt_OrderNumber.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Order Number')</script>", false);
            txt_OrderNumber.Focus();
            txt_OrderNumber.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_OrderNumber.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (ddl_ClientName.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Customer Name')</script>", false);
            ddl_ClientName.Focus();
            ddl_ClientName.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_ClientName.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (ddl_SubProcess.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select SubProcess')</script>", false);
            ddl_SubProcess.Focus();
            ddl_SubProcess.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_SubProcess.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (ddl_ordertype.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Order Type')</script>", false);
            ddl_ordertype.Focus();
            ddl_ordertype.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_ordertype.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (ddl_ordersTask.SelectedIndex <= 0)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Order Task')</script>", false);
            ddl_ordersTask.Focus();
            return false;
        }
        //if (ddl_State.SelectedIndex <= 0)
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select State')</script>", false);
        //    ddl_State.Focus();
        //    ddl_State.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else
        //{

        //    ddl_State.BorderColor = System.Drawing.Color.DarkBlue;
        //}
        //if (ddl_County.SelectedIndex <= 0)
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select County')</script>", false);
        //    ddl_County.Focus();
        //    ddl_County.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else
        //{

        //    ddl_County.BorderColor = System.Drawing.Color.DarkBlue;
        //}

        if (txt_Date.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Vender Number')</script>", false);
            txt_Date.Focus();
            txt_Date.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_Date.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (txt_ParcelNumber.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Parcel Number')</script>", false);
            txt_ParcelNumber.Focus();
            txt_ParcelNumber.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_ParcelNumber.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (txt_BorrowerFirstname.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Borrower Name')</script>", false);
            txt_BorrowerFirstname.Focus();
            txt_BorrowerFirstname.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_BorrowerFirstname.BorderColor = System.Drawing.Color.DarkBlue;
        }
        return true;


    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        if (Validation() != false)
        {
       
            string Clientordernumber = txt_OrderNumber.Text.ToUpper().ToString();
            int ordertype = int.Parse(ddl_ordertype.SelectedValue.ToString());
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());

            int subprocessid = int.Parse(ddl_SubProcess.SelectedValue.ToString());

            string BarrowerFirstname = txt_BorrowerFirstname.Text.ToUpper().ToString();
            string BarrowerLastName = txt_BorrowerLastname.Text.ToUpper().ToString();
            string zipcode = txt_ZipCode.Text.ToString();
            string City = txt_City.Text.ToUpper().ToString();
            int state = int.Parse(ddl_State.SelectedValue.ToString());
            int county = int.Parse(ddl_County.SelectedValue.ToString());
            string address = txt_BarrowerAddress.Text.ToUpper().ToString();
            string LoanNumber = txt_LoanNumber.Text.ToString();
            string ContractNumber = txt_ContractNumber.Text.ToString();
            string BatchNumber = txt_BatchNumber.Text.ToString();
            string PhoneNumber = txt_PhoneNumber.Text.ToString();
            int status = int.Parse(ddl_orderstatus.SelectedValue.ToString());

            string ParcelNo = txt_ParcelNumber.Text.ToString();
            int Ordertask = int.Parse(ddl_ordersTask.SelectedValue.ToString());

            int OrderStatus = int.Parse(ddl_orderstatus.SelectedValue.ToString());
            string Notes = txt_Notes.Text.ToUpper().ToString();






            string Recived = txt_Date.Text.ToString();
            Hashtable htorder = new Hashtable();
            DataTable dtorder = new DataTable();

         
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            htorder.Add("@Trans", "UPDATE");
            htorder.Add("@Order_ID",Order_Id);
            htorder.Add("@Sub_ProcessId", subprocessid);
            htorder.Add("@Order_Type", ordertype);
            htorder.Add("@Date", Recived);
            htorder.Add("@Client_Order_Number", Clientordernumber);
            htorder.Add("@Loan_Number", LoanNumber);
            htorder.Add("@Borrower_Name", BarrowerFirstname);
            htorder.Add("@Last_Name", BarrowerLastName);
            htorder.Add("@Barrower_Address", txt_BarrowerAddress.Text);
            htorder.Add("@Barrower_State", state);
            htorder.Add("@Barrower_County", county);
            htorder.Add("@Barrower_City", City);
            htorder.Add("@Barrower_Zip", zipcode);
            htorder.Add("@Parecel_Id", ParcelNo);
            htorder.Add("@Phone_Number", PhoneNumber);
            htorder.Add("@Contract_Number", ContractNumber);
            htorder.Add("@Batch_Number", BatchNumber);
            htorder.Add("@Notes", Notes);
            htorder.Add("@Order_Status", OrderStatus);
            htorder.Add("@Order_Task", Ordertask);
            htorder.Add("@Inserted_By", userid);
            htorder.Add("@Inserted_date", date);
            htorder.Add("@status", true);
            dtorder = dataaccess.ExecuteSP("Sp_Order", htorder);


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Updated Sucessfully')</script>", false);
          
            Clear_Order_Details();




        }

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Clear_Order_Details();
    }
    protected void Clear_Order_Details()
    {
        txt_OrderNumber.Text = "";

        ddl_ordertype.SelectedIndex = 0;
        ddl_ClientName.SelectedIndex = 0;
        ddl_ordersTask.SelectedIndex = 0;
        //ddl_SubProcess.SelectedIndex = 0;

        txt_ParcelNumber.Text = "";
        txt_ContractNumber.Text = "";
        txt_BatchNumber.Text = "";
        txt_LoanNumber.Text = "";
        txt_ZipCode.Text = "";
        txt_City.Text = "";
        ddl_State.SelectedIndex = 0;
        //ddl_County.SelectedIndex = 0;
        ddl_orderstatus.SelectedIndex = 0;
        txt_BorrowerFirstname.Text = "";
        txt_BorrowerLastname.Text = "";
        txt_Date.Text = "";
        txt_Notes.Text = "";
        txt_PhoneNumber.Text = "";
        txt_BarrowerAddress.Text = "";
        ddl_ordersTask.Enabled = true;
        ddl_orderstatus.Enabled = true;



    }
}