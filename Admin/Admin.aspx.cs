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
using ClosedXML.Excel;
using InfoSoftGlobal;

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
    DataTable dtgrid = new DataTable("Grid");
    int CHECK_ORDER;
    DataTable dt = new DataTable("Chart");
    string GraphWidth = "370";
    string GraphHeight = "370";
    string[] color = new string[12];
    string conn = "";
    public string Connection = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString.ToString();
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
            DivCreate.Visible = false;
            DivView.Visible = true;
            Gridview_Bind_Orders();
            Get_Count_Of_Orders();
            dbc.BindClientName(ddl_ClientName);
            dbc.BindState(ddl_State);
            dbc.BindProduct_Type(ddl_Product_Type);
            dbc.BindOrderType(ddl_ordertype);
            dbc.BindOrderStatus(ddl_orderstatus);
            dbc.BindOrderTask(ddl_ordersTask);
            GetMaximum_OrderNumber();
            ConfigureColors();
            LoadGraphData();
            CreatePieGraph();
            if (User_Role_Id == "2")
            {
                
            }
            else if(User_Role_Id=="1")
            {
                list_itemque.Attributes.Add("class", "active");
                //li_queue.Visible = true;
                //divque.Visible = true;
            }
        }
    }
    protected void Gridview_Bind_Orders()
    {

        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();
        if (rdo_CurrentOrder.Checked == true)
        {
            htuser.Add("@Trans", "SELECT_ALL");

        }
        else if (rdo_CompletedOrders.Checked == true)
        {
            htuser.Add("@Trans", "SELECT_COMPLETED");

        }


      
        dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
        ViewState["Data"] = dtuser;
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Orders.Visible = true;
            grd_Orders.DataSource = dtuser;
            grd_Orders.DataBind();

        }
        else
        {

            grd_Orders.DataSource = null;
            grd_Orders.EmptyDataText = "No Records Found";
            grd_Orders.DataBind();

        }

    }

    protected void Bind_Order_For_Export()
    {
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();
        if (rdo_CurrentOrder.Checked == true)
        {
            htuser.Add("@Trans", "SELECT_ALL_FOR_EXPORT");

        }
        else if (rdo_CompletedOrders.Checked == true)
        {
            htuser.Add("@Trans", "SELECT_COMPLETED_EXPORT");

        }



        dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
        ViewState["data"] = dtuser;
       

    }
    protected void grd_Orders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditDetails")
        {
            DivCreate.Visible = true;
            DivView.Visible = false;
            ddl_ordersTask.Enabled = false;
            ddl_orderstatus.Enabled = false;
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
            ViewState["Orderid"] = lbl_Order_ID.Text;
            btn_Save.Text = "Edit Order";
            Hashtable htselect = new Hashtable();
            DataTable dtselect = new DataTable();
            htselect.Add("@Trans", "SELECT_ORDER_WISE");
            htselect.Add("@Order_ID", lbl_Order_ID.Text);
            dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
            if (dtselect.Rows.Count > 0)
            {

                txt_OrderNumber.Text = dtselect.Rows[0]["Client_Order_Number"].ToString();

                ddl_ordertype.SelectedValue = dtselect.Rows[0]["Order_Type"].ToString();
                ddl_Product_Type.SelectedValue = dtselect.Rows[0]["Product_Type"].ToString();
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
            Gridview_Bind_Orders();
           

        }
        else if (e.CommandName == "DeleteRecord")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
            Hashtable ht = new Hashtable();
            DataTable dt = new DataTable();
            ht.Add("@Trans", "DELETE");
            ht.Add("@Order_ID", lbl_Order_ID.Text);
            dt = dataaccess.ExecuteSP("Sp_Order", ht);
            Gridview_Bind_Orders();

        }
        
    }

    protected void grd_Bind_Order_Task_Details()
    {
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htuser.Add("@Trans", "GET_ORDER_TASK_INFO");
        htuser.Add("@Order_ID", ViewState["Orderid"]);
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
        htuser.Add("@Order_Id", ViewState["Orderid"]);
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
    protected void grd_Orders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_Orders.PageIndex = e.NewPageIndex;
        Gridview_Bind_Orders();
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
        htwebreaserch.Add("@Trans", "TOT_WEB_FOR_WORK");


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
        htmail_Reasrch.Add("@Trans", "TOT_MAIL_FOR_WORK");


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
        htqcWork.Add("@Trans", "TOT_QC_FOR_WORK");


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

            Hashtable htCompleted = new Hashtable();
            DataTable dtCompleted = new System.Data.DataTable();
            htCompleted.Add("@Trans", "TOTAL_COMPLETED_ORDERS");

            dtCompleted = dataaccess.ExecuteSP("Sp_Order_Count", htCompleted);
            if (dtCompleted.Rows.Count > 0)
            {



             //   lbl_Complted_Order_Count.Text = dtCompleted.Rows[0]["count"].ToString();

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
          //  lbl_Complted_Order_Count.Text = "0";

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
    protected void btn_Add_New_Click(object sender, EventArgs e)
    {
        DivCreate.Visible = true;
        DivView.Visible = false;
        Clear_Order_Details();
        btn_Save.Text = "Add New Order";
        ddl_orderstatus.SelectedIndex = 1;


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
        if (ddl_Product_Type.SelectedIndex <= 0)
        {
            
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Order Type')</script>", false);
            ddl_Product_Type.Focus();
            ddl_Product_Type.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_Product_Type.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (ddl_ordertype.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Order Type Source')</script>", false);
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
    protected void GetMaximum_OrderNumber()
    {

        Hashtable ht_Select_Order_Number = new Hashtable();
        DataTable dt_Select_Order_Number = new DataTable();

        ht_Select_Order_Number.Add("@Trans", "MAX_ORDER_NO");
        dt_Select_Order_Number = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Number);

        if (dt_Select_Order_Number.Rows.Count > 0)
        {

            // txt_OrderNumber.Text = dt_Select_Order_Number.Rows[0]["ORDER_NUMBER"].ToString();
            ViewState["Max_OrderNumber"] = dt_Select_Order_Number.Rows[0]["ORDER_NUMBER"].ToString();
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        if (Validation() != false && btn_Save.Text == "Add New Order")
        {
            Hashtable htcheck = new Hashtable();
            DataTable dtcheck = new System.Data.DataTable();



            htcheck.Add("@Trans", "CHECK_ORDER_NUMBER");
            htcheck.Add("@Client_Order_Number", txt_OrderNumber.Text);
            dtcheck = dataaccess.ExecuteSP("Sp_Order", htcheck);
            if (dtcheck.Rows.Count > 0)
            {
                CHECK_ORDER = int.Parse(dtcheck.Rows[0]["count"].ToString());

            }
            else
            {
                CHECK_ORDER = 0;

            }

            if (CHECK_ORDER == 0)
            {

                string ordernumber = ViewState["Max_OrderNumber"].ToString();
                string Clientordernumber = txt_OrderNumber.Text.ToUpper().ToString();
                int ordertype = int.Parse(ddl_ordertype.SelectedValue.ToString());
                int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());

                int subprocessid = int.Parse(ddl_SubProcess.SelectedValue.ToString());
                int Product_Type = int.Parse(ddl_Product_Type.SelectedValue.ToString());
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


                int OrderStatus = int.Parse(ddl_orderstatus.SelectedValue.ToString());
                int Ordertask = int.Parse(ddl_ordersTask.SelectedValue.ToString());
                string Notes = txt_Notes.Text.ToUpper().ToString();



                Hashtable htorder = new Hashtable();
                DataTable dtorder = new DataTable();


                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                htorder.Add("@Trans", "INSERT");
                htorder.Add("@Branch_ID", BRANCH_ID);
                htorder.Add("@Sub_ProcessId", subprocessid);
                htorder.Add("@Date", date);
                htorder.Add("@Placed_By", userid);
                htorder.Add("@Order_Type", ordertype);
                htorder.Add("@Product_Type", Product_Type);
                htorder.Add("@Order_Number", ordernumber);
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
                htorder.Add("@Export_Status", false);

                dtorder = dataaccess.ExecuteSP("Sp_Order", htorder);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New Order Added Sucessfully')</script>", false);
                Clear_Order_Details();
                Gridview_Bind_Orders();
            }
            else
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('This Order NUmber already Exist Please Check it')</script>", false);
            }

            //ModalPopupOrder.Hide();

        }
        else if (Validation() != false && btn_Save.Text == "Edit Order")
        {
            string ordernumber = ViewState["Max_OrderNumber"].ToString();
            string Clientordernumber = txt_OrderNumber.Text.ToUpper().ToString();
            int ordertype = int.Parse(ddl_ordertype.SelectedValue.ToString());
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());

            int subprocessid = int.Parse(ddl_SubProcess.SelectedValue.ToString());
            int Product_Type = int.Parse(ddl_Product_Type.SelectedValue.ToString());
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

            int orderid = int.Parse(ViewState["Orderid"].ToString());
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            htorder.Add("@Trans", "UPDATE");
            htorder.Add("@Order_ID", orderid);
            htorder.Add("@Sub_ProcessId", subprocessid);
            htorder.Add("@Order_Type", ordertype);
            htorder.Add("@Product_Type", Product_Type);
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
            btn_Save.Text = "Add New Order";
            Gridview_Bind_Orders();
            Clear_Order_Details();


            DivCreate.Visible = false;
            DivView.Visible = true;
            

        }



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
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        DivCreate.Visible = false;
        DivView.Visible = true;
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Clear_Order_Details();
    }
    protected void btn_Import_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Orders_Import.aspx");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        // return;
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        Hashtable htruncate = new Hashtable();
        DataTable dttruncate = new System.Data.DataTable();
        htruncate.Add("@Trans", "TEMP_USER");
        dttruncate = dataaccess.ExecuteSP("Sp_Order", htruncate);



        Hashtable htuser = new Hashtable();
        DataTable dtuser1 = new System.Data.DataTable();
        htuser.Add("@Trans", "SELECT_ALL");
        dtuser1 = dataaccess.ExecuteSP("Sp_Order", htuser);
        if (dtuser1.Rows.Count > 0)
        {
            Gv_Import.DataSource = dtuser1;
            Gv_Import.DataBind();
        }

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Orders.xls"));

        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);

        Gv_Import.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
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

    protected void btn_Submit_Click(object sender, EventArgs e)
    {

        if (txt_Search_By.Text != "")
        {

            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            if (ddl_Search.SelectedItem.Text == "Order Number")
            {
                htuser.Add("@Trans", "SELECT_ORDERS_BY_ORDER_NUMBER");

            }
            else if (ddl_Search.SelectedItem.Text == "Client")
            {
                htuser.Add("@Trans", "SELECT_ORDERS_BY_CLIENT");
            }
            else if (ddl_Search.SelectedItem.Text == "Recived Date")
            {
                htuser.Add("@Trans", "GET_ORDERS_BY_DATEWISE");

            }
            else if (ddl_Search.SelectedItem.Text == "Sub Client")
            {
                htuser.Add("@Trans", "SELECT_ORDERS_BY_SUBPROCESS_WISE");
            }




            htuser.Add("@Search_Value", txt_Search_By.Text.ToString());
            dtuser = dataaccess.ExecuteSP("Sp_Order_Search", htuser);
            ViewState["Data"] = dtuser;
            if (dtuser.Rows.Count > 0)
            {
                //ex2.Visible = true;
                grd_Orders.Visible = true;
                grd_Orders.DataSource = dtuser;
                grd_Orders.DataBind();

            }
            else
            {

                grd_Orders.DataSource = null;
                grd_Orders.EmptyDataText = "No Records Found";
                grd_Orders.DataBind();

            }


        }
        else
        {

            Gridview_Bind_Orders();
        }
    }
    protected void btn_refresh_Click(object sender, EventArgs e)
    {
     
        Get_Count_Of_Orders();
        Response.Redirect("~/Tax_Admin_Home.aspx");
     
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
    protected void txt_Search_By_TextChanged(object sender, EventArgs e)
    {
        //string Selected = ddl_Search.SelectedItem.ToString();
        string search = txt_Search_By.Text.ToString();


        dtsearch = (DataTable)ViewState["Data"];
        DataView dvserch = new DataView(dtsearch);

        if (search != "")
        {
         
            dvserch.RowFilter = "Client_Order_Number like '" + search.ToString() + "%' or Date like '" + search.ToString() + "%' or  Client_Name like '" + search.ToString() + "%' or Sub_ProcessName like '" + search.ToString() + "%' or Order_Task like '" + search.ToString() + "%' or Order_Status like '" + search.ToString() + "%' or User_Name like '" + search.ToString() + "%' or Product_Type like '" + search.ToString() + "%' or State_Name like '" + search.ToString() + "' or County_Name like '" + search.ToString() + "' or Borrower_Name like '" + search.ToString() + "' or Barrower_Address like '" + search.ToString() + "'  ";

            DataTable dt = dvserch.ToTable();


            if (dt.Rows.Count > 0)
            {

                grd_Orders.DataSource = dvserch;
                grd_Orders.DataBind();

            }

            else if (dt.Rows.Count <= 0)
            {

                Hashtable htsearch = new Hashtable();
                DataTable dtsearch1 = new DataTable();
                htsearch.Add("@Trans", "SEARCH");
                htsearch.Add("@Search_By", search.ToString());
                dtsearch1 = dataaccess.ExecuteSP("Sp_Order", htsearch);

                if (dtsearch1.Rows.Count > 0)
                {


                    grd_Orders.DataSource = dtsearch1;
                    grd_Orders.DataBind();
                }
                else
                {


                    grd_Orders.DataSource = null;
                    grd_Orders.DataBind();
                }


            }
            else
            {


                grd_Orders.DataSource = null;
                grd_Orders.DataBind();
            }
        }



        //else if (Selected != "" && Selected == "Recived Date" && search != "")
        //{

        //    dvserch.RowFilter = "Date like '" + search.ToString() + "%'";
        //}
        //else if (Selected != "" && Selected == "Client" && search != "")
        //{

        //    dvserch.RowFilter = "Client_Name like '" + search.ToString() + "%'";
        //}
        //else if (Selected != "" && Selected == "Sub Client" && search != "")
        //{

        //    dvserch.RowFilter = "Sub_ProcessName like '" + search.ToString() + "%'";
        //}
        //else if (Selected != "" && Selected == "Task" && search != "")
        //{

        //    dvserch.RowFilter = "Order_Task like '" + search.ToString() + "%'";
        //}
        //else if (Selected != "" && Selected == "Status" && search != "")
        //{

        //    dvserch.RowFilter = "Order_Status like '" + search.ToString() + "%'";
        //}
        //else if (Selected != "" && Selected == "UserName" && search != "")
        //{

        //    dvserch.RowFilter = "User_Name like '" + search.ToString() + "%'";
        //}

        //else if (Selected != "" && Selected == "Order Type" && search != "")
        //{

        //    dvserch.RowFilter = "Product_Type like '" + search.ToString() + "%'";
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

    protected void li_queue_Click(object sender, EventArgs e)
    {

    }
    protected void li_dash_Click(object sender, EventArgs e)
    {

    }
    protected void rdo_CurrentOrder_CheckedChanged(object sender, EventArgs e)
    {
        if (rdo_CurrentOrder.Checked == true)
        {
            rdo_CompletedOrders.Checked = false;

            Gridview_Bind_Orders();
            
        }
        txt_Search_By.Text = "";
        
    }
    protected void rdo_CompletedOrders_CheckedChanged(object sender, EventArgs e)
    {
        if (rdo_CompletedOrders.Checked == true)
        {
            rdo_CurrentOrder.Checked = false;
            Gridview_Bind_Orders();
        }
        txt_Search_By.Text = "";
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
    protected void btn_Order_Import_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/Orders_Import.aspx");
    }
    protected void btn_Export_Click1(object sender, EventArgs e)
    {
        Bind_Order_For_Export();



        dtgrid = (DataTable)ViewState["data"];

         dtgrid.TableName = "DataGrid";
        using (XLWorkbook wb = new XLWorkbook())
        {
         
            wb.Worksheets.Add(dtgrid);

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=OrderReport.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
    protected void btn_Order_Search_Click(object sender, EventArgs e)
    {
        string Selected = ddl_Search.SelectedItem.ToString();
        string search = txt_Search_By.Text.ToString();


        dtsearch = (DataTable)ViewState["Data"];
        DataView dvserch = new DataView(dtsearch);

        if (Selected != "" && Selected == "Order Number" && search != "")
        {

            dvserch.RowFilter = "Client_Order_Number like '" + search.ToString() + "%'";

        }
        else if (Selected != "" && Selected == "Recived Date" && search != "")
        {

            dvserch.RowFilter = "Date like '" + search.ToString() + "%'";
        }
        else if (Selected != "" && Selected == "Client" && search != "")
        {

            dvserch.RowFilter = "Client_Name like '" + search.ToString() + "%'";
        }
        else if (Selected != "" && Selected == "Sub Client" && search != "")
        {

            dvserch.RowFilter = "Sub_ProcessName like '" + search.ToString() + "%'";
        }


        grd_Orders.DataSource = dvserch;
        grd_Orders.DataBind();

    }
    protected void txt_Search_By_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void lnk_Completed_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Completed";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void lnk_Completed_Order_Allocate_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Completed";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void lnk_Completed_Click1(object sender, EventArgs e)
    {

    }
    protected void lnk_Completed_Order_Allocate_Click1(object sender, EventArgs e)
    {

    }
    protected void txt_OrderNumber_TextChanged(object sender, EventArgs e)
    {
        Hashtable htcheck = new Hashtable();
        DataTable dtcheck = new System.Data.DataTable();



        htcheck.Add("@Trans", "CHECK_ORDER_NUMBER");
        htcheck.Add("@Client_Order_Number", txt_OrderNumber.Text);
        dtcheck = dataaccess.ExecuteSP("Sp_Order", htcheck);
        if (dtcheck.Rows.Count > 0)
        {
            CHECK_ORDER = int.Parse(dtcheck.Rows[0]["count"].ToString());

        }
        else
        {
            CHECK_ORDER = 0;

        }
       
            if (CHECK_ORDER>0)
            {
                User_Chk_Img.ImageUrl = "~/Admin/MsgImage/Delete1.png";
                 
              

            }
            else if (CHECK_ORDER<=0)
            {
                User_Chk_Img.ImageUrl = "~/Admin/MsgImage/Sucess.png";
            }
      
    }
    protected void lnk_Client_Hold_Click(object sender, EventArgs e)
    {
        Session["Ordertype"] = "Hold";
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void grd_Orders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_Btn = (Label)e.Row.FindControl("lblOrder_Product_Type");
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

        }
    }


    private void ConfigureColors()
    {
        color[0] = "AFD8F8";
        color[1] = "F6BD0F";
        color[2] = "8BBA00";
        color[3] = "FF8E46";
        color[4] = "008E8E";
        color[5] = "D64646";
        color[6] = "8E468E";
        color[7] = "588526";
        color[8] = "B3AA00";
        color[9] = "008ED6";
        color[10] = "9D080D";
        color[11] = "A186BE";
    }

    private DataTable LoadGraphData()
    {

        string cmd = "select Order_Status,No_of_Orders from Tbl_Temp_Dash";
        SqlDataAdapter adp = new SqlDataAdapter(cmd, Connection);
        adp.Fill(dt);

        return dt;
    }

    private void CreatePieGraph()
    {
        string strCaption = "Year wise Sales report";
        string strSubCaption = "2000 - 2008";
        string xAxis = "No_of_Orders";
        string yAxis = "Order_Status";

        //strXML will be used to store the entire XML document generated
        string strXML = null;

        //Generate the graph element
        strXML = @"<graph caption='" + strCaption + @"' subCaption='" + strSubCaption + @"' decimalPrecision='0' 
                          pieSliceDepth='30' formatNumberScale='0'
                          xAxisName='" + xAxis + @"' yAxisName='" + yAxis + @"' rotateNames='1'>";

        int i = 0;

        foreach (DataRow DR in dt.Rows)
        {
            strXML += "<set name='" + DR[0].ToString() + "' value='" + DR[1].ToString() + "' color='" + color[i] + @"'  link=&quot;JavaScript:myJS('" + DR["Order_Status"].ToString() + ", " + DR["No_of_Orders"].ToString() + "'); &quot;/>";
            i++;
        }

        //Finally, close <graph> element
        strXML += "</graph>";

        FCLiteral1.Text = FusionCharts.RenderChartHTML(
                  "FusionCharts/FCF_Line.swf", // Path to chart's SWF
                  "",                              // Leave blank when using Data String method
                  strXML,                          // xmlStr contains the chart data
                  "mygraph1",                      // Unique chart ID
                  GraphWidth, GraphHeight,                   // Width & Height of chart
                  false
                  );


    }    
}