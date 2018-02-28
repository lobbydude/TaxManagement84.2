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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

using System.Text;
using System.Drawing;

public partial class Gls_Tax_Entry : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    CustomerBowser browser = new CustomerBowser();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int tabweb = 0, tabit = 0, taborder = 0, tabagency = 0, tabout = 0, tabcmt = 0, tabcountydb = 0, btncountydb = 0, btndeldb = 0;
    int tabtax = 0, tabassed = 0, tabsaldet = 0, tabbankrupty = 0, tabsrcupload = 0, tabcurrent = 0, tabannual = 0, tabcomt = 0, tabfeed = 0,taberror=0;
   
    int userid;
    string Empname;
    int Count;
    Hashtable htselect = new Hashtable();
    DataTable dtselect = new DataTable();
    Genral gen = new Genral();
    int BRANCH_ID;
    int Order_Id;
    string Operation;
    decimal Land, Building, Total, sold_Tax_AMount, Munciplene_Amount;
    string path;
    string extension;
    string Order_Kbpath;
    string Tax_Type_Source_Upload__path;
    string Doctype;
    string docpath;
    int Maximum;
    string Order_Type = "";
    decimal Tax_Amount, Excemption;
    int Orderpath_Count;
    int Check_County;
    int Status_Id;
    object Tax_Inserted_Id;
    int Production_Check;

    ReportDocument rptDoc = new ReportDocument();
    ReportDocument subRepDoc = new ReportDocument();
    public string Connection = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString.ToString();
    int client_Id, Subprocess_id;
    decimal tax_Base_Amount, tax_Pay_Off_Amount1, tax_Pay_Off_Amount2, tax_Paid_Amount, tax_due_Amount, tax_Discount_Amount;
    DateTime date2, date3;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Tab_AssedVal.Enabled = false;
        //Tab_SalDetail.Enabled = false;
        ////Tab_MuncipleDet.Enabled = false;
        //Tab_BankruptyDet.Enabled = false;
        //Tab_SourceUpload.Enabled = false;

        //Color bgcr = ColorTranslator.FromHtml("#12B61F");
        //Color focr = ColorTranslator.FromHtml("#ffffff");
        //Tab_TaxDetails.ForeColor = focr;
        //Tab_TaxDetails.BackColor = bgcr;


        if (tabweb == 0 && tabit == 0 && taborder == 0 && tabagency == 0 && tabout == 0 && tabcmt == 0 && tabcountydb == 0 && btncountydb == 0 && btndeldb == 0 && tabassed == 0 &&
            tabsaldet == 0  && tabbankrupty == 0 && tabsrcupload == 0)
        {
            Color bgcr = ColorTranslator.FromHtml("#12B61F");
            Color focr = ColorTranslator.FromHtml("#ffffff");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;

            Color bgclr = ColorTranslator.FromHtml("#33CCFF");
            Color foclr = ColorTranslator.FromHtml("#303030");
           
            tabitcomplent.BackColor = bgclr;
            tbpnlusrdetails.BackColor = bgclr;
            tbpnljobdetails.BackColor = bgclr;
            taboutputpreview.BackColor = bgclr;
            tabcountycmt.BackColor = bgclr;
            tabcounty.BackColor = bgclr;
            btn_CountyDB.BackColor = bgclr;
            btn_DelequentDb.BackColor = bgclr;

           
            Tab_AssedVal.BackColor = bgclr;
            Tab_SalDetail.BackColor = bgclr;
            Tab_BankruptyDet.BackColor = bgclr;
            Tab_SourceUpload.BackColor = bgclr;

            
            Tab_AssedVal.ForeColor = foclr;
            Tab_SalDetail.ForeColor = foclr;
            Tab_BankruptyDet.ForeColor = foclr;
            Tab_SourceUpload.ForeColor = foclr;


            
            tabitcomplent.ForeColor = foclr;
            tbpnlusrdetails.ForeColor = foclr;
            tbpnljobdetails.ForeColor = foclr;
            taboutputpreview.ForeColor = foclr;
            tabcountycmt.ForeColor = foclr;
            tabcounty.ForeColor = foclr;
            btn_CountyDB.ForeColor = foclr;
            btn_DelequentDb.ForeColor = foclr;
        }

        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }

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
        Order_Id = int.Parse(Session["order_id"].ToString());
        Order_Type = Session["Order_Type"].ToString();
        if (!IsPostBack)
        {

     
         
            dbc.BindState(ddl_Barrower_State);
          
     
            dbc.BindDeliquentTax_Type(ddl_Tax_Delquent_Tax_type, Order_Id);
            dbc.BindSourceUploadTax_Type(ddl_Source_upload_Taxtype, Order_Id);
            dbc.BindComments_Tax_Type(ddl_TaxType_Commts, Order_Id);
            dbc.BindTax_Year(ddl_Assesed_Tax_Year);
            dbc.BindYearType(ddl_Tax_Year_Type);
            dbc.BindTax_Status(ddl_Tax_Status_Entry);
            dbc.BindTax_Type(ddl_Tax_Type_Entry);
            dbc.BindOrderStatus_ForEnter(ddl_Status);
            dbc.BindErrorCategory(ddl_Error_Category);
            dbc.BindTax_Period(ddl_Tax_Period_Entry);
            dbc.BindDiscountConf(ddl_Discount_Entry);
            if (ddl_Barrower_County.SelectedValue != "")
            {

                dbc.BindCounty(ddl_Barrower_County, int.Parse(ddl_Barrower_State.SelectedValue));

            }
            Get_Order_Details();
            Page.MaintainScrollPositionOnPostBack = true;
            Gridview_Bind_Order_Kb_Data();
            Gridview_Bind_Order_Agency_Kb_Data();
            dbc.BindTax_Sales_Master(ddl_Tax_Sold);
            Gridview_Bind_IT_Error_Data();
            Gridview_Bind_Tax_Details();
            Gridview_Bind_TaxAcseesd_Data();
            Gridview_Bind_CountyDatabaseInformation();
      
            Gridview_Bind_Tax_Type_Comments();
            Gridview_Bind_Order_Deliquent_Data();
            Gridview_bind_Tax_Sold_Data();
    
            Gridview_bind_Bankrupty_Tax_Data();
            Gridview_Bind_Tax_type_Source_Upload_Data();
            Gridview_Bind_Order_Erorr_Data();
            Get_Tax_Comments();
            BindAnnualTaxAmount();
            Bind_Annual_Tax_Total_PaidAmount();
            if (ddl_Bankruptcy_Yes_No.SelectedValue == "YES")
            {

                txt_Bankcrupt_Comments.Enabled = true;
                txt_Bankruptcy_Case_No.Enabled = true;
                txt_Bankruptcy_ChapterNo.Enabled = true;
                txt_Bankruptcy_Date.Enabled = true;
            }
            else
            {
                txt_Bankcrupt_Comments.Enabled = false;
                txt_Bankruptcy_Case_No.Enabled = false;
                txt_Bankruptcy_ChapterNo.Enabled = false;
                txt_Bankruptcy_Date.Enabled = false;

            }

        }
    }
    protected void Gridview_Bind_Tax_Details()
    {
        Hashtable htTax = new Hashtable();
        DataTable dtTax = new System.Data.DataTable();

        htTax.Add("@Trans", "SELECT_CURRENTYEAR");
        htTax.Add("@Order_Id", Order_Id);
        dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_Entry", htTax);
        if (dtTax.Rows.Count > 0)
        {
            //ex2.Visible = true;
            gvTaxDetails.Visible = true;
            gvTaxDetails.DataSource = dtTax;
            gvTaxDetails.DataBind();

        }
        else
        {
          //  dtTax.Rows.Add(dtTax.NewRow());
            gvTaxDetails.DataSource = null;
            gvTaxDetails.DataBind();
            //int columncount = gvTaxDetails.Rows[0].Cells.Count;
            //gvTaxDetails.Rows[0].Cells.Clear();
            //gvTaxDetails.Rows[0].Cells.Add(new TableCell());
            //gvTaxDetails.Rows[0].Cells[0].ColumnSpan = columncount;
           // gvTaxDetails.Rows[0].Cells[0].Text = "No Records Found";


        }
    }
    protected void Get_Order_Details()
    {

        Hashtable htorder = new Hashtable();
        DataTable dtorder = new System.Data.DataTable();

        htorder.Add("@Trans", "SELECT_ORDER_WISE");
        htorder.Add("@Order_Id", Order_Id);
        dtorder = dataaccess.ExecuteSP("Sp_Order", htorder);
        if (dtorder.Rows.Count > 0)
        {

            txt_Order_Number.Text = dtorder.Rows[0]["Client_Order_Number"].ToString();

           // txt_Loan_Number.Text = dtorder.Rows[0]["Loan_Number"].ToString();

            Session["Sub_processID"] = dtorder.Rows[0]["Sub_ProcessId"].ToString();


            txt_Barrower_Name.Text = dtorder.Rows[0]["Borrower_Name"].ToString();
            txt_Barrower_Name.Text = dtorder.Rows[0]["Last_Name"].ToString();
            txt_Barrower_Address.Text = dtorder.Rows[0]["Barrower_Address"].ToString();
            txt_Barrower_City.Text = dtorder.Rows[0]["Barrower_City"].ToString();
            txt_Barrower_Zip.Text = dtorder.Rows[0]["Barrower_Zip"].ToString();

            ddl_Barrower_State.SelectedValue = dtorder.Rows[0]["Barrower_State"].ToString();

            dbc.BindCounty(ddl_Barrower_County, int.Parse(ddl_Barrower_State.SelectedValue));
            ddl_Barrower_County.SelectedValue = dtorder.Rows[0]["Barrower_County"].ToString();

            txt_Date.Text = dtorder.Rows[0]["date"].ToString();
            txt_Parcel_Number.Text = dtorder.Rows[0]["Parecel_Id"].ToString();
            //txt_Tax_Comments.Text = dtorder.Rows[0]["Comments"].ToString();
           // txt_Order_Notes.Text = dtorder.Rows[0]["Notes"].ToString();
            txt_ETA_date.Text = dtorder.Rows[0]["ETA_Date"].ToString();
            ViewState["County_Id"] = dtorder.Rows[0]["Barrower_County"].ToString();
            ViewState["State_Id"] = dtorder.Rows[0]["Barrower_State"].ToString();
            if (txt_Barrower_City.Text != "")
            {
                ViewState["City"] = txt_Barrower_City.Text;
            }
            else
            {
                ViewState["City"] = "";


            }
            ViewState["Order_Number"] = dtorder.Rows[0]["Client_Order_Number"].ToString();
            ViewState["Order_Status"] = dtorder.Rows[0]["Order_Status"].ToString();
            ViewState["Order_Task"] = dtorder.Rows[0]["Order_Task_Id"].ToString();

        }


    }
    protected void Gridview_Bind_TaxAcseesd_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Order_Tax_Asessed_Entry", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Assesed.Visible = true;
            grd_Assesed.DataSource = dtuser;
            grd_Assesed.DataBind();

        }
        else
        {

            grd_Assesed.DataSource = null;
            grd_Assesed.EmptyDataText = "No Records Are Avilable";
            grd_Assesed.DataBind();

        }
    }
    protected void Gridview_Bind_Tax_Type_Comments()
    {
        Hashtable ht_Comments = new Hashtable();
        DataTable dt_Comments = new System.Data.DataTable();
        ht_Comments.Add("@Trans", "SELECT");
        ht_Comments.Add("@Order_Id", Order_Id);
        dt_Comments = dataaccess.ExecuteSP("Sp_Orders_Tax_County_Comments", ht_Comments);
        if (dt_Comments.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Grd_Tax_Type_Comments.Visible = true;
            Grd_Tax_Type_Comments.DataSource = dt_Comments;
            Grd_Tax_Type_Comments.DataBind();

        }
        else
        {
            Grd_Tax_Type_Comments.Visible = true;
            Grd_Tax_Type_Comments.DataSource = null;
            Grd_Tax_Type_Comments.EmptyDataText = "No Orders Added";
            Grd_Tax_Type_Comments.DataBind();
        }

    }

    protected void Gridview_Bind_Order_Agency_Kb_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@County_Id", ViewState["County_Id"]);
        dtuser = dataaccess.ExecuteSP("Sp_Orders_Agency_Knowledge_Base", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Agency.Visible = true;
            grd_Agency.DataSource = dtuser;
            grd_Agency.DataBind();

        }
        else
        {

            grd_Agency.DataSource = null;
            grd_Agency.EmptyDataText = "No Records Are Avilable";
            grd_Agency.DataBind();

        }
    }
    protected void Gridview_bind_Tax_Sold_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Orders_Tax_Sales_Entry", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Tax_Sold.Visible = true;
            grd_Tax_Sold.DataSource = dtuser;
            grd_Tax_Sold.DataBind();

        }
        else
        {

            grd_Tax_Sold.DataSource = null;
            grd_Tax_Sold.EmptyDataText = "No Records Are Avilable";
            grd_Tax_Sold.DataBind();

        }

    }
    protected void Gridview_bind_Bankrupty_Tax_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Orders_Tax_Bankrupt_Entry", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grid_Banckrupty.Visible = true;
            grid_Banckrupty.DataSource = dtuser;
            grid_Banckrupty.DataBind();

        }
        else
        {

            grid_Banckrupty.DataSource = null;
            grid_Banckrupty.EmptyDataText = "No Records Are Avilable";
            grid_Banckrupty.DataBind();

        }

    }
    protected void Gridview_Bind_CountyDatabaseInformation()
    {

        Hashtable htselCountyDdata = new Hashtable();
        DataTable dtCountyData = new System.Data.DataTable();

        htselCountyDdata.Add("@Trans", "SELECT_COUNTYDB_TAXTYPE");
        htselCountyDdata.Add("@Order_Id", Order_Id);
        dtCountyData = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htselCountyDdata);
        if (dtCountyData.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Tax_County_Database.Visible = true;
            grd_Tax_County_Database.DataSource = dtCountyData;
            grd_Tax_County_Database.DataBind();

        }
        else
        {

            grd_Tax_County_Database.DataSource = null;
            grd_Tax_County_Database.EmptyDataText = "No Records Are Avilable";
            grd_Tax_County_Database.DataBind();

        }

    }
    protected void Gridview_Bind_Tax_type_Source_Upload_Data()
    {
        //    int Tax_Type_Id ;
        //    if (ddl_Source_upload_Taxtype.SelectedValue.ToString() != "SELECT")
        //    {
        //        Tax_Type_Id = int.Parse(ddl_Source_upload_Taxtype.SelectedValue.ToString());
        //    }
        //    else
        //    {
        //        Tax_Type_Id = 0;
        //    }
        Hashtable htselSourceuploadkb = new Hashtable();
        DataTable dtselSourceuploadkb = new System.Data.DataTable();

        htselSourceuploadkb.Add("@Trans", "SELECT");
        htselSourceuploadkb.Add("@Order_Id", Order_Id);
        // htselSourceuploadkb.Add("@Tax_Type_Id", Tax_Type_Id);
        dtselSourceuploadkb = dataaccess.ExecuteSP("Sp_Orders_Tax_Source_Upload", htselSourceuploadkb);
        if (dtselSourceuploadkb.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Tax_Type_Source_upload.Visible = true;
            Tax_Type_Source_upload.DataSource = dtselSourceuploadkb;
            Tax_Type_Source_upload.DataBind();

        }
        else
        {

            Tax_Type_Source_upload.DataSource = null;
            Tax_Type_Source_upload.EmptyDataText = "No Records Are Avilable";
            Tax_Type_Source_upload.DataBind();

        }
    }
    protected void Gridview_Bind_Order_Deliquent_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Orders_Tax_Deliquent_County_Data", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Grid_Delequent_Data.Visible = true;
            Grid_Delequent_Data.DataSource = dtuser;
            Grid_Delequent_Data.DataBind();

        }
        else
        {

            Grid_Delequent_Data.DataSource = null;
            Grid_Delequent_Data.EmptyDataText = "No Records Are Avilable";
            Grid_Delequent_Data.DataBind();

        }
    }
    protected void tbpnluser_Click(object sender, EventArgs e)
    {
        Web_info.Visible = true;
        IT_comp.Visible = false;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        County_Db.Visible = false;
        btn_lnkCountyDb.Visible = false;
        btnlnkDelequentDb.Visible = false;
        td_row.Visible = true;
        tr_county.Visible = false;
        tr_countydb.Visible = false;

        tabweb = 1;

        if (tabweb == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            tbpnluser.ForeColor = foclr;
            tbpnluser.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
   //     tr_btnCounty.Visible = false;
    }
    protected void tabitcomplent_Click(object sender, EventArgs e)
    {
        Web_info.Visible = false;
        IT_comp.Visible = true;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        County_Db.Visible = false;
        btn_lnkCountyDb.Visible = false;
        btnlnkDelequentDb.Visible = false;
        tr_county.Visible = false;
        tr_countydb.Visible = false;
        td_row.Visible = true;
        tabit = 1;

        if (tabit == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            tabitcomplent.ForeColor = foclr;
            tabitcomplent.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
      //  tr_btnCounty.Visible = false;
    }
    protected void tbpnlusrdetails_Click(object sender, EventArgs e)
    {
        Web_info.Visible = false;
        IT_comp.Visible = false;
        Order_Kb.Visible = true;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        County_Db.Visible = false;
        btn_lnkCountyDb.Visible = false;
        btnlnkDelequentDb.Visible = false;
        tr_county.Visible = false;
        tr_countydb.Visible = false;
        td_row.Visible = true;
        taborder = 1;

        if (taborder == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            tbpnlusrdetails.ForeColor = foclr;
            tbpnlusrdetails.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }

        //tr_btnCounty.Visible = false;
    }
    protected void tbpnljobdetails_Click(object sender, EventArgs e)
    {
        Web_info.Visible = false;
        IT_comp.Visible = false;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = true;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        County_Db.Visible = false;
        btn_lnkCountyDb.Visible = false;
        btnlnkDelequentDb.Visible = false;
        tr_county.Visible = false;
        tr_countydb.Visible = false;
        td_row.Visible = true;
        tabagency = 1;

        if (tabagency == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            tbpnljobdetails.ForeColor = foclr;
            tbpnljobdetails.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }

       // tr_btnCounty.Visible = false;
    }
    protected void taboutputpreview_Click(object sender, EventArgs e)
    {
        ModalPopupExtend_Preview.Show();
        //Web_info.Visible = false;
        //IT_comp.Visible = false;
        //Order_Kb.Visible = false;
        //Agency_Kb.Visible = false;
        //Out_Put_Preview.Visible = true;
        //County_Comm.Visible = false;
        //County_Db.Visible = false;
        //btn_lnkCountyDb.Visible = false;
        //btnlnkDelequentDb.Visible = false;
        //tr_county.Visible = false;
        //tr_countydb.Visible = false;
        //td_row.Visible = true;
        tabout = 1;

        if (tabout == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            taboutputpreview.ForeColor = foclr;
            taboutputpreview.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }

      //  tr_btnCounty.Visible = false;
    }
    protected void tabcountycmt_Click(object sender, EventArgs e)
    {
        Web_info.Visible = false;
        IT_comp.Visible = false;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = true;
        County_Db.Visible = false;
        btn_lnkCountyDb.Visible = false;
        btnlnkDelequentDb.Visible = false;
        tr_county.Visible = false;
        tr_countydb.Visible = false;
        td_row.Visible = true;
        tabcmt = 1;

        if (tabcmt == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            tabcountycmt.ForeColor = foclr;
            tabcountycmt.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
      //  tr_btnCounty.Visible = false;
    }
    protected void tabcounty_Click(object sender, EventArgs e)
    {
        Web_info.Visible = false;
        IT_comp.Visible = false;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        County_Db.Visible = true;
        tr_county.Visible = true;
        tr_countydb.Visible = true;
        td_row.Visible = false;
        
       
        //tr_btnCounty.Visible = true;
        btn_lnkCountyDb.Visible = true;
        btnlnkDelequentDb.Visible = false;
        tabcountydb = 1;
        btncountydb = 1;

        if (tabcountydb == 1 && btncountydb == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
           
            btn_CountyDB.ForeColor = foclr;
            btn_CountyDB.BackColor = bgclr;
            tabcounty.ForeColor = foclr;
            tabcounty.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
        
    }
    protected void btn_CountyDB_Click(object sender, EventArgs e)
    {
        btn_lnkCountyDb.Visible = true;
        btnlnkDelequentDb.Visible = false;
        Web_info.Visible = false;
        IT_comp.Visible = false;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        tr_county.Visible = true;
        tr_countydb.Visible = true;
        tabcountydb = 1;
        btncountydb = 1;

        if (btncountydb == 1 && tabcountydb == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            tabcounty.ForeColor = foclr;
            tabcounty.BackColor = bgclr;
            btn_CountyDB.ForeColor = foclr;
            btn_CountyDB.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
       // tr_btnCounty.Visible = true;
        //County_Db.Visible = false;
    }
    protected void btn_DelequentDb_Click(object sender, EventArgs e)
    {
        btn_lnkCountyDb.Visible = false;
        btnlnkDelequentDb.Visible = true;
        Web_info.Visible = false;
        IT_comp.Visible = false;
        Order_Kb.Visible = false;
        Agency_Kb.Visible = false;
        Out_Put_Preview.Visible = false;
        County_Comm.Visible = false;
        tr_county.Visible = true;
        tr_countydb.Visible = true;
        btndeldb = 1;
        tabcountydb = 1;

        if (btndeldb == 1 &&tabcountydb == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            btn_DelequentDb.ForeColor = foclr;
            btn_DelequentDb.BackColor = bgclr;
            tabcounty.ForeColor = foclr;
            tabcounty.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
      //  tr_btnCounty.Visible = true;
        //County_Db.Visible = false;
    }
    protected void btn_Error_Submit_Click(object sender, EventArgs e)
    {
        if (txt_Error.Text != "")
        {
            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            string Uploadpath = @"\\192.168.12.33\TAXPLORER\IT COMPLIANTS\" + txt_Order_Number.Text;
            DirectoryInfo di = new DirectoryInfo(Uploadpath);

            if (di.Exists)
            {
                di.Delete(true);


                Directory.CreateDirectory(@"\\192.168.12.33\TAXPLORER\IT COMPLIANTS\" + txt_Order_Number.Text);
            }
            else if (!di.Exists)
            {
                Directory.CreateDirectory(@"\\192.168.12.33\TAXPLORER\IT COMPLIANTS\" + txt_Order_Number.Text);
            }
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload3.PostedFile.FileName);
                string fileName = c;
                if (fileName != "")
                {
                    string dest_path1 = @"\\192.168.12.33\TAXPLORER\IT COMPLIANTS\" + txt_Order_Number.Text + @"\" + fileName;
                    fileupload3.PostedFile.SaveAs(dest_path1);

                    ViewState["Path"] = dest_path1;

                    path = ViewState["Path"].ToString();
                }
            }
            else
            {

                path = null;
            }




            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htorderkb.Add("@Trans", "INSERT");
            htorderkb.Add("@Order_Id", Order_Id);
            htorderkb.Add("@Error_Name", txt_Error.Text);
            htorderkb.Add("@Error_Path", path);
            htorderkb.Add("@Inserted_By", userid);
            htorderkb.Add("@Inserted_date", date);
            htorderkb.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Orders_IT_Error", htorderkb);
            Gridview_Bind_IT_Error_Data();
            txt_Error.Text = "";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Your request has Sent to IT Team,We Will Response You Soon')</script>", false);
            //fileuploadError.FileName = null;


        }
        else
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Error Name')</script>", false);
        }

    }
    private bool Validate_Order_Kb()
    {


        if (txt_order_Kb_Comment.Text == "")
        {
            txt_order_Kb_Comment.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Comment')</script>", false);
            return false;


        }
        return true;
    }
    protected void img_btn_order_kb_add_Click(object sender, EventArgs e)
    {
        tr_OrderKb.Visible = false;
        tr_OrderKb1.Visible = false;

        if (Validate_Order_Kb() != false && img_btn_order_kb_add.Text == "Add")
        {
          //  model1.Show();
            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            string Uploadpath = @"\\192.168.12.33\TAXPLORER\ORDER KB\" + txt_Order_Number.Text;
            DirectoryInfo di = new DirectoryInfo(Uploadpath);

           
             if (!di.Exists)
            {
                Directory.CreateDirectory(@"\\192.168.12.33\TAXPLORER\ORDER KB\" + txt_Order_Number.Text);
            }
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload1.PostedFile.FileName);
                string fileName = c;
                extension = Path.GetExtension(fileupload1.FileName);
                if (fileName != "")
                {
                    string dest_path1 = @"\\192.168.12.33\TAXPLORER\ORDER KB\" + txt_Order_Number.Text + @"\" + fileName;
                    fileupload1.PostedFile.SaveAs(dest_path1);
                    ViewState["FPath"] = dest_path1;

                    Order_Kbpath = ViewState["FPath"].ToString();
                }
            }
            else
            {

                Order_Kbpath = null;
            }
            DateTime date = new DateTime();
            date = DateTime.Now;
            htorderkb.Add("@Trans", "INSERT");
            htorderkb.Add("@Subprocess_Id", int.Parse(Session["Sub_processID"].ToString()));
            htorderkb.Add("@Order_Id", Order_Id);
            htorderkb.Add("@Document_Name", txt_order_Kb_Document.Text);
            htorderkb.Add("@Comments", txt_order_Kb_Comment.Text);
            htorderkb.Add("@Order_kb_File_Type", extension);
            if (Order_Kbpath != null)
            {
                htorderkb.Add("@Order_Kb_Path", Order_Kbpath);
            }
            htorderkb.Add("@Inserted_By", userid);
            htorderkb.Add("@Inserted_date", date);
            htorderkb.Add("@Modified_By", userid);
            htorderkb.Add("@Modified_Date", date);
            htorderkb.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htorderkb);
            Gridview_Bind_Order_Kb_Data();

            ClearOrderandAgency();

        }
        else if (img_btn_order_kb_add.Text == "UPDATE" && Validate_Order_Kb() != false)
        {
           // model1.Show();

            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            string Uploadpath = @"\\192.168.12.33\TAXPLORER\ORDER KB\" + txt_Order_Number.Text;
            DirectoryInfo di = new DirectoryInfo(Uploadpath);

            
             if (!di.Exists)
            {
                Directory.CreateDirectory(@"\\192.168.12.33\TAXPLORER\ORDER KB\" + txt_Order_Number.Text);
            }
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload1.PostedFile.FileName);
                string fileName = c;
                extension = Path.GetExtension(fileupload1.FileName);
                if (fileName != "")
                {
                    string dest_path1 = @"\\192.168.12.33\TAXPLORER\ORDER KB\" + txt_Order_Number.Text + @"\" + fileName;
                    fileupload1.PostedFile.SaveAs(dest_path1);

                    ViewState["FPath"] = dest_path1;

                    Order_Kbpath = ViewState["FPath"].ToString();
                }
            }
            else
            {

                Order_Kbpath = null;
            }
            DateTime date = new DateTime();
            date = DateTime.Now;
            htorderkb.Add("@Trans", "UPDATE");
            htorderkb.Add("@Order_Kb_Id", ViewState["Order_Kb_Id"]);
            htorderkb.Add("@Subprocess_Id", userid);
            htorderkb.Add("@Order_Id", Order_Id);
            htorderkb.Add("@Document_Name", txt_order_Kb_Document.Text);
            htorderkb.Add("@Comments", txt_order_Kb_Comment.Text);
            htorderkb.Add("@Order_kb_File_Type", extension);
            htorderkb.Add("@Order_Kb_Path", Order_Kbpath);
            htorderkb.Add("@Modified_By", userid);
            htorderkb.Add("@Modified_Date", date);
            htorderkb.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htorderkb);
         
            img_btn_order_kb_add.Text = "Add";
            ClearOrderandAgency();
            Gridview_Bind_Order_Kb_Data();

        }

        //model1.Hide();
    }
    protected void ClearOrderandAgency()
    {

        txt_order_Kb_Comment.Text = "";
        txt_order_Kb_Document.Text = "";
        txt_Agency_Comment.Text = "";


    }
    protected void imgbtn_agency_Add_Click(object sender, EventArgs e)
    {
        tr_Agency.Visible = false;
        if (Validate_Order_Agency_Kb() != false && imgbtn_agency_Add.Text != "UPDATE")
        {
          
            Hashtable htagencykb = new Hashtable();
            DataTable agencykb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htagencykb.Add("@Trans", "INSERT");
            htagencykb.Add("@County_Id", ViewState["County_Id"]);
            htagencykb.Add("@Comments", txt_Agency_Comment.Text);
            htagencykb.Add("@Inserted_By", userid);
            htagencykb.Add("@Inserted_date", date);
            htagencykb.Add("@Modified_By", userid);
            htagencykb.Add("@Modified_Date", date);
            htagencykb.Add("@status", "True");
            agencykb = dataaccess.ExecuteSP("Sp_Orders_Agency_Knowledge_Base", htagencykb);

            Gridview_Bind_Order_Agency_Kb_Data();
            ClearOrderandAgency();
        }
        else if (imgbtn_agency_Add.Text == "UPDATE")
        {

            Hashtable htagencykb = new Hashtable();
            DataTable agencykb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            string Chanesto = txt_Agency_Comment.Text;
            htagencykb.Add("@Trans", "UPDATE");  //Keep User Tracking
            htagencykb.Add("@Order_Agency_Kb_Id", ViewState["Agency_Order_Kb_Id"]);
            htagencykb.Add("@County_Id", ViewState["County_Id"]);
            htagencykb.Add("@Comments", Chanesto.ToString());
            htagencykb.Add("@Modified_By", userid);
            htagencykb.Add("@Modified_Date", date);
            htagencykb.Add("@status", "True");


            agencykb = dataaccess.ExecuteSP("Sp_Orders_Agency_Knowledge_Base", htagencykb);
            
            ClearOrderandAgency();
            imgbtn_agency_Add.Text = "Add";
            Gridview_Bind_Order_Agency_Kb_Data();

        }

    }
    private bool Validate_Order_Agency_Kb()
    {

        if (txt_Agency_Comment.Text == "")
        {
            txt_Agency_Comment.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Comment')</script>", false);
            return false;


        }
        return true;
    }
    protected void imgbtn_Taxtype_Note_Add_Click(object sender, EventArgs e)
    {
        tr_CountyData.Visible = false;
        tr_CountyData1.Visible = false;
        Hashtable httaxnotes = new Hashtable();
        DataTable dtcountytaxnotes = new System.Data.DataTable();
        if (ImageButton3.Text == "Add")
        {
            DateTime datecountynote = new DateTime();
            datecountynote = DateTime.Now;
               dbc.BindComments_Tax_Type(ddl_TaxType_Commts, Order_Id);
            httaxnotes.Add("@Trans", "INSERT");
            httaxnotes.Add("@Order_Id", Order_Id);
            httaxnotes.Add("@Tax_Id", int.Parse(ddl_TaxType_Commts.SelectedValue.ToString()));

            httaxnotes.Add("@Note", Txt_taxtype_Comments.Text);
            httaxnotes.Add("@Inserted_By", userid);
            httaxnotes.Add("@Inserted_date", DateTime.Now);
            httaxnotes.Add("@Status", "True");
            dtcountytaxnotes = dataaccess.ExecuteSP("Sp_Orders_Tax_County_Comments", httaxnotes);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Comment add successfully')</script>", false);
        }
        else if (ImageButton3.Text=="UPDATE")
        {
            httaxnotes.Add("@Trans", "UPDATE");
            httaxnotes.Add("@Tax_Id", int.Parse(ddl_TaxType_Commts.SelectedValue.ToString()));
            httaxnotes.Add("@Note_Id", int.Parse(Session["lblNote_Id"].ToString()));
            httaxnotes.Add("@Note", Txt_taxtype_Comments.Text);
            httaxnotes.Add("@Modified_By", userid);
            httaxnotes.Add("@Modified_Date", DateTime.Now);
            dtcountytaxnotes = dataaccess.ExecuteSP("Sp_Orders_Tax_County_Comments", httaxnotes);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Comment update successfully')</script>", false);
        }
        ddl_TaxType_Commts.SelectedValue = "SELECT";

        Txt_taxtype_Comments.Text = "";
        Gridview_Bind_Tax_Type_Comments();
    }
    protected void imgbtn_Delequent_Tax_Add_Click(object sender, EventArgs e)
    {
        tr_DelequentDb.Visible = false;
        tr_DelequentDb1.Visible = false;

        if (imgbtn_Delequent_Tax_Add.Text == "Add")
        {
         
            Hashtable htcountydata = new Hashtable();
            DataTable dtcountydata = new System.Data.DataTable();
            DateTime datecounty = new DateTime();
            datecounty = DateTime.Now;

            htcountydata.Add("@Trans", "INSERT");
            htcountydata.Add("@Order_Id", Order_Id);
            htcountydata.Add("@Tax_Type_Id", int.Parse(ddl_Tax_Delquent_Tax_type.SelectedValue.ToString()));
            htcountydata.Add("@Ph_No", txt_delequent_phno.Text);
            htcountydata.Add("@Make_Changes_Payable_to", txt_Delequent_Make_Changes.Text);
            htcountydata.Add("@Payee_Address", txt_Delequent_Payee_addres.Text);
            htcountydata.Add("@Inserted_By", userid);
            htcountydata.Add("@Inserted_date", datecounty);
            htcountydata.Add("@Status", "True");
            dtcountydata = dataaccess.ExecuteSP("Sp_Orders_Tax_Deliquent_County_Data", htcountydata);

            Gridview_Bind_Order_Deliquent_Data();
            ClearDeliquent();
           
        }
        else if (imgbtn_Delequent_Tax_Add.Text == "Update")
        {
            
            Hashtable htcountydata = new Hashtable();
            DataTable dtcountydata = new System.Data.DataTable();
            DateTime datecounty = new DateTime();
            datecounty = DateTime.Now;

            htcountydata.Add("@Trans", "UPDATE");
            htcountydata.Add("@Order_Id", Order_Id);
            htcountydata.Add("@Delequent_Database_Id", ViewState["Delequent_Database_Id"]);
            htcountydata.Add("@Tax_Type_Id", int.Parse(ddl_Tax_Delquent_Tax_type.SelectedValue.ToString()));
            htcountydata.Add("@Ph_No", txt_delequent_phno.Text);
            htcountydata.Add("@Make_Changes_Payable_to", txt_Delequent_Make_Changes.Text);
            htcountydata.Add("@Payee_Address", txt_Delequent_Payee_addres.Text);
            htcountydata.Add("@Inserted_By", userid);
            htcountydata.Add("@Inserted_date", datecounty);
            htcountydata.Add("@Status", "True");
            dtcountydata = dataaccess.ExecuteSP("Sp_Orders_Tax_Deliquent_County_Data", htcountydata);
          

            imgbtn_Delequent_Tax_Add.Text = "Add";
            Gridview_Bind_Order_Deliquent_Data();

            ClearDeliquent();
          
        }
    }
    protected void ClearDeliquent()
    {

        ddl_Tax_Delquent_Tax_type.SelectedIndex = 0;
        txt_Delequent_Make_Changes.Text = "";
        txt_Delequent_Payee_addres.Text = "";
        txt_delequent_phno.Text = "";


    }

    protected void ddl_TaxType_Commts_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddl_Tax_Delquent_Tax_type_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Check_TAx_Accesed_values()
    {



        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Order_Tax_Asessed_Entry", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Assesed Value Not Entered Do You Want To Preview')</script>", false);

        }


    }
    protected void btn_Preview_Click(object sender, EventArgs e)
    {


        Check_TAx_Accesed_values();
        string ParamX = Order_Id.ToString();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('Gls_Tax_Report_Preview.aspx?Param=" + ParamX.ToString() + "');", true);






        model1.Show();
        System.Data.Common.DbConnectionStringBuilder builder = new System.Data.Common.DbConnectionStringBuilder();
        builder.ConnectionString = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
        string server = builder["Data Source"] as string;
        string database = builder["Initial Catalog"] as string;
        string UserID = builder["User ID"] as string;
        string password = builder["Password"] as string;
        //int OrderID = int.Parse(Session["OrderID"].ToString());
        //int ClintID = int.Parse(Session["ClientID"].ToString());
        // string LetterCase = Convert.ToString(Session["CaseLetter"].ToString());
        //int SubProcessID = int.Parse(Session["SubProcessID"].ToString());
        // string Trans = "OrderWise";

        //int ProcessID=1;

        TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
        TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
        ConnectionInfo crConnectionInfo = new ConnectionInfo();
        Tables CrTables;
        rptDoc.Load(Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.rpt"));

        // Order_Details_Page_1 Parameterhttp:
        rptDoc.SetParameterValue("@Order_ID", Order_Id);
        rptDoc.SetParameterValue("@Order_ID", Order_Id, "Notes");

        crConnectionInfo.ServerName = server;
        crConnectionInfo.DatabaseName = database;
        crConnectionInfo.UserID = UserID;
        crConnectionInfo.Password = password;
        CrTables = rptDoc.Database.Tables;
        foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
        {
            crtableLogoninfo = CrTable.LogOnInfo;
            crtableLogoninfo.ConnectionInfo = crConnectionInfo;
            CrTable.ApplyLogOnInfo(crtableLogoninfo);
        }

        foreach (ReportDocument sr in rptDoc.Subreports)
        {
            foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in sr.Database.Tables)
            {
                crtableLogoninfo = CrTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                CrTable.ApplyLogOnInfo(crtableLogoninfo);

            }
        }

        Session["rptDoc"] = rptDoc;
        rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.pdf"));
        // CrystalReportViewer1.ReportSource = rptDoc;
        //MemoryStream oStream = default(MemoryStream);
        //oStream = (MemoryStream)rptDoc.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
        //Response.Clear();
        //Response.Buffer = true;
        //Response.ContentType = "application/pdf";
        //Response.BinaryWrite(oStream.ToArray());
        //Response.End();
        //   RadPdfTableTruncate();
        // PdfView();

        Session["order_id"] = Order_Id.ToString();
        Response.Redirect("~/Gls/Gls_Tax_Report_Preview.aspx");
        model1.Hide();
    }
    private bool Validate_Order_Info()
    {

        if (txt_Production_Date.Text == "")
        {
            txt_Production_Date.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Production Date')</script>", false);
        
            return false;


        }
        else if (ddl_Status.SelectedIndex <= 0)
        {
            ddl_Status.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Order Status')</script>", false);
            return false;

        }
        return true;
    }
    protected void btn_Complete_Click(object sender, EventArgs e)
    {
        if (Validate_Order_Info() != false)
        {
            if (Order_Type == "Web/Call" || Order_Type == "Mail/Fax")
            {
                if (ddl_Status.SelectedValue == "6")
                {
                    DateTime date = new DateTime();
                    date = DateTime.Now;
                    string dateeval = date.ToString("dd/MM/yyyy");
                    string time = date.ToString("hh:mm tt");
                   



                    Hashtable htcheckproducion = new Hashtable();
                    DataTable dtcheckproduction = new System.Data.DataTable();
                    htcheckproducion.Add("@Trans", "Sp_Order_Production");
                    htcheckproducion.Add("@Order_ID", Order_Id);
                    htcheckproducion.Add("@Order_Status_Id", ViewState["Order_Status"]);
                    htcheckproducion.Add("@Order_Task_Id", ViewState["Order_Task"]);
                    dtcheckproduction = dataaccess.ExecuteSP("Sp_Order_Production", htcheckproducion);

                    if (dtcheckproduction.Rows.Count > 0)
                    {

                        Production_Check = int.Parse(dtcheckproduction.Rows[0]["count"].ToString());
                    }
                    else
                    {

                        Production_Check = 0;
                    }

                    if (Production_Check == 0)
                    {
                        Hashtable htinsertproducion = new Hashtable();
                        DataTable dtinsertproduction = new System.Data.DataTable();
                        htinsertproducion.Add("@Trans", "INSERT");
                        htinsertproducion.Add("@Order_ID", Order_Id);
                        htinsertproducion.Add("@Order_Status_Id",6);
                        htinsertproducion.Add("@Order_Task_Id", int.Parse(ViewState["Order_Task"].ToString()));
                        htinsertproducion.Add("@User_Id", userid);
                        htinsertproducion.Add("@Production_Date", txt_Production_Date.Text);
                        htinsertproducion.Add("@Inserted_By", userid);
                        htinsertproducion.Add("@Instered_Date", dateeval);
                        htinsertproducion.Add("@Status","True");

                        dtinsertproduction = dataaccess.ExecuteSP("Sp_Order_Production", htinsertproducion);

                    }


                    Hashtable htupdate = new Hashtable();
                    DataTable dtupdate = new System.Data.DataTable();
                    htupdate.Add("@Trans", "UPDATE_STATUS");
                    htupdate.Add("@Order_ID", Order_Id);
                    htupdate.Add("@Order_Status", 1);
                    htupdate.Add("@Modified_By", userid);
                    htupdate.Add("@Modified_Date", dateeval);

                    dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);

                    Hashtable htupdatestatus = new Hashtable();
                    DataTable dtupdatestatus = new System.Data.DataTable();
                    htupdatestatus.Add("@Trans", "UPDATE_TASK");
                    htupdatestatus.Add("@Order_ID", Order_Id);
                    htupdatestatus.Add("@Order_Task", 5);
                    htupdatestatus.Add("@Modified_By", userid);
                    htupdatestatus.Add("@Modified_Date", dateeval);

                    dtupdatestatus = dataaccess.ExecuteSP("Sp_Order", htupdatestatus);
                    Hashtable htorderAllocate = new Hashtable();
                    DataTable dtorderallocate = new System.Data.DataTable();
                    htorderAllocate.Add("@Trans", "DELETE");
                    htorderAllocate.Add("@Order_ID", Order_Id);
                    htorderAllocate.Add("@Modified_By", userid);
                    htorderAllocate.Add("@Modified_Date", date);
                    dtorderallocate = dataaccess.ExecuteSP("Sp_Order_Assignment", htorderAllocate);

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Completed Sucessfully')</script>", false);
                }
                else if (ddl_Status.SelectedValue == "9")
                {
                    DateTime date = new DateTime();
                    date = DateTime.Now;
                    string dateeval = date.ToString("dd/MM/yyyy");
                    string time = date.ToString("hh:mm tt");
                    Hashtable htupdate = new Hashtable();
                    DataTable dtupdate = new System.Data.DataTable();
                    htupdate.Add("@Trans", "UPDATE_STATUS");
                    htupdate.Add("@Order_ID", Order_Id);
                    htupdate.Add("@Order_Status", 9);
                    htupdate.Add("@Modified_By", userid);
                    htupdate.Add("@Modified_Date", dateeval);

                    dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);



                }
            }
        }
        else if (Order_Type == "QC" && Validate_Order_Info() != false)
        {

          
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            Hashtable htupdate = new Hashtable();
            DataTable dtupdate = new System.Data.DataTable();
            htupdate.Add("@Trans", "UPDATE_TASK");
            htupdate.Add("@Order_ID", Order_Id);
            htupdate.Add("@Order_Task", 5);
            htupdate.Add("@Modified_By", userid);
            htupdate.Add("@Modified_Date", dateeval);
            dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);

            System.Data.Common.DbConnectionStringBuilder builder = new System.Data.Common.DbConnectionStringBuilder();
            builder.ConnectionString = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
            string server = builder["Data Source"] as string;
            string database = builder["Initial Catalog"] as string;
            string UserID = builder["User ID"] as string;
            string password = builder["Password"] as string;


            TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            Tables CrTables;
            rptDoc.Load(Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.rpt"));

            // Order_Details_Page_1 Parameterhttp:
            rptDoc.SetParameterValue("@Order_ID", Order_Id);

            rptDoc.SetParameterValue("@Order_ID", Order_Id, "Notes");
            crConnectionInfo.ServerName = server;
            crConnectionInfo.DatabaseName = database;
            crConnectionInfo.UserID = UserID;
            crConnectionInfo.Password = password;
            CrTables = rptDoc.Database.Tables;
            foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
            {
                crtableLogoninfo = CrTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                CrTable.ApplyLogOnInfo(crtableLogoninfo);
            }

            foreach (ReportDocument sr in rptDoc.Subreports)
            {
                foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in sr.Database.Tables)
                {
                    crtableLogoninfo = CrTable.LogOnInfo;
                    crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                    CrTable.ApplyLogOnInfo(crtableLogoninfo);

                }
            }


           // CrystalReportViewer1.ReportSource = rptDoc;
            MemoryStream oStream = default(MemoryStream);
            oStream = (MemoryStream)rptDoc.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.BinaryWrite(oStream.ToArray());
            //Response.End();

            string Uploadpath = "~/Export Report/" + Order_Id + "/";
            DirectoryInfo di = new DirectoryInfo(Uploadpath);

            if (di.Exists)
            {
                di.Delete(true);

                Directory.CreateDirectory(Server.MapPath(Uploadpath));
            }
            else if (!di.Exists)
            {
                Directory.CreateDirectory(Server.MapPath(Uploadpath));
            }
            Hashtable htcheck = new Hashtable();
            DataTable dtcheck = new System.Data.DataTable();
            htcheck.Add("@Trans", "Check");
            htcheck.Add("@Order_Id", Order_Id);
            dtcheck = dataaccess.ExecuteSP("Sp_Orders_Report_Path", htcheck);
            if (dtcheck.Rows.Count > 0)
            {

                Orderpath_Count = int.Parse(dtcheck.Rows[0]["Count"].ToString());
            }
            else
            {

                Orderpath_Count = 0;

            }
            string Upath = "~/Export Report/" + Order_Id + "/" + ViewState["Order_Number"].ToString() + ".pdf" + "";
            if (Orderpath_Count == 0)
            {
                Hashtable htorderpath = new Hashtable();
                DataTable dtorderpath = new System.Data.DataTable();

                DateTime date1 = new DateTime();
                date1 = DateTime.Now;
                string dateeval1 = date1.ToString("dd/MM/yyyy");
                string time1 = date.ToString("hh:mm tt");

                htorderpath.Add("@Trans", "INSERT");
                htorderpath.Add("@Order_Id", Order_Id);
                htorderpath.Add("@File_Name", ViewState["Order_Number"].ToString() + ".pdf");
                htorderpath.Add("@Document_Path", Upath);
                htorderpath.Add("@Inserted_By", userid);
                htorderpath.Add("@Inserted_date", date1);
                htorderpath.Add("@Modified_By", userid);
                htorderpath.Add("@Modified_Date", date1);
                htorderpath.Add("@status", "True");
                dtorderpath = dataaccess.ExecuteSP("Sp_Orders_Report_Path", htorderpath);
            }
            else if (Orderpath_Count > 0)
            {

                Hashtable htorderpath = new Hashtable();
                DataTable dtorderpath = new System.Data.DataTable();

                DateTime date1 = new DateTime();
                date1 = DateTime.Now;
                string dateeval1 = date1.ToString("dd/MM/yyyy");
                string time1 = date.ToString("hh:mm tt");

                htorderpath.Add("@Trans", "Update");
                htorderpath.Add("@Order_Id", Order_Id);
                htorderpath.Add("@File_Name", ViewState["Order_Number"].ToString() + ".pdf");
                htorderpath.Add("@Document_Path", Upath);
                htorderpath.Add("@Inserted_By", userid);
                htorderpath.Add("@Inserted_date", date1);
                htorderpath.Add("@Modified_By", userid);
                htorderpath.Add("@Modified_Date", date1);
                htorderpath.Add("@status", "True");
                dtorderpath = dataaccess.ExecuteSP("Sp_Orders_Report_Path", htorderpath);
            }

            //    string c = Path.GetFileName(fileuploadError.PostedFile.FileName);
            //    string fileName = c;
            //    if (fileName != "")
            //    {

            //        fileuploadError.PostedFile.SaveAs(Server.MapPath(Uploadpath) + fileName);
            //        ViewState["Path"] = Uploadpath.ToString() + fileName;

            //        path = ViewState["Path"].ToString();
            //    }
            //}

            string filePath = Server.MapPath("~/Export Report/" + Order_Id + "/") + ViewState["Order_Number"].ToString() + ".pdf";




            ExportOptions rptExportOption;
            DiskFileDestinationOptions rptFileDestOption = new DiskFileDestinationOptions();
            PdfRtfWordFormatOptions rptFormatOption = new PdfRtfWordFormatOptions();

            string reportFileName = filePath;

            rptFileDestOption.DiskFileName = reportFileName;
            rptExportOption = rptDoc.ExportOptions;
            {
                rptExportOption.ExportDestinationType = ExportDestinationType.DiskFile;
                rptExportOption.ExportFormatType = ExportFormatType.PortableDocFormat;
                rptExportOption.ExportDestinationOptions = rptFileDestOption;
                rptExportOption.ExportFormatOptions = rptFormatOption;


            }
            rptDoc.Export();

            Response.End();

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Completed Sucessfully')</script>", false);
          


        }
    }
    
    protected void btn_PreviewMail_Click(object sender, EventArgs e)
    {

    }
    protected void btn_PreviewFax_Click(object sender, EventArgs e)
    {

    }
    protected void btn_PreviewEfax_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {

    }
    protected void txt_ETA_date_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txt_Barrower_Address_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txt_Parcel_Number_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txt_Barrower_City_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txt_Barrower_Zip_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txt_Barrower_Last_Name_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddl_Barrower_State_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Tab_TaxDetails_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = true;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
        //Municipal_Det.Visible = false;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = false;
        tr_Taxdet.Visible = true;
        Tab_CurrentYear.Visible = true;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = false;
        tabtax = 1;
        if (tabtax == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_TaxDetails.ForeColor = foclr;
            Tab_TaxDetails.BackColor = bgclr;
        }
        tabcurrent = 1;
        if (tabcurrent == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            TabPanelcurrent.ForeColor = foclr;
            TabPanelcurrent.BackColor = bgclr;
        }


    }
    protected void Tab_AssedVal_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = false;
        Assed_Val.Visible = true;
        Tax_SalDet.Visible = false;
        // Municipal_Det.Visible = false;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = false;
        tr_Taxdet.Visible = false;
        Tab_CurrentYear.Visible = false;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = false;
        tabassed = 1;
        if (tabassed == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_AssedVal.ForeColor = foclr;
            Tab_AssedVal.BackColor = bgclr;
        }
        
    }
    protected void Tab_SalDetail_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = true;
        //   Municipal_Det.Visible = false;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = false;
        tr_Taxdet.Visible = false;
        Tab_CurrentYear.Visible = false;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = false;
        tabsaldet = 1;
        if (tabsaldet == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_SalDetail.ForeColor = foclr;
            Tab_SalDetail.BackColor = bgclr;
        }
    }
    protected void Tab_MuncipleDet_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
       // Municipal_Det.Visible = true;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = false;
    }
    protected void Tab_BankruptyDet_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
        Bankrupty_Det22.Visible = true;
        Source_Upload.Visible = false;
        tr_Taxdet.Visible = false;
        Tab_CurrentYear.Visible = false;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = false;
        tabbankrupty = 1;
        if (tabbankrupty == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_BankruptyDet.ForeColor = foclr;
            Tab_BankruptyDet.BackColor = bgclr;
        }
    }
    protected void Tab_SourceUpload_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
        // Municipal_Det.Visible = false;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = true;
        tr_Taxdet.Visible = false;
        Tab_CurrentYear.Visible = false;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = false;
        tabsrcupload = 1;
        if (tabsrcupload == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_SourceUpload.ForeColor = foclr;
            Tab_SourceUpload.BackColor = bgclr;
        }
    }
    protected void txt_Land_TextChanged(object sender, EventArgs e)
    {
        CalculateTotal();
        txt_Building.Focus();
    }
    protected void txt_Building_TextChanged(object sender, EventArgs e)
    {
        CalculateTotal();
        btn_Assesd_Add.Focus();
    }
    protected void CalculateTotal()
    {
        if (txt_Land.Text != "")
        {

            Land = Convert.ToDecimal(txt_Land.Text);
        }
        else
        {

            Land = 0;
        }
        if (txt_Building.Text != "")
        {

            Building = Convert.ToDecimal(txt_Building.Text);
        }
        else
        {

            Building = 0;
        }

        Total = Land + Building;
        txt_total.Text = Total.ToString();
    }
    protected void imgbtn_Assesd_Add_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtn_Munciple_Add_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ddl_Bankruptcy_Yes_No_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Imgbtn_Brancrupty_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void img_btn_order_source_tax_upload_add_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void btnDownload_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void Gridview_Bind_IT_Error_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Orders_IT_Error", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Grid_Order_IT_Error.Visible = true;
            Grid_Order_IT_Error.DataSource = dtuser;
            Grid_Order_IT_Error.DataBind();

        }
        else
        {

            Grid_Order_IT_Error.DataSource = null;
            Grid_Order_IT_Error.EmptyDataText = "No Records Are Avilable";
            Grid_Order_IT_Error.DataBind();

        }
    }

    protected void Gridview_Bind_Order_Kb_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_order_kb.Visible = true;
            grd_order_kb.DataSource = dtuser;
            grd_order_kb.DataBind();

        }
        else
        {

            grd_order_kb.DataSource = null;
            grd_order_kb.EmptyDataText = "No Records Are Avilable";
            grd_order_kb.DataBind();

        }
    }
    protected void grd_order_kb_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_order_kb_id = (Label)e.Row.FindControl("lblOrder_Kb_Id");
            Label lbl_order_kb_fileType = (Label)e.Row.FindControl("lbl_Order_Kb_File_Type");
            Label lbl_order_kb_filepath = (Label)e.Row.FindControl("lbl_orderkb_doc_path");
            ImageButton imbtn_orderdoc = (ImageButton)e.Row.FindControl("imgbtndoc");

            if (lbl_order_kb_filepath.Text != "" && lbl_order_kb_filepath.Text != null)
            {
                ViewState["doc_type"] = lbl_order_kb_fileType.Text;
                ViewState["doc_path"] = lbl_order_kb_filepath.Text;
                imbtn_orderdoc.Visible = true;

                if (lbl_order_kb_fileType.Text == ".doc" || lbl_order_kb_fileType.Text == ".docx")
                {
                    imbtn_orderdoc.ImageUrl = "~/img/word.png";

                }
                else if (lbl_order_kb_fileType.Text == ".xls" || lbl_order_kb_fileType.Text == ".xlsx")
                {

                    imbtn_orderdoc.ImageUrl = "~/img/Excel.png";
                }
                else if (lbl_order_kb_fileType.Text == ".pdf")
                {

                    imbtn_orderdoc.ImageUrl = "~/img/pdf.png";
                }
                else {

                    imbtn_orderdoc.ImageUrl = "~/Admin/MsgImage/Download.png";
                }
            }
            else
            {

                imbtn_orderdoc.Visible = false;
            }



        }
    }
   
    protected void btn_AddOrder_Click(object sender, ImageClickEventArgs e)
    {
        tr_OrderKb.Visible = true;
        tr_OrderKb1.Visible = true;
    }
    
    protected void btn_AddAgency_Click(object sender, ImageClickEventArgs e)
    {
        tr_Agency.Visible = true;
    }
    protected void btn_AddCountyCmt_Click(object sender, ImageClickEventArgs e)
    {
        tr_CountyData.Visible = true;
        tr_CountyData1.Visible = true;
    }
    
    protected void btn_AddCountyDb_Click(object sender, ImageClickEventArgs e)
    {
        tr_CountyDbInfo.Visible = true;
        tr_CountyDbInfo1.Visible = true;
    }
    protected void btn_AddDelequent_Click(object sender, ImageClickEventArgs e)
    {
        tr_DelequentDb.Visible = true;
        tr_DelequentDb1.Visible = true;
    }
    protected void btn_AddTaxDet_Click(object sender, ImageClickEventArgs e)
    {
        tr_TaxDataRow.Visible = true;
        tr_TaxDataRow1.Visible = true;
        tr_TaxDataRow2.Visible = true;
        tr_TaxDataRow3.Visible = true;
        tr_TaxDataRow4.Visible = true;
    }
    protected void btn_TaxSubmit_Click(object sender, EventArgs e)
    {

        //tabassed = 1;
        //if (tabassed == 1)
        //{
        //    Color bgclr = ColorTranslator.FromHtml("#12B61F");
        //    Color foclr = ColorTranslator.FromHtml("#ffffff");
        //    Tab_AssedVal.ForeColor = foclr;
        //    Tab_AssedVal.BackColor = bgclr;
        //}


        if (btn_TaxSubmit.Text == "Save")
        {

            if (ddl_Tax_Status_Entry.SelectedValue == "2")
            {

                if (txt_GTDt1.Text == "")
                {


                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Good Throgh Date')</script>", false);
                    //  model1.Hide();
                    return;
                }
                if (txt_GTDt2.Text == "")
                {


                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Good Throgh Date')</script>", false);
                    //  model1.Hide();
                    return;
                }

            }

            if (txt_Tax_Amount_Entry.Text != "")
            {

                tax_Base_Amount = Convert.ToDecimal(txt_Tax_Amount_Entry.Text.ToString());

            }
            else
            {
                tax_Base_Amount = 0;

            }
            if (txt_PayoffAmt1.Text != "") { tax_Pay_Off_Amount1 = Convert.ToDecimal(txt_PayoffAmt1.Text.ToString()); } else { tax_Pay_Off_Amount1 = 0; }
            if (txt_PayoffAmt2.Text != "") { tax_Pay_Off_Amount2 = Convert.ToDecimal(txt_PayoffAmt2.Text.ToString()); } else { tax_Pay_Off_Amount2 = 0; }
            if (txt_Tax_Paid_Amount_Amount_Entry.Text != "") { tax_Paid_Amount = Convert.ToDecimal(txt_Tax_Paid_Amount_Amount_Entry.Text.ToString()); } else { tax_Paid_Amount = 0; }
            // if (txt_Tax_Due_Amount_Amount_Entry.Text != "") { tax_due_Amount = Convert.ToDecimal(txt_Tax_Due_Amount_Amount_Entry.Text.ToString()); } else { tax_due_Amount = 0; }

            if (txt_Tax_Discount_Amount_Amount_Entry.Text != "") { tax_Discount_Amount = Convert.ToDecimal(txt_Tax_Discount_Amount_Amount_Entry.Text.ToString()); } else { tax_Discount_Amount = 0; }

            if (ddl_Tax_Type_Entry.Text != "")
            {
                Hashtable htinsertrec = new Hashtable();
                DataTable dtinsertrec = new System.Data.DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");
                string Amount = String.Format("{0:.##}", txt_Tax_Amount_Entry.Text);
                Tax_Amount = Convert.ToDecimal(Amount.ToString());
                htinsertrec.Add("@Trans", "INSERT");
                htinsertrec.Add("@Tax_No", txt_Parcel_Number.Text);
                htinsertrec.Add("@SubProcess_Id",Subprocess_id);
                htinsertrec.Add("@Order_Id", Order_Id);
                htinsertrec.Add("@Tax_Type_Id", ddl_Tax_Type_Entry.SelectedValue);
                htinsertrec.Add("@Year_Type", ddl_Tax_Year_Type.SelectedValue);
                htinsertrec.Add("@Tax_Year", txt_Tax_Year.Text);
                htinsertrec.Add("@Tax_Status_Id", ddl_Tax_Status_Entry.SelectedValue);
                htinsertrec.Add("@Tax_Base_Amount", tax_Base_Amount);
                htinsertrec.Add("@Tax_Payoff_Amount", tax_Pay_Off_Amount1);
                htinsertrec.Add("@Tax_Payoff_Amount2", tax_Pay_Off_Amount2);
                htinsertrec.Add("@Tax_Paid_Amount", tax_Paid_Amount);
                htinsertrec.Add("@Discount_Amount", tax_Discount_Amount);
                htinsertrec.Add("@Discount", ddl_Discount_Entry.SelectedValue);
                htinsertrec.Add("@Discount_Date", txt_Tax_Entry_Discount_Date.Text);

                htinsertrec.Add("@Tax_Due_Amount", tax_due_Amount);
                htinsertrec.Add("@Tax_Due_Date", txt_Tax_Due_Date_Entry.Text);
                htinsertrec.Add("@Tax_Period_Id", ddl_Tax_Period_Entry.SelectedValue);
                htinsertrec.Add("@Good_Through_Date", txt_GTDt1.Text);
                htinsertrec.Add("@Good_Through_Date2", txt_GTDt2.Text);
                htinsertrec.Add("@Paid_Date", txt_Tax_Entry_Paid_Date.Text);
                htinsertrec.Add("@Inserted_By", userid);
                htinsertrec.Add("@Inserted_date", date);
                htinsertrec.Add("@Status", "True");



                //INSERT TAX NOTES 


                if (ddl_Tax_Status_Entry.SelectedValue == "2")
                {
                    DateTime date1 = DateTime.Now;

                    if (txt_GTDt1.Text != "")
                    {
                        date2 = Convert.ToDateTime(txt_GTDt1.Text);
                    }
                    if (txt_GTDt2.Text != "")
                    {

                        date3 = Convert.ToDateTime(txt_GTDt2.Text);
                    }
                    int result = DateTime.Compare(date1, date2);
                    int result2 = DateTime.Compare(date1, date3);

                    if (result > 0 && result2 > 0)
                    {

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert(' Good Thru Date Should Be Greater Than Today')</script>", false);

                        return;

                    }
                    if (result <= 0 && result2 <= 0)
                    {



                        Tax_Inserted_Id = dataaccess.ExecuteSPForScalar("Sp_Orders_Tax_Entry", htinsertrec);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Tax Added SucessFully)</script>", false);

                        Gridview_Bind_Tax_Details();


                    }


                }
                else if (ddl_Tax_Status_Entry.SelectedValue != "2")
                {
                    Tax_Inserted_Id = dataaccess.ExecuteSPForScalar("Sp_Orders_Tax_Entry", htinsertrec);
                    Gridview_Bind_Tax_Details();
                }
                ViewState["Tax_Type"] = ddl_Tax_Type_Entry.SelectedItem.ToString();
                ViewState["Tax_Type_Id"] = ddl_Tax_Type_Entry.SelectedValue.ToString();


                Hashtable htupdate = new Hashtable();
                DataTable dtupdate = new System.Data.DataTable();
                htupdate.Add("@Trans", "UPDATE_STATUS");
                htupdate.Add("@Order_ID", Order_Id);
                htupdate.Add("@Order_Status", 3);

                htupdate.Add("@Modified_By", userid);
                htupdate.Add("@Modified_Date", dateeval);

                dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);

                //Insert Tax Dat into Tax County Wise Information


                //get The CountyDatabase Information

                string CITY = ViewState["Tax_Type"].ToString();
                //city Wise
                if (CITY == "City" && txt_Barrower_City.Text != "")
                {

                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    htTax.Add("@City", ViewState["City"]);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {


                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }



                }
                //county With Same Name of City
                else if (CITY == "County" && txt_Barrower_City.Text != "")
                {
                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    htTax.Add("@City", ViewState["City"]);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {


                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }



                }
                //county With City Name Blank
                else if (CITY == "County" && txt_Barrower_City.Text == "")
                {
                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    string CityName = "";
                    htTax.Add("@City", CityName);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {

                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }

                }

                // Not an County and Not an City
                else if (CITY != "County" && CITY != "City")
                {
                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    string CityName = "";
                    htTax.Add("@City", CityName);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {


                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }

                }






                //Now iNsert into Tbl_County Database OrderWise

                //check CountyDatabaseinfo
                Hashtable htcount = new Hashtable();
                DataTable dtcount = new System.Data.DataTable();
                htcount.Add("@Trans", "CHECK");
                htcount.Add("@Order_Id", Order_Id);
                htcount.Add("@Tax_Type_Id", ViewState["Tax_Type_Id"]);

                dtcount = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htcount);
                if (dtcount.Rows.Count > 0)
                {

                    Check_County = int.Parse(dtcount.Rows[0]["count"].ToString());
                }
                else
                {

                    Check_County = 0;
                }

                if (Check_County == 0)
                {
                    Hashtable htcountydata = new Hashtable();
                    DataTable dtcountydata = new System.Data.DataTable();
                    DateTime datecounty = new DateTime();
                    datecounty = DateTime.Now;

                    htcountydata.Add("@Trans", "INSERT");
                    htcountydata.Add("@Order_Id", Order_Id);
                    htcountydata.Add("@Tax_Id", Tax_Inserted_Id);
                    htcountydata.Add("@Tax_Type_Id", ViewState["Tax_Type_Id"]);
                    //    htcountydata.Add("@Munciplene_Name", txt_TaxMunciplename_Entry.Text);
                    htcountydata.Add("@Ph_No", ViewState["Tax_Office_Phone_No"].ToString());

                    htcountydata.Add("@Make_Changes_Payable_to", ViewState["Make_Changes_Payable_to"].ToString());
                    htcountydata.Add("@Payee_Address", ViewState["Payee_Address"].ToString());
                    htcountydata.Add("@Inserted_By", userid);
                    htcountydata.Add("@Inserted_date", datecounty);
                    htcountydata.Add("@Status", "True");
                    dtcountydata = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htcountydata);
                    Gridview_Bind_Tax_Details();
                    Gridview_Bind_CountyDatabaseInformation();
                    BindAnnualTaxAmount();
                    Bind_Annual_Tax_Total_PaidAmount();


                    //  ScriptManager.RegisterStartupScript(uptax_entrygrid, uptax_entrygrid.GetType(), "Tax Added SucessFully", "OpenPopup();", true);

                    // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Tax Added SucessFully)</script>", false);
                    //Response.Write("<script type='text/javascript'>");
                    //Response.Write("alert('Tax Added SucessFully');");
                    //Response.Write("</script>");

                }
              //  Gridview_Bind_Tax_Details();


                Tax_Detail.Visible = false;
                Assed_Val.Visible = true;
            }
        }
        else if (btn_TaxSubmit.Text == "UPDATE")
        {
            if (ddl_Tax_Status_Entry.SelectedValue == "2")
            {

                if (txt_GTDt1.Text == "")
                {


                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Good Throgh Date')</script>", false);
                    //  model1.Hide();
                    return;
                }
                if (txt_GTDt2.Text == "")
                {


                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Good Throgh Date')</script>", false);
                    //  model1.Hide();
                    return;
                }

            }

            if (txt_Tax_Amount_Entry.Text != "")
            {

                tax_Base_Amount = Convert.ToDecimal(txt_Tax_Amount_Entry.Text.ToString());

            }
            else
            {
                tax_Base_Amount = 0;

            }
            if (txt_PayoffAmt1.Text != "") { tax_Pay_Off_Amount1 = Convert.ToDecimal(txt_PayoffAmt1.Text.ToString()); } else { tax_Pay_Off_Amount1 = 0; }
            if (txt_PayoffAmt2.Text != "") { tax_Pay_Off_Amount2 = Convert.ToDecimal(txt_PayoffAmt2.Text.ToString()); } else { tax_Pay_Off_Amount2 = 0; }

            if (txt_Tax_Paid_Amount_Amount_Entry.Text != "") { tax_Paid_Amount = Convert.ToDecimal(txt_Tax_Paid_Amount_Amount_Entry.Text.ToString()); } else { tax_Paid_Amount = 0; }
            // if (txt_Tax_Due_Amount_Amount_Entry.Text != "") { tax_due_Amount = Convert.ToDecimal(txt_Tax_Due_Amount_Amount_Entry.Text.ToString()); } else { tax_due_Amount = 0; }

            if (txt_Tax_Discount_Amount_Amount_Entry.Text != "") { tax_Discount_Amount = Convert.ToDecimal(txt_Tax_Discount_Amount_Amount_Entry.Text.ToString()); } else { tax_Discount_Amount = 0; }

            if (ddl_Tax_Type_Entry.Text != "")
            {
                Hashtable htinsertrec = new Hashtable();
                DataTable dtinsertrec = new System.Data.DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");
                string Amount = String.Format("{0:.##}", txt_Tax_Amount_Entry.Text);
                Tax_Amount = Convert.ToDecimal(Amount.ToString());
                htinsertrec.Add("@Trans", "UPDATE");
                htinsertrec.Add("@Tax_No", txt_Parcel_Number.Text);
                htinsertrec.Add("@Order_Id", Order_Id);
                htinsertrec.Add("@Tax_Type_Id", ddl_Tax_Type_Entry.SelectedValue);
                htinsertrec.Add("@Year_Type", ddl_Tax_Year_Type.SelectedValue);
                htinsertrec.Add("@Tax_Year", txt_Tax_Year.Text);
                htinsertrec.Add("@Tax_Status_Id", ddl_Tax_Status_Entry.SelectedValue);
                htinsertrec.Add("@Tax_Base_Amount", tax_Base_Amount);
                htinsertrec.Add("@Tax_Payoff_Amount", tax_Pay_Off_Amount1);
                htinsertrec.Add("@Tax_Payoff_Amount2", tax_Pay_Off_Amount2);
                htinsertrec.Add("@Tax_Paid_Amount", tax_Paid_Amount);
                htinsertrec.Add("@Discount_Amount", tax_Discount_Amount);
                htinsertrec.Add("@Discount", ddl_Discount_Entry.SelectedValue);
                htinsertrec.Add("@Discount_Date", txt_Tax_Entry_Discount_Date.Text);

                htinsertrec.Add("@Tax_Due_Amount", tax_due_Amount);
                htinsertrec.Add("@Tax_Due_Date", txt_Tax_Due_Date_Entry.Text);
                htinsertrec.Add("@Tax_Period_Id", ddl_Tax_Period_Entry.SelectedValue);
                htinsertrec.Add("@Good_Through_Date", txt_GTDt1.Text);
                htinsertrec.Add("@Good_Through_Date2", txt_GTDt2.Text);
                htinsertrec.Add("@Paid_Date", txt_Tax_Entry_Paid_Date.Text);
                htinsertrec.Add("@Inserted_By", userid);
                htinsertrec.Add("@Inserted_date", date);
                htinsertrec.Add("@Status", "True");



                //INSERT TAX NOTES 

                DateTime date1 = DateTime.Now;

                if (txt_GTDt1.Text != "")
                {
                    date2 = Convert.ToDateTime(txt_GTDt1.Text);
                }
                if (txt_GTDt2.Text != "")
                {

                    date3 = Convert.ToDateTime(txt_GTDt2.Text);
                }
                int result = DateTime.Compare(date1, date2);
                int result2 = DateTime.Compare(date1, date3);

                if (result > 0 && result2 > 0)
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert(' Good Thru Date Should Be Greater Than Today')</script>", false);

                    return;

                }
                if (result <= 0 && result2 <= 0)
                {



                    Tax_Inserted_Id = dataaccess.ExecuteSP("Sp_Orders_Tax_Entry", htinsertrec);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Tax Added SucessFully)</script>", false);

                    Gridview_Bind_Tax_Details();


                }
                else if (ddl_Tax_Status_Entry.SelectedValue != "2")
                {
                    Tax_Inserted_Id = dataaccess.ExecuteSP("Sp_Orders_Tax_Entry", htinsertrec);
                    Gridview_Bind_Tax_Details();
                }


                ViewState["Tax_Type"] = ddl_Tax_Type_Entry.SelectedItem.ToString();
                ViewState["Tax_Type_Id"] = ddl_Tax_Type_Entry.SelectedValue.ToString();


                Hashtable htupdate = new Hashtable();
                DataTable dtupdate = new System.Data.DataTable();
                htupdate.Add("@Trans", "UPDATE_STATUS");
                htupdate.Add("@Order_ID", Order_Id);
                htupdate.Add("@Order_Status", 3);

                htupdate.Add("@Modified_By", userid);
                htupdate.Add("@Modified_Date", dateeval);

                dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);

                //Insert Tax Dat into Tax County Wise Information


                //get The CountyDatabase Information

                string CITY = ViewState["Tax_Type"].ToString();
                //city Wise
                if (CITY == "City" && txt_Barrower_City.Text != "")
                {

                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    htTax.Add("@City", ViewState["City"]);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {


                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }



                }
                //county With Same Name of City
                else if (CITY == "County" && txt_Barrower_City.Text != "")
                {
                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    htTax.Add("@City", ViewState["City"]);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {


                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }



                }
                //county With City Name Blank
                else if (CITY == "County" && txt_Barrower_City.Text == "")
                {
                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    string CityName = "";
                    htTax.Add("@City", CityName);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {

                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }

                }

                // Not an County and Not an City
                else if (CITY != "County" && CITY != "City")
                {
                    Hashtable htTax = new Hashtable();
                    DataTable dtTax = new System.Data.DataTable();

                    htTax.Add("@Trans", "SEL_TAX_TYPE_CITY_WISE");
                    htTax.Add("@State_Id", ViewState["State_Id"]);
                    htTax.Add("@County_Id", ViewState["County_Id"]);
                    string CityName = "";
                    htTax.Add("@City", CityName);
                    dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htTax);
                    if (dtTax.Rows.Count > 0)
                    {

                        ViewState["Tax_Office_Phone_No"] = dtTax.Rows[0]["Tax_Office_Phone_No"].ToString();
                        ViewState["Make_Changes_Payable_to"] = dtTax.Rows[0]["Make_Changes_Payable_to"].ToString();
                        ViewState["Payee_Address"] = dtTax.Rows[0]["Payee_Address"].ToString();



                    }
                    else
                    {


                        ViewState["Tax_Office_Phone_No"] = "";
                        ViewState["Make_Changes_Payable_to"] = "";
                        ViewState["Payee_Address"] = "";

                    }

                }






                //Now iNsert into Tbl_County Database OrderWise

                //check CountyDatabaseinfo
                Hashtable htcount = new Hashtable();
                DataTable dtcount = new System.Data.DataTable();
                htcount.Add("@Trans", "CHECK");
                htcount.Add("@Order_Id", Order_Id);
                htcount.Add("@Tax_Type_Id", ViewState["Tax_Type_Id"]);

                dtcount = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htcount);
                if (dtcount.Rows.Count > 0)
                {

                    Check_County = int.Parse(dtcount.Rows[0]["count"].ToString());
                }
                else
                {

                    Check_County = 0;
                }

                if (Check_County == 0)
                {
                    Hashtable htcountydata = new Hashtable();
                    DataTable dtcountydata = new System.Data.DataTable();
                    DateTime datecounty = new DateTime();
                    datecounty = DateTime.Now;

                    htcountydata.Add("@Trans", "UPDATE");
                    htcountydata.Add("@Order_Id", Order_Id);
                    htcountydata.Add("@Tax_Id", Tax_Inserted_Id);
                    htcountydata.Add("@Tax_Type_Id", ViewState["Tax_Type_Id"]);
                    //htcountydata.Add("@Munciplene_Name", txt_TaxMunciplename_Entry.Text);
                    htcountydata.Add("@Ph_No", ViewState["Tax_Office_Phone_No"].ToString());

                    htcountydata.Add("@Make_Changes_Payable_to", ViewState["Make_Changes_Payable_to"].ToString());
                    htcountydata.Add("@Payee_Address", ViewState["Payee_Address"].ToString());
                    htcountydata.Add("@Inserted_By", userid);
                    htcountydata.Add("@Inserted_date", datecounty);
                    htcountydata.Add("@Status", "True");
                    dtcountydata = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htcountydata);
                    Gridview_Bind_Tax_Details();
                    Gridview_Bind_CountyDatabaseInformation();
                  
                    BindAnnualTaxAmount();
                    Bind_Annual_Tax_Total_PaidAmount();
                    //  ScriptManager.RegisterStartupScript(uptax_entrygrid, uptax_entrygrid.GetType(), "Tax Added SucessFully", "OpenPopup();", true);

                    // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Tax Added SucessFully)</script>", false);
                    //Response.Write("<script type='text/javascript'>");
                    //Response.Write("alert('Tax Added SucessFully');");
                    //Response.Write("</script>");

                }
               

                Tax_Detail.Visible = false;
                Assed_Val.Visible = true;

            }

        }
    }
    protected void btn_AddAssessed_Click(object sender, ImageClickEventArgs e)
    {
        tr_AssedVal.Visible = true;
        tr_AssedVal1.Visible = true;
    }
    
    protected void btn_ClearAssed_Click(object sender, EventArgs e)
    {
        ClearAsseed();
    }
    protected void btn_Assesd_Add_Click(object sender, EventArgs e)
    {
    
        tabsaldet = 1;
        if (tabsaldet == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_SalDetail.ForeColor = foclr;
            Tab_SalDetail.BackColor = bgclr;
        }
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = true;

        if (txt_Land.Text != "")
        {

            Land = Convert.ToDecimal(txt_Land.Text);
        }
        else
        {

            Land = 0;
        }
        if (txt_Building.Text != "")
        {

            Building = Convert.ToDecimal(txt_Building.Text);
        }
        else
        {

            Building = 0;
        }
        if (txt_Excemption.Text != "")
        {

            Excemption = Convert.ToDecimal(txt_Excemption.Text);
        }
        else
        {

            Excemption = 0;
        }

        Total = Land + Building;
        if (ddl_Assesed_Tax_Year.SelectedItem.ToString() != "")
        {

            if (btn_Assesd_Add.Text == "Save")
            {
                Hashtable htorderkb = new Hashtable();
                DataTable dtorderkb = new System.Data.DataTable();


                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                htorderkb.Add("@Trans", "INSERT");
                htorderkb.Add("@Order_Id", Order_Id);
                htorderkb.Add("@Tax_Year", ddl_Assesed_Tax_Year.SelectedValue);
                htorderkb.Add("@Land_Cost", Land);
                htorderkb.Add("@Building_Cost", Building);
                htorderkb.Add("@Excemption", Excemption);
                htorderkb.Add("@Total", Total);
                htorderkb.Add("@Inserted_By", userid);
                htorderkb.Add("@Inserted_date", date);
                htorderkb.Add("@Modified_By", userid);
                htorderkb.Add("@Modified_Date", date);
                htorderkb.Add("@status", "True");
                dtorderkb = dataaccess.ExecuteSP("Sp_Order_Tax_Asessed_Entry", htorderkb);
                Gridview_Bind_TaxAcseesd_Data();

                ClearAsseed();

            }
            else if (btn_Assesd_Add.Text == "UPDATE")
            {

                Hashtable htorderkb = new Hashtable();
                DataTable dtorderkb = new System.Data.DataTable();

                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                htorderkb.Add("@Trans", "UPDATE");
                htorderkb.Add("@Tax_Assessed_Id", ViewState["Tax_Assessed_Id"]);
                htorderkb.Add("@Order_Id", Order_Id);
                htorderkb.Add("@Tax_Year", ddl_Assesed_Tax_Year.SelectedValue);
                htorderkb.Add("@Land_Cost", Land);
                htorderkb.Add("@Building_Cost", Building);
                htorderkb.Add("@Excemption", Excemption);
                htorderkb.Add("@Total", Total);
                htorderkb.Add("@Modified_By", userid);
                htorderkb.Add("@Modified_Date", date);
                htorderkb.Add("@status", "True");
                dtorderkb = dataaccess.ExecuteSP("Sp_Order_Tax_Asessed_Entry", htorderkb);

                btn_Assesd_Add.Text = "Save";
                ClearAsseed();
                Gridview_Bind_TaxAcseesd_Data();
            }

        }
        else
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Select Tax Year')</script>", false);
        }

    }
    protected void ClearAsseed()
    {

        txt_Land.Text = "";
        txt_Building.Text = "";
        txt_total.Text = "";
        txt_Excemption.Text = "";
        tr_AssedVal.Visible = false;
        tr_AssedVal1.Visible = false;

    }
    protected void btn_Munciple_Add_Click(object sender, EventArgs e)
    {

    }
    protected void btn_ClearMunicipal_Click(object sender, EventArgs e)
    {

    }
    protected void btn_ClearSrcUpload_Click(object sender, EventArgs e)
    {
        tr_ErrorDet.Visible = true;
        tr_ErrorDet1.Visible = true;
    }
    private bool Validate_source_tax_upload()
    {


        if (txt_Source_upload_Details.Text == "")
        {
            txt_Source_upload_Details.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Details')</script>", false);
            return false;


        }
        return true;
    }
    protected void btn_AddSrcUpload_Click(object sender, EventArgs e)
    {

        if (Validate_source_tax_upload() != false && btn_AddSrcUpload.Text == "Save")
        {


            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            string Uploadpath = @"\\192.168.12.33TAXPLORER\TAX SOURCEFILES\" + txt_Order_Number.Text;
            DirectoryInfo di = new DirectoryInfo(Uploadpath);


            if (!di.Exists)
            {
                Directory.CreateDirectory(@"\\192.168.12.33\TAXPLORER\TAX SOURCEFILES\" + txt_Order_Number.Text);
            }
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload2.PostedFile.FileName);
                string fileName = c;
                extension = Path.GetExtension(fileupload2.FileName);
                if (fileName != "")
                {
                    string dest_path1 = @"\\192.168.12.33\TAXPLORER\TAX SOURCEFILES\" + txt_Order_Number.Text + @"\" + fileName;
                    fileupload2.PostedFile.SaveAs(dest_path1);
                    ViewState["FPath"] = dest_path1;

                    Tax_Type_Source_Upload__path = ViewState["FPath"].ToString();
                }
            }
            else
            {

                Tax_Type_Source_Upload__path = null;
            }
            DateTime date = new DateTime();
            date = DateTime.Now;
            htorderkb.Add("@Trans", "INSERT");
            htorderkb.Add("@Tax_Type_Id", int.Parse(ddl_Source_upload_Taxtype.SelectedValue.ToString()));
            htorderkb.Add("@Order_ID", Order_Id);
            htorderkb.Add("@Source_Details", txt_Source_upload_Details.Text);
            htorderkb.Add("@Document_Name", "123");
            htorderkb.Add("@Tax_Type_Source_upload_File_Type", extension);
            htorderkb.Add("@Tax_Type_Source_upload_Path", Tax_Type_Source_Upload__path);
            htorderkb.Add("@Inserted_By", userid);
            htorderkb.Add("@Inserted_date", date);
            htorderkb.Add("@Modified_By", userid);
            htorderkb.Add("@Modified_Date", date);
            htorderkb.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Orders_Tax_Source_Upload", htorderkb);

    
        }
        Gridview_Bind_Tax_type_Source_Upload_Data();
    }
    protected void btn_ClearSalInfo_Click(object sender, EventArgs e)
    {
        tr_SalDetail.Visible =  false;
        tr_SalDetail1.Visible = false;
        tr_SalDetail2.Visible = false;
    }

    protected void btn_AddTaxSal_Click(object sender, ImageClickEventArgs e)
    {
        tr_SalDetail.Visible = true;
        tr_SalDetail1.Visible = true;
        tr_SalDetail2.Visible = true;
    }
    protected void btn_AddTaxBankrupty_Click(object sender, ImageClickEventArgs e)
    {
        tr_Bankrupty.Visible = true;
        tr_Bankrupty1.Visible = true;
    }
    protected void btn_BrancruptyAdd_Click(object sender, EventArgs e)
    {
        Tab_SourceUpload.Enabled = true;
        tabsrcupload = 1;
        if (tabsrcupload == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_SourceUpload.ForeColor = foclr;
            Tab_SourceUpload.BackColor = bgclr;
        }
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = true;

        if (btn_Brancrupty.Text == "Save")
        {
            Hashtable htmunciple = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();


            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htmunciple.Add("@Trans", "INSERT");
            htmunciple.Add("@Order_id", Order_Id);
            htmunciple.Add("@Bankcrupty", ddl_Bankruptcy_Yes_No.SelectedItem.ToString());
            htmunciple.Add("@Chapter_No", txt_Bankruptcy_ChapterNo.Text);
            htmunciple.Add("@Case_No", txt_Bankruptcy_Case_No.Text);
            htmunciple.Add("@Bk_Date", txt_Bankruptcy_Date.Text);
            htmunciple.Add("@Comments", txt_Bankcrupt_Comments.Text);
            htmunciple.Add("@Inserted_By", userid);
            htmunciple.Add("@Instered_Date", date);
            htmunciple.Add("@Modified_By", userid);
            htmunciple.Add("@Modified_Date", date);
            htmunciple.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Orders_Tax_Bankrupt_Entry", htmunciple);
            Gridview_bind_Bankrupty_Tax_Data();

            Clearbankrupt();

        }
        else if (btn_Brancrupty.Text == "Update")
        {

            Hashtable htmunciple = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htmunciple.Add("@Trans", "UPDATE");
            htmunciple.Add("@Bankruptcy_Id ", ViewState["Bankruptcy_Id"]);
            htmunciple.Add("@Order_id", Order_Id);
            htmunciple.Add("@Bankcrupty", ddl_Bankruptcy_Yes_No.SelectedItem.ToString());
            htmunciple.Add("@Chapter_No", txt_Bankruptcy_ChapterNo.Text);
            htmunciple.Add("@Case_No", txt_Bankruptcy_Case_No.Text);
            htmunciple.Add("@Bk_Date", txt_Bankruptcy_Date.Text);
            htmunciple.Add("@Comments", txt_Bankcrupt_Comments.Text);
            htmunciple.Add("@Modified_By", userid);
            htmunciple.Add("@Modified_Date", date);
            htmunciple.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Orders_Tax_Bankrupt_Entry", htmunciple);
    
            btn_Brancrupty.Text = "Save";
            Clearbankrupt();
            Gridview_bind_Bankrupty_Tax_Data();
        }

    }
    protected void Clearbankrupt()
    {

        txt_Bankcrupt_Comments.Text = "";
        txt_Bankruptcy_Case_No.Text = "";
        txt_Bankruptcy_ChapterNo.Text = "";
        txt_Bankruptcy_Date.Text = "";



    }
    protected void btn_AddSalInfo_Click(object sender, EventArgs e)
    {
        
        tabbankrupty = 1;
        if (tabbankrupty == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_BankruptyDet.ForeColor = foclr;
            Tab_BankruptyDet.BackColor = bgclr;
        }
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
        Bankrupty_Det22.Visible = true;

        if (btn_Add_Tax_Sale.Text == "Save")
        {


            Hashtable htinsertrec = new Hashtable();
            DataTable dtinsertrec = new System.Data.DataTable();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            //string Amount = String.Format("{0:.##}", txt_Tax_Amount_Entry.Text);
            //Tax_Amount = Convert.ToDecimal(Amount.ToString());


            if (txt_sold_Tax_AMount.Text != "")
            {

                sold_Tax_AMount = Convert.ToDecimal(txt_sold_Tax_AMount.Text);


            }
            else
            {
                sold_Tax_AMount = 0;

            }




            htinsertrec.Add("@Trans", "INSERT");
            htinsertrec.Add("@Order_Id", Order_Id);
            htinsertrec.Add("@Taxes_Sold", ddl_Tax_Sold.SelectedItem.ToString());
            htinsertrec.Add("@Tax_Sold_Date", txt_Sold_Date.Text);
            htinsertrec.Add("@Next_Critical_Date", txt_Next_Critical_date.Text);
            htinsertrec.Add("@Next_Critical_Action", txt_Next_Critical_Action.Text);
            htinsertrec.Add("@Sold_Tax_Amount", sold_Tax_AMount);
            htinsertrec.Add("@Redemption_Good_Through_Date", txt_Redemption_Good_Through_Date.Text);
            htinsertrec.Add("@Last_Redemption", txt_Last_Redemption_Date.Text);
            htinsertrec.Add("@Comments", txt_Tax_Sale_Comments.Text);
            htinsertrec.Add("@Inserted_By", userid);
            htinsertrec.Add("@Instered_Date", date);
            htinsertrec.Add("@Status", "True");

            dtinsertrec = dataaccess.ExecuteSP("Sp_Orders_Tax_Sales_Entry", htinsertrec);

            Gridview_bind_Tax_Sold_Data();
            ClearTax_Sold();
            
        }
        else if (btn_Add_Tax_Sale.Text == "Update")
        {

            Hashtable htinsertrec = new Hashtable();
            DataTable dtinsertrec = new System.Data.DataTable();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            //string Amount = String.Format("{0:.##}", txt_Tax_Amount_Entry.Text);
            //Tax_Amount = Convert.ToDecimal(Amount.ToString());


            if (txt_sold_Tax_AMount.Text != "")
            {

                sold_Tax_AMount = Convert.ToDecimal(txt_sold_Tax_AMount.Text);


            }
            else
            {
                sold_Tax_AMount = 0;

            }




            htinsertrec.Add("@Trans", "UPDATE");
            htinsertrec.Add("@Order_Id", Order_Id);
            htinsertrec.Add("@Tax_Sale_Id", ViewState["Tax_Sale_Id"]);
            htinsertrec.Add("@Taxes_Sold", ddl_Tax_Sold.SelectedItem.ToString());
            htinsertrec.Add("@Tax_Sold_Date", txt_Sold_Date.Text);
            htinsertrec.Add("@Next_Critical_Date", txt_Next_Critical_date.Text);
            htinsertrec.Add("@Next_Critical_Action", txt_Next_Critical_Action.Text);
            htinsertrec.Add("@Sold_Tax_Amount", sold_Tax_AMount);
            htinsertrec.Add("@Redemption_Good_Through_Date", txt_Redemption_Good_Through_Date.Text);
            htinsertrec.Add("@Last_Redemption", txt_Last_Redemption_Date.Text);
            htinsertrec.Add("@Comments", txt_Tax_Sale_Comments.Text);
            htinsertrec.Add("@Modified_By", userid);
            htinsertrec.Add("@Modified_Date", date);
            htinsertrec.Add("@Status", "True");

            dtinsertrec = dataaccess.ExecuteSP("Sp_Orders_Tax_Sales_Entry", htinsertrec);

            Gridview_bind_Tax_Sold_Data();
            ClearTax_Sold();
           
        }
    }
    protected void ClearTax_Sold()
    {

        ddl_Tax_Sold.SelectedIndex = 0;
        txt_Next_Critical_Action.Text = "";
        txt_Sold_Date.Text = "";
        btn_Add_Tax_Sale.Text = "Save";
        txt_sold_Tax_AMount.Text = "";
        txt_Next_Critical_date.Text = "";
        txt_Next_Critical_Action.Text = "";
        txt_Redemption_Good_Through_Date.Text = "";
        txt_Last_Redemption_Date.Text = "";
        txt_Tax_Sale_Comments.Text = "";






    }
    protected void btn_ClearBankrupty_Click(object sender, EventArgs e)
    {
        tr_Bankrupty.Visible = false;
        tr_Bankrupty1.Visible = false;
    }
    protected void gvTaxDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void gvTaxDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         if (e.CommandName == "DeleteRecord")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lblOrder_Kb_Id = (Label)row.FindControl("lblOrder_Kb_Id");
            int orderkbid = int.Parse(lblOrder_Kb_Id.Text.ToString());
            Hashtable htdelete = new Hashtable();
            DataTable dtdelete = new DataTable();
            htdelete.Add("@Trans", "DELETE");
            htdelete.Add("@Order_Kb_Id", orderkbid);
            dtdelete = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htdelete);
            Gridview_Bind_Order_Kb_Data();
        }
        else if (e.CommandName == "EditRecord")
        {
            tr_TaxDataRow.Visible = true;
            tr_TaxDataRow1.Visible = true;
            tr_TaxDataRow2.Visible = true;
            tr_TaxDataRow3.Visible = true;
            tr_TaxDataRow4.Visible = true;
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lblTax_Id = (Label)row.FindControl("lblTax_Id");
          
            Hashtable htorder = new Hashtable();
        DataTable dtorder = new System.Data.DataTable();

        htorder.Add("@Trans", "SELECT_BY_TAX_ID");
        htorder.Add("@Order_Id", Order_Id);
        htorder.Add("@Tax_Id",lblTax_Id.Text);
        dtorder = dataaccess.ExecuteSP("Sp_Orders_Tax_Entry", htorder);
        if (dtorder.Rows.Count > 0)
        {
            Tax_Inserted_Id = int.Parse(lblTax_Id.Text);
            ddl_Tax_Type_Entry.SelectedValue = dtorder.Rows[0]["Tax_Type_Id"].ToString();
          //  txt_TaxMunciplename_Entry.Text = dtorder.Rows[0]["Munciplene_Name"].ToString();
            txt_Tax_Year.Text = dtorder.Rows[0]["Tax_Year"].ToString();
            ddl_Tax_Year_Type.SelectedValue = dtorder.Rows[0]["Tax_Year"].ToString();
            txt_Tax_Amount_Entry.Text = dtorder.Rows[0]["Tax_Base_Amount"].ToString();
            txt_Tax_Due_Date_Entry.Text = dtorder.Rows[0]["Tax_Due_Date"].ToString();
            txt_Tax_Discount_Amount_Amount_Entry.Text = dtorder.Rows[0]["Tax_Due_Amount"].ToString();
            txt_Tax_Entry_Discount_Date.Text = dtorder.Rows[0]["Discount_Date"].ToString();
            txt_Tax_Paid_Amount_Amount_Entry.Text = dtorder.Rows[0]["Tax_Paid_Amount"].ToString();
            txt_Tax_Entry_Paid_Date.Text = dtorder.Rows[0]["Paid_Date"].ToString();
            txt_PayoffAmt1.Text = dtorder.Rows[0]["Tax_Payoff_Amount"].ToString();
            txt_GTDt1.Text = dtorder.Rows[0]["Good_Through_Date"].ToString();
            txt_PayoffAmt2.Text = dtorder.Rows[0]["Tax_Payoff_Amount2"].ToString();
            txt_GTDt2.Text = dtorder.Rows[0]["Good_Through_Date2"].ToString();
            ddl_Tax_Period_Entry.SelectedValue = dtorder.Rows[0]["Tax_Period_Id"].ToString();
            ddl_Tax_Status_Entry.SelectedValue = dtorder.Rows[0]["Tax_Status_Id"].ToString();
            string Discount = dtorder.Rows[0]["Discount"].ToString();
           // ddl_Discount_Entry.SelectedValue = Discount.ToString();
           


        }



            btn_TaxSubmit.Text = "UPDATE";
            Operation = "UPDATE";
           

        }
    }
 
    
    
    protected void grd_Agency_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grd_Agency_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void Grd_Tax_Type_Comments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Delequent_Database_Id = Convert.ToInt32(Grd_Tax_Type_Comments.DataKeys[e.RowIndex].Values["Note_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Note_Id", Delequent_Database_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Tax_County_Comments", htdelete);
        Gridview_Bind_Tax_Type_Comments();
    }
    protected void Grd_Tax_Type_Comments_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr_CountyData.Visible = true;
        tr_CountyData1.Visible = true;
        GridViewRow row = Grd_Tax_Type_Comments.SelectedRow;
        Label lblTax_Id = (Label)row.FindControl("lblTax_Id");
        Label lbl_Taxtype_Comments = (Label)row.FindControl("lbl_Taxtype_Comments");
        Label lblNote_Id = (Label)row.FindControl("lblNote_Id");
        ViewState["lbl_Note_Id"] = lblNote_Id.Text;
        dbc.BindComments_Tax_Type(ddl_TaxType_Commts, Order_Id);
        ddl_TaxType_Commts.SelectedValue = lblTax_Id.Text;
        Txt_taxtype_Comments.Text = lbl_Taxtype_Comments.Text;
        ImageButton3.Text = "UPDATE";

    }
    protected void grd_Assesed_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_Assessed_Id = int.Parse(grd_Assesed.DataKeys[e.RowIndex].Values["Tax_Assessed_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Assessed_Id", Tax_Assessed_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Order_Tax_Asessed_Entry", htdelete);
        Gridview_Bind_TaxAcseesd_Data();
    }
    protected void grd_Assesed_SelectedIndexChanged(object sender, EventArgs e)
    {


        tr_AssedVal.Visible = true;
        tr_AssedVal1.Visible = true;
        GridViewRow row = grd_Assesed.SelectedRow;

        Label lblTax_Assessed_Id = (Label)row.FindControl("lblTax_Assessed_Id");
        Label lblTax_Year = (Label)row.FindControl("lblTax_Year");
        Label lblLand_Cost = (Label)row.FindControl("lblLand_Cost");
        Label lblBuilding_Cost = (Label)row.FindControl("lblBuilding_Cost");
        Label lblExcemption = (Label)row.FindControl("lblExcemption_Cost");
        Label lblTotal = (Label)row.FindControl("lblTotal");
        string Year = lblTax_Year.Text;
        ViewState["Tax_Assessed_Id"] = lblTax_Assessed_Id.Text;
        dbc.BindTax_Year(ddl_Assesed_Tax_Year);
        if (ddl_Assesed_Tax_Year.Items.FindByText(Year).Value != null)
        {


            ddl_Assesed_Tax_Year.Items.FindByText(Year).Selected = true;
        }
        txt_Land.Text = lblLand_Cost.Text;
        txt_Building.Text = lblBuilding_Cost.Text;
        txt_total.Text = lblTotal.Text;
        txt_Excemption.Text = lblExcemption.Text;
        

        btn_Assesd_Add.Text = "UPDATE";
    }
    protected void grd_Tax_Sold_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_Sale_Id = int.Parse(grd_Tax_Sold.DataKeys[e.RowIndex].Values["Tax_Sale_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Sale_Id", Tax_Sale_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Tax_Sales_Entry", htdelete);
        Gridview_bind_Tax_Sold_Data();
    }
 
    protected void grid_Banckrupty_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        int Bankruptcy_Id = int.Parse(grid_Banckrupty.DataKeys[e.RowIndex].Values["Bankruptcy_Id"].ToString());

        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Bankruptcy_Id ", Bankruptcy_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Tax_Bankrupt_Entry", htdelete);
        Gridview_bind_Bankrupty_Tax_Data();
    }
    protected void grid_Banckrupty_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr_Bankrupty.Visible = true;
        tr_Bankrupty1.Visible = true;
        GridViewRow row = grid_Banckrupty.SelectedRow;
        Label lblMunciplene_Id = (Label)row.FindControl("lblBankruptcy_Id");
        int Bankruptcy_Id = Convert.ToInt32(lblMunciplene_Id.Text);

        ViewState["Bankruptcy_Id"] = Bankruptcy_Id;



        Label lblBankcrupty_Type = (Label)row.FindControl("lblBankcrupty_Type");
        Label lbl_Case_No = (Label)row.FindControl("lbl_Case_No");
        Label lblChapter_No = (Label)row.FindControl("lblChapter_No");
        Label lbl_Bk_Date = (Label)row.FindControl("lbl_Bk_Date");
        Label lbl_bankcruptComments = (Label)row.FindControl("lbl_bankcruptComments");




        if (ddl_Bankruptcy_Yes_No.Items.FindByText(lblBankcrupty_Type.Text).Value != null)
        {

            ddl_Bankruptcy_Yes_No.Items.FindByText(lblBankcrupty_Type.Text).Selected = true;
        }

        txt_Bankruptcy_Case_No.Text = lbl_Case_No.Text;
        txt_Bankruptcy_ChapterNo.Text = lblChapter_No.Text;
        txt_Bankruptcy_Date.Text = lbl_Bk_Date.Text;
        txt_Bankcrupt_Comments.Text = lbl_bankcruptComments.Text;

        



        btn_Brancrupty.Text = "Update";
    }
    protected void Tax_Type_Source_upload_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void Tax_Type_Source_upload_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_Type_Source_upload_id = int.Parse(Tax_Type_Source_upload.DataKeys[e.RowIndex].Values["Tax_Type_Source_upload_id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Type_Source_upload_id", Tax_Type_Source_upload_id);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Tax_Source_Upload", htdelete);
        Gridview_Bind_Tax_type_Source_Upload_Data();
    }
    protected void Tax_Type_Source_upload_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        tr_TaxDataRow.Visible = false;
        tr_TaxDataRow1.Visible = false;
        tr_TaxDataRow2.Visible = false;
        tr_TaxDataRow3.Visible = false;
        tr_TaxDataRow4.Visible = false;
    }
    protected void grd_order_kb_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ViewDocument")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_path = (Label)row.FindControl("lbl_orderkb_doc_path");

            string filePath = lbl_path.Text;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();

        }
        else if (e.CommandName == "DeleteRecord")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lblOrder_Kb_Id = (Label)row.FindControl("lblOrder_Kb_Id");
            int orderkbid = int.Parse(lblOrder_Kb_Id.Text.ToString());
            Hashtable htdelete = new Hashtable();
            DataTable dtdelete = new DataTable();
            htdelete.Add("@Trans", "DELETE");
            htdelete.Add("@Order_Kb_Id", orderkbid);
            dtdelete = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htdelete);
            Gridview_Bind_Order_Kb_Data();
        }
        else if (e.CommandName == "EditRecord")
        {
            tr_OrderKb.Visible = true;
            tr_OrderKb1.Visible = true;
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lblOrder_Kb_Id = (Label)row.FindControl("lblOrder_Kb_Id");
            Label lbl_Document = (Label)row.FindControl("lblDocument_Name");
            Label lbl_Comments = (Label)row.FindControl("lblComments");

            ViewState["Order_Kb_Id"] = lblOrder_Kb_Id.Text;
            txt_order_Kb_Document.Text = lbl_Document.Text;
            txt_order_Kb_Comment.Text = lbl_Comments.Text;

            img_btn_order_kb_add.Text = "UPDATE";
            Operation = "UPDATE";
            ViewState["Update"] = "UPDATE";

        }
    }
    protected void grd_Agency_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRecord")
        {

            tr_Agency.Visible = true;
            GridViewRow row=(GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_AgencyOrder_Kb_Id = (Label)row.FindControl("lbl_Agency_Order_Kb_Id");
            Label lbl_Agency_Document = (Label)row.FindControl("lbl_Agency_Documents");
            Label lbl_agency_Comments = (Label)row.FindControl("lbl_Agency_Comments");

            ViewState["Agency_Order_Kb_Id"] = lbl_AgencyOrder_Kb_Id.Text;
            ViewState["Changeinfo"] = lbl_agency_Comments.Text;
            txt_Agency_Comment.Text = lbl_agency_Comments.Text;
            

            imgbtn_agency_Add.Text = "UPDATE";

        }
        else if (e.CommandName == "DeleteRecord")
        {

            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_AgencyOrder_Kb_Id = (Label)row.FindControl("lbl_Agency_Order_Kb_Id");
            int Agencyid = int.Parse(lbl_AgencyOrder_Kb_Id.Text.ToString());
            Hashtable htdelete = new Hashtable();
            DataTable dtdelete = new DataTable();
            htdelete.Add("@Trans", "DELETE");
            htdelete.Add("@Order_Agency_Kb_Id", Agencyid);
            dtdelete = dataaccess.ExecuteSP("Sp_Orders_Agency_Knowledge_Base", htdelete);
            Gridview_Bind_Order_Agency_Kb_Data();

        }
    }
    protected void grd_Tax_Sold_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRecord")
        {
            tr_SalDetail.Visible = true;
            tr_SalDetail1.Visible = true;
            tr_SalDetail2.Visible = true;
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lblTax_Sale_Id = (Label)row.FindControl("lblTax_Sale_Id");
            int Tax_Sale_Id = Convert.ToInt32(lblTax_Sale_Id.Text);

            ViewState["Tax_Sale_Id"] = Tax_Sale_Id;
            // txt_Tax_Parcel_Number.Text = txt_Parcel_Number.Text;

            Label lblTax_Sold = (Label)row.FindControl("lblTax_Sold");
            Label lblSold_Date = (Label)row.FindControl("lblSold_Date");
            Label lbl_Next_Critical_Date = (Label)row.FindControl("lbl_Next_Critical_Date");
            Label lblNext_Critical_Action = (Label)row.FindControl("lblNext_Critical_Action");
            Label lblSold_TaxAmt = (Label)row.FindControl("lblSold_TaxAmt");
            Label lblRedemption_Good_Thru_Date = (Label)row.FindControl("lblRedemption_Good_Thru_Date");
            Label lblLast_Redemption_Loss_Date = (Label)row.FindControl("lblLast_Redemption_Loss_Date");
            Label lblTax_Sale_Comments = (Label)row.FindControl("lblTax_Sale_Comments");

            ddl_Tax_Sold.SelectedValue = lblTax_Sold.Text;

            //if (ddl_Tax_Sold.Items.FindByText(lblTax_Sold.Text).Value != null)
            //{

            //    ddl_Tax_Sold.Items.FindByText(lblTax_Sold.Text).Selected = true;
            //}
            txt_Sold_Date.Text = lblSold_Date.Text;
            txt_Next_Critical_date.Text = lbl_Next_Critical_Date.Text;
            txt_Next_Critical_Action.Text = lblNext_Critical_Action.Text;
            
            txt_Last_Redemption_Date.Text = lblLast_Redemption_Loss_Date.Text;
            txt_Redemption_Good_Through_Date.Text = lblRedemption_Good_Thru_Date.Text;
            txt_sold_Tax_AMount.Text = lblSold_TaxAmt.Text;
            txt_Tax_Sale_Comments.Text = lblTax_Sale_Comments.Text;



            btn_Add_Tax_Sale.Text = "Update";

        }
        else if (e.CommandName == "DeleteRecord")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lblTax_Sale_Id = (Label)row.FindControl("lblTax_Sale_Id");
            int Tax_Sale_Id = Convert.ToInt32(lblTax_Sale_Id.Text);
          
            Hashtable htdelete = new Hashtable();
            DataTable dtdelete = new DataTable();
            htdelete.Add("@Trans", "DELETE");
            htdelete.Add("@Tax_Sale_Id", Tax_Sale_Id);
            dtdelete = dataaccess.ExecuteSP("Sp_Orders_Tax_Sales_Entry", htdelete);
            Gridview_bind_Tax_Sold_Data();

        }
    }
    protected void txt_Redemption_Good_Through_Date_TextChanged(object sender, EventArgs e)
    {
        if (txt_Redemption_Good_Through_Date.Text != "")
        {

            txt_Next_Critical_date.Text = txt_Redemption_Good_Through_Date.Text;
        }
        else
        {
            txt_Next_Critical_date.Text = "";

        }
    }
    protected void Grid_Delequent_Data_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr_DelequentDb.Visible = true;
        tr_DelequentDb1.Visible = true;
        GridViewRow row = Grid_Delequent_Data.SelectedRow;
        Label lbl_Delequent_Database_Id = (Label)row.FindControl("lbl_Delequent_Database_Id");
        int Delequent_Database_Id = Convert.ToInt32(lbl_Delequent_Database_Id.Text);

        ViewState["Delequent_Database_Id"] = Delequent_Database_Id;

        LinkButton lbl_Tax_Type = (LinkButton)row.FindControl("lbl_Deliquent_Tax_Type");
        Label lbl_Deliquent_Ph_No = (Label)row.FindControl("lbl_Deliquent_Ph_No");
        Label lbl_Deliquent_Make_Changes_Payable_to = (Label)row.FindControl("lbl_Deliquent_Make_Changes_Payable_to");
        Label lbl_Deliquent_Payee_Address = (Label)row.FindControl("lbl_Deliquent_Payee_Address");


        dbc.BindTax_Type(ddl_Tax_Delquent_Tax_type);
      

        if (ddl_Tax_Delquent_Tax_type.Items.FindByText(lbl_Tax_Type.Text).Value != null)
        {

            ddl_Tax_Delquent_Tax_type.Items.FindByText(lbl_Tax_Type.Text).Selected = true;
        }
        txt_delequent_phno.Text = lbl_Deliquent_Ph_No.Text;
        txt_Delequent_Make_Changes.Text = lbl_Deliquent_Make_Changes_Payable_to.Text;
        txt_Delequent_Payee_addres.Text = lbl_Deliquent_Payee_Address.Text;


    

        imgbtn_Delequent_Tax_Add.Text = "Update";
    }
    protected void Grid_Delequent_Data_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //delete tax entry 
        int Delequent_Database_Id = Convert.ToInt32(Grid_Delequent_Data.DataKeys[e.RowIndex].Values["Delequent_Database_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Delequent_Database_Id", Delequent_Database_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Tax_Deliquent_County_Data", htdelete);
        Gridview_Bind_Order_Deliquent_Data();
        //delete tax county info
    }
    protected void btn_Send_Click(object sender, EventArgs e)
    {

    }
    protected void btn_AddITInfo_Click(object sender, ImageClickEventArgs e)
    {
        tr_ITcomp.Visible = true;
        tr_ITcomp1.Visible = true;
    }
    protected void taboutputpreview_Click1(object sender, EventArgs e)
    {

    }
    protected void btnuserCancel_Click(object sender, EventArgs e)
    {

    }
   
    protected void btn_AddErrorInfo_Click(object sender, ImageClickEventArgs e)
    {
        tr_ErrorDet.Visible = true;
        tr_ErrorDet1.Visible = true;
    }
  
 
    protected void Tab_ErrorInfo_Click(object sender, EventArgs e)
    {
        Tax_Detail.Visible = false;
        Assed_Val.Visible = false;
        Tax_SalDet.Visible = false;
        // Municipal_Det.Visible = false;
        Bankrupty_Det22.Visible = false;
        Source_Upload.Visible = false;
        Error_Detail.Visible = true;
        taberror = 1;
        if (taberror == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            Tab_ErrorInfo.ForeColor = foclr;
            Tab_ErrorInfo.BackColor = bgclr;
            Color bgcr = ColorTranslator.FromHtml("#33CCFF");
            Color focr = ColorTranslator.FromHtml("#303030");
            tbpnluser.ForeColor = focr;
            tbpnluser.BackColor = bgcr;
            Tab_TaxDetails.ForeColor = focr;
            Tab_TaxDetails.BackColor = bgcr;
        }
    }
    protected void btn_Cancel_Complaint_Click(object sender, EventArgs e)
    {
        txt_Error.Text = "";

        tr_ITcomp.Visible = false;
        tr_ITcomp1.Visible = false;
        

    }
    protected void Grid_Order_IT_Error_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ViewDocument")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_path = (Label)row.FindControl("lbl_ITorderkb_doc_path");

            string filePath = lbl_path.Text;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();

        }
        else if (e.CommandName == "DeleteRecord")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lblOrder_Kb_Id = (Label)row.FindControl("lblITOrder_Kb_Id");
            int orderkbid = int.Parse(lblOrder_Kb_Id.Text.ToString());
            Hashtable htdelete = new Hashtable();
            DataTable dtdelete = new DataTable();
            htdelete.Add("@Trans", "DELETE");
            htdelete.Add("@IT_Error_Id", orderkbid);

            dtdelete = dataaccess.ExecuteSP("Sp_Orders_IT_Error", htdelete);

            
            Gridview_Bind_IT_Error_Data();


        }
    }
    protected void img_btn_order_kb_Cancel_Click(object sender, EventArgs e)
    {
        tr_OrderKb.Visible = false;
        tr_OrderKb1.Visible = false;
        ClearOrderandAgency();
    }
    protected void imgbtn_agency_Cancel_Click(object sender, EventArgs e)
    {
        tr_Agency.Visible = false;
        ClearOrderandAgency();
    }
    protected void btn_County_Database_cacnel_Click(object sender, EventArgs e)
    {
        tr_CountyData.Visible = false;
        tr_CountyData1.Visible = false;
        Txt_taxtype_Comments.Text = "";
    }
    protected void imgbtn_Delequent_Tax_Cancel_Click(object sender, EventArgs e)
    {
        tr_DelequentDb.Visible = false;
        tr_DelequentDb1.Visible = false;
        ClearDeliquent();
    }
    protected void btn_AddCountyTax_Click(object sender, EventArgs e)
    {
        Hashtable htupdaterec = new Hashtable();
        DataTable dtupdaterec = new System.Data.DataTable();
        DateTime date = new DateTime();
        date = DateTime.Now;
        string dateeval = date.ToString("dd/MM/yyyy");
        string time = date.ToString("hh:mm tt");

        htupdaterec.Add("@Trans", "UPDATE");
        htupdaterec.Add("@Conty_Database_Id", ViewState["Conty_Database_Id"]);
      
        htupdaterec.Add("@Ph_No", txt_CountyPhno.Text);
        htupdaterec.Add("@Make_Changes_Payable_to", txt_CountyPayto.Text);
        htupdaterec.Add("@Payee_Address", txt_CountyTaxPayeeadd.Text);
        htupdaterec.Add("@Modified_By", userid);
        htupdaterec.Add("@Modified_Date", date);
        htupdaterec.Add("@Status", "True");
        dtupdaterec = dataaccess.ExecuteSP("Sp_Orders_Tax_County_DataBase", htupdaterec);

        tr_CountyDbInfo.Visible = false;
        tr_CountyDbInfo1.Visible = false;
     
        Gridview_Bind_CountyDatabaseInformation();

    }
   
    protected void grd_Tax_County_Database_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRecord")
        {
            tr_CountyDbInfo.Visible = true;
            tr_CountyDbInfo1.Visible = true;
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_County_Tax_Type = (Label)row.FindControl("lbl_County_Tax_Type");
            Label lbl_Ph_No = (Label)row.FindControl("lbl_Ph_No");
            Label lbl_Payee_Address = (Label)row.FindControl("lbl_Payee_Address");
            Label lbl_Make_Changes_Payable_to = (Label)row.FindControl("lbl_Make_Changes_Payable_to");
            Label lbl_Conty_Database_Id = (Label)row.FindControl("lbl_Conty_Database_Id");
            ViewState["Conty_Database_Id"] = lbl_Conty_Database_Id.Text;
            dbc.BindTax_Type(ddl_CountyTaxtype);

            ddl_CountyTaxtype.SelectedItem.Text = lbl_County_Tax_Type.Text;
            txt_CountyPhno.Text = lbl_Ph_No.Text;
            txt_CountyTaxPayeeadd.Text = lbl_Payee_Address.Text;
            txt_CountyPayto.Text = lbl_Make_Changes_Payable_to.Text;

        }
    }
    protected void Imgbtn_Error_Click(object sender, EventArgs e)
    {
        if (Validate_Order_Error() != false && Imgbtn_Error.Text != "UPDATE")
        {
            model1.Show();
            Hashtable htagencykb = new Hashtable();
            DataTable agencykb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htagencykb.Add("@Trans", "INSERT");
            htagencykb.Add("@Order_Id", Order_Id);
            htagencykb.Add("@Erorr_Category_Id", ddl_Error_Category.SelectedValue);
            htagencykb.Add("@Error_Description", txt_Error_Description.Text);
            htagencykb.Add("@Inserted_By", userid);
            htagencykb.Add("@Inserted_date", date);
            htagencykb.Add("@Modified_By", userid);
            htagencykb.Add("@Modified_Date", date);
            htagencykb.Add("@status", "True");
            agencykb = dataaccess.ExecuteSP("Sp_Orders_Error", htagencykb);

            Gridview_Bind_Order_Erorr_Data();
            ClearOrderaEror();
        }
        else if (Validate_Order_Error() != false && Imgbtn_Error.Text == "UPDATE")
        {

            Hashtable htagencykb = new Hashtable();
            DataTable agencykb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htagencykb.Add("@Trans", "UPDATE");  //Keep User Tracking
            htagencykb.Add("@Error_Id", ViewState["Error_Id"]);
            htagencykb.Add("@Erorr_Category_Id", ddl_Error_Category.SelectedValue);
            htagencykb.Add("@Error_Description", txt_Error_Description.Text);
            htagencykb.Add("@Inserted_By", userid);
            htagencykb.Add("@Inserted_date", date);
            htagencykb.Add("@Modified_By", userid);
            htagencykb.Add("@Modified_Date", date);
            htagencykb.Add("@status", "True");


            agencykb = dataaccess.ExecuteSP("Sp_Orders_Error", htagencykb);
       
            ClearOrderaEror();
            Imgbtn_Error.Text = "Add";
            Gridview_Bind_Order_Erorr_Data();

        }

    }
    private bool Validate_Order_Error()
    {

        if (ddl_Error_Category.SelectedIndex <= 0)
        {
            ddl_Error_Category.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Error Category')</script>", false);
            return false;


        }
        if (txt_Error_Description.Text == "")
        {
            txt_Error_Description.Focus();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Error Description')</script>", false);
            return false;

        }
        return true;

    }
    protected void Gridview_Bind_Order_Erorr_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Orders_Error", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Error_Details.Visible = true;
            grd_Error_Details.DataSource = dtuser;
            grd_Error_Details.DataBind();

        }
        else
        {

            grd_Error_Details.DataSource = null;
            grd_Error_Details.EmptyDataText = "No Records Are Avilable";
            grd_Error_Details.DataBind();

        }
    }
    protected void ClearOrderaEror()
    {

        ddl_Error_Category.SelectedIndex = 0;
        txt_Error_Description.Text = "";

    }
    protected void grd_Error_Details_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRecord")
        {

            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lblError_Id = (Label)row.FindControl("lblError_Id");
            ViewState["Error_Id"] = lblError_Id.Text;
            Label lblError_Category_Name = (Label)row.FindControl("lblError_Category_Name");
            Label lblErorr_Category_Id = (Label)row.FindControl("lblErorr_Category_Id");
            Label lblError_Description = (Label)row.FindControl("lblError_Description");

            ddl_Error_Category.SelectedValue = lblErorr_Category_Id.Text;
            txt_Error_Description.Text = lblError_Description.Text;
          
            Imgbtn_Error.Text = "UPDATE";

        }

    }
    protected void grd_Error_Details_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_error_id = int.Parse(grd_Error_Details.DataKeys[e.RowIndex].Values["Error_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Error_Id", Tax_error_id);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Error", htdelete);
        Gridview_Bind_Order_Erorr_Data();
    }
    protected void TabPanelcurrent_Click(object sender, EventArgs e)
    {
        tr_Taxdet.Visible = true;
        Tab_CurrentYear.Visible = true;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = false;
        tabcurrent = 1;
        if (tabcurrent == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            TabPanelcurrent.ForeColor = foclr;
            TabPanelcurrent.BackColor = bgclr;
        }
    }
    protected void TabAnnual_Click(object sender, EventArgs e)
    {
        tr_Taxdet.Visible = true;
        Tab_CurrentYear.Visible = false;
        Tab_AnnualTax.Visible = true;
        Tab_Comment.Visible = false;
        tabannual = 1;
        if (tabannual == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            TabAnnual.ForeColor = foclr;
            TabAnnual.BackColor = bgclr;
        }
    }
    protected void TaxNotes_Click(object sender, EventArgs e)
    {
        tr_Taxdet.Visible = true;
        Tab_CurrentYear.Visible = false;
        Tab_AnnualTax.Visible = false;
        Tab_Comment.Visible = true;
        tabcomt = 1;
        if (tabcomt == 1)
        {
            Color bgclr = ColorTranslator.FromHtml("#12B61F");
            Color foclr = ColorTranslator.FromHtml("#ffffff");
            TaxNotes.ForeColor = foclr;
            TaxNotes.BackColor = bgclr;
        }
    }
    protected void btn_Submit_Comments_Click(object sender, EventArgs e)
    {
        if (txt_CurrentYear_Comments.Text != "" || txt_Annual_Comments.Text != "" || txt_PriorYear_Comments.Text != "")
        {
            Hashtable htcheck = new Hashtable();
            DataTable dtcheck = new System.Data.DataTable();
            htcheck.Add("@Trans", "CHECK");
            htcheck.Add("@Order_Id", Order_Id);
            dtcheck = dataaccess.ExecuteSP("Sp_Client_Lereta_Tax_Comments", htcheck);
            int Check = int.Parse(dtcheck.Rows[0]["count"].ToString());
            if (Check == 0)
            {
                Hashtable htcountydata = new Hashtable();
                DataTable dtcountydata = new System.Data.DataTable();
                DateTime datecounty = new DateTime();
                datecounty = DateTime.Now;

                htcountydata.Add("@Trans", "INSERT");
                htcountydata.Add("@Order_Id", Order_Id);
                htcountydata.Add("@Annual_Comments", txt_Annual_Comments.Text);
                htcountydata.Add("@Current_Year_Comments", txt_CurrentYear_Comments.Text);
                htcountydata.Add("@Prior_Year_Comments", txt_PriorYear_Comments.Text);
                htcountydata.Add("@Inserted_By", userid);
                htcountydata.Add("@Inserted_date", datecounty);
                htcountydata.Add("@Status", "True");
                dtcountydata = dataaccess.ExecuteSP("Sp_Client_Lereta_Tax_Comments", htcountydata);
                Get_Tax_Comments();
            }
            else if (Check > 0)
            {
                Hashtable htcountydata = new Hashtable();
                DataTable dtcountydata = new System.Data.DataTable();
                DateTime datecounty = new DateTime();
                datecounty = DateTime.Now;

                htcountydata.Add("@Trans", "UPDATE");
                htcountydata.Add("@Order_Id", Order_Id);
                htcountydata.Add("@Annual_Comments", txt_Annual_Comments.Text);
                htcountydata.Add("@Current_Year_Comments", txt_CurrentYear_Comments.Text);
                htcountydata.Add("@Prior_Year_Comments", txt_PriorYear_Comments.Text);
                htcountydata.Add("@Modified_By", userid);
                htcountydata.Add("@Modified_Date", datecounty);
                htcountydata.Add("@Status", "True");
                dtcountydata = dataaccess.ExecuteSP("Sp_Client_Lereta_Tax_Comments", htcountydata);
                Get_Tax_Comments();
            }

        }
    }
    protected void Get_Tax_Comments()
    {

        Hashtable htselect = new Hashtable();
        DataTable dtselect = new System.Data.DataTable();
        htselect.Add("@Trans", "SELECT");
        htselect.Add("@Order_Id", Order_Id);
        dtselect = dataaccess.ExecuteSP("Sp_Client_Lereta_Tax_Comments", htselect);
        if (dtselect.Rows.Count > 0)
        {

            txt_Annual_Comments.Text = dtselect.Rows[0]["Annual_Comments"].ToString();
            txt_CurrentYear_Comments.Text = dtselect.Rows[0]["Current_Year_Comments"].ToString();
            txt_PriorYear_Comments.Text = dtselect.Rows[0]["Prior_Year_Comments"].ToString();
        }
        else
        {
            txt_Annual_Comments.Text = "";
            txt_CurrentYear_Comments.Text = "";
            txt_PriorYear_Comments.Text = "";

        }

    }
    protected void btn_AddAnnual_Click(object sender, ImageClickEventArgs e)
    {
        tr_Annual.Visible = true;
        tr_Annual1.Visible = true;
    }

    protected void BindAnnualTaxAmount()
    {
        Hashtable htTax = new Hashtable();
        DataTable dtTax = new System.Data.DataTable();

        htTax.Add("@Trans", "SELECT_CURRENT_ANNUALYEAR");
        htTax.Add("@Order_Id", Order_Id);
        dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_Entry", htTax);
        if (dtTax.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Grd_Annual_Tax.Visible = true;
            Grd_Annual_Tax.DataSource = dtTax;
            Grd_Annual_Tax.DataBind();
            txt_Annual_Tax_Year.Text = dtTax.Rows[0]["Tax_Year"].ToString();
            txt_Annual_BaseAmount.Text = dtTax.Rows[0]["Tax_Year"].ToString();
            Bind_Annual_Tax_Total_PaidAmount();

        }
        else
        {
            dtTax.Rows.Add(dtTax.NewRow());
            Grd_Annual_Tax.DataSource = dtTax;
            Grd_Annual_Tax.DataBind();
            int columncount = Grd_Annual_Tax.Rows[0].Cells.Count;
            Grd_Annual_Tax.Rows[0].Cells.Clear();
            Grd_Annual_Tax.Rows[0].Cells.Add(new TableCell());
            Grd_Annual_Tax.Rows[0].Cells[0].ColumnSpan = columncount;
            Grd_Annual_Tax.Rows[0].Cells[0].Text = "No Records Found";

            txt_Annual_Tax_Year.Text = "";
            txt_Annual_BaseAmount.Text = "";
            txt_Annual_Tot_PaidAmount.Text = "";
        }

    }

    protected void Bind_Annual_Tax_Total_PaidAmount()
    {
        Hashtable htTax = new Hashtable();
        DataTable dtTax = new System.Data.DataTable();

        htTax.Add("@Trans", "SELECT_CURRENT_ANNUAL_TOTAL_PAID");
        htTax.Add("@Order_Id", Order_Id);
        dtTax = dataaccess.ExecuteSP("Sp_Orders_Tax_Entry", htTax);
        if (dtTax.Rows.Count > 0)
        {
            txt_Annual_Tot_PaidAmount.Text = dtTax.Rows[0]["Tot"].ToString();
        }

    }
    protected void btn_SubmitAnnual_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Comment_Click(object sender, ImageClickEventArgs e)
    {
        tr_cmt.Visible = true;
        tr_cmt1.Visible = true;
        tr_cmt2.Visible = true;
        tr_cmt3.Visible = true;
    }
}