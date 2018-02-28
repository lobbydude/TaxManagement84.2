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


public partial class Gls_Gls_Orders_Tax_Entry : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    CustomerBowser browser = new CustomerBowser();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
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
    string  Order_Type ="";
    decimal Tax_Amount,Excemption;
    int Orderpath_Count;
    int Check_County;
    int Status_Id;
    
    ReportDocument rptDoc = new ReportDocument();
    ReportDocument subRepDoc = new ReportDocument();
    public string Connection = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString.ToString();
    int client_Id, Subprocess_id;
    decimal tax_Base_Amount, tax_Pay_Off_Amount, tax_Paid_Amount, tax_due_Amount, tax_Discount_Amount;
    DateTime date2;
    protected void Page_Load(object sender, EventArgs e)
    {
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
           
            //TabContainer1.ActiveTabIndex = 0;
            //string s = browser.GetWebpage("http://www.netronline.com");
            //LiteralControl lc = new LiteralControl(s);
            //this.PlaceHolder1.Controls.Add(lc);

            TabContainer1.ActiveTabIndex = 1;
            TabContainer2.ActiveTabIndex = 0;
            tabcountydatabase.ActiveTabIndex = 0;
            dbc.BindState(ddl_Barrower_State);
            //dbc.BindTax_Year(ddl_Assesed_Tax_Year);
            dbc.BindTax_Type(ddl_Munciplene_Tax_Type);
            dbc.BindTax_Status(ddl_Munciplene_Tax_Status);
            dbc.BindTax_Year(ddl_Munciplene_Tax_Year);
            dbc.BindDeliquentTax_Type(ddl_Tax_Delquent_Tax_type,Order_Id);
            dbc.BindDeliquentTax_Type(ddl_Source_upload_Taxtype, Order_Id);
            dbc.BindComments_Tax_Type(ddl_TaxType_Commts, Order_Id);
            dbc.BindTax_Year(ddl_Assesed_Tax_Year);
           
            if (ddl_Barrower_County.SelectedValue != "")
            {

                dbc.BindCounty(ddl_Barrower_County, int.Parse(ddl_Barrower_State.SelectedValue));

            }
            Get_Order_Details();
            Page.MaintainScrollPositionOnPostBack = true;
            Gridview_Bind_Order_Kb_Data();
            Gridview_Bind_Order_Agency_Kb_Data();
           
            Gridview_Bind_Tax_Details();
            Gridview_Bind_TaxAcseesd_Data();
            Gridview_Bind_CountyDatabaseInformation();
            Geydview_Bind_Comments();
            Geydview_Bind_Notes();
             Gridview_Bind_Tax_Type_Comments();
            Gridview_Bind_Order_Deliquent_Data();
            Gridview_bind_Tax_Sold_Data();
            Gridview_bind_Munciple_Tax_Data();
            Gridview_bind_Bankrupty_Tax_Data();
            Gridview_Bind_Tax_type_Source_Upload_Data();
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


    //-------------------------------Order Knowledge Base--------------------------------


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

            txt_Loan_Number.Text = dtorder.Rows[0]["Loan_Number"].ToString();
            
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
            txt_Order_Notes.Text = dtorder.Rows[0]["Notes"].ToString();
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


    protected void img_btn_order_source_tax_upload_add_Click(object sender, ImageClickEventArgs e)
    {
        if (Validate_source_tax_upload() != false && ImageButton1.AlternateText == "Add")
        {
           
            model1.Show();
            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            string Uploadpath = "~/Uploads/Tax_Type_Source_File/" + Order_Id + "/" ;
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
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload2.PostedFile.FileName);
                string fileName = c;
                extension = Path.GetExtension(fileupload2.FileName);
                if (fileName != "")
                {

                    
                    fileupload3.PostedFile.SaveAs(Server.MapPath(Uploadpath) + fileName);
                    ViewState["FPath"] = Uploadpath.ToString() + fileName;

                    Tax_Type_Source_Upload__path = ViewState["FPath"].ToString();
                }
            }
            else
            {

                Order_Kbpath = null;
            }

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
            dtorderkb = dataaccess.ExecuteSP("Sp_Tax_Type_Source_Upload", htorderkb);

            model1.Hide();

        }
        Gridview_Bind_Tax_type_Source_Upload_Data();

    }
    protected void img_btn_order_kb_add_Click(object sender, ImageClickEventArgs e)
    {

        if (Validate_Order_Kb() != false && img_btn_order_kb_add.AlternateText == "Add")
        {
            model1.Show();
            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            string Uploadpath = "~/OrdersFile/OrderKB/" + Order_Id + "/";
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
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload1.PostedFile.FileName);
                string fileName = c;
                extension = Path.GetExtension(fileupload1.FileName);
                if (fileName != "")
                {

                    fileupload3.PostedFile.SaveAs(Server.MapPath(Uploadpath) + fileName);
                    ViewState["FPath"] = Uploadpath.ToString() + fileName;

                    Order_Kbpath = ViewState["FPath"].ToString();
                }
            }
            else
            {

                Order_Kbpath = null;
            }
            htorderkb.Add("@Trans", "INSERT");
            htorderkb.Add("@Subprocess_Id", int.Parse(Session["Sub_processID"].ToString()));
            htorderkb.Add("@Order_Id", Order_Id);
            htorderkb.Add("@Document_Name", txt_order_Kb_Document.Text);
            htorderkb.Add("@Comments", txt_order_Kb_Comment.Text);
            htorderkb.Add("@Order_kb_File_Type", extension);
            htorderkb.Add("@Order_Kb_Path", Order_Kbpath);
            htorderkb.Add("@Inserted_By", userid);
            htorderkb.Add("@Inserted_date", date);
            htorderkb.Add("@Modified_By", userid);
            htorderkb.Add("@Modified_Date", date);
            htorderkb.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htorderkb);
            Gridview_Bind_Order_Kb_Data();

            ClearOrderandAgency();

        }
        else if (img_btn_order_kb_add.AlternateText == "UPDATE" && Validate_Order_Kb() != false)
        {
            model1.Show();

            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            string Uploadpath = "~/OrdersFile/OrderKB/" + Order_Id + "/";
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
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload1.PostedFile.FileName);
                string fileName = c;
                extension = Path.GetExtension(fileupload1.FileName);
                if (fileName != "")
                {

                    fileupload3.PostedFile.SaveAs(Server.MapPath(Uploadpath) + fileName);
                    ViewState["FPath"] = Uploadpath.ToString() + fileName;

                    Order_Kbpath = ViewState["FPath"].ToString();
                }
            }
            else
            {

                Order_Kbpath = null;
            }

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
            img_btn_order_kb_add.ImageUrl = "~/images/Gridview/Add.png";
            img_btn_order_kb_add.AlternateText = "Add";
            ClearOrderandAgency();
            Gridview_Bind_Order_Kb_Data();

        }

        model1.Hide();
    }
    protected void ClearOrderandAgency()
    {

        txt_order_Kb_Comment.Text = "";
        txt_order_Kb_Document.Text = "";
        txt_Agency_Comment.Text = "";


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
        dtselSourceuploadkb = dataaccess.ExecuteSP("Sp_Tax_Type_Source_Upload", htselSourceuploadkb);
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
    protected void Tax_Type_Source_upload_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void grd_order_kb_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = grd_order_kb.SelectedRow;
        Label lblOrder_Kb_Id = (Label)row.FindControl("lblOrder_Kb_Id");
        Label lbl_Document = (Label)row.FindControl("lblDocument_Name");
        Label lbl_Comments = (Label)row.FindControl("lblComments");

        ViewState["Order_Kb_Id"] = lblOrder_Kb_Id.Text;
        txt_order_Kb_Document.Text = lbl_Document.Text;
        txt_order_Kb_Comment.Text = lbl_Comments.Text;
        img_btn_order_kb_add.ImageUrl = "~/images/Gridview/Save.png";
        img_btn_order_kb_add.AlternateText = "UPDATE";
        Operation = "UPDATE";
        ViewState["Update"] = "UPDATE";

    }

    //-----------------------------order Agency Details------------------------------------------
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

    protected void imgbtn_agency_Add_Click(object sender, ImageClickEventArgs e)
    {
        if (Validate_Order_Agency_Kb() != false && imgbtn_agency_Add.AlternateText != "UPDATE")
        {
            model1.Show();
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
        else if (imgbtn_agency_Add.AlternateText == "UPDATE")
        {

            Hashtable htagencykb = new Hashtable();
            DataTable agencykb = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            string Chanesto=txt_Agency_Comment.Text;
            htagencykb.Add("@Trans", "INSERT");  //Keep User Tracking
            htagencykb.Add("@Order_Agency_Kb_Id", ViewState["Agency_Order_Kb_Id"]);
            htagencykb.Add("@County_Id", ViewState["County_Id"]);
            htagencykb.Add("@Comments", Chanesto.ToString());
            htagencykb.Add("@Modified_By", userid);
            htagencykb.Add("@Modified_Date", date);
            htagencykb.Add("@status", "True");


            agencykb = dataaccess.ExecuteSP("Sp_Orders_Agency_Knowledge_Base", htagencykb);
            imgbtn_agency_Add.ImageUrl = "~/images/Gridview/Add.png";
            ClearOrderandAgency();
            imgbtn_agency_Add.AlternateText = "Add";
            Gridview_Bind_Order_Agency_Kb_Data();

        }
    model1.Hide();

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
    protected void grd_Agency_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = grd_Agency.SelectedRow;
        Label lbl_AgencyOrder_Kb_Id = (Label)row.FindControl("lbl_Agency_Order_Kb_Id");
        Label lbl_Agency_Document = (Label)row.FindControl("lbl_Agency_Documents");
        Label lbl_agency_Comments = (Label)row.FindControl("lbl_Agency_Comments");

        ViewState["Agency_Order_Kb_Id"] = lbl_AgencyOrder_Kb_Id.Text;
        ViewState["Changeinfo"] = lbl_agency_Comments.Text;
        txt_Agency_Comment.Text = lbl_agency_Comments.Text;
        imgbtn_agency_Add.ImageUrl = "~/images/Gridview/Save.png";

        imgbtn_agency_Add.AlternateText = "UPDATE";
    }
    protected void Tax_Type_Source_upload_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_Type_Source_upload_id = int.Parse(Tax_Type_Source_upload.DataKeys[e.RowIndex].Values["Tax_Type_Source_upload_id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Type_Source_upload_id", Tax_Type_Source_upload_id);
        dtdelete = dataaccess.ExecuteSP("Sp_Tax_Type_Source_Upload", htdelete);
        Gridview_Bind_Tax_type_Source_Upload_Data();
    }

    protected void grd_order_kb_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int orderkbid = int.Parse(grd_order_kb.DataKeys[e.RowIndex].Values["Order_Kb_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Order_Kb_Id", orderkbid);
        dtdelete = dataaccess.ExecuteSP("Sp_Order_Knowledge_Base", htdelete);
        Gridview_Bind_Order_Kb_Data();
    }
    protected void grd_Agency_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Agencyid = int.Parse(grd_Agency.DataKeys[e.RowIndex].Values["Order_Agency_Kb_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Order_Agency_Kb_Id", Agencyid);
        dtdelete = dataaccess.ExecuteSP("Sp_Orders_Agency_Knowledge_Base", htdelete);
        Gridview_Bind_Order_Agency_Kb_Data();
    }

   
    protected void ddl_Barrower_State_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (ddl_Barrower_State.SelectedValue != "")
        {

            dbc.BindCounty(ddl_Barrower_County, int.Parse(ddl_Barrower_State.SelectedValue));
            ddl_Barrower_County.Focus();
        }
    }


    //---------------------------------Tax Entry And Output Details------------------------------------
    protected void Gridview_Bind_Tax_Type_Comments()
    {
        Hashtable ht_Comments = new Hashtable();
        DataTable dt_Comments = new System.Data.DataTable();
        ht_Comments.Add("@Trans", "Taxtype_Comments");
        ht_Comments.Add("@Order_Id", Order_Id);
        dt_Comments = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", ht_Comments);
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

    protected void Gridview_Bind_Tax_Details()
    {
        Hashtable htTax = new Hashtable();
        DataTable dtTax = new System.Data.DataTable();

        htTax.Add("@Trans", "SELECT");
        htTax.Add("@Order_Id", Order_Id);
        dtTax = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htTax);
        if (dtTax.Rows.Count > 0)
        {
            //ex2.Visible = true;
            gvTaxDetails.Visible = true;
            gvTaxDetails.DataSource = dtTax;
            gvTaxDetails.DataBind();

        }
        else
        {
            dtTax.Rows.Add(dtTax.NewRow());
            gvTaxDetails.DataSource = dtTax;
            gvTaxDetails.DataBind();
            int columncount = gvTaxDetails.Rows[0].Cells.Count;
            gvTaxDetails.Rows[0].Cells.Clear();
            gvTaxDetails.Rows[0].Cells.Add(new TableCell());
            gvTaxDetails.Rows[0].Cells[0].ColumnSpan = columncount;
            gvTaxDetails.Rows[0].Cells[0].Text = "No Records Found";


        }
    }
       private bool Validate_Date()
    {

       
       
        return true;

    }



    protected void gvTaxDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            model1.Show();
          
          //  TextBox txt_Tax_No_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_No_Entry");
            DropDownList ddl_Tax_Type_Entry = (DropDownList)gvTaxDetails.FooterRow.FindControl("ddl_Tax_Type_Entry");
            TextBox txt_Tax_Year = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Year_Entry");

            DropDownList ddl_Tax_Status_Entry = (DropDownList)gvTaxDetails.FooterRow.FindControl("ddl_Tax_Status_Entry");
            TextBox txt_TaxMunciplename_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Munciplane_Name_Entry");
            TextBox txt_Tax_Amount_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Amount_Amount_Entry");
            TextBox txt_Tax_Payoff_Amount_Amount_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Payoff_Amount_Amount_Entry");
            //txt_Tax_Payoff_Amount =decimal.Parse( txt_Tax_Payoff_Amount_Amount_Entry.Text.ToString());
            TextBox txt_Tax_Paid_Amount_Amount_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Paid_Amount_Amount_Entry");



            DropDownList ddl_Discount_Entry = (DropDownList)gvTaxDetails.FooterRow.FindControl("ddl_Discount_Entry");
            TextBox txt_Tax_Discount_Amount_Amount_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Discount_Amount_Amount_Entry");
            TextBox txt_Tax_Entry_Discount_Date = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Entry_Discount_Date");


            //    txt_Tax_Paid_Amount = decimal.Parse(txt_Tax_Paid_Amount_Amount_Entry.Text.ToString());ddl_Discount_Entry
            TextBox txt_Tax_Due_Amount_Amount_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Due_Amount_Amount_Entry");
         //   txt_Tax_Due_Amount = decimal.Parse(txt_Tax_Due_Amount_Amount_Entry.Text.ToString());
            TextBox txt_Tax_Due_Date_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Due_Date_Entry");
            DropDownList ddl_Tax_Period_Entry = (DropDownList)gvTaxDetails.FooterRow.FindControl("ddl_Tax_Period_Entry");
            TextBox txt_Tax_Entry_Good_Through_Date = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Entry_Good_Through_Date");
            TextBox txt_Tax_Entry_Paid_Date = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Tax_Entry_Paid_Date");
             //TextBox txt_Notes_Entry = (TextBox)gvTaxDetails.FooterRow.FindControl("txt_Notes_Entry");
            if (ddl_Tax_Status_Entry.SelectedValue == "2")
            {

                if (txt_Tax_Entry_Good_Through_Date.Text == "")
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
            if (txt_Tax_Payoff_Amount_Amount_Entry.Text != "") { tax_Pay_Off_Amount = Convert.ToDecimal(txt_Tax_Payoff_Amount_Amount_Entry.Text.ToString()); } else { tax_Pay_Off_Amount = 0; }
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
                htinsertrec.Add("@Order_Id", Order_Id);
                htinsertrec.Add("@Tax_Type_Id", ddl_Tax_Type_Entry.SelectedValue);
                htinsertrec.Add("@Munciplene_Name", txt_TaxMunciplename_Entry.Text);
                htinsertrec.Add("@Tax_Year", txt_Tax_Year.Text);
                htinsertrec.Add("@Tax_Status_Id", ddl_Tax_Status_Entry.SelectedValue);
                htinsertrec.Add("@Tax_Base_Amount", tax_Base_Amount);
                htinsertrec.Add("@Tax_Payoff_Amount", tax_Pay_Off_Amount);
                htinsertrec.Add("@Tax_Paid_Amount", tax_Paid_Amount);
                htinsertrec.Add("@Discount_Amount", tax_Discount_Amount);
                htinsertrec.Add("@Discount", ddl_Discount_Entry.SelectedValue);
                htinsertrec.Add("@Discount_Date", txt_Tax_Entry_Discount_Date.Text);

                htinsertrec.Add("@Tax_Due_Amount", tax_due_Amount);
                htinsertrec.Add("@Tax_Due_Date", txt_Tax_Due_Date_Entry.Text);
                htinsertrec.Add("@Tax_Period_Id", ddl_Tax_Period_Entry.SelectedValue);
                htinsertrec.Add("@Good_Through_Date", txt_Tax_Entry_Good_Through_Date.Text);
                htinsertrec.Add("@Paid_Date", txt_Tax_Entry_Paid_Date.Text);
                htinsertrec.Add("@Inserted_By", userid);
                htinsertrec.Add("@Inserted_date", date);
                htinsertrec.Add("@Status", "True");
             


                 //INSERT TAX NOTES 


                if (ddl_Tax_Status_Entry.SelectedValue == "2")
                {
                     DateTime date1 = DateTime.Now;
      
        if (txt_Tax_Entry_Good_Through_Date.Text != "")
        {
             date2 = Convert.ToDateTime(txt_Tax_Entry_Good_Through_Date.Text);
        }
        int result = DateTime.Compare(date1, date2);

        if (result > 0)
        {
            model1.Hide();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert(' Good Thru Date Should Be Greater Than Today')</script>", false);
            
            return;

        }
                    if (result <=0)
                    {

                   

                    dtinsertrec = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htinsertrec);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Tax Added SucessFully)</script>", false);
                 
                    Gridview_Bind_Tax_Details();
                  
                  
                    }

                }
                else if (ddl_Tax_Status_Entry.SelectedValue != "2")
                {
                    dtinsertrec = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htinsertrec);
                    Gridview_Bind_Tax_Details();
                }
                ViewState["Tax_Type"] = ddl_Tax_Type_Entry.SelectedItem.ToString();
                ViewState["Tax_Type_Id"] = ddl_Tax_Type_Entry.SelectedValue.ToString();
                Gridview_Bind_Tax_Details();

              
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
                    dtTax = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htTax);
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
                    dtTax = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htTax);
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
                    dtTax = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htTax);
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
                    dtTax = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htTax);
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

                //get Maximum Tax Id 
                Hashtable htmax = new Hashtable();
                DataTable dtmax = new System.Data.DataTable();
                htmax.Add("@Trans", "GET_MAX_TAX_ID");
                dtmax = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htmax);
                if (dtmax.Rows.Count > 0)
                {

                    Maximum = int.Parse(dtmax.Rows[0]["Tax_id"].ToString());
                }
                else
                {

                    Maximum = 0;
                }
                //INSERT TAX NOTES

               


                //Now iNsert into Tbl_County Database OrderWise

                //check CountyDatabaseinfo
                Hashtable htcount = new Hashtable();
                DataTable dtcount = new System.Data.DataTable();
                htcount.Add("@Trans", "CHECK");
                htcount.Add("@Order_Id",Order_Id);
                htcount.Add("@Tax_Type_Id", ViewState["Tax_Type_Id"]);
               
                dtcount = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htcount);
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
                    htcountydata.Add("@Tax_Id", Maximum);
                    htcountydata.Add("@Tax_Type_Id", ViewState["Tax_Type_Id"]);
                    htcountydata.Add("@Munciplene_Name",txt_TaxMunciplename_Entry.Text);
                    htcountydata.Add("@Ph_No", ViewState["Tax_Office_Phone_No"].ToString());

                    htcountydata.Add("@Make_Changes_Payable_to", ViewState["Make_Changes_Payable_to"].ToString());
                    htcountydata.Add("@Payee_Address", ViewState["Payee_Address"].ToString());
                    htcountydata.Add("@Inserted_By", userid);
                    htcountydata.Add("@Inserted_date", datecounty);
                    htcountydata.Add("@Status", "True");
                    dtcountydata = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htcountydata);
                    Gridview_Bind_Tax_Details();
                    Gridview_Bind_CountyDatabaseInformation();
                    model1.Hide();

              //  ScriptManager.RegisterStartupScript(uptax_entrygrid, uptax_entrygrid.GetType(), "Tax Added SucessFully", "OpenPopup();", true);

                   // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Tax Added SucessFully)</script>", false);
                //Response.Write("<script type='text/javascript'>");
                //Response.Write("alert('Tax Added SucessFully');");
                //Response.Write("</script>");
               
                }
            }

            else
            {
                model1.Hide();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Tax id')</script>", false);
             
            }
           // Gridview_Bind_Tax_Details();
            model1.Hide();

        }


    
            }


    

    
    
    protected void Gridview_Bind_CountyDatabaseInformation()
    {

        Hashtable htselCountyDdata = new Hashtable();
        DataTable dtCountyData = new System.Data.DataTable();

        htselCountyDdata.Add("@Trans", "SELECT_COUNTYDB_TAXTYPE");
        htselCountyDdata.Add("@Order_Id", Order_Id);
        dtCountyData = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htselCountyDdata);
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

    protected void gvTaxDetails_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTaxDetails.EditIndex = e.NewEditIndex;
        Gridview_Bind_Tax_Details();
    }
    protected void gvTaxDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      //  model1.Show();
        //delete tax entry 
        int Tax_Id = Convert.ToInt32(gvTaxDetails.DataKeys[e.RowIndex].Values["Tax_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Id", Tax_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htdelete);
        Gridview_Bind_Tax_Details();
        //delete tax county info
        Hashtable htdeletecountytax = new Hashtable();
        DataTable dtdeletecountytax = new DataTable();
        htdeletecountytax.Add("@Trans", "DELETE");
        htdeletecountytax.Add("@Order_Id", Order_Id);
        htdeletecountytax.Add("@Tax_Id", Tax_Id);
        dtdeletecountytax = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htdeletecountytax);
        Gridview_Bind_CountyDatabaseInformation();
       // model1.Hide();

        //delete order tax Notes

        Hashtable htdeleteNotes = new Hashtable();
        DataTable dtdeleteNotes = new DataTable();
        htdeleteNotes.Add("@Trans", "DELETE");
        htdeleteNotes.Add("@Tax_Id", Tax_Id);
        dtdeleteNotes = dataaccess.ExecuteSP("Sp_Orders_Tax_County_Comments", htdeleteNotes);
      
    }
    protected void gvTaxDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       // model1.Show();
        int Taxid = Convert.ToInt32(gvTaxDetails.DataKeys[e.RowIndex].Value.ToString());
        TextBox txt_Tax_No = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_No");
        DropDownList ddl_Tax_Type = (DropDownList)gvTaxDetails.Rows[e.RowIndex].FindControl("ddl_Tax_Type");
        TextBox txt_Tax_Year_Entry = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Year");
        DropDownList ddl_Tax_Status = (DropDownList)gvTaxDetails.Rows[e.RowIndex].FindControl("ddl_Tax_Status");
        TextBox txt_Tax_Munciple_Name = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Munciplane_Name");
        TextBox txt_Tax_Amount = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Amount");

        DropDownList ddl_Discount = (DropDownList)gvTaxDetails.Rows[e.RowIndex].FindControl("ddl_Discount");
        TextBox txt_Tax_Discount_Amount = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Discount_Amount");
        TextBox txt_Tax_Discount_Date = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Discount_Date");

        TextBox txt_Tax_Due_Date = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Due_Date");
        DropDownList ddl_Tax_Period = (DropDownList)gvTaxDetails.Rows[e.RowIndex].FindControl("ddl_Tax_Period");
        TextBox txt_Tax_Good_Through_Date = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Good_Through_Date");
        TextBox txt_Tax_Paid_Date = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Paid_Date");
       // TextBox txt_Tax_Amount_Entry = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Amount");
        TextBox txt_Tax_Payoff_Amount_Amount_Entry = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Payoff_Amount");
        TextBox txt_Tax_Paid_Amount_Amount_Entry = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Paid_Amount");
        TextBox txt_Tax_Due_Amount_Amount_Entry = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Tax_Due_Amount");
        TextBox txt_Notes = (TextBox)gvTaxDetails.Rows[e.RowIndex].FindControl("txt_Notes");
        Hashtable htupdaterec = new Hashtable();
        DataTable dtupdaterec = new System.Data.DataTable();
        DateTime date = new DateTime();
        date = DateTime.Now;
        string dateeval = date.ToString("dd/MM/yyyy");
        string time = date.ToString("hh:mm tt");

        if (txt_Tax_Amount.Text != "")
        {

            tax_Base_Amount = Convert.ToDecimal(txt_Tax_Amount.Text.ToString());
          
        }
        else
        {
            tax_Base_Amount = 0;

        }
        if (txt_Tax_Payoff_Amount_Amount_Entry.Text != "") { tax_Pay_Off_Amount = Convert.ToDecimal(txt_Tax_Payoff_Amount_Amount_Entry.Text.ToString()); } else { tax_Pay_Off_Amount = 0; }
        if (txt_Tax_Paid_Amount_Amount_Entry.Text != "") { tax_Paid_Amount = Convert.ToDecimal(txt_Tax_Paid_Amount_Amount_Entry.Text.ToString()); } else { tax_Paid_Amount = 0; }
      //  if (txt_Tax_Due_Amount_Amount_Entry.Text != "") { tax_due_Amount = Convert.ToDecimal(txt_Tax_Due_Amount_Amount_Entry.Text.ToString()); } else { tax_due_Amount = 0; }
        if (txt_Tax_Discount_Amount.Text != "") { tax_Discount_Amount = Convert.ToDecimal(txt_Tax_Discount_Amount.Text.ToString()); } else { tax_Discount_Amount = 0; }     
   
                
                
        htupdaterec.Add("@Trans", "UPDATE");
        htupdaterec.Add("@Tax_Id", Taxid);
        htupdaterec.Add("@Tax_No", txt_Parcel_Number.Text);
        htupdaterec.Add("@Order_Id", Order_Id);
        htupdaterec.Add("@Tax_Type_Id", ddl_Tax_Type.SelectedValue);
        htupdaterec.Add("@Munciplene_Name", txt_Tax_Munciple_Name.Text);
        htupdaterec.Add("@Tax_Year", txt_Tax_Year_Entry.Text);
        htupdaterec.Add("@Tax_Status_Id", ddl_Tax_Status.SelectedValue);
        htupdaterec.Add("@Tax_Due_Date", txt_Tax_Due_Date.Text);

        htupdaterec.Add("@Discount_Amount", tax_Discount_Amount);
        htupdaterec.Add("@Discount", ddl_Discount.SelectedValue);
        htupdaterec.Add("@Discount_Date", txt_Tax_Discount_Date.Text);

        htupdaterec.Add("@Tax_Period_Id", ddl_Tax_Period.SelectedValue);
        htupdaterec.Add("@Good_Through_Date", txt_Tax_Good_Through_Date.Text);
        htupdaterec.Add("@Tax_Base_Amount", tax_Base_Amount);
        htupdaterec.Add("@Tax_Payoff_Amount", tax_Pay_Off_Amount);
        htupdaterec.Add("@Tax_Paid_Amount", tax_Paid_Amount);
        htupdaterec.Add("@Tax_Due_Amount", tax_due_Amount);

        htupdaterec.Add("@Paid_Date", txt_Tax_Paid_Date.Text);
        htupdaterec.Add("@Modified_By", userid);
        htupdaterec.Add("@Modified_Date", date);
        htupdaterec.Add("@Status", "True");
        dtupdaterec = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htupdaterec);

       

        gvTaxDetails.EditIndex = -1;
        Gridview_Bind_Tax_Details();
       // model1.Hide();

    }
    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    /* Verifies that the control is rendered */
    //}
    
    protected void gvTaxDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {

                Label lbl_Tax_Id = (Label)e.Row.FindControl("lblTax_Id");
                DropDownList ddl_Tax_Type = (DropDownList)e.Row.FindControl("ddl_Tax_Type");
                DropDownList ddl_Tax_Year = (DropDownList)e.Row.FindControl("ddl_Tax_Year");
                DropDownList ddl_Tax_Status = (DropDownList)e.Row.FindControl("ddl_Tax_Status");
                DropDownList ddl_Tax_Period = (DropDownList)e.Row.FindControl("ddl_Tax_Period");
                DropDownList ddl_Discount = (DropDownList)e.Row.FindControl("ddl_Discount");


                TextBox txt_Tax_Discount_Amount = (TextBox)e.Row.FindControl("txt_Tax_Discount_Amount");
                TextBox txt_Tax_Discount_Date = (TextBox)e.Row.FindControl("txt_Tax_Discount_Date");

                dbc.BindTax_Period(ddl_Tax_Period);
                dbc.BindTax_Status(ddl_Tax_Status);
                dbc.BindDiscountConf(ddl_Discount);
                dbc.BindTax_Type(ddl_Tax_Type);
              //  dbc.BindTax_Year(ddl_Tax_Year);
             


                Hashtable htsel = new Hashtable();
                DataTable dtsel = new System.Data.DataTable();

                htsel.Add("@Trans", "GET_TAXINFO_IDWISE");
                htsel.Add("@Tax_Id", lbl_Tax_Id.Text);
                dtsel = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htsel);
                if (dtsel.Rows.Count > 0)
                {
                    ddl_Tax_Status.SelectedValue = dtsel.Rows[0]["Tax_Status_Id"].ToString();
                    ddl_Tax_Type.SelectedValue = dtsel.Rows[0]["Tax_Type_Id"].ToString();
                    string disc = dtsel.Rows[0]["Discount"].ToString();
                    if (dtsel.Rows[0]["Discount"].ToString() == "Y         ")
                    {

                        ddl_Discount.SelectedValue = "Y";

                    }
                    else if (dtsel.Rows[0]["Discount"].ToString() == "N         ")
                    {
                        ddl_Discount.SelectedValue = "N";
                    }
        if (ddl_Discount.SelectedValue == "N")
        {
            txt_Tax_Discount_Amount.Text = "";
            txt_Tax_Discount_Date.Text = "";
            txt_Tax_Discount_Amount.Enabled = false;
            txt_Tax_Discount_Date.Enabled = false;
        }

        if (ddl_Discount.SelectedValue == "Y")
        {
           
            txt_Tax_Discount_Amount.Enabled = true;
            txt_Tax_Discount_Date.Enabled = true;
        }
                   ddl_Tax_Period.SelectedValue = dtsel.Rows[0]["Tax_Period_Id"].ToString();
                }
            }
        }
        else if (e.Row.RowType == DataControlRowType.Footer )
        {
            DropDownList ddl_Tax_Type_Entry = (DropDownList)e.Row.FindControl("ddl_Tax_Type_Entry");
            DropDownList ddl_Discount_Entry = (DropDownList)e.Row.FindControl("ddl_Discount_Entry");
            DropDownList ddl_Tax_Status_Entry = (DropDownList)e.Row.FindControl("ddl_Tax_Status_Entry");
            DropDownList ddl_Tax_Period_Entry = (DropDownList)e.Row.FindControl("ddl_Tax_Period_Entry");

            dbc.BindTax_Status(ddl_Tax_Status_Entry);
            dbc.BindTax_Type(ddl_Tax_Type_Entry);
            //dbc.BindTax_Year(ddl_Tax_Year_Entry);
            dbc.BindTax_Period(ddl_Tax_Period_Entry);
            dbc.BindDiscountConf(ddl_Discount_Entry);
        }
    }
    //protected void gvTaxDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    model1.Show();
    //    //delete tax entry 
    //    int Tax_Id = Convert.ToInt32(gvTaxDetails.DataKeys[e.RowIndex].Values["Tax_Id"].ToString());
    //    Hashtable htdelete = new Hashtable();
    //    DataTable dtdelete = new DataTable();
    //    htdelete.Add("@Trans", "DELETE");
    //    htdelete.Add("@Tax_Id", Tax_Id);
    //    dtdelete = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Entry", htdelete);
    //    Gridview_Bind_Tax_Details();
    //    //delete tax county info
    //    Hashtable htdeletecountytax = new Hashtable();
    //    DataTable dtdeletecountytax = new DataTable();
    //    htdeletecountytax.Add("@Trans", "DELETE");
    //    htdeletecountytax.Add("@Order_Id", Order_Id);
    //    htdeletecountytax.Add("@Tax_Id", Tax_Id);
    //    dtdeletecountytax = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htdeletecountytax);
    //    Gridview_Bind_CountyDatabaseInformation();
    //    model1.Hide();
    //}
   
    protected void gvTaxDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvTaxDetails.EditIndex = -1;
        Gridview_Bind_Tax_Details();
    }

    //Tax Discount Entry
    protected void ddl_Disount_Selcted_Changed(object sender, EventArgs e)
    {
      
     //   ModalPopupExtender1.Show();
       


    }

    protected void Discount_Entry_Click(object sender, EventArgs e)
    {
      // ModalPopupExtend_Tax_Sales.Show();
        
       // ModalPopupExtender1.Show();



    }

    

    //protected void EditOrder_Details(object sender, CommandEventArgs e)
    
    //{
    //    //ModalPopupExtender1.Show();
    //}
   
   
    //protected void Get_Tax_Entry_Notes()
    //{   
        
    //    Hashtable htselorderkb = new Hashtable();
    //    DataTable dtuser = new System.Data.DataTable();

    //    htselorderkb.Add("@Trans", "SELECT");
    //    htselorderkb.Add("@Order_Id", Order_Id);
    //    htselorderkb.Add("@Tax_Id", ViewState["Tax_Id"]);
    //    dtuser = dataaccess.ExecuteSP("Sp_Orders_Tax_County_Comments", htselorderkb);
    //    if (dtuser.Rows.Count > 0)
    //    {
    //        lbl_Notes_Entry.Text = dtuser.Rows[0]["Note"].ToString();
    //    }
    //    else
    //    {

    //        lbl_Notes_Entry.Text = "";
    //    }


    //}
    protected void gvTaxDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gvTaxDetails.SelectedRow;
        Label lbl_tax_id = (Label)row.FindControl("lblTax_Id");
        int Taxid = Convert.ToInt32(lbl_tax_id.Text);
     
        ViewState["Tax_Id"] = Taxid;
       // txt_Tax_Parcel_Number.Text = txt_Parcel_Number.Text;
        LinkButton lbl_Tax_Type = (LinkButton)row.FindControl("lblTax_Type");
        Label lbl_Tax_Year = (Label)row.FindControl("lblTax_Year");
        Label lbl_Tax_Status = (Label)row.FindControl("lblTax_Status");
        Label lbl_Tax_Period = (Label)row.FindControl("lblTax_Period");
        Label lbl_Tax_Base_Amount = (Label)row.FindControl("lblTax_Base_Amount");
        Label lbl_Tax_Payoff_Amount = (Label)row.FindControl("lblTax_Payoff_Amount");
        Label lbl_Tax_Due_Amount = (Label)row.FindControl("lblTax_Due_Amount");
        Label lbl_Tax_Paid_Amount = (Label)row.FindControl("lblTax_Paid_Amount");
        Label lbl_Tax_Due_Date = (Label)row.FindControl("lblTax_Due_Date");
        Label lbl_Tax_Good_Through_Date = (Label)row.FindControl("lblGood_Through_Date");
        Label lbl_Tax_Paid_Date = (Label)row.FindControl("lblPaid_Date");


      




    }
    //----------------------------------Tax Assesd Entry-------------------------------------


    protected void ClearAsseed()
    {

        txt_Land.Text = "";
        txt_Building.Text = "";
        txt_total.Text = "";
        txt_Excemption.Text = "";


    }

    protected void imgbtn_Assesd_Add_Click(object sender, ImageClickEventArgs e)
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

            if (imgbtn_Assesd_Add.AlternateText == "Add")
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
                dtorderkb = dataaccess.ExecuteSP("Sp_Tax_Asessed_Entry", htorderkb);
                Gridview_Bind_TaxAcseesd_Data();

                ClearAsseed();

            }
            else if (imgbtn_Assesd_Add.AlternateText == "UPDATE")
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
                dtorderkb = dataaccess.ExecuteSP("Sp_Tax_Asessed_Entry", htorderkb);
                imgbtn_Assesd_Add.ImageUrl = "~/images/Gridview/Add.png";
                imgbtn_Assesd_Add.AlternateText = "Add";
                ClearAsseed();
                Gridview_Bind_TaxAcseesd_Data();
            }

        }
        else
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Select Tax Year')</script>", false);
        }



    }
    protected void Gridview_Bind_TaxAcseesd_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Tax_Asessed_Entry", htselorderkb);
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
    protected void txt_Land_TextChanged(object sender, System.EventArgs e)
    {
        CalculateTotal();
        txt_Building.Focus();

    }
    protected void txt_Building_TextChanged(object sender, System.EventArgs e)
    {
        CalculateTotal();
        imgbtn_Assesd_Add.Focus();
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
    protected void grd_Assesed_SelectedIndexChanged(object sender, System.EventArgs e)
    {
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
        imgbtn_Assesd_Add.ImageUrl = "~/images/Gridview/Save.png";

        imgbtn_Assesd_Add.AlternateText = "UPDATE";
    }
    protected void btn_Error_Submit_Click(object sender, System.EventArgs e)
    {

        if (txt_Error.Text != "")
        {
            Hashtable htorderkb = new Hashtable();
            DataTable dtorderkb = new System.Data.DataTable();

            string Uploadpath = "~/UserError/" + Order_Id + "/";
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
            HttpFileCollection uploads = HttpContext.Current.Request.Files;
            if (uploads != null)
            {
                string c = Path.GetFileName(fileupload3.PostedFile.FileName);
                string fileName = c;
                if (fileName != "")
                {

                    fileupload3.PostedFile.SaveAs(Server.MapPath(Uploadpath) + fileName);
                    ViewState["Path"] = Uploadpath.ToString() + fileName;

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
            htorderkb.Add("@Erorr_Name", txt_Error.Text);
            htorderkb.Add("@Error_Docuemnt_Path", path);
            htorderkb.Add("@Error_From", userid);
            htorderkb.Add("@Error_Sended_Date", date);
            htorderkb.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_Orders_Error", htorderkb);

            txt_Error.Text = "";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Your request has Sent to IT Team,We Will Response You Soon')</script>", false);
            //fileuploadError.FileName = null;
       
            
        }
        else
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Enter Error Name')</script>", false);
        }


    }
    protected void grd_Tax_County_Database_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grd_Tax_County_Database.EditIndex = e.NewEditIndex;
        Gridview_Bind_CountyDatabaseInformation();

    }

  
    protected void grd_Tax_County_Database_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int Taxid = Convert.ToInt32(grd_Tax_County_Database.DataKeys[e.RowIndex].Value.ToString());

        TextBox txt_Tax_Phno = (TextBox)grd_Tax_County_Database.Rows[e.RowIndex].FindControl("txt_County_Phno");
        TextBox txt_Tax_Make_Changes_Payble_To = (TextBox)grd_Tax_County_Database.Rows[e.RowIndex].FindControl("txt_Make_Changes_Payable_to");
        TextBox txt_Tax_Payee_Address = (TextBox)grd_Tax_County_Database.Rows[e.RowIndex].FindControl("txt_Payee_Address");
       // TextBox txt_County_Munciple_Name = (TextBox)grd_Tax_County_Database.Rows[e.RowIndex].FindControl("txt_County_Munciple_Name");



        Hashtable htupdaterec = new Hashtable();
        DataTable dtupdaterec = new System.Data.DataTable();
        DateTime date = new DateTime();
        date = DateTime.Now;
        string dateeval = date.ToString("dd/MM/yyyy");
        string time = date.ToString("hh:mm tt");

        htupdaterec.Add("@Trans", "UPDATE");
        htupdaterec.Add("@Conty_Database_Id", Taxid);
       // htupdaterec.Add("@Munciplene_Name", txt_County_Munciple_Name.Text);
        htupdaterec.Add("@Ph_No", txt_Tax_Phno.Text);
        htupdaterec.Add("@Make_Changes_Payable_to", txt_Tax_Make_Changes_Payble_To.Text);
        htupdaterec.Add("@Payee_Address", txt_Tax_Payee_Address.Text);
        htupdaterec.Add("@Modified_By", userid);
        htupdaterec.Add("@Modified_Date", date);
        htupdaterec.Add("@Status", "True");
        dtupdaterec = dataaccess.ExecuteSP("Sp_County_Tax_Data_Order_Wise", htupdaterec);


        grd_Tax_County_Database.EditIndex = -1;
        Gridview_Bind_CountyDatabaseInformation();


    }
    protected void grd_Tax_County_Database_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grd_Tax_County_Database.EditIndex = -1;
        Gridview_Bind_CountyDatabaseInformation();

    }
    protected void Tax_Type_Source_upload_RowDataBound(object sender, GridViewRowEventArgs e)
    {
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
                    imbtn_orderdoc.ImageUrl = "~/Admin/MsgImage/Download.png";

                }
                else if (lbl_order_kb_fileType.Text == ".xls" || lbl_order_kb_fileType.Text == ".xlsx")
                {

                    imbtn_orderdoc.ImageUrl = "~/Admin/MsgImage/Download.png";
                }
                else if (lbl_order_kb_fileType.Text == ".pdf")
                {

                    imbtn_orderdoc.ImageUrl = "~/Admin/MsgImage/Download.png";
                }
            }
            else
            {

                imbtn_orderdoc.Visible = false;
            }



        }



    }
   

    protected void Download_Tax_Type_Docuemnt(object sender, CommandEventArgs e)
     {
        //using (ZipFile zip = new ZipFile())
        //{
        //    int row=0;
        // //   string Taxtype_path="" ;
        //    if (e.CommandName == "Select")
        //    {
        //        row = int.Parse(e.CommandArgument.ToString());
        //    }
        //    GridViewRow row1 = Tax_Type_Source_upload.Rows[row];
        //    Label Taxtype_path = (Label)row1.FindControl("lblDocument_Path");
        //    string path = Taxtype_path.Text;
        //    //htsel.Add("@Trans", "SELECT_Taxtype");
        //    //htsel.Add("@Tax_Type_Id", Taxtype_id);
        //    //dtus = dataaccess.ExecuteSP("Sp_Tax_Type_Source_Upload", htsel);
        //    //string File_path="";
        //    //if (dtus.Rows.Count > 0)
        //    //{
        //    //    File_path = dtus.Rows[0][9].ToString();
        //    //}


        //    string fileName =Server.MapPath(path);
        //        string filePath = fileName;
        //        zip.AddFile(fileName, "files");
               

        //            Response.Clear();
        //            Response.BufferOutput = false;
        //            string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
        //            Response.ContentType = "application/zip";
        //            Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
        //            zip.Save(Response.OutputStream);
        //            Response.End();
                
        //}
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        // return;
    }

    protected void View_OrderDocuemnt(object sender, CommandEventArgs e)
    {
        Session["Doc_Type"] = ViewState["doc_type"].ToString();
        Session["Doc_Path"] = ViewState["doc_path"].ToString();
        string doc_path = ViewState["doc_path"].ToString();
        string samlpe = ViewState["doc_type"].ToString();
        //if (ViewState["doc_type"].ToString() == ".doc" || ViewState["doc_type"].ToString() == ".docx")
        //{
        //    scpm.WordorExcelToPdfConverter.ConvertWordToPdf(Server.MapPath(ViewState["doc_path"].ToString()), Server.MapPath("~/pdfs/CrystalReport.pdf"));
        //}
        //else if (ViewState["doc_type"].ToString() == ".xls" || ViewState["doc_type"].ToString() == ".xlsx")
        //{
        //    scpm.WordorExcelToPdfConverter.ConvertExcelToPdf(Server.MapPath(ViewState["doc_path"].ToString()), Server.MapPath("~/pdfs/CrystalReport.pdf"));
        //}

        // path = path + fileName;
      //  PdfView1();

        //using (ZipFile zip = new ZipFile())
        //{
          
        //            string fileName = doc_path;
        //            if (fileName != "")
        //            {
        //                string filePath = Server.MapPath(fileName);
        //                zip.AddFile(filePath, "files");
        //            }

        //            if (zip.Entries.Count != 0)
        //            {
        //                Response.Clear();
        //                Response.AddHeader("Content-Disposition", "attachment; filename=" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + ".zip");
        //                Response.ContentType = "application/zip";
        //                zip.Save(Response.OutputStream);
        //                Response.End();
        //            }
        //}
    

    }
    // Report Viwer


    protected void Check_TAx_Accesed_values()
    {

     

        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Tax_Asessed_Entry", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Assesed Value Not Entered Do You Want To Preview')</script>", false);

        }


    }
    
    protected void btn_Preview_Click(object sender, System.EventArgs e)
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
        RadPdfTableTruncate();
       // PdfView();

        Session["order_id"] = Order_Id.ToString();
       Response.Redirect("~/Gls/Gls_Tax_Report_Preview.aspx");
        model1.Hide();
     
      
    }
    protected void RadPdfTableTruncate()
    {
        Hashtable Ht = new Hashtable();
        DataTable dt = new DataTable();
        Ht.Add("@Trans", "TruncateRad");
        dt = dataaccess.ExecuteSP("Sb_Rad_Pdf_Truncate", Ht);

    }

    protected void PdfView()
    {
        //byte[] pdfData = System.IO.File.ReadAllBytes(Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.pdf"));
   
        //PdfWebControl1.CreateDocument("Document Name", pdfData);
        //PdfDocumentEditor DocumentEditor1 =
        //    this.PdfWebControl1.EditDocument();
        //PdfWebControl1.HideToolsMenu = true;
        //PdfWebControl1.HideSideBar = true;
        //PdfWebControl1.HideObjectPropertiesBar = true;
        //PdfWebControl1.HideThumbnails = true;
    }
    protected void PdfView1()
    {
        //byte[] pdfData = System.IO.File.ReadAllBytes(Server.MapPath("~/pdfs/CrystalReport.pdf"));
        //this.PdfWebControl1.CreateDocument("Document Name", pdfData);
        //PdfDocumentEditor DocumentEditor1 =
        //    this.PdfWebControl1.EditDocument();
        //PdfWebControl1.HideToolsMenu = true;
        //PdfWebControl1.HideSideBar = true;
        //PdfWebControl1.HideObjectPropertiesBar = true;
        //PdfWebControl1.HideThumbnails = true;
    }
    protected void btn_Complete_Click(object sender, System.EventArgs e)
    {

        if (Order_Type == "Web/Call" || Order_Type == "Mail/Fax")
        {
            model1.Show();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            Hashtable htupdate = new Hashtable();
            DataTable dtupdate = new System.Data.DataTable();
            htupdate.Add("@Trans", "UPDATE_STATUS");
            htupdate.Add("@Order_ID", Order_Id);
            htupdate.Add("@Order_Status", 5);
            htupdate.Add("@Modified_By", userid);
            htupdate.Add("@Modified_Date", dateeval);
            dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);


         


            System.Data.Common.DbConnectionStringBuilder builder = new System.Data.Common.DbConnectionStringBuilder();
            builder.ConnectionString = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
            string server = builder["Data Source"] as string;
            string database = builder["Initial Catalog"] as string;
            string UserID = builder["User ID"] as string;
            string password = builder["Password"] as string;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Completed Sucessfully')</script>", false);
           model1.Hide();
        }
        else if (Order_Type == "QC")
        {

            model1.Show();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");
            Hashtable htupdate = new Hashtable();
            DataTable dtupdate = new System.Data.DataTable();
            htupdate.Add("@Trans", "UPDATE_STATUS");
            htupdate.Add("@Order_ID", Order_Id);
            htupdate.Add("@Order_Status", 6);
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

            rptDoc.SetParameterValue("@Order_ID", Order_Id,"Notes");
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


            CrystalReportViewer1.ReportSource = rptDoc;
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
           model1.Hide();
       

        }

    }
    protected void btn_Update_Click(object sender, System.EventArgs e)
    {
        model1.Show();

        Hashtable htupdaterec = new Hashtable();
        DataTable dtupdaterec = new System.Data.DataTable();
        DateTime date = new DateTime();
        date = DateTime.Now;
        string dateeval = date.ToString("dd/MM/yyyy");
        string time = date.ToString("hh:mm tt");
        int barrowercounty, barrowerstate;
        if (ddl_Barrower_County.SelectedValue == "SELECT" || ddl_Barrower_County.SelectedValue == "")
        {

            barrowercounty = 0;

        }
        else
        {

            barrowercounty = int.Parse(ddl_Barrower_County.SelectedValue);
        }
        if (ddl_Barrower_State.SelectedValue == "SELECT") { barrowerstate = 0; } else { barrowerstate = int.Parse(ddl_Barrower_State.SelectedValue); }

       
        htupdaterec.Add("@Trans", "UPDATE");
        htupdaterec.Add("@Order_Id", Order_Id);
        htupdaterec.Add("@Loan_Number", txt_Loan_Number.Text);
        htupdaterec.Add("@Borrower_Name", txt_Barrower_Name.Text);
        htupdaterec.Add("@Last_Name",txt_Barrower_Name.Text);
        htupdaterec.Add("@Barrower_Address", txt_Barrower_Address.Text);
        htupdaterec.Add("@Barrower_County", barrowercounty);
        htupdaterec.Add("@Barrower_City", txt_Barrower_City.Text);
        htupdaterec.Add("@Barrower_Zip", txt_Barrower_Zip.Text);
        htupdaterec.Add("@Barrower_State", barrowerstate);
        //htupdaterec.Add("@Comments", txt_Tax_Comments.Text);
        htupdaterec.Add("@Parecel_Id",txt_Parcel_Number.Text);
        htupdaterec.Add("@ETA_Date", txt_ETA_date.Text);
        htupdaterec.Add("@Modified_By", userid);
        htupdaterec.Add("@Modified_Date", date);
        htupdaterec.Add("@Status", "True");
        dtupdaterec = dataaccess.ExecuteSP("Sp_Client_Gls_Order_Info_Update", htupdaterec);

        Get_Order_Details();
       model1.Hide();

    }
    protected void txt_Tax_Comments_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
      
    }
   
   
    protected void txt_Client_Zip_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
        txt_Barrower_Name.Focus();
    }
    protected void txt_Barrower_Name_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
        txt_Barrower_Address.Focus();
    }
    protected void txt_Barrower_Address_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
        txt_Barrower_City.Focus();
    }
    protected void txt_Barrower_City_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
        txt_Barrower_Zip.Focus();
    }
    protected void txt_Barrower_Zip_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
        txt_Date.Focus();
    }
    protected void txt_Order_Comments_TextChanged(object sender, EventArgs e)
    {
        Insert_OrderComments(sender, e);
        //txt_Tax_Comments.Focus();
    }
    protected void txt_Barrower_Last_Name_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);

    }
    protected void txt_Parcel_Number_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);

    }

    protected void txt_ETA_date_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);
    }

    //Notes and Comments

    protected void Insert_OrderNotes(object sender, EventArgs e)
    {

        if (txt_Order_Notes.Text != "")
        {
            model1.Show();
            Hashtable htnotes = new Hashtable();
            DataTable dtnotes = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htnotes.Add("@Trans", "INSERT");
            htnotes.Add("@Order_Id", Order_Id);
            htnotes.Add("@Note", txt_Order_Notes.Text);
            htnotes.Add("@Inserted_By", userid);
            htnotes.Add("@Inserted_date", date);
            htnotes.Add("@Modified_By", userid);
            htnotes.Add("@Modified_Date", date);
            htnotes.Add("@status", "True");
            dtnotes = dataaccess.ExecuteSP("Sp_Order_Notes", htnotes);
            txt_Order_Notes.Text="";
            Geydview_Bind_Notes();
            model1.Hide();
        }
    }
    protected void Geydview_Bind_Notes()
    {

        Hashtable htNotes = new Hashtable();
        DataTable dtNotes = new System.Data.DataTable();

        htNotes.Add("@Trans", "SELECT");
        htNotes.Add("@Order_Id", Order_Id);
        dtNotes = dataaccess.ExecuteSP("Sp_Order_Notes", htNotes);
        if (dtNotes.Rows.Count > 0)
        {
            //ex2.Visible = true;
            //Grid_Notes.Visible = true;
            //Grid_Notes.DataSource = dtNotes;
            //Grid_Notes.DataBind();

        }
        else
        {
            dtNotes.Rows.Add(dtNotes.NewRow());
            //Grid_Notes.DataSource = dtNotes;
            //Grid_Notes.DataBind();
            //int columncount = gvTaxDetails.Rows[0].Cells.Count;
            //Grid_Notes.Rows[0].Cells.Clear();
            //Grid_Notes.Rows[0].Cells.Add(new TableCell());
            //Grid_Notes.Rows[0].Cells[0].ColumnSpan = columncount;



        }


    }


    protected void txt_Order_Notes_TextChanged(object sender, EventArgs e)
    {
        Insert_OrderNotes(sender, e);
        
    }


    protected void Insert_OrderComments(object sender, EventArgs e)
    {

        if (txt_Order_Comments.Text != "")
        {
            model1.Show();
            Hashtable htComments = new Hashtable();
            DataTable dtComments = new System.Data.DataTable();

            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            string time = date.ToString("hh:mm tt");

            htComments.Add("@Trans", "INSERT");
            htComments.Add("@Order_Id", Order_Id);
            htComments.Add("@Comment", txt_Order_Comments.Text);
            htComments.Add("@Inserted_By", userid);
            htComments.Add("@Inserted_date", date);
            htComments.Add("@Modified_By", userid);
            htComments.Add("@Modified_Date", date);
            htComments.Add("@status", "True");
            dtComments = dataaccess.ExecuteSP("Sp_Order_Comments", htComments);

            Geydview_Bind_Comments();
            txt_Order_Comments.Text = "";
            model1.Hide();
        }
    }
    protected void Geydview_Bind_Comments()
    {

        Hashtable htComments = new Hashtable();
        DataTable dtComments = new System.Data.DataTable();

        htComments.Add("@Trans", "SELECT");
        htComments.Add("@Order_Id", Order_Id);
        dtComments = dataaccess.ExecuteSP("Sp_Order_Comments", htComments);
        if (dtComments.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Grid_Comments.Visible = true;
            Grid_Comments.DataSource = dtComments;
            Grid_Comments.DataBind();

        }
        else
        {
            dtComments.Rows.Add(dtComments.NewRow());
            Grid_Comments.DataSource = dtComments;
            Grid_Comments.DataBind();
            int columncount = gvTaxDetails.Rows[0].Cells.Count;
            Grid_Comments.Rows[0].Cells.Clear();
            Grid_Comments.Rows[0].Cells.Add(new TableCell());
            Grid_Comments.Rows[0].Cells[0].ColumnSpan = columncount;



        }


    }



    protected void Imbtn_Add_Deliquent_Click(object sender, ImageClickEventArgs e)
    {
        //ModalPopupDelquent.Show();

    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //}
    //protected void btn_Send_Error_Click(object sender, EventArgs e)
    //{
    //    txt_Error.Text = "";
    //    ModalPopupError.Show();
     

    //}
    //protected void Btn_Error_Cancel_Click(object sender, EventArgs e)
    //{
    //    ModalPopupError.Hide();
    //}

    //Tax Deliquent County Information
    protected void imgbtn_Delequent_Tax_Add_Click(object sender, ImageClickEventArgs e)
    {
       
        if (imgbtn_Delequent_Tax_Add.AlternateText == "Add")
        {
            model1.Show();
            Hashtable htcountydata = new Hashtable();
            DataTable dtcountydata = new System.Data.DataTable();
            DateTime datecounty = new DateTime();
            datecounty = DateTime.Now;

            htcountydata.Add("@Trans", "INSERT");
            htcountydata.Add("@Order_Id", Order_Id);
            htcountydata.Add("@Tax_Type_Id", int.Parse(ddl_Tax_Delquent_Tax_type.SelectedValue.ToString()));
            htcountydata.Add("@Ph_No",txt_delequent_phno.Text);
            htcountydata.Add("@Make_Changes_Payable_to",txt_Delequent_Make_Changes.Text);
            htcountydata.Add("@Payee_Address",txt_Delequent_Payee_addres.Text);
            htcountydata.Add("@Inserted_By", userid);
            htcountydata.Add("@Inserted_date", datecounty);
            htcountydata.Add("@Status", "True");
            dtcountydata = dataaccess.ExecuteSP("Sp_Deliquent_County_Tax_Data_Order_Wise", htcountydata);

            Gridview_Bind_Order_Deliquent_Data();
            ClearDeliquent();
           model1.Hide();
        }
        else if (imgbtn_Delequent_Tax_Add.AlternateText == "Update")
        {
            model1.Show();
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
            dtcountydata = dataaccess.ExecuteSP("Sp_Deliquent_County_Tax_Data_Order_Wise", htcountydata);
            imgbtn_Delequent_Tax_Add.ImageUrl = "~/images/Gridview/Add.png";
       
            imgbtn_Delequent_Tax_Add.AlternateText = "Add";
            Gridview_Bind_Order_Deliquent_Data();
           
            ClearDeliquent();
            model1.Hide();
        }


    }
    protected void Grid_Delequent_Data_SelectedIndexChanged(object sender, EventArgs e)
    {
    
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


        imgbtn_Delequent_Tax_Add.ImageUrl = "~/images/Gridview/Save.png";

        imgbtn_Delequent_Tax_Add.AlternateText = "Update";

       
    }
    protected void ClearDeliquent()
    {

        ddl_Tax_Delquent_Tax_type.SelectedIndex = 0;
        txt_Delequent_Make_Changes.Text = "";
        txt_Delequent_Payee_addres.Text = "";
        txt_delequent_phno.Text="";


    }
    protected void Gridview_Bind_Order_Deliquent_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id",Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Deliquent_County_Tax_Data_Order_Wise", htselorderkb);
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
    protected void Grid_Delequent_Data_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        //delete tax entry 
        int Delequent_Database_Id = Convert.ToInt32(Grid_Delequent_Data.DataKeys[e.RowIndex].Values["Delequent_Database_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Delequent_Database_Id", Delequent_Database_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Deliquent_County_Tax_Data_Order_Wise", htdelete);
        Gridview_Bind_Order_Deliquent_Data();
        //delete tax county info
     
        model1.Hide();

    }


    protected void ddl_Tax_Discount_SelectedIndexChangedE(object sender, EventArgs e)
    {
        DropDownList chkTest = (DropDownList)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
        DropDownList ddl_Discount = (DropDownList)grdRow.FindControl("ddl_Discount");

        TextBox txt_Tax_Discount_Amount = (TextBox)grdRow.FindControl("txt_Tax_Discount_Amount");
        TextBox txt_Tax_Discount_Date = (TextBox)grdRow.FindControl("txt_Tax_Discount_Date");

        if (ddl_Discount.SelectedValue == "N")
        {
            txt_Tax_Discount_Amount.Text = "";
            txt_Tax_Discount_Date.Text = "";
            txt_Tax_Discount_Amount.Enabled = false;
            txt_Tax_Discount_Date.Enabled = false;
        }

        if (ddl_Discount.SelectedValue == "Y")
        {
           
            txt_Tax_Discount_Amount.Enabled = true;
            txt_Tax_Discount_Date.Enabled = true;
        }
    }


    protected void ddl_Tax_Status_Entry_SelectedIndexChangedF(object sender, EventArgs e)
    {
        DropDownList chkTest = (DropDownList)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
        DropDownList ddl_Discount_Entry = (DropDownList)grdRow.FindControl("ddl_Discount_Entry");
        TextBox txt_Tax_Discount_Amount_Amount_Entry = (TextBox)grdRow.FindControl("txt_Tax_Discount_Amount_Amount_Entry");
        TextBox txt_Tax_Entry_Discount_Date = (TextBox)grdRow.FindControl("txt_Tax_Entry_Discount_Date");

        if (ddl_Discount_Entry.SelectedValue == "N")
        {
            txt_Tax_Discount_Amount_Amount_Entry.Text = "";
            txt_Tax_Entry_Discount_Date.Text = "";
            txt_Tax_Discount_Amount_Amount_Entry.Enabled = false;
            txt_Tax_Entry_Discount_Date.Enabled = false;

        }

        if (ddl_Discount_Entry.SelectedValue == "Y")
        {
            txt_Tax_Discount_Amount_Amount_Entry.Enabled = true;
            txt_Tax_Entry_Discount_Date.Enabled = true;
        }



    }
    protected void ddl_Tax_Status_SelectedIndexChanged(object sender, EventArgs e)
    {

        Text_Enable_Based_OnTax_Edit( sender,e);

    }
    protected void   ddl_Tax_Status_Entry_SelectedIndexChanged(object sender, EventArgs e)
    {

        Text_Enable_Based_OnTax_Entry(sender, e);

    }
    protected void Text_Enable_Based_OnTax_Edit(object sender, EventArgs e)
    {
        DropDownList chkTest = (DropDownList)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
         DropDownList ddl_Tax_Status = (DropDownList)grdRow.FindControl("ddl_Tax_Status");

         TextBox txt_Tax_Paid_Amount = (TextBox)grdRow.FindControl("txt_Tax_Paid_Amount");
        TextBox txt_Tax_Payoff_Amount = (TextBox)grdRow.FindControl("txt_Tax_Payoff_Amount");
        TextBox txt_Tax_Good_thrudate = (TextBox)grdRow.FindControl("txt_Tax_Good_Through_Date");
        TextBox txt_Tax_Due_Amount = (TextBox)grdRow.FindControl("txt_Tax_Due_Amount");
        TextBox txt_Tax_Due_Date = (TextBox)grdRow.FindControl("txt_Tax_Due_Date");

        TextBox txt_Tax_Paid_date = (TextBox)grdRow.FindControl("txt_Tax_Paid_Date");
        if (ddl_Tax_Status.SelectedValue != "" && ddl_Tax_Status.SelectedValue != "0")
        {

            Status_Id = int.Parse(ddl_Tax_Status.SelectedValue.ToString());


        }
       
        if (Status_Id == 1)
        {


            
            txt_Tax_Payoff_Amount.Enabled = false;
            txt_Tax_Good_thrudate.Enabled = false;
            txt_Tax_Due_Amount.Enabled = false;
     


            txt_Tax_Paid_Amount.Enabled = true;
            txt_Tax_Paid_date.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;
            txt_Tax_Payoff_Amount.Text= "";
            txt_Tax_Good_thrudate.Text = "";
            txt_Tax_Due_Amount.Text = "";
            txt_Tax_Due_Date.Text = "";





        }
        else if (Status_Id == 4)
        {

            
            txt_Tax_Paid_Amount.Enabled = false;
            txt_Tax_Paid_date.Enabled = false;


            txt_Tax_Good_thrudate.Enabled = true;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;
            txt_Tax_Payoff_Amount.Enabled = true;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;

            txt_Tax_Paid_Amount.Text = "";
            txt_Tax_Paid_date.Text = "";

        }
        else if (Status_Id == 2)
        {
           
            txt_Tax_Paid_Amount.Enabled = false;
            txt_Tax_Paid_date.Enabled = false;

            txt_Tax_Good_thrudate.Enabled = true;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;
            txt_Tax_Payoff_Amount.Enabled = true;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;
            txt_Tax_Paid_Amount.Text = "";
            txt_Tax_Paid_date.Text = "";

        }
        else if (Status_Id == 3)
        {


           
            txt_Tax_Paid_Amount.Enabled = false;
            txt_Tax_Paid_date.Enabled = false;


            txt_Tax_Good_thrudate.Enabled = false;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;
            txt_Tax_Payoff_Amount.Enabled = false;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;

            txt_Tax_Good_thrudate.Text = "";
            txt_Tax_Payoff_Amount.Text = "";
            txt_Tax_Paid_Amount.Text = "";
            txt_Tax_Paid_date.Text = "";

        }
        else
        {
            
            txt_Tax_Paid_Amount.Enabled = true;
            txt_Tax_Paid_date.Enabled = true;


            txt_Tax_Good_thrudate.Enabled = true;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;
            txt_Tax_Payoff_Amount.Enabled = true;
            //txt_Tax_Due_Amount.Enabled = true;
            txt_Tax_Due_Date.Enabled = true;


        }

    }
    protected void Text_Enable_Based_OnTax_Entry(object sender, EventArgs e)
    {
        DropDownList chkTest = (DropDownList)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
       // DropDownList ddl_Tax_Status = (DropDownList)grdRow.FindControl("ddl_Tax_Status");
        DropDownList ddl_Tax_Status_Entry = (DropDownList)grdRow.FindControl("ddl_Tax_Status_Entry");
        TextBox txt_Tax_Paid_Amount = (TextBox)grdRow.FindControl("txt_Tax_Paid_Amount_Amount_Entry");
        TextBox txt_Tax_Payoff_Amount = (TextBox)grdRow.FindControl("txt_Tax_Payoff_Amount_Amount_Entry");
        TextBox txt_Tax_Good_thrudate = (TextBox)grdRow.FindControl("txt_Tax_Entry_Good_Through_Date");
        TextBox txt_Tax_Due_Amount = (TextBox)grdRow.FindControl("txt_Tax_Due_Amount_Amount_Entry");
        TextBox txt_Tax_Due_Date = (TextBox)grdRow.FindControl("txt_Tax_Due_Date_Entry");

        TextBox txt_Tax_Paid_date = (TextBox)grdRow.FindControl("txt_Tax_Entry_Paid_Date");
        //if (ddl_Tax_Status.SelectedValue != "" && ddl_Tax_Status.SelectedValue != "0")
        //{

        //    Status_Id = int.Parse(ddl_Tax_Status.SelectedValue.ToString());


        //}
         if (ddl_Tax_Status_Entry.SelectedValue != "" && ddl_Tax_Status_Entry.SelectedValue != "0")
        {
            Status_Id = int.Parse(ddl_Tax_Status_Entry.SelectedValue.ToString());
        }
         if (Status_Id == 1)
         {


 
             txt_Tax_Payoff_Amount.Enabled = false;
             txt_Tax_Good_thrudate.Enabled = false;
            // txt_Tax_Due_Amount.Enabled = false;
           

             txt_Tax_Paid_Amount.Enabled = true;
             txt_Tax_Paid_date.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;

             txt_Tax_Payoff_Amount.Text = "";
             txt_Tax_Good_thrudate.Text = "";
         //    txt_Tax_Due_Amount.Text = "";
            // txt_Tax_Due_Date.Text = "";





         }
         else if (Status_Id == 4)
         {

   
             txt_Tax_Paid_Amount.Enabled = false;
             txt_Tax_Paid_date.Enabled = false;


             txt_Tax_Good_thrudate.Enabled = true;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;
             txt_Tax_Payoff_Amount.Enabled = true;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;

             txt_Tax_Paid_Amount.Text = "";
             txt_Tax_Paid_date.Text = "";

         }
         else if (Status_Id == 2)
         {
            

             txt_Tax_Paid_Amount.Enabled = false;
             txt_Tax_Paid_date.Enabled = false;

             txt_Tax_Good_thrudate.Enabled = true;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;
             txt_Tax_Payoff_Amount.Enabled = true;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;
             txt_Tax_Paid_Amount.Text = "";
             txt_Tax_Paid_date.Text = "";

         }
         else if (Status_Id == 3)
         {


           
             txt_Tax_Paid_Amount.Enabled = false;
             txt_Tax_Paid_date.Enabled = false;


             txt_Tax_Good_thrudate.Enabled = false;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;
             txt_Tax_Payoff_Amount.Enabled = false;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;

             txt_Tax_Good_thrudate.Text = "";
             txt_Tax_Payoff_Amount.Text = "";
             txt_Tax_Paid_Amount.Text = "";
             txt_Tax_Paid_date.Text = "";

         }
         else
         {
            
             txt_Tax_Paid_Amount.Enabled = true;
             txt_Tax_Paid_date.Enabled = true;


             txt_Tax_Good_thrudate.Enabled = true;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;
             txt_Tax_Payoff_Amount.Enabled = true;
             //txt_Tax_Due_Amount.Enabled = true;
             txt_Tax_Due_Date.Enabled = true;


         }

    }
 
   


    protected void grd_Assesed_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_Assessed_Id = int.Parse(grd_Assesed.DataKeys[e.RowIndex].Values["Tax_Assessed_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Assessed_Id", Tax_Assessed_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Tax_Asessed_Entry", htdelete);
        Gridview_Bind_TaxAcseesd_Data();
    }

    //============================================Tax Sold Data Entry======================
    protected void btn_Add_Tax_Sale_Click(object sender, EventArgs e)
    {
         model1.Show();
        if (btn_Add_Tax_Sale.Text == "Add Tax Sale")
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

                    
                } else
                {
                    sold_Tax_AMount = 0;

                }
             
                


                htinsertrec.Add("@Trans", "INSERT");
                htinsertrec.Add("@Order_Id", Order_Id);
                htinsertrec.Add("@Taxes_Sold", ddl_Tax_Sold.SelectedItem.ToString());
                htinsertrec.Add("@Tax_Sold_Date", txt_Sold_Date.Text);
                htinsertrec.Add("@Next_Critical_Date",txt_Next_Critical_date.Text);
                htinsertrec.Add("@Next_Critical_Action", txt_Next_Critical_Action.Text);
                htinsertrec.Add("@Sold_Tax_Amount", sold_Tax_AMount);
                htinsertrec.Add("@Redemption_Good_Through_Date",txt_Redemption_Good_Through_Date.Text);
                htinsertrec.Add("@Last_Redemption", txt_Last_Redemption_Date.Text);
                htinsertrec.Add("@Comments", txt_Tax_Sale_Comments.Text);
                htinsertrec.Add("@Inserted_By", userid);
                htinsertrec.Add("@Instered_Date", date);
                htinsertrec.Add("@Status", "True");

                dtinsertrec = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Sales_Entry", htinsertrec);

                Gridview_bind_Tax_Sold_Data();
                ClearTax_Sold();
                model1.Hide();
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

            dtinsertrec = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Sales_Entry", htinsertrec);

            Gridview_bind_Tax_Sold_Data();
            ClearTax_Sold();
            model1.Hide();
        }
       
    }
    protected void ClearTax_Sold()
    {

        ddl_Tax_Sold.SelectedIndex = 0;
        txt_Next_Critical_Action.Text = "";
        txt_Sold_Date.Text = "";
        txt_sold_Tax_AMount.Text = "";
        txt_Next_Critical_date.Text = "";
        txt_Next_Critical_Action.Text = "";
        txt_Redemption_Good_Through_Date.Text = "";
        txt_Last_Redemption_Date.Text = "";
        txt_Tax_Sale_Comments.Text = "";
       
        
        
        


    }
    protected void Gridview_bind_Tax_Sold_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Sales_Entry", htselorderkb);
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
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
      
        dbc.BindTax_Sales_Master(ddl_Tax_Sold);
        ClearTax_Sold();
        ModalPopupExtend_Tax_Sales.Show();
        

    }
    protected void btn_Tax_Sale_cancel_Click(object sender, EventArgs e)
    {
        ModalPopupExtend_Tax_Sales.Hide();
    }
    protected void grd_Tax_Sold_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        GridViewRow row = grd_Tax_Sold.SelectedRow;
        Label lblTax_Sale_Id = (Label)row.FindControl("lblTax_Sale_Id");
        int Tax_Sale_Id = Convert.ToInt32(lblTax_Sale_Id.Text);

        ViewState["Tax_Sale_Id"] = Tax_Sale_Id;
       // txt_Tax_Parcel_Number.Text = txt_Parcel_Number.Text;

        LinkButton lblTax_Sold = (LinkButton)row.FindControl("lblTax_Sold");
        Label lblSold_Date = (Label)row.FindControl("lblSold_Date");
        Label lbl_Next_Critical_Date = (Label)row.FindControl("lbl_Next_Critical_Date");
        Label lblNext_Critical_Action = (Label)row.FindControl("lblNext_Critical_Action");
        Label lblSold_TaxAmt = (Label)row.FindControl("lblSold_TaxAmt");
        Label lblRedemption_Good_Thru_Date = (Label)row.FindControl("lblRedemption_Good_Thru_Date");
        Label lblLast_Redemption_Loss_Date = (Label)row.FindControl("lblLast_Redemption_Loss_Date");
        Label lblTax_Sale_Comments = (Label)row.FindControl("lblTax_Sale_Comments");

        ModalPopupExtend_Tax_Sales.Show();

        if (ddl_Tax_Sold.Items.FindByText(lblTax_Sold.Text).Value != null)
        {

            ddl_Tax_Sold.Items.FindByText(lblTax_Sold.Text).Selected = true;
        }
        txt_Sold_Date.Text = lblSold_Date.Text;
        txt_Next_Critical_date.Text = lbl_Next_Critical_Date.Text;
        txt_Next_Critical_Action.Text = lblNext_Critical_Action.Text;
        txt_Next_Critical_Action.Text = lblNext_Critical_Action.Text;
        txt_Last_Redemption_Date.Text = lblLast_Redemption_Loss_Date.Text;
        txt_Redemption_Good_Through_Date.Text = lblRedemption_Good_Thru_Date.Text;
        txt_sold_Tax_AMount.Text = lblSold_TaxAmt.Text;
        txt_Tax_Sale_Comments.Text = lblTax_Sale_Comments.Text;
        


        btn_Add_Tax_Sale.Text = "Update";
    }

    
    protected void lnkTaxSalebtn_CLick(object sender, EventArgs e)
    {
        ModalPopupExtend_Tax_Sales.Show();
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
      //  GridViewRow row = grd_Tax_Sold.SelectedRow;
        Label lblTax_Sale_Id = (Label)row.FindControl("lblTax_Sale_Id");
        int Tax_Sale_Id = Convert.ToInt32(lblTax_Sale_Id.Text);

        ViewState["Tax_Sale_Id"] = Tax_Sale_Id;
      //  txt_Tax_Parcel_Number.Text = txt_Parcel_Number.Text;

        LinkButton lblTax_Sold = (LinkButton)row.FindControl("lblTax_Sold");
        Label lblSold_Date = (Label)row.FindControl("lblSold_Date");
        Label lbl_Next_Critical_Date = (Label)row.FindControl("lbl_Next_Critical_Date");
        Label lblNext_Critical_Action = (Label)row.FindControl("lblNext_Critical_Action");
        Label lblSold_TaxAmt = (Label)row.FindControl("lblSold_TaxAmt");
        Label lblRedemption_Good_Thru_Date = (Label)row.FindControl("lblRedemption_Good_Thru_Date");
        Label lblLast_Redemption_Loss_Date = (Label)row.FindControl("lblLast_Redemption_Loss_Date");

        dbc.BindTax_Sales_Master(ddl_Tax_Sold);
       // ModalPopupExtend_Tax_Sales.Show();

        if (ddl_Tax_Sold.Items.FindByText(lblTax_Sold.Text).Value != null)
        {

            ddl_Tax_Sold.Items.FindByText(lblTax_Sold.Text).Selected = true;
        }
        else
        {
            ddl_Tax_Sold.SelectedValue = "SELECT";

        }
        txt_Sold_Date.Text = lblSold_Date.Text;
        txt_Next_Critical_date.Text = lbl_Next_Critical_Date.Text;
        txt_Next_Critical_Action.Text = lblNext_Critical_Action.Text;
        txt_Next_Critical_Action.Text = lblNext_Critical_Action.Text;
        txt_Last_Redemption_Date.Text = lblLast_Redemption_Loss_Date.Text;
        txt_Redemption_Good_Through_Date.Text = lblRedemption_Good_Thru_Date.Text;
        txt_sold_Tax_AMount.Text = lblSold_TaxAmt.Text;


        btn_Add_Tax_Sale.Text = "Update";

    }
    protected void grd_Tax_Sold_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Tax_Sale_Id = int.Parse(grd_Tax_Sold.DataKeys[e.RowIndex].Values["Tax_Sale_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Tax_Sale_Id", Tax_Sale_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Tax_Sales_Entry", htdelete);
        Gridview_bind_Tax_Sold_Data();
    }
    //====================================Tax Munciple Data Entry
    protected void imgbtn_Munciple_Add_Click(object sender, ImageClickEventArgs e)
    {
        if (txt_Munciplene_Amount.Text != "")
        {

            Munciplene_Amount = Convert.ToDecimal(txt_Munciplene_Amount.Text);
        }
        else
        {

            Munciplene_Amount = 0;
        }


        if (imgbtn_Munciple_Add.AlternateText == "Add")
            {
                Hashtable htmunciple = new Hashtable();
                DataTable dtorderkb = new System.Data.DataTable();


                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                htmunciple.Add("@Trans", "INSERT");
                htmunciple.Add("@Order_Id", Order_Id);
                htmunciple.Add("@Tax_Type", ddl_Munciplene_Tax_Type.SelectedValue);
                htmunciple.Add("@Tax_Year", ddl_Munciplene_Tax_Year.SelectedValue);
                htmunciple.Add("@Tax_Status", ddl_Munciplene_Tax_Status.SelectedValue);
                htmunciple.Add("@Tax_Amount", Munciplene_Amount);
                htmunciple.Add("@Inserted_By", userid);
                htmunciple.Add("@Instered_Date", date);
                htmunciple.Add("@Modified_By", userid);
                htmunciple.Add("@Modified_Date", date);
                htmunciple.Add("@status", "True");
                dtorderkb = dataaccess.ExecuteSP("Sp_Client_GLS_Orders_Munciple_Entry", htmunciple);
                Gridview_bind_Munciple_Tax_Data();

                ClearMunciple();

            }
        else if (imgbtn_Munciple_Add.AlternateText == "Update")
            {

                Hashtable htmunciple = new Hashtable();
                DataTable dtorderkb = new System.Data.DataTable();

                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                htmunciple.Add("@Trans", "UPDATE");
                htmunciple.Add("@Munciplene_Id ", ViewState["Munciplene_Id"]);
                htmunciple.Add("@Order_Id", Order_Id);
                htmunciple.Add("@Tax_Type", ddl_Munciplene_Tax_Type.SelectedValue);
                htmunciple.Add("@Tax_Year", ddl_Munciplene_Tax_Year.SelectedValue);
                htmunciple.Add("@Tax_Status", ddl_Munciplene_Tax_Status.SelectedValue);
                htmunciple.Add("@Tax_Amount", Munciplene_Amount);
                htmunciple.Add("@Modified_By", userid);
                htmunciple.Add("@Modified_Date", date);
                htmunciple.Add("@status", "True");
                dtorderkb = dataaccess.ExecuteSP("Sp_Client_GLS_Orders_Munciple_Entry", htmunciple);
                imgbtn_Assesd_Add.ImageUrl = "~/images/Gridview/Add.png";
                imgbtn_Assesd_Add.AlternateText = "Add";
                ClearMunciple();
                Gridview_bind_Munciple_Tax_Data();
            }

        
       




    }

    protected void Gridview_bind_Munciple_Tax_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_Client_GLS_Orders_Munciple_Entry", htselorderkb);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            Grid_Munciplene_Tax.Visible = true;
            Grid_Munciplene_Tax.DataSource = dtuser;
            Grid_Munciplene_Tax.DataBind();

        }
        else
        {

            Grid_Munciplene_Tax.DataSource = null;
            Grid_Munciplene_Tax.EmptyDataText = "No Records Are Avilable";
            Grid_Munciplene_Tax.DataBind();

        }

    }

    protected void ClearMunciple()
    {

        txt_Munciplene_Amount.Text = "";


    }


  


    protected void Grid_Munciplene_Tax_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        GridViewRow row = Grid_Munciplene_Tax.SelectedRow;
        Label lblMunciplene_Id = (Label)row.FindControl("lblMunciplene_Id");
        int Munciplene_Id = Convert.ToInt32(lblMunciplene_Id.Text);

        ViewState["Munciplene_Id"] = Munciplene_Id;
    


        Label lblTax_Type = (Label)row.FindControl("lblTax_Type");
        Label lblTax_Status = (Label)row.FindControl("lblTax_Status");
        Label lbl_Tax_Amount = (Label)row.FindControl("lbl_Tax_Amount");
        Label lblTax_Year = (Label)row.FindControl("lblTax_Year");
      
    
        dbc.BindTax_Type(ddl_Munciplene_Tax_Type);

        if (ddl_Munciplene_Tax_Type.Items.FindByText(lblTax_Type.Text).Value != null)
        {

            ddl_Munciplene_Tax_Type.Items.FindByText(lblTax_Type.Text).Selected = true;
        }
        dbc.BindTax_Year(ddl_Munciplene_Tax_Year);
        if (ddl_Munciplene_Tax_Year.Items.FindByText(lblTax_Year.Text).Value != null)
        {

            ddl_Munciplene_Tax_Year.Items.FindByText(lblTax_Year.Text).Selected = true;
        }
        dbc.BindTax_Status(ddl_Munciplene_Tax_Status);
        if (ddl_Munciplene_Tax_Status.Items.FindByText(lblTax_Status.Text).Value != null)
        {

            ddl_Munciplene_Tax_Status.Items.FindByText(lblTax_Status.Text).Selected = true;
        }
        txt_Munciplene_Amount.Text = lbl_Tax_Amount.Text;


        imgbtn_Munciple_Add.ImageUrl = "~/images/Gridview/Save.png";

       

        imgbtn_Munciple_Add.AlternateText = "Update";

    }
    protected void Grid_Munciplene_Tax_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Munciplene_Id = int.Parse(Grid_Munciplene_Tax.DataKeys[e.RowIndex].Values["Munciplene_Id"].ToString());

        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Munciplene_Id ", Munciplene_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_Client_GLS_Orders_Munciple_Entry", htdelete);
        Gridview_bind_Munciple_Tax_Data();
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
    protected void Imgbtn_Brancrupty_Click(object sender, ImageClickEventArgs e)
    {


        if (Imgbtn_Brancrupty.AlternateText == "Add")
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
            htmunciple.Add("@Comments",txt_Bankcrupt_Comments.Text);
            htmunciple.Add("@Inserted_By", userid);
            htmunciple.Add("@Instered_Date", date);
            htmunciple.Add("@Modified_By", userid);
            htmunciple.Add("@Modified_Date", date);
            htmunciple.Add("@status", "True");
            dtorderkb = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Bankrupt_Entry", htmunciple);
            Gridview_bind_Bankrupty_Tax_Data();

            Clearbankrupt();

        }
        else if (Imgbtn_Brancrupty.AlternateText == "Update")
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
            dtorderkb = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Bankrupt_Entry", htmunciple);
            Imgbtn_Brancrupty.ImageUrl = "~/images/Gridview/Add.png";
            Imgbtn_Brancrupty.AlternateText = "Add";
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
    protected void Gridview_bind_Bankrupty_Tax_Data()
    {
        Hashtable htselorderkb = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();

        htselorderkb.Add("@Trans", "SELECT");
        htselorderkb.Add("@Order_Id", Order_Id);
        dtuser = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Bankrupt_Entry", htselorderkb);
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
    protected void grid_Banckrupty_SelectedIndexChanged(object sender, EventArgs e)
    {
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

        Imgbtn_Brancrupty.ImageUrl = "~/images/Gridview/Save.png";



        Imgbtn_Brancrupty.AlternateText = "Update";
    }

    protected void grd_Taxtype_Comments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }
    protected void grid_Banckrupty_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        int Bankruptcy_Id = int.Parse(grid_Banckrupty.DataKeys[e.RowIndex].Values["Bankruptcy_Id"].ToString());

        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Bankruptcy_Id ", Bankruptcy_Id);
        dtdelete = dataaccess.ExecuteSP("Sp_CLient_GLS_Orders_Bankrupt_Entry", htdelete);
        Gridview_bind_Bankrupty_Tax_Data();
    }
    protected void ddl_Bankruptcy_Yes_No_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddl_Bankruptcy_Yes_No.SelectedValue == "YES")
        {

            txt_Bankcrupt_Comments.Enabled = true;
            txt_Bankruptcy_Case_No.Enabled = true;
            txt_Bankruptcy_ChapterNo.Enabled = true;
            txt_Bankruptcy_Date.Enabled = true;
        }
        else
        {
            txt_Bankcrupt_Comments.Text = "";
            txt_Bankruptcy_Case_No.Text = "";
            txt_Bankruptcy_ChapterNo.Text = "";
            txt_Bankruptcy_Date.Text = "";
            txt_Bankcrupt_Comments.Enabled = false;
            txt_Bankruptcy_Case_No.Enabled = false;
            txt_Bankruptcy_ChapterNo.Enabled = false;
            txt_Bankruptcy_Date.Enabled = false;

        }
    }

    protected void btn_Discount_cancel_Click(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string GetDynamicContent(string contextKey)
    {
        return default(string);
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        //using (ZipFile zip = new ZipFile())
        //{
        //    foreach (GridViewRow gvrow in Tax_Type_Source_upload.Rows)
        //    {
        //        CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
        //        if (chk.Checked)
        //        {
        //            Label path = (Label)gvrow.FindControl("lblDocument_Path");
        //            string fileName = path.Text.ToString();
        //            if (fileName != "")
        //            {
        //                string filePath = Server.MapPath(fileName);
        //                zip.AddFile(filePath, "files");
        //            }
        //        }
        //    }
        //    if (zip.Entries.Count != 0)
        //    {
        //        Response.Clear();
        //        Response.AddHeader("Content-Disposition", "attachment; filename=" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + ".zip");
        //        Response.ContentType = "application/zip";
        //        zip.Save(Response.OutputStream);
        //        Response.End();
        //    }
        //}
    }
    protected void imgbtn_Taxtype_Note_Add_Click(object sender, ImageClickEventArgs e)
    {
        Hashtable httaxnotes = new Hashtable();
        DataTable dtcountytaxnotes = new System.Data.DataTable();
        if (Session["lblNote_Id"] == "")
        {
            DateTime datecountynote = new DateTime();
            datecountynote = DateTime.Now;
            //    dbc.BindComments_Tax_Type(ddl_TaxType_Commts, Order_Id);
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
        else if (Session["lblNote_Id"] != "" & Session["lblNote_Id"] !=null)
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
    protected void grd_Taxtype_Comments_SelectedIndexChanged(object sender, EventArgs e)
    {
         GridViewRow row = Grd_Tax_Type_Comments.SelectedRow;
         Label lblTax_Id = (Label)row.FindControl("lblTax_Id");
        Label lbl_Taxtype_Comments = (Label)row.FindControl("lbl_Taxtype_Comments");
        Label lblNote_Id = (Label)row.FindControl("lblNote_Id");
        dbc.BindComments_Tax_Type(ddl_TaxType_Commts, Order_Id);
        ddl_TaxType_Commts.SelectedValue = lblTax_Id.Text;
        Txt_taxtype_Comments.Text = lbl_Taxtype_Comments.Text;
        Session["lblNote_Id"] = lblNote_Id.Text;
    }
    protected void ddl_TaxType_Commts_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["lblNote_Id"] = "";
    }
}