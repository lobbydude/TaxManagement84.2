using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class Admin_Order_Create : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
    decimal Totalcost;
    Hashtable htselect = new Hashtable();
    DataTable dtselect = new DataTable();
    string OrderStatus;
    int Chk_Userid;

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
        }
       
        if (!IsPostBack)
        {


            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            txt_Date.Text = dateeval.ToString();
            GetMaximum_OrderNumber();
            //divseacrh.Visible = false;
            DivView.Visible = true;
           // Divcreate.Visible = false;
           // lblhead.Text = "Add New Order";
            dbc.BindClientName(ddl_ClientName);
            dbc.BindClientName(ddl_Search_Client_type);
            ddl_Search_Client_type.Items.Insert(1,"ALL");
            dbc.BindOrderType(ddl_order_search_Order_Type);
            ddl_order_search_Order_Type.Items.Insert(1,"ALL");
           
            dbc.BindOrderStatus(ddl_order_search_Status);
            ddl_order_search_Status.Items.Insert(1,"ALL");
            dbc.BindOrderType(ddl_ordertype);
            dbc.BindOrderStatus(ddl_orderstatus);

            dbc.BindState(ddl_State);
            txt_OrderNumber.Focus();
            GridviewbindOrderdata();
            lbl_Record_Addedby.Text = Empname.ToString();
            lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            if (RadioButtonList1.SelectedValue == "1")
            {

                divorderwise.Visible = true;
                divclientwise.Visible = false;

            }
            else if (RadioButtonList1.SelectedValue == "2")
            {

                divorderwise.Visible = false;
                divclientwise.Visible = true;
            }

        }

    }
    protected void GetMaximum_OrderNumber()
    {

        Hashtable ht_Select_Order_Number = new Hashtable();
        DataTable dt_Select_Order_Number = new DataTable();

        ht_Select_Order_Number.Add("@Trans", "MAX_ORDER_NO");
        dt_Select_Order_Number = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Number);

        if (dt_Select_Order_Number.Rows.Count > 0)
        {

            txt_OrderNumber.Text= dt_Select_Order_Number.Rows[0]["ORDER_NUMBER"].ToString();
        }
    }
   
    
    protected void btn_Submit_Click(object sender, EventArgs e)
    {

       // Divcreate.Visible = true;
        //DivView.Visible = false;
        lblhead.Text = "Add New Order";
        GetMaximum_OrderNumber();
        Clear_Order_Details();
        ModalPopupOrder.Show();


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
        if (ddl_ClientName.SelectedIndex <=0)
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
        if (ddl_State.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select State')</script>", false);
            ddl_State.Focus();
            ddl_State.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_State.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (ddl_County.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select County')</script>", false);
            ddl_County.Focus();
            ddl_County.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_County.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (txt_VendorName.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Vender Name')</script>", false);
            txt_VendorName.Focus();
            txt_VendorName.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_VendorName.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (txt_VendorNumber.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Vender Number')</script>", false);
            txt_VendorNumber.Focus();
            txt_VendorNumber.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_VendorNumber.BorderColor = System.Drawing.Color.DarkBlue;
        }
       if (txt_APN.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter APN Number')</script>", false);
            txt_APN.Focus();
            txt_APN.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_APN.BorderColor = System.Drawing.Color.DarkBlue;
        }
       if (txt_Borrowername.Text == "")
       {
           ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Borrower Name')</script>", false);
           txt_Borrowername.Focus();
           txt_Borrowername.BorderColor = System.Drawing.Color.Red;
           return false;

       }
       else
       {

           txt_Borrowername.BorderColor = System.Drawing.Color.DarkBlue;
       }
        return true;
        

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
         if (Validation() != false && btn_Save.Text == "Add New Order")
        
         {

             string ordernumber =          txt_OrderNumber.Text.ToString();
             string Placedby =             txt_Placedby.Text.ToUpper().ToString();
             int ordertype =               int.Parse(ddl_ordertype.SelectedValue.ToString());
             int clientid =                int.Parse(ddl_ClientName.SelectedValue.ToString());
             string Customernumber =       txt_ClientNumber.Text.ToUpper().ToString();
             int subprocessid =            int.Parse(ddl_SubProcess.SelectedValue.ToString());
             string Subprocessnumber =     txt_SubprocessNumber.Text.ToUpper().ToString();
             string VendorName =           txt_VendorName.Text.ToUpper().ToString();
             string VendorNumber =         txt_VendorNumber.Text.ToUpper().ToString();
             string address =              txt_Address.Text.ToUpper().ToString();
             int zipcode =                 int.Parse(txt_ZipCode.Text.ToString());
             string City =                 txt_City.Text.ToUpper().ToString();
             int state =                   int.Parse(ddl_State.SelectedValue.ToString());
             int county =                  int.Parse(ddl_County.SelectedValue.ToString());
             string Similar =              txt_Similar.Text.ToUpper().ToString();
             string Barrowername =         txt_Borrowername.Text.ToUpper().ToString();
             string BarrowerName2 =        txt_BorrowerName2.Text.ToUpper().ToString();
             string effectivedate =        txt_Effectivedate.Text.ToString();
             string Lastdeed =             txt_LastDeed.Text.ToString();
             string Grantee =              txt_Grantee.Text.ToString();
             string APN =                  txt_APN.Text.ToUpper().ToString();
             if (txt_TotalCost.Text != "")
             {
                 Totalcost = Convert.ToDecimal(txt_TotalCost.Text.ToString());
             }
             else
             {
                 Totalcost = 0;
             

             }
             int OrderStatus = int.Parse(ddl_orderstatus.SelectedValue.ToString());
             string Notes = txt_Notes.Text.ToUpper().ToString();
             string Legal = txt_Legal.Text.ToUpper().ToString();



          

           
                Hashtable htorder = new Hashtable();
                DataTable dtorder = new DataTable();

                
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                htorder.Add("@Trans", "INSERT");
                htorder.Add("@Sub_ProcessId", subprocessid);
                htorder.Add("@Date", date);
                htorder.Add("@Order_Type", ordertype);
                htorder.Add("@Order_Number", ordernumber);
                htorder.Add("@Customer_Number", Customernumber);
                htorder.Add("@Vendor_Name", VendorName);
                htorder.Add("@Vendor_Number",VendorNumber);
                htorder.Add("@Order_Status", OrderStatus);
                htorder.Add("@Documents", "");
                htorder.Add("@APN", APN);
                htorder.Add("@Address", address);
                htorder.Add("@City", City);
                htorder.Add("@State", state);
                htorder.Add("@Zip",zipcode);
                htorder.Add("@County", county);
                htorder.Add("@Borrower_Name", Barrowername);
                htorder.Add("@Borrower_Name2", BarrowerName2);
                htorder.Add("@Notes", Notes);
                htorder.Add("@Effective_date", effectivedate);
                htorder.Add("@Total_Cost", Totalcost);
                htorder.Add("@Grantee", Grantee);
                htorder.Add("@Legal", Legal);
                htorder.Add("@Last_Deed", Lastdeed);
                htorder.Add("@Paid", "");
                htorder.Add("@Id", 0);
                htorder.Add("@Opened", date);
                htorder.Add("@Action_Date", date);
                htorder.Add("@Turn_Time", "");
                htorder.Add("@Inserted_By", userid);
                htorder.Add("@Inserted_date", date);
                htorder.Add("@status", true);
                dtorder = dataaccess.ExecuteSP("Sp_Order", htorder);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New Order Added Sucessfully')</script>", false);
                GridviewbindOrderdata();
                ModalPopupOrder.Hide();
              
            }
         else if (Validation() != false && btn_Save.Text == "Edit Order")
         {

             string ordernumber = txt_OrderNumber.Text.ToString();
             string Placedby = txt_Placedby.Text.ToUpper().ToString();
             int ordertype = int.Parse(ddl_ordertype.SelectedValue.ToString());
             int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
             string Customernumber = txt_ClientNumber.Text.ToUpper().ToString();
             int subprocessid = int.Parse(ddl_SubProcess.SelectedValue.ToString());
             string Subprocessnumber = txt_SubprocessNumber.Text.ToUpper().ToString();
             string VendorName = txt_VendorName.Text.ToUpper().ToString();
             string VendorNumber = txt_VendorNumber.Text.ToUpper().ToString();
             string address = txt_Address.Text.ToUpper().ToString();
             int zipcode = int.Parse(txt_ZipCode.Text.ToString());
             string City = txt_City.Text.ToUpper().ToString();
             int state = int.Parse(ddl_State.SelectedValue.ToString());
             int county = int.Parse(ddl_County.SelectedValue.ToString());
             string Similar = txt_Similar.Text.ToUpper().ToString();
             string Barrowername = txt_Borrowername.Text.ToUpper().ToString();
             string BarrowerName2 = txt_BorrowerName2.Text.ToUpper().ToString();
             string effectivedate = txt_Effectivedate.Text.ToString();
             string Lastdeed = txt_LastDeed.Text.ToString();
             string Grantee = txt_Grantee.Text.ToString();
             string APN = txt_APN.Text.ToUpper().ToString();
             if (txt_TotalCost.Text != "")
             {
                 Totalcost = Convert.ToDecimal(txt_TotalCost.Text.ToString());
             }
             else
             {
                 Totalcost = 0;


             }
             int OrderStatus = int.Parse(ddl_orderstatus.SelectedValue.ToString());
             string Notes = txt_Notes.Text.ToUpper().ToString();
             string Legal = txt_Legal.Text.ToUpper().ToString();





             int orderid = int.Parse(ViewState["Orderid"].ToString());

             Hashtable htorder = new Hashtable();
             DataTable dtorder = new DataTable();


             DateTime date = new DateTime();
             date = DateTime.Now;
             string dateeval = date.ToString("dd/MM/yyyy");
             htorder.Add("@Trans", "UPDATE");
             htorder.Add("@Order_ID", orderid);
             htorder.Add("@Date", date);
             htorder.Add("@Sub_ProcessId", subprocessid);
             htorder.Add("@Placed_By", Placedby);
             htorder.Add("@Order_Type", ordertype);
             htorder.Add("@Order_Number", ordernumber);
             htorder.Add("@Customer_Number", Customernumber);
             htorder.Add("@Vendor_Name", VendorName);
             htorder.Add("@Vendor_Number", VendorNumber);
             htorder.Add("@Order_Status", OrderStatus);
             htorder.Add("@Documents", "");
             htorder.Add("@APN", APN);
             htorder.Add("@Address", address);
             htorder.Add("@City", City);
             htorder.Add("@State", state);
             htorder.Add("@Zip", zipcode);
             htorder.Add("@County", county);
             htorder.Add("@Borrower_Name", Barrowername);
             htorder.Add("@Borrower_Name2", BarrowerName2);
             htorder.Add("@Notes", Notes);
             htorder.Add("@Effective_date", effectivedate);
             htorder.Add("@Total_Cost", Totalcost);
             htorder.Add("@Grantee", Grantee);
             htorder.Add("@Legal", Legal);
             htorder.Add("@Last_Deed", Lastdeed);
             htorder.Add("@Paid", "");
             htorder.Add("@Id", 0);
             htorder.Add("@Opened", date);
             htorder.Add("@Action_Date", date);
             htorder.Add("@Turn_Time", "");
             htorder.Add("@Inserted_By", userid);
             htorder.Add("@Inserted_date", date);
             htorder.Add("@status", true);
             dtorder = dataaccess.ExecuteSP("Sp_Order", htorder);

             ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Updated Sucessfully')</script>", false);
             btn_Save.Text = "Add New Order";
             GridviewbindOrderdata();
             Clear_Order_Details();
             GetMaximum_OrderNumber();
             DivView.Visible = true;
             Divcreate.Visible = false;
             ModalPopupOrder.Hide();

         }
        


    }
    protected void Clear_Order_Details()
    { 
    //txt_OrderNumber.Text="";
    txt_Placedby.Text             ="";
    ddl_ordertype.SelectedIndex   =0;
    ddl_ClientName.SelectedIndex  =0;
    txt_ClientNumber.Text         ="";
    ddl_SubProcess.SelectedIndex  =-1;
    txt_SubprocessNumber.Text     ="";
    txt_VendorName.Text           ="";
    txt_VendorNumber.Text         ="";
    txt_Address.Text              ="";
    txt_ZipCode.Text              ="";
    txt_City.Text                 ="";
    ddl_State.SelectedIndex       =0;
    ddl_County.SelectedIndex      =-1;
    txt_Similar.Text              ="";
    txt_Borrowername.Text         ="";
    txt_BorrowerName2.Text        ="";
    txt_Effectivedate.Text        ="";
    txt_LastDeed.Text             ="";
    txt_Grantee.Text              ="";
    txt_APN.Text                  ="";
    txt_TotalCost.Text            = "";
    txt_Notes.Text = "";
    txt_Legal.Text = "";



    }
    protected void GridviewbindOrderdata()
    {

        //Hashtable htselect = new Hashtable();
        //DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
        if (dtselect.Rows.Count > 0)
        {
            grd_order.Visible = true;
            grd_order.DataSource = dtselect;
            grd_order.DataBind();

        }
        else
        {
            grd_order.Visible = true;
            grd_order.DataSource = null;
            grd_order.EmptyDataText = "No Orders Added";
            grd_order.DataBind();

        }
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Clear_Order_Details();
    }
    protected void GetClintNumber()
    {
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
        htselect.Add("@Trans", "SELECTCLIENTNO");
        htselect.Add("@Client_Id", int.Parse(ddl_ClientName.SelectedValue.ToString()));
        dtselect = dataaccess.ExecuteSP("Sp_Client", htselect);
        if (dtselect.Rows.Count > 0)
        {

            txt_ClientNumber.Text = dtselect.Rows[0]["Client_Number"].ToString();

        }




    }
    protected void GetSubProcessNumber()
    {
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
        htselect.Add("@Trans", "SELECTSUBPROCESS");
        htselect.Add("@Subprocess_Id", int.Parse(ddl_SubProcess.SelectedValue.ToString()));
        dtselect = dataaccess.ExecuteSP("Sp_Client_SubProcess", htselect);
        if (dtselect.Rows.Count > 0)
        {

            txt_SubprocessNumber.Text = dtselect.Rows[0]["Subprocess_Number"].ToString();

        }




    }
    protected void ddl_ClientName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_ClientName.SelectedIndex !=0)
        {
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
            dbc.BindSubProcessName(ddl_SubProcess,clientid);
            GetClintNumber();
        }
    }
    protected void ddl_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_State.SelectedIndex != 0)
        {
            int stateid = int.Parse(ddl_State.SelectedValue.ToString());
            dbc.BindCounty(ddl_County,stateid);
           
        }
    }
    protected void grd_order_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       // GridviewbindOrderdata();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddlAssign = (DropDownList)e.Row.FindControl("ddlAssign");
            DataSet ds = new DataSet();
            dbc.BindUserName(ddlAssign);
            ddlAssign.Items.Insert(0, new ListItem("NOT ASSIGNED", "0"));
            ddlAssign.Items.FindByValue((e.Row.FindControl("lblAssignto") as Label).Text).Selected = true;
        }
       
    }
    public SortDirection sortProperty
    {
        get
        {
            if (ViewState["SortingState"] == null)
            {
                ViewState["SortingState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["SortingState"];
        }
        set
        {
            ViewState["SortingState"] = value;
        }
    }
    protected void grd_order_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridviewbindOrderdata();

        DataTable dt = new DataTable();
        dt = dtselect;
        string sortingDirection = string.Empty;
        if (sortProperty == SortDirection.Ascending)
        {
            sortProperty = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            sortProperty = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

        DataView sortedView = new DataView(dt);
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        grd_order.DataSource = sortedView;
        grd_order.DataBind();




    }

    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkTest = (CheckBox)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
        DropDownList drpstatus = (DropDownList)grdRow.FindControl("ddlAssign");


        if (chkTest.Checked == true)
        {
            grdRow.BackColor = System.Drawing.Color.Pink;
           
            drpstatus.Enabled = true;

        }
        else if (chkTest.Checked == false)
        {
           // Color clr = ColorTranslator.FromHtml("#BACFF8");
            grd_order.BackColor = System.Drawing.Color.White;
            drpstatus.Enabled = false;
          
        }
      

    }

    protected void ddlAssign_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        DropDownList ddlassign = (DropDownList)sender;
        GridViewRow grdRow = (GridViewRow)ddlassign.NamingContainer;
        DropDownList Ddl_Assign_Update = (DropDownList)grdRow.FindControl("ddlAssign");
        Label lbl_Orderid = (Label)grdRow.FindControl("lblorderid");
        int order_id=int.Parse(lbl_Orderid.Text);
        int ToUser_Id=int.Parse(Ddl_Assign_Update.SelectedValue.ToString());

        DateTime date = new DateTime();
        date = DateTime.Now;
        string dateeval = date.ToString("dd/MM/yyyy");

        Hashtable htcount = new Hashtable();
        DataTable dtCount = new DataTable();

        htcount.Add("@Trans", "CHECK");
        htcount.Add("@Order_Id", order_id);
      

        dtCount = dataaccess.ExecuteSP("Sp_Order_Assignment", htcount);

        if (dtCount.Rows.Count > 0)
        {

            Chk_Userid = int.Parse(dtCount.Rows[0]["count"].ToString());
        }
        else
        {

            Chk_Userid = 0;
        }


        if (Ddl_Assign_Update.SelectedValue != "0")
        {
            Hashtable htInsert = new Hashtable();
            DataTable dtInsert = new DataTable();

            htInsert.Add("@Trans", "INSERT");
            htInsert.Add("@Order_Id", order_id);
            htInsert.Add("@User_Id", ToUser_Id);
            htInsert.Add("@Inserted_By", userid);
            htInsert.Add("@Inserted_date", date);
            htInsert.Add("@status", true);
            if (Chk_Userid == 0)
            {
                dtInsert = dataaccess.ExecuteSP("Sp_Order_Assignment", htInsert);
            }
            else if(Chk_Userid>0)
            {
                Hashtable htUpdate = new Hashtable();
                DataTable dtUpdate = new DataTable();

                htUpdate.Add("@Trans", "UPDATE");
                htUpdate.Add("@Order_Id", order_id);
                htUpdate.Add("@User_Id", ToUser_Id);
                htUpdate.Add("@Modified_By", userid);
                htUpdate.Add("@Modified_Date", date);
                htUpdate.Add("@status", true);
                dtUpdate = dataaccess.ExecuteSP("Sp_Order_Assignment", htUpdate);
            }



        }


        GridviewbindOrderdata();


    }

  
    protected void ddl_SubProcess_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_SubProcess.SelectedIndex > 0)
        {
            GetSubProcessNumber();
            //txt_SubprocessNumber.Text = ddl_SubProcess.SelectedValue.ToString();
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {


        if (RadioButtonList1.SelectedValue == "1")
        {

            divorderwise.Visible = true;
            divclientwise.Visible = false;

        }
        else if (RadioButtonList1.SelectedValue == "2")
        {

            divorderwise.Visible = false;
            divclientwise.Visible = true;
        }
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {

        //ModalOrderSearch.PopupControlID = btn_Search.OnClientClick;
        //ModalOrderSearch.Show();
        //StockMasterPopup.Show();
       // Employee.Show();
       ModalPopupExtender1.Show();
    }
    protected void grd_order_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = grd_order.SelectedRow;

        Label lblSubprocessid = (Label)row.FindControl("lblSubprocessid");
        Label lblorderid = (Label)row.FindControl("lblorderid");
        Button btnordernuber = (Button)row.FindControl("btnordernumber");
        Label lblCustomerName = (Label)row.FindControl("lblcustomerName");
        Label lblEffectiveDate = (Label)row.FindControl("lblSubmited");
        Label lblstatus = (Label)row.FindControl("lblstatus");
        Label lblCounty = (Label)row.FindControl("lblCounty");
        Label lblState = (Label)row.FindControl("lblState");
        Button btnEdit_Order = (Button)row.FindControl("btnEditOrder");
        OrderStatus = lblstatus.Text.ToString();
        if (OrderStatus == "Typing")
        {
            Session["userid"] = userid.ToString();
            Session["Empname"] = Empname.ToString();
            Session["Orderid"] = lblorderid.Text.ToString();
            Session["EffectiveDate"] = lblEffectiveDate.Text.ToString();
            Session["OrderNumber"] = btnordernuber.Text.ToString();
            Session["County"] = lblCounty.Text.ToString();
            Session["State"] = lblState.Text.ToString();
          
            Response.Redirect("~/Admin/Order_Serach_Entry_Create.aspx");

        }
        else if (OrderStatus == "Search1")
        {
            int order_Id = Convert.ToInt32(lblorderid.Text);
            Hashtable ht_Select_Order_Details = new Hashtable();
            DataTable dt_Select_Order_Details = new DataTable();

            ht_Select_Order_Details.Add("@Trans", "SELECT_ORDER_WISE");
            ht_Select_Order_Details.Add("@Order_ID", order_Id);
            dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);

            if (dt_Select_Order_Details.Rows.Count > 0)
            {
                ViewState["Orderid"] = order_Id.ToString();
                txt_OrderNumber.Text = dt_Select_Order_Details.Rows[0]["Order_Number"].ToString();
                txt_Date.Text = dt_Select_Order_Details.Rows[0]["Date"].ToString();
                txt_Placedby.Text = dt_Select_Order_Details.Rows[0]["Placed_By"].ToString();
                ddl_ordertype.SelectedValue = dt_Select_Order_Details.Rows[0]["Order_Type_Id"].ToString();
                ddl_ClientName.SelectedValue = dt_Select_Order_Details.Rows[0]["Client_Id"].ToString();
                if (ddl_ClientName.SelectedValue != "")
                {

                    int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
                    dbc.BindSubProcessName(ddl_SubProcess, clientid);
                }
                txt_ClientNumber.Text = dt_Select_Order_Details.Rows[0]["Client_Number"].ToString();
                ddl_SubProcess.SelectedValue = dt_Select_Order_Details.Rows[0]["Sub_ProcessId"].ToString();
                txt_SubprocessNumber.Text = dt_Select_Order_Details.Rows[0]["Subprocess_Number"].ToString();
                txt_VendorName.Text = dt_Select_Order_Details.Rows[0]["Vendor_Name"].ToString();
                txt_VendorNumber.Text = dt_Select_Order_Details.Rows[0]["Vendor_Number"].ToString();
                txt_Address.Text = dt_Select_Order_Details.Rows[0]["Address"].ToString();
                txt_ZipCode.Text = dt_Select_Order_Details.Rows[0]["Zip"].ToString();
                txt_City.Text = dt_Select_Order_Details.Rows[0]["City"].ToString();

                ddl_State.SelectedValue = dt_Select_Order_Details.Rows[0]["stateid"].ToString();

                if (ddl_State.SelectedValue != "")
                {
                    int stateid = int.Parse(ddl_State.SelectedValue.ToString());
                    dbc.BindCounty(ddl_County, stateid);

                }
                ddl_County.SelectedValue = dt_Select_Order_Details.Rows[0]["CountyId"].ToString();
                txt_Similar.Text = "";
                txt_Borrowername.Text = dt_Select_Order_Details.Rows[0]["Borrower_Name"].ToString();
                txt_BorrowerName2.Text = dt_Select_Order_Details.Rows[0]["Borrower_Name2"].ToString();
                txt_Effectivedate.Text = dt_Select_Order_Details.Rows[0]["Effective_date"].ToString();
                txt_LastDeed.Text = dt_Select_Order_Details.Rows[0]["Last_Deed"].ToString();
                txt_Grantee.Text = dt_Select_Order_Details.Rows[0]["Grantee"].ToString();
                txt_APN.Text = dt_Select_Order_Details.Rows[0]["APN"].ToString();
                txt_TotalCost.Text = dt_Select_Order_Details.Rows[0]["Total_Cost"].ToString();
                txt_Notes.Text = dt_Select_Order_Details.Rows[0]["Notes"].ToString();
                txt_Legal.Text = dt_Select_Order_Details.Rows[0]["Legal"].ToString();
                ddl_orderstatus.SelectedValue = dt_Select_Order_Details.Rows[0]["Order_Status_Id"].ToString();
                btn_Save.Text = "Edit Order";
                lblhead.Text = "Edit Order Details";

               
            }
            //   Divcreate.Visible = true;
            //   DivView.Visible = false;
            ModalPopupOrder.Show();
        
           
        }
        else if (OrderStatus == "Search")
        {
            Session["userid"] = userid.ToString();
            Session["Empname"] = Empname.ToString();
            Session["Orderid"] = lblorderid.Text.ToString();
            Session["OrderNumber"] = btnordernuber.Text.ToString();

            Response.Redirect("~/Admin/Order_Search.aspx");

        }

        else if (OrderStatus == "search mapping")
        {
            Session["userid"] = userid.ToString();
            Session["Empname"] = Empname.ToString();
            Session["Orderid"] = lblorderid.Text.ToString();
            Session["OrderNumber"] = btnordernuber.Text.ToString();

            Response.Redirect("~/Admin/Order_Search_Mapping.aspx");

        }



    }

  
    protected void EditOrder_Details(object sender, CommandEventArgs e)
    {

        int order_Id = Convert.ToInt32(e.CommandArgument.ToString());
        Hashtable ht_Select_Order_Details = new Hashtable();
        DataTable dt_Select_Order_Details = new DataTable();

        ht_Select_Order_Details.Add("@Trans", "SELECT_ORDER_WISE");
        ht_Select_Order_Details.Add("@Order_ID",order_Id);
        dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);

        if (dt_Select_Order_Details.Rows.Count > 0)
        {
            ViewState["Orderid"] = order_Id.ToString();
            txt_OrderNumber.Text =dt_Select_Order_Details.Rows[0]["Order_Number"].ToString();
            txt_Date.Text = dt_Select_Order_Details.Rows[0]["Date"].ToString();
            txt_Placedby.Text = dt_Select_Order_Details.Rows[0]["Placed_By"].ToString();
            ddl_ordertype.SelectedValue = dt_Select_Order_Details.Rows[0]["Order_Type_Id"].ToString();
            ddl_ClientName.SelectedValue = dt_Select_Order_Details.Rows[0]["Client_Id"].ToString();
            if (ddl_ClientName.SelectedValue != "")
            {

                int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
                dbc.BindSubProcessName(ddl_SubProcess, clientid);
            }
            txt_ClientNumber.Text = dt_Select_Order_Details.Rows[0]["Client_Number"].ToString();
            ddl_SubProcess.SelectedValue = dt_Select_Order_Details.Rows[0]["Sub_ProcessId"].ToString();
            txt_SubprocessNumber.Text = dt_Select_Order_Details.Rows[0]["Subprocess_Number"].ToString();
            txt_VendorName.Text = dt_Select_Order_Details.Rows[0]["Vendor_Name"].ToString();
            txt_VendorNumber.Text = dt_Select_Order_Details.Rows[0]["Vendor_Number"].ToString();
            txt_Address.Text = dt_Select_Order_Details.Rows[0]["Address"].ToString();
            txt_ZipCode.Text = dt_Select_Order_Details.Rows[0]["Zip"].ToString();
            txt_City.Text = dt_Select_Order_Details.Rows[0]["City"].ToString();
           
            ddl_State.SelectedValue = dt_Select_Order_Details.Rows[0]["stateid"].ToString();
           
            if (ddl_State.SelectedValue != "")
            {
                int stateid = int.Parse(ddl_State.SelectedValue.ToString());
                dbc.BindCounty(ddl_County, stateid);

            }
            ddl_County.SelectedValue = dt_Select_Order_Details.Rows[0]["CountyId"].ToString();
            txt_Similar.Text = "";
            txt_Borrowername.Text = dt_Select_Order_Details.Rows[0]["Borrower_Name"].ToString();
            txt_BorrowerName2.Text = dt_Select_Order_Details.Rows[0]["Borrower_Name2"].ToString();
            txt_Effectivedate.Text = dt_Select_Order_Details.Rows[0]["Effective_date"].ToString();
            txt_LastDeed.Text = dt_Select_Order_Details.Rows[0]["Last_Deed"].ToString();
            txt_Grantee.Text = dt_Select_Order_Details.Rows[0]["Grantee"].ToString();
            txt_APN.Text = dt_Select_Order_Details.Rows[0]["APN"].ToString();
            txt_TotalCost.Text = dt_Select_Order_Details.Rows[0]["Total_Cost"].ToString();
            txt_Notes.Text = dt_Select_Order_Details.Rows[0]["Notes"].ToString();
            txt_Legal.Text = dt_Select_Order_Details.Rows[0]["Legal"].ToString();
            ddl_orderstatus.SelectedValue = dt_Select_Order_Details.Rows[0]["Order_Status_Id"].ToString();
            btn_Save.Text = "Edit Order";
        }
     //   Divcreate.Visible = true;
     //   DivView.Visible = false;
        ModalPopupOrder.Show();

        
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {



    }
    protected void btncurrent_Click(object sender, EventArgs e)
    {

    }
    protected void btnformer_Click(object sender, EventArgs e)
    {

    }
   
   
 
    protected void Button2_Click1(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
    }

    protected void btn_Sarch_Result_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "1")
        {

            string OrderNumber = txt_orderserach_Number.Text.ToString();

            htselect.Add("@Trans", "SELECT_ORDER_NO_WISE");
            htselect.Add("@Order_Number", OrderNumber);
            dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
            if (dtselect.Rows.Count > 0)
            {
                grd_order.Visible = true;
                grd_order.DataSource = dtselect;
                grd_order.DataBind();

            }
            else
            {
                grd_order.Visible = true;
                grd_order.DataSource = null;
                grd_order.EmptyDataText = "No Orders Added";
                grd_order.DataBind();

            }

        }
        else if (RadioButtonList1.SelectedValue == "2")
        {

            // indivisual
            if (ddl_Search_Client_type.SelectedItem.ToString() != "ALL" && ddl_Search_SubProcess.SelectedItem.ToString() != "ALL" && txt_order_Search_Fromdate.Text != "" && txt_orderserach_Todate.Text != "" && ddl_order_search_Order_Type.SelectedItem.ToString() != "ALL" && ddl_order_search_Status.SelectedItem.ToString() != "ALL")
            {

                int ordertype = int.Parse(ddl_order_search_Order_Type.SelectedValue.ToString());
                int clientid = int.Parse(ddl_Search_Client_type.SelectedValue.ToString());
                int subprocessid = int.Parse(ddl_Search_SubProcess.SelectedValue.ToString());
                string Fromdate = txt_order_Search_Fromdate.Text.ToString();
                string Todate = txt_orderserach_Todate.Text.ToString();
                int OrderStatus = int.Parse(ddl_order_search_Status.SelectedValue.ToString());

                Hashtable ht_Select_Order_Details = new Hashtable();
                DataTable dt_Select_Order_Details = new DataTable();

                ht_Select_Order_Details.Add("@Trans", "SELCT_INDIVISUAL");
                ht_Select_Order_Details.Add("@Sub_ProcessId", subprocessid);
                ht_Select_Order_Details.Add("@Fromdate", Fromdate);
                ht_Select_Order_Details.Add("@Todate", Todate);
                ht_Select_Order_Details.Add("@Order_Status", OrderStatus);
                ht_Select_Order_Details.Add("@Order_Type", ordertype);
                dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);
                if (dt_Select_Order_Details.Rows.Count > 0)
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = dt_Select_Order_Details;
                    grd_order.DataBind();

                }
                else
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = null;
                    grd_order.EmptyDataText = "No Orders Added";
                    grd_order.DataBind();

                }




            }  //all
            else if (ddl_Search_Client_type.SelectedItem.ToString() == "ALL" && ddl_Search_SubProcess.SelectedItem.ToString() == "ALL" && txt_order_Search_Fromdate.Text != "" && txt_orderserach_Todate.Text != "" && ddl_order_search_Order_Type.SelectedItem.ToString() == "ALL" && ddl_order_search_Status.SelectedItem.ToString() == "ALL")
            {
                string Fromdate = txt_order_Search_Fromdate.Text.ToString();
                string Todate = txt_orderserach_Todate.Text.ToString();
                Hashtable ht_Select_Order_Details = new Hashtable();
                DataTable dt_Select_Order_Details = new DataTable();

                ht_Select_Order_Details.Add("@Trans", "SELCT_ALL");

                ht_Select_Order_Details.Add("@Fromdate", Fromdate);
                ht_Select_Order_Details.Add("@Todate", Todate);

                dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);
                if (dt_Select_Order_Details.Rows.Count > 0)
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = dt_Select_Order_Details;
                    grd_order.DataBind();

                }
                else
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = null;
                    grd_order.EmptyDataText = "No Orders Added";
                    grd_order.DataBind();

                }
            }
            //subprocess all
            else if (ddl_Search_Client_type.SelectedItem.ToString() != "ALL" && ddl_Search_SubProcess.SelectedItem.ToString() == "ALL" && txt_order_Search_Fromdate.Text != "" && txt_orderserach_Todate.Text != "" && ddl_order_search_Order_Type.SelectedItem.ToString() != "ALL" && ddl_order_search_Status.SelectedItem.ToString() != "ALL")
            {

                int ordertype = int.Parse(ddl_order_search_Order_Type.SelectedValue.ToString());
                int clientid = int.Parse(ddl_Search_Client_type.SelectedValue.ToString());

                string Fromdate = txt_order_Search_Fromdate.Text.ToString();
                string Todate = txt_orderserach_Todate.Text.ToString();
                int OrderStatus = int.Parse(ddl_order_search_Status.SelectedValue.ToString());

                Hashtable ht_Select_Order_Details = new Hashtable();
                DataTable dt_Select_Order_Details = new DataTable();

                ht_Select_Order_Details.Add("@Trans", "SELCT_ALL_SUBPROCESS");
                ht_Select_Order_Details.Add("@Client_Id", clientid);
                ht_Select_Order_Details.Add("@Fromdate", Fromdate);
                ht_Select_Order_Details.Add("@Todate", Todate);
                ht_Select_Order_Details.Add("@Order_Status", OrderStatus);
                ht_Select_Order_Details.Add("@Order_Type", ordertype);
                dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);
                if (dt_Select_Order_Details.Rows.Count > 0)
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = dt_Select_Order_Details;
                    grd_order.DataBind();

                }
                else
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = null;
                    grd_order.EmptyDataText = "No Orders Added";
                    grd_order.DataBind();

                }




            }
            //subprocess all , order type single , order status all
            else if (ddl_Search_Client_type.SelectedItem.ToString() != "ALL" && ddl_Search_SubProcess.SelectedItem.ToString() == "ALL" && txt_order_Search_Fromdate.Text != "" && txt_orderserach_Todate.Text != "" && ddl_order_search_Order_Type.SelectedItem.ToString() != "ALL" && ddl_order_search_Status.SelectedItem.ToString() == "ALL")
            {

                int ordertype = int.Parse(ddl_order_search_Order_Type.SelectedValue.ToString());
                int clientid = int.Parse(ddl_Search_Client_type.SelectedValue.ToString());

                string Fromdate = txt_order_Search_Fromdate.Text.ToString();
                string Todate = txt_orderserach_Todate.Text.ToString();


                Hashtable ht_Select_Order_Details = new Hashtable();
                DataTable dt_Select_Order_Details = new DataTable();

                ht_Select_Order_Details.Add("@Trans", "SELCT_ALL_SUBPROCESS_ALL_ORDER_STATUS_SINGLE_TYPE");
                ht_Select_Order_Details.Add("@Client_Id", clientid);
                ht_Select_Order_Details.Add("@Fromdate", Fromdate);
                ht_Select_Order_Details.Add("@Todate", Todate);
                ht_Select_Order_Details.Add("@Order_Type", ordertype);
                dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);
                if (dt_Select_Order_Details.Rows.Count > 0)
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = dt_Select_Order_Details;
                    grd_order.DataBind();

                }
                else
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = null;
                    grd_order.EmptyDataText = "No Orders Added";
                    grd_order.DataBind();

                }




            }
            else if (ddl_Search_Client_type.SelectedItem.ToString() != "ALL" && ddl_Search_SubProcess.SelectedItem.ToString() == "ALL" && txt_order_Search_Fromdate.Text != "" && txt_orderserach_Todate.Text != "" && ddl_order_search_Order_Type.SelectedItem.ToString() == "ALL" && ddl_order_search_Status.SelectedItem.ToString() == "ALL")
            {


                int clientid = int.Parse(ddl_Search_Client_type.SelectedValue.ToString());

                string Fromdate = txt_order_Search_Fromdate.Text.ToString();
                string Todate = txt_orderserach_Todate.Text.ToString();


                Hashtable ht_Select_Order_Details = new Hashtable();
                DataTable dt_Select_Order_Details = new DataTable();

                ht_Select_Order_Details.Add("@Trans", "SELCT_ALL_SUBPROCESS_ALL_ORDER_STATUS_TYPE");
                ht_Select_Order_Details.Add("@Client_Id", clientid);
                ht_Select_Order_Details.Add("@Fromdate", Fromdate);
                ht_Select_Order_Details.Add("@Todate", Todate);
                dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);
                if (dt_Select_Order_Details.Rows.Count > 0)
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = dt_Select_Order_Details;
                    grd_order.DataBind();

                }
                else
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = null;
                    grd_order.EmptyDataText = "No Orders Added";
                    grd_order.DataBind();

                }




            }

            else if (ddl_Search_Client_type.SelectedItem.ToString() != "ALL" && ddl_Search_SubProcess.SelectedItem.ToString() != "ALL" && txt_order_Search_Fromdate.Text != "" && txt_orderserach_Todate.Text != "" && ddl_order_search_Order_Type.SelectedItem.ToString() == "ALL" && ddl_order_search_Status.SelectedItem.ToString() == "ALL")
            {


                //int ordertype = int.Parse(ddl_order_search_Order_Type.SelectedValue.ToString());
                int clientid = int.Parse(ddl_Search_Client_type.SelectedValue.ToString());
                int subprocessid = int.Parse(ddl_Search_SubProcess.SelectedValue.ToString());
                string Fromdate = txt_order_Search_Fromdate.Text.ToString();
                string Todate = txt_orderserach_Todate.Text.ToString();
                //int OrderStatus = int.Parse(ddl_order_search_Status.SelectedValue.ToString());


                Hashtable ht_Select_Order_Details = new Hashtable();
                DataTable dt_Select_Order_Details = new DataTable();

                ht_Select_Order_Details.Add("@Trans", "SELCT_SINGLE_CLIENT_SUB_ORDER_ALL");
                ht_Select_Order_Details.Add("@Sub_ProcessId", subprocessid);
                ht_Select_Order_Details.Add("@Fromdate", Fromdate);
                ht_Select_Order_Details.Add("@Todate", Todate);
                dt_Select_Order_Details = dataaccess.ExecuteSP("Sp_Order", ht_Select_Order_Details);
                if (dt_Select_Order_Details.Rows.Count > 0)
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = dt_Select_Order_Details;
                    grd_order.DataBind();

                }
                else
                {
                    grd_order.Visible = true;
                    grd_order.DataSource = null;
                    grd_order.EmptyDataText = "No Orders Added";
                    grd_order.DataBind();

                }




            }
        }





    }
    protected void btn_order_cancel_Click(object sender, EventArgs e)
    {
        ModalPopupOrder.Hide();
    }
    protected void ddl_Search_Client_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Search_Client_type.SelectedIndex != 0 && ddl_Search_Client_type.SelectedIndex > 0 &&  ddl_Search_Client_type.SelectedValue!="ALL")
        {

            dbc.BindSubProcessName(ddl_Search_SubProcess, int.Parse(ddl_Search_Client_type.SelectedValue));
            ddl_Search_SubProcess.Items.Insert(1, "ALL");
        }
        else
        {

            ddl_Search_SubProcess.Items.Insert(0,"ALL");
        }
    }
    protected void btn_Cancel_Search_Click(object sender, EventArgs e)
    {
       // ModalPopupExtender1.Hide();
       // Response.Redirect("~/Admin/Order_Create.aspx");

        txt_orderserach_Number.Text = "";
        ddl_Search_Client_type.SelectedIndex = 0;
        ddl_order_search_Status.SelectedIndex = 0;
        txt_order_Search_Fromdate.Text = "";
        txt_orderserach_Todate.Text = "";
        ddl_order_search_Order_Type.SelectedIndex = 0;

       // GridviewbindOrderdata();


    }
    protected void btn_Refresh_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Order_Create.aspx");
    }
    protected void btn_Import_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Upload_Orders.aspx");
    }
    protected void btn_Import_Excel_Cancel_Click(object sender, EventArgs e)
    {
        ModalPopupImportExcel.Hide();
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
        if (dtselect.Rows.Count > 0)
        {
            Gv_Import.DataSource = dtselect;
            Gv_Import.DataBind();
        }
        //DataTable dt = new DataTable();
        //htselect.Add("@Trans", "SELECT");
        //dt = dataaccess.ExecuteSP("Sp_Order", htselect);
        //string strFilename = "Sample.doc";
        //UploadDataTableToExcel(dt, strFilename);
        //ExportToExcel();
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Export_Order.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);

        Gv_Import.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
       // return;
    }

  

   
}