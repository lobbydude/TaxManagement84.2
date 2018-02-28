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

public partial class Admin_Import_County_Database_Information : System.Web.UI.Page
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

    int GET_CLIENT, GET_SUBPROCESS, GET_ORDER_STATUS, GET_ORDER_TYPE, GET_STATE, GET_COUNTY, CHECK_ORDER;
    string MAX_ORDER_NUMBER;
    int BRANCH_ID;
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

        if (!IsPostBack)
        {
            ex2.Visible = false;
           // lbl_Record_Addedby.Text = Empname.ToString();
          //  lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");



        }

    }

    protected void News_Click(object sender, EventArgs e)
    {
        model1.Show();
        strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
        if (fileuploadExcel.HasFile)
        {
            if ((strFileType.Trim() == ".xls") || (strFileType.Trim() == ".xlsx"))
            {
               
                string filename = fileuploadExcel.FileName;
               fileuploadExcel.SaveAs(Server.MapPath(filename));
                ImportToGrid(Server.MapPath(filename));
                //High_LightGridRow(sender,e);
                model1.Hide();
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
        model1.Show();
      
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
        MyConnection.Open();
        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [Sheet1$]", MyConnection);
        DtSet = new System.Data.DataSet();
        MyCommand.Fill(DtSet, "[Sheet1]");
        dt = DtSet.Tables[0];
        Hashtable httruncate = new Hashtable();
        DataTable dttruncate = new System.Data.DataTable();
        httruncate.Add("@Trans", "TRUNCATE");
        dttruncate = dataaccess.ExecuteSP("Sp_Temp_County_Database", httruncate);
      
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Hashtable htinsertrec = new Hashtable();
            DataTable dtinsertrec = new System.Data.DataTable();

            htinsertrec.Add("@Trans", "INSERT");
            htinsertrec.Add("@State", dt.Rows[i]["State"].ToString());
            htinsertrec.Add("@County", dt.Rows[i]["County"].ToString());
            htinsertrec.Add("@City", dt.Rows[i]["City"].ToString());
            htinsertrec.Add("@Tax_Office_Phone_No", dt.Rows[i]["Tax_Office_Phone_No"].ToString());
            htinsertrec.Add("@School_Tax_Office_Ph_No", dt.Rows[i]["School_Tax_Office_Ph_No"].ToString());
            htinsertrec.Add("@Make_Changes_Payable_to", dt.Rows[i]["Make_Changes_Payable_to"].ToString());
            htinsertrec.Add("@Payee_Address", dt.Rows[i]["Payee_Address"].ToString());
            htinsertrec.Add("@Physical_Address", dt.Rows[i]["Physical_Address"].ToString());
            htinsertrec.Add("@Hours_Open", dt.Rows[i]["Hours_Open"].ToString());
            htinsertrec.Add("@Website", dt.Rows[i]["Website"].ToString());
            htinsertrec.Add("@Fax_No", dt.Rows[i]["Fax_No"].ToString());
            dtinsertrec = dataaccess.ExecuteSP("Sp_Temp_County_Database", htinsertrec);

        }

        MyConnection.Close();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new System.Data.DataTable();
        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Temp_County_Database", htselect);
        if (dtselect.Rows.Count > 0)
        {
            ex2.Visible = true;
            grd_order.DataSource = dtselect;
            grd_order.DataBind();

        }
      //  DuplicateRecords();

        //   btn_Submit.Visible = true;

        if (System.IO.File.Exists(path))
        {
            System.IO.File.Delete(path);
        }
        model1.Hide();
    }
    protected void Gridview_Bind_Ordes()
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new System.Data.DataTable();
        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Temp_County_Database", htselect);
        if (dtselect.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_order.DataSource = dtselect;
            grd_order.DataBind();

        }
        //DuplicateRecords();
        model1.Hide();
    }
    protected void btn_Duplicate_Click(object sender, EventArgs e)
    {

          

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        model1.Show();
        foreach (GridViewRow row in grd_order.Rows)
        {


            CheckBox chk = (CheckBox)row.FindControl("chkBxSelect");
            if (chk.Checked == true)
            {



                Label lbl_State = (Label)row.FindControl("lblState");
                Label lbl_County = (Label)row.FindControl("lblCounty");
                Label lbl_City = (Label)row.FindControl("lblCity");
                Label lblTax_Office_Phone_No = (Label)row.FindControl("lblTax_Office_Phone_No");
                Label lblSchool_Tax_Office_Ph_No = (Label)row.FindControl("lblSchool_Tax_Office_Ph_No");
                Label lblMake_Changes_Payable_to = (Label)row.FindControl("lblMake_Changes_Payable_to");
                Label lblPayee_Address = (Label)row.FindControl("lblPayee_Address");
                Label lblPhysical_Address = (Label)row.FindControl("lblPhysical_Address");
                Label lblHours_Open = (Label)row.FindControl("lblHours_Open");
                Label lblWebsite = (Label)row.FindControl("lblWebsite");
                Label lblFax_No = (Label)row.FindControl("lblFax_No");

                // get State
                Hashtable htstate = new Hashtable();
                DataTable dtstate = new System.Data.DataTable();
                htstate.Add("@Trans", "GETSTATE_BY_ABR");
                htstate.Add("@state_name", lbl_State.Text);
                dtstate = dataaccess.ExecuteSP("Sp_Order_Get_Details", htstate);
                if (dtstate.Rows.Count > 0)
                {

                    GET_STATE = int.Parse(dtstate.Rows[0]["State_ID"].ToString());
                }
                else
                {

                    GET_STATE = 0;
                }
                //get County
                Hashtable htcounty = new Hashtable();
                DataTable dtcounty = new System.Data.DataTable();
                htcounty.Add("@Trans", "GETCOUNTY");
                htcounty.Add("@State", GET_STATE);
                htcounty.Add("@County_Name", lbl_County.Text);
                dtcounty = dataaccess.ExecuteSP("Sp_Order_Get_Details", htcounty);
                if (dtcounty.Rows.Count > 0)
                {

                    GET_COUNTY = int.Parse(dtcounty.Rows[0]["County_ID"].ToString());
                }
                else
                {

                    GET_COUNTY = 0;
                }
                //get_Sub_process and Client
               
                //check order number exist
                //Hashtable htcheck = new Hashtable();
                //DataTable dtcheck = new System.Data.DataTable();



                //htcheck.Add("@Trans", "CHECK_ORDER_NUMBER");
                //htcheck.Add("@Client_Order_Number", lbl_Clent_OrderNumber.Text);
                //htcheck.Add("@State", GET_STATE);
                //htcheck.Add("@Borrower_Name", lbl_Borrower_Name.Text);
                //htcheck.Add("@County", GET_COUNTY);
                //htcheck.Add("@Address", lbl_Address.Text);
                //dtcheck = dataaccess.ExecuteSP("Sp_Order", htcheck);
                //if (dtcheck.Rows.Count > 0)
                //{
                //    CHECK_ORDER = int.Parse(dtcheck.Rows[0]["count"].ToString());

                //}
                //else
                //{
                //    CHECK_ORDER = 0;

                //}


                Hashtable htinsertrec = new Hashtable();
                DataTable dtinsertrec = new System.Data.DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                htinsertrec.Add("@Trans", "INSERT");
                htinsertrec.Add("@State", GET_STATE);
                htinsertrec.Add("@County",GET_COUNTY);
                htinsertrec.Add("@City",lbl_City.Text);
                htinsertrec.Add("@Tax_Office_Phone_No", lblTax_Office_Phone_No.Text);
                htinsertrec.Add("@School_Tax_Office_Ph_No", lblSchool_Tax_Office_Ph_No.Text);
                htinsertrec.Add("@Make_Changes_Payable_to", lblMake_Changes_Payable_to.Text);
                htinsertrec.Add("@Payee_Address", lblPayee_Address.Text);
                htinsertrec.Add("@Physical_Address", lblPhysical_Address.Text);
                htinsertrec.Add("@Hours_Open", lblHours_Open.Text);
                htinsertrec.Add("@Website", lblWebsite.Text);
                htinsertrec.Add("@Fax_No", lblFax_No.Text);
                htinsertrec.Add("@Inserted_By", userid);
                htinsertrec.Add("@Inserted_date", date);
                htinsertrec.Add("@status", "True");
                dtinsertrec = dataaccess.ExecuteSP("Sp_County_Database", htinsertrec);
            }
        }
        grd_order.DataSource = null;
        grd_order.EmptyDataText = "No Orders to Import";
        grd_order.DataBind();
        model1.Hide();
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {

    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        //CheckBox chkTest = (CheckBox)sender;
        //GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
        //Label lblrowid = (Label)grdRow.FindControl("lblOrder_id");
        //if (chkTest.Checked == true)
        //{
        //}
        //if (chkTest.Checked == false)
        //{
        //    // grdRow.BackColor = System.Drawing.Color.Pink;
        //}
    }
    protected void grd_order_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void grd_order_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void btn_ExampleExcel_Click(object sender, EventArgs e)
    {
        FileInfo file = new FileInfo(Server.MapPath("~/Uploads/County Database.xlsx"));
        if (file.Exists)
        {
            Response.Clear();
            Response.ClearHeaders();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + "County Database.xlsx");
            Response.AddHeader("Content-Type", "application/Excel");
            Response.ContentType = "application/vnd.xls";
            Response.AddHeader("Content-Length", file.Length.ToString());
            Response.WriteFile(file.FullName);
            Response.End();
        }
        else
        {
            Response.Write("This file does not exist.");
        }
        // ExportToGrid(Server.MapPath("~/Uploads/Order_Excel.xls"));
    }
}