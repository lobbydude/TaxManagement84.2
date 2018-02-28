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
using System.Drawing;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Web.Configuration;


public partial class Admin_Orders_Import : System.Web.UI.Page
{
    string Path1;
    string strFileType = "";
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
    int Count;
    Hashtable htselect = new Hashtable();
    DataTable dtselect = new DataTable();
    string constr = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString.ToString();

    int GET_CLIENT, GET_SUBPROCESS, GET_ORDER_STATUS, GET_ORDER_TYPE, GET_CLIENT_STATE, GET_BARROWER_STATE, GET_CLIENT_COUNTY, GET_BARROWER_COUNTY, CHECK_ORDER;
    string MAX_ORDER_NUMBER;
    int BRANCH_ID;
    int client_Id, Subprocess_id;
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
        }
        if (Session["client_Id"] != "" && Session["subProcess_id"]!="")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }

        if (!IsPostBack)
        {
            ex2.Visible = false;
            Restrict_Controls();
            //lbl_Record_Addedby.Text = Empname.ToString();
            //lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");

          

        }


    }
    protected void Restrict_Controls()
    {

        //if (fileuploadExcel.FileName == "")
        //{

        //    btn_Extract.CssClass = "DropDown";
        //    btn_Extract.Enabled = false;
        //}
        //else
        //{

        //    btn_Extract.CssClass = "Windowbutton";
        //    btn_Extract.Enabled = true;
        //}
        if (grd_order.Rows.Count > 0)
        {

            btn_Duplicate.CssClass = "GridButton";
            btn_Save.CssClass = "GridButton";

            btn_Duplicate.Enabled = true;
            btn_Save.Enabled = true;

        }
        else
        {

            btn_Duplicate.CssClass = "WebButton";
            btn_Save.CssClass = "WebButton";

            btn_Duplicate.Enabled = false;
            btn_Save.Enabled = false;
        }
        
    }
    protected void High_LightGridRow(object sender, EventArgs e)
    {

        CheckBox chkTest = (CheckBox)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;



        if (chkTest.Checked == true)
        {
            grdRow.BackColor = System.Drawing.Color.Pink;


        }
        else if (chkTest.Checked == false)
        {
            // Color clr = ColorTranslator.FromHtml("#BACFF8");
            grd_order.BackColor = System.Drawing.Color.White;


        }
    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkTest = (CheckBox)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;

        Label lblrowid = (Label)grdRow.FindControl("lblOrder_id");


       
         if (chkTest.Checked == true)
        {

           

        }
         if (chkTest.Checked == false)
         {
            // grdRow.BackColor = System.Drawing.Color.Pink;


         }


    
    }

    protected void News_Click(object sender, EventArgs e)
    {
        strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
        if (fileuploadExcel.HasFile)
        {
            if ((strFileType.Trim() == ".xls") || (strFileType.Trim() == ".xlsx"))
            {
                model1.Show();
             
              
               // ImportToGrid(Server.MapPath(filename));
                //string file = System.IO.Path.GetFullPath(fileuploadExcel.PostedFile.FileName);
                //filename = System.IO.Path.GetFileName(fileuploadExcel.PostedFile.FileName);

               
                string filename = fileuploadExcel.FileName;
                string fileLocation = Server.MapPath(filename);
                if (System.IO.File.Exists(fileLocation))
                {

                    System.IO.File.Delete(fileLocation);
                }
                fileuploadExcel.SaveAs(Server.MapPath(filename));
                ImportToGrid(Server.MapPath(filename));

                Restrict_Controls();
                model1.Hide();
                //High_LightGridRow(sender,e);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Sorry! The Extension format is Incorrect')</script>", false);
                return;
            }

        }
       
    }
    protected void ImportToGrid(String path)
    {
        grd_order.Visible = true;
        DataTable dt = new DataTable();
        Path1 = path;
        OleDbConnection MyConnection = null;
        DataSet DtSet = null;
        OleDbDataAdapter MyCommand = null;
        strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
        //use below connection string if your excel file .xslx 2007 format
        if (strFileType.Trim() == ".xls")
        {
            MyConnection = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0; Data Source='" + path + "';Extended Properties=Excel 8.0;");
        }
        else if (strFileType.Trim() == ".xlsx")
        {
            MyConnection = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + path + "';Extended Properties=Excel 12.0;");
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Sorry! The Extension format is Incorrect')</script>", false);
            return;
        }
        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [Sheet1$]", MyConnection);
        DtSet = new System.Data.DataSet();
        MyCommand.Fill(DtSet, "[Sheet1]");
        dt = DtSet.Tables[0];
        BulkUpload(dt);
        Hashtable httruncate = new Hashtable();
        DataTable dttruncate = new System.Data.DataTable();
        httruncate.Add("@Trans", "TRUNCATE");
        dttruncate = dataaccess.ExecuteSP("Sp_Temp_Order", httruncate);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Hashtable htinsertrec = new Hashtable();
            DataTable dtinsertrec = new System.Data.DataTable();

            htinsertrec.Add("@Trans", "INSERT");
            htinsertrec.Add("@Client_Order_Number",dt.Rows[i]["Client_Order_Number"].ToString());
            htinsertrec.Add("@Client_Name", dt.Rows[i]["Client_Name"].ToString());
            htinsertrec.Add("@Sub_Client", dt.Rows[i]["Sub_Client"].ToString());
            htinsertrec.Add("@Client_Address", dt.Rows[i]["Client_Address"].ToString());
            htinsertrec.Add("@Cleint_City", dt.Rows[i]["Cleint_City"].ToString());
            htinsertrec.Add("@Client_State", dt.Rows[i]["Client_State"].ToString());
            htinsertrec.Add("@Client_County", dt.Rows[i]["Client_County"].ToString());
            htinsertrec.Add("@Cleint_Zip", dt.Rows[i]["Cleint_Zip"].ToString());
            htinsertrec.Add("@Cleint_Email", dt.Rows[i]["Cleint_Email"].ToString());
            htinsertrec.Add("@Loan_Number", dt.Rows[i]["Loan_Number"].ToString());
            htinsertrec.Add("@Borrower_Name", dt.Rows[i]["Borrower_Name"].ToString());
            htinsertrec.Add("@Last_Name", dt.Rows[i]["Last_Name"].ToString());
            htinsertrec.Add("@Barrower_Address", dt.Rows[i]["Barrower_Address"].ToString());
            htinsertrec.Add("@Barrower_State", dt.Rows[i]["Barrower_State"].ToString());
            htinsertrec.Add("@Barrower_County", dt.Rows[i]["Barrower_County"].ToString());
            htinsertrec.Add("@Barrower_City", dt.Rows[i]["Barrower_City"].ToString());
            htinsertrec.Add("@Barrower_Zip", dt.Rows[i]["Barrower_Zip"].ToString());
            htinsertrec.Add("@Products", dt.Rows[i]["Products"].ToString());
            htinsertrec.Add("@Parcel_Id", dt.Rows[i]["Parcel_Id"].ToString());
            htinsertrec.Add("@Phone_Number", dt.Rows[i]["Phone_Number"].ToString());
            htinsertrec.Add("@Contract_Number", dt.Rows[i]["Contract_Number"].ToString());
            htinsertrec.Add("@Batch_Number", dt.Rows[i]["Batch_Number"].ToString());
           
            dtinsertrec = dataaccess.ExecuteSP("Sp_Temp_Order", htinsertrec);
            
        }

        MyConnection.Close();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new System.Data.DataTable();
        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Temp_Order", htselect);
        if (dtselect.Rows.Count > 0)
        {
            ex2.Visible = true;
            grd_order.DataSource = dtselect;
            grd_order.DataBind();

        }
        DuplicateRecords();
        ExistRecords();
    
      
    }
    protected void Gridview_Bind_Ordes()
    {

        Hashtable htselect = new Hashtable();
        DataTable dtselect = new System.Data.DataTable();
        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Temp_Order", htselect);
        if (dtselect.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_order.DataSource = dtselect;
            grd_order.DataBind();



        }
        else
        { 
        

        }
        //DuplicateRecords();
    }
    protected void BulkUpload(DataTable dt)
    {
        dt.TableName = "dbo.Tbl_Temp_Orders";
        using (SqlConnection connection = new SqlConnection(constr))
        {
            connection.Open();
            //CreatingTranscationsothatitcanrollbackifgotanyerrorwhileuploading
            SqlTransaction trans = connection.BeginTransaction();
            //Start bulkCopy
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection,
            SqlBulkCopyOptions.TableLock |
            SqlBulkCopyOptions.FireTriggers,
            trans))
            {
                //Setting timeout to 0 means no time out for this command will not timeout until upload complete.
                //Change as per you
                bulkCopy.BulkCopyTimeout = 0;
                bulkCopy.DestinationTableName = dt.TableName;
                //write the data in the "dataTable"
                bulkCopy.WriteToServer(dt);
            }
        }
    }
    protected void Get_Maximum_OrderNumber()
    {
        Hashtable htmax = new Hashtable();
        DataTable dtmax = new System.Data.DataTable();
        htmax.Add("@Trans", "MAX_ORDER_NO");
        dtmax = dataaccess.ExecuteSP("Sp_Order", htmax);
        if (dtmax.Rows.Count > 0)
        {

            MAX_ORDER_NUMBER = "DRN" + "-" + dtmax.Rows[0]["ORDER_NUMBER"].ToString();
        }

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {

        model1.Show();
        foreach (GridViewRow row in grd_order.Rows)
        {


            CheckBox chk = (CheckBox)row.FindControl("chkBxSelect");
            if (chk.Checked == true)
            {

                Label lbl_Clent_OrderNumber = (Label)row.FindControl("lblOrder_Number");
                Label lblClientName = (Label)row.FindControl("lblClientName");
                Label lblSubProcess = (Label)row.FindControl("lblSubProcess");
                Label lblClient_Address = (Label)row.FindControl("lblClient_Address");
                Label lblCleint_City = (Label)row.FindControl("lblCleint_City");
                Label lblClient_State = (Label)row.FindControl("lblClient_State");
                Label lblClient_County = (Label)row.FindControl("lblClient_County");
                Label lblClient_Zip = (Label)row.FindControl("lblClient_Zip");
                Label lblCleint_Email = (Label)row.FindControl("lblCleint_Email");
                Label lbl_Loan_Number = (Label)row.FindControl("lblLoan_Number");
                Label lbl_Borrower_Name = (Label)row.FindControl("lblBorrower_Name");
                Label lblLast_Name = (Label)row.FindControl("lblLast_Name");
                Label lblBarrower_Address = (Label)row.FindControl("lblBarrower_Address");
                Label lblBarrower_State = (Label)row.FindControl("lblBarrower_State");
                Label lblBarrower_County = (Label)row.FindControl("lblBarrower_County");
                Label lblBarrower_City = (Label)row.FindControl("lblBarrower_City");
                Label lblBarrower_Zip = (Label)row.FindControl("lblBarrower_Zip");
                Label lbl_Products = (Label)row.FindControl("lblProducts");
                Label lbl_Parcel = (Label)row.FindControl("lblParcel_Id");
                Label lblPhone_Number = (Label)row.FindControl("lblPhone_Number");
                Label lblContract_Number = (Label)row.FindControl("lblContract_Number");
                Label lblBatch_Number = (Label)row.FindControl("lblBatch_Number");
                // get client State
                Hashtable htstate = new Hashtable();
                DataTable dtstate = new System.Data.DataTable();
                htstate.Add("@Trans", "GETSTATE");
                htstate.Add("@state_name", lblClient_State.Text);
                dtstate = dataaccess.ExecuteSP("Sp_Order_Get_Details", htstate);
                if (dtstate.Rows.Count > 0)
                {

                    GET_CLIENT_STATE = int.Parse(dtstate.Rows[0]["State_ID"].ToString());
                }
                else
                {

                    GET_CLIENT_STATE = 0;
                }

                //Get Barrower State

                Hashtable htbarowerstate = new Hashtable();
                DataTable dtbarrowerstate = new System.Data.DataTable();
                htbarowerstate.Add("@Trans", "GETSTATE_BY_ABR");
                htbarowerstate.Add("@state_name", lblBarrower_State.Text);
                dtbarrowerstate = dataaccess.ExecuteSP("Sp_Order_Get_Details", htbarowerstate);
                if (dtbarrowerstate.Rows.Count > 0)
                {

                    GET_BARROWER_STATE = int.Parse(dtbarrowerstate.Rows[0]["State_ID"].ToString());
                }
                else
                {

                    GET_BARROWER_STATE = 0;
                }

                //get County
                Hashtable htcounty = new Hashtable();
                DataTable dtcounty = new System.Data.DataTable();
                htcounty.Add("@Trans", "GETCOUNTY");
                htcounty.Add("@State", GET_CLIENT_STATE);
                htcounty.Add("@County_Name", lblClient_County.Text);
                dtcounty = dataaccess.ExecuteSP("Sp_Order_Get_Details", htcounty);
                if (dtcounty.Rows.Count > 0)
                {

                    GET_CLIENT_COUNTY = int.Parse(dtcounty.Rows[0]["County_ID"].ToString());
                }
                else
                {

                    GET_CLIENT_COUNTY = 0;
                }
                //get Barrower County


                //get County
                Hashtable htBarcounty = new Hashtable();
                DataTable dtbarcounty = new System.Data.DataTable();
                htBarcounty.Add("@Trans", "GETCOUNTY");
                htBarcounty.Add("@State", GET_BARROWER_STATE);
                htBarcounty.Add("@County_Name", lblBarrower_County.Text);
                dtbarcounty = dataaccess.ExecuteSP("Sp_Order_Get_Details", htBarcounty);
                if (dtbarcounty.Rows.Count > 0)
                {

                    GET_BARROWER_COUNTY = int.Parse(dtbarcounty.Rows[0]["County_ID"].ToString());
                }
                else
                {

                    GET_BARROWER_COUNTY = 0;
                }
                Hashtable htClient = new Hashtable();
                DataTable dtClient = new System.Data.DataTable();
                htClient.Add("@Trans", "GET_CLINT");
                htClient.Add("@Client_Name",lblClientName.Text);
                dtClient = dataaccess.ExecuteSP("Sp_Order_Get_Details", htClient);
                if (dtClient.Rows.Count > 0)
                {


                    GET_CLIENT = int.Parse(dtClient.Rows[0]["Client_Id"].ToString());
                }
                else
                {

                  
                    GET_CLIENT = 0;
                }

                //get_Sub_process and Client
                Hashtable htsub = new Hashtable();
                DataTable dtsub = new System.Data.DataTable();
                htsub.Add("@Trans", "GET_SUB_CLINT");
                htsub.Add("@Client_Id",GET_CLIENT);
                htsub.Add("@Sub_ProcessName",lblSubProcess.Text);
                dtsub = dataaccess.ExecuteSP("Sp_Order_Get_Details", htsub);
                if (dtsub.Rows.Count > 0)
                {

                    GET_SUBPROCESS = int.Parse(dtsub.Rows[0]["Subprocess_Id"].ToString());
                   
                }
                else
                {

                    GET_SUBPROCESS = 0;
                  
                }
                
             //   GET_SUBPROCESS = Subprocess_id;

                //get_Order_Type
                //Hashtable htorderType = new Hashtable();
                //DataTable dtordertype = new System.Data.DataTable();
                //htorderType.Add("@Trans", "GET_ORDER_TYPE");
                //htorderType.Add("@State", GET_BARROWER_STATE);
                //dtordertype = dataaccess.ExecuteSP("Sp_Order_Get_Details", htorderType);
                //if (dtordertype.Rows.Count > 0)
                //{

                //    GET_ORDER_TYPE = int.Parse(dtordertype.Rows[0]["Order_Type_ID"].ToString());
                //}
                //else
                //{

                //    GET_ORDER_TYPE = 0;
                //}


                GET_ORDER_TYPE = 2;

                //get_max order number
                Hashtable htmax = new Hashtable();
                DataTable dtmax = new System.Data.DataTable();
                htmax.Add("@Trans", "MAX_ORDER_NO");
                dtmax = dataaccess.ExecuteSP("Sp_Order", htmax);
                if (dtmax.Rows.Count > 0)
                {

                    MAX_ORDER_NUMBER ="DRN" +"-"+ dtmax.Rows[0]["ORDER_NUMBER"].ToString();
                }
               
                //check order number exist
                Hashtable htcheck = new Hashtable();
                DataTable dtcheck = new System.Data.DataTable();

               
              
                htcheck.Add("@Trans", "CHECK_ORDER_NUMBER");
                htcheck.Add("@Client_Order_Number", lbl_Clent_OrderNumber.Text);
                htcheck.Add("@State", GET_BARROWER_STATE);
                htcheck.Add("@Borrower_Name", lbl_Borrower_Name.Text);
                htcheck.Add("@County", GET_BARROWER_COUNTY);
                htcheck.Add("@Address", lblBarrower_Address.Text);
                dtcheck = dataaccess.ExecuteSP("Sp_Order", htcheck);
                if (dtcheck.Rows.Count > 0)
                {
                    CHECK_ORDER = int.Parse(dtcheck.Rows[0]["count"].ToString());

                }
                else
                {
                    CHECK_ORDER = 0;

                }


                Hashtable htinsertrec = new Hashtable();
                DataTable dtinsertrec = new System.Data.DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                htinsertrec.Add("@Trans", "INSERT");
                htinsertrec.Add("@Branch_ID", BRANCH_ID);
                htinsertrec.Add("@Sub_ProcessId",GET_SUBPROCESS);
                htinsertrec.Add("@Date", dateeval);
                htinsertrec.Add("@Placed_By", userid);
                htinsertrec.Add("@Order_Type",GET_ORDER_TYPE);

                htinsertrec.Add("@Order_Number", MAX_ORDER_NUMBER);
                htinsertrec.Add("@Client_Order_Number", lbl_Clent_OrderNumber.Text);
                htinsertrec.Add("@Order_Task", GET_ORDER_TYPE);
                htinsertrec.Add("@Order_Status",1);
                htinsertrec.Add("@Loan_Number",lbl_Loan_Number.Text);
                htinsertrec.Add("@Borrower_Name",lbl_Borrower_Name.Text);
                htinsertrec.Add("@Barrower_Address", lblBarrower_Address.Text);
                htinsertrec.Add("@Last_Name",lblLast_Name.Text);
                htinsertrec.Add("@Barrower_County", GET_BARROWER_COUNTY);
                htinsertrec.Add("@Barrower_City", lblBarrower_City.Text);
                htinsertrec.Add("@Barrower_Zip", lblBarrower_Zip.Text);
                htinsertrec.Add("@Barrower_State", GET_BARROWER_STATE);
                htinsertrec.Add("@Address", lblClient_Address.Text);
                htinsertrec.Add("@City", lblCleint_City.Text);
                htinsertrec.Add("@State", GET_CLIENT_STATE);
                htinsertrec.Add("@County", GET_CLIENT_COUNTY);
                htinsertrec.Add("@Zip", lblClient_Zip.Text);
                htinsertrec.Add("@Products", lbl_Products.Text);
                htinsertrec.Add("@Parecel_Id", lbl_Parcel.Text);
                htinsertrec.Add("@Phone_Number", lblPhone_Number.Text);
                htinsertrec.Add("@Contract_Number", lblContract_Number.Text);
                htinsertrec.Add("@Batch_Number", lblBatch_Number.Text);
                htinsertrec.Add("@Record_Added_Date", dateeval);
                htinsertrec.Add("@Record_Added_Time", time);
                htinsertrec.Add("@Inserted_By", userid);
                htinsertrec.Add("@Inserted_date", dateeval);
                htinsertrec.Add("@status","True");
                htinsertrec.Add("@Export_Status", "False");
                if (CHECK_ORDER == 0)
                {
                    dtinsertrec = dataaccess.ExecuteSP("Sp_Order", htinsertrec);
                    Get_Maximum_OrderNumber();
                }
                else
                { 
                

                }




            }


        }
        grd_order.DataSource = null;
        grd_order.EmptyDataText = "No Orders to Import";
        grd_order.DataBind();



        model1.Hide();





    }

    protected void DuplicateRecords()
    {

        foreach (GridViewRow row in grd_order.Rows)
        {
            Label lbl_clientordernumber = (Label)row.FindControl("lblOrder_Number");

            string DuplicateClient_Number;
            Hashtable htselect = new Hashtable();
            DataTable dtselect = new System.Data.DataTable();
            htselect.Add("@Trans", "GetDuplicate");
            dtselect = dataaccess.ExecuteSP("Sp_Temp_Order", htselect);
            if (dtselect.Rows.Count > 0)
            {
                for (int i = 0; i < dtselect.Rows.Count; i++)
                {
                    Count = int.Parse(dtselect.Rows[i]["count"].ToString());

                    if (Count > 1)
                    {

                        btn_Duplicate.CssClass = "Windowbutton";
                        DuplicateClient_Number = dtselect.Rows[i]["Client_Order_Number"].ToString();

                        if (lbl_clientordernumber.Text == DuplicateClient_Number)
                        {
                            row.BackColor = System.Drawing.Color.Pink; 

                        }
                    }
                    else
                    {

                        btn_Duplicate.CssClass = "DropDown";
                    }

                }


            }
            else
            {

                btn_Duplicate.CssClass = "DropDown";
            }

        }
           
    }
    protected void ExistRecords()
    {

        foreach (GridViewRow row in grd_order.Rows)
        {
            Label lbl_clientordernumber = (Label)row.FindControl("lblOrder_Number");

            string DuplicateClient_Number;
            Hashtable htselect = new Hashtable();
            DataTable dtselect = new System.Data.DataTable();
            htselect.Add("@Trans", "CHECK_DUPLICATE");
            dtselect = dataaccess.ExecuteSP("Sp_Order", htselect);
            if (dtselect.Rows.Count > 0)
            {
                for (int i = 0; i < dtselect.Rows.Count; i++)
                {
                    Count = int.Parse(dtselect.Rows[i]["count"].ToString());

                    if (Count > 1)
                    {

                        btn_Duplicate.CssClass = "Windowbutton";
                        DuplicateClient_Number = dtselect.Rows[i]["Client_Order_Number"].ToString();

                        if (lbl_clientordernumber.Text == DuplicateClient_Number)
                        {
                            row.BackColor = System.Drawing.Color.LightYellow;

                        }
                    }
                    else
                    {

                        btn_Duplicate.CssClass = "DropDown";
                    }

                }


            }
            else
            {

                btn_Duplicate.CssClass = "DropDown";
            }

        }

    }
    protected void grd_order_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            


        }

    }
    protected void btn_Duplicate_Click(object sender, EventArgs e)
    {
        //foreach(GridViewRow row in  grd_order.Rows)
        //{


        //    CheckBox chk = (CheckBox)row.FindControl("chkBxSelect");
        //    if (chk.Checked == true)
        //    {

        //        Label lbl = (Label)row.FindControl("lblOrder_id");

                Hashtable htdelrec = new Hashtable();
                DataTable dtdelrec = new System.Data.DataTable();

                htdelrec.Add("@Trans", "DELETE");
                dtdelrec = dataaccess.ExecuteSP("Sp_Temp_Order", htdelrec);

                
        //    }
          

        //}

        Gridview_Bind_Ordes();
        DuplicateRecords();

        ExistRecords();

    }
    protected void grd_order_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e)
    {
        Gridview_Bind_Ordes();

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
    protected void btn_Exit_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Tax_Admin_Home.aspx");
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {



        string filePath = "~/Admin/TaxOrder_Import.xlsx";
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void fileuploadExcel_Load(object sender, EventArgs e)
    {
        Restrict_Controls();
    }
}