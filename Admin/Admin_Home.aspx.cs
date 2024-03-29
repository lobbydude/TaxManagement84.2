﻿using System;
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
public partial class Admin_Admin_Home : System.Web.UI.Page
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
           
            Empname = Session["Empname"].ToString();
            BRANCH_ID = int.Parse(Session["Branch_id"].ToString());
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
            dbc.BindOrderType(ddl_ordertype);
            dbc.BindOrderStatus(ddl_orderstatus);
            dbc.BindOrderTask(ddl_ordersTask);
            GetMaximum_OrderNumber();
        }
    }
    protected void Gridview_Bind_Orders()
    {
        


        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();
        htuser.Add("@Trans", "SELECT_ALL");
        dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
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
            htselect.Add("@Order_ID",lbl_Order_ID.Text);
            dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
            if (dtselect.Rows.Count > 0)
            {

                txt_OrderNumber.Text = dtselect.Rows[0]["Client_Order_Number"].ToString();

                ddl_ordertype.SelectedValue = dtselect.Rows[0]["Order_Type"].ToString();
                ddl_ordersTask.SelectedValue = dtselect.Rows[0]["Order_Task_Id"].ToString();
                ddl_ClientName.SelectedValue = dtselect.Rows[0]["Client_Id"].ToString();
                dbc.BindSubProcessName(ddl_SubProcess,int.Parse(ddl_ClientName.SelectedValue.ToString()));
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
                 

            }
          

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

        }

    protected void ddl_ClientName_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddl_ClientName.SelectedIndex > 0)
        {

            dbc.BindSubProcessName(ddl_SubProcess,int.Parse(ddl_ClientName.SelectedValue.ToString()));
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

            string ordernumber = ViewState["Max_OrderNumber"].ToString();
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
            htorder.Add("@Placed_By",userid);
            htorder.Add("@Order_Type", ordertype);
            htorder.Add("@Order_Number", ordernumber);
            htorder.Add("@Client_Order_Number",Clientordernumber);
            htorder.Add("@Loan_Number", LoanNumber);
            htorder.Add("@Borrower_Name",BarrowerFirstname);
            htorder.Add("@Last_Name",BarrowerLastName);
            htorder.Add("@Barrower_Address",txt_BarrowerAddress.Text);
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
           
            //ModalPopupOrder.Hide();

        }
        else if (Validation() != false && btn_Save.Text == "Edit Order")
        {
            string ordernumber = ViewState["Max_OrderNumber"].ToString();
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

                int orderid = int.Parse(ViewState["Orderid"].ToString());
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            htorder.Add("@Trans", "UPDATE");
            htorder.Add("@Order_ID", orderid);
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
            btn_Save.Text = "Add New Order";
            Gridview_Bind_Orders();
            Clear_Order_Details();
       
         
       

        }



    }
    protected void Clear_Order_Details()
    {
        txt_OrderNumber.Text="";
     
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
        DivCreate.Visible = false;
        DivView.Visible = true;
        Gridview_Bind_Orders();
        Get_Count_Of_Orders();
        dbc.BindClientName(ddl_ClientName);
        dbc.BindState(ddl_State);
        dbc.BindOrderType(ddl_ordertype);
        dbc.BindOrderStatus(ddl_orderstatus);
        dbc.BindOrderTask(ddl_ordersTask);
        GetMaximum_OrderNumber();
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
}