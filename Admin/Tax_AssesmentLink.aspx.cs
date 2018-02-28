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

public partial class Admin_Tax_AssesmentLink : System.Web.UI.Page
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
    int BRANCH_ID;
    int client_Id, Subprocess_id,Value1,Value2;
    int State_Id, County_ID;
    DateTime date;
    int check;
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
        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }

        if (!IsPostBack)
        {
            //ex2.Visible = false;

            tblimport.Visible = true;
            tbl_Add_New.Visible = false;
            tr_AddNew.Visible = false;
            dbc.BindState(ddl_State);
            dbc.BindState(ddl_State_Wise);
            Grdiview_Bind_Tax_County_Link();
             


        }

    }
    protected void ddl_ClientName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void News_Click(object sender, EventArgs e)
    {
        strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
        if (fileuploadExcel.HasFile)
        {
            if ((strFileType.Trim() == ".xls") || (strFileType.Trim() == ".xlsx"))
            {
                model1.Show();
                string filename = fileuploadExcel.FileName;
                fileuploadExcel.SaveAs(Server.MapPath(filename));
                ImportToGrid(Server.MapPath(filename));
               // Duplicate_Records();
                //Restrict_Controls();
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
        grd_Import.Visible = true;
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

        if (dt.Rows.Count > 0)
        {

            grd_Import.DataSource = dt;
            grd_Import.DataBind();
        }

        //for (int i = 0; i < dt.Rows.Count; i++)
        //{

        //    ex2.Visible = true;

            
        //    string State1 = grd_Import.Rows[i].Cells[0].Text.ToString();
        //    string County1 = grd_Import.Rows[i].Cells[1].Text.ToString();
        //    for (int j = 0; j < grd_Import.Rows.Count; j++)
        //    {

        //        string State = grd_Import.Rows[j].Cells[0].Text.ToString();
        //        string County = grd_Import.Rows[j].Cells[1].Text.ToString();


        //        //Hashtable htcheck = new Hashtable();
        //        //DataTable dtcheck = new DataTable();
        //        //htcheck.Add("@Trans", "Check");
        //        //htcheck.Add("@State", State);
        //        //htcheck.Add("@county_Name", County);
        //        //dtcheck = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htcheck);
        //        //if (dtcheck.Rows.Count > 0)
        //        //{


        //        //}

        //        if (County1 == County)
        //        {
        //            grd_Import.Rows[j].BackColor = System.Drawing.Color.Yellow;
                   
        //        }
        //        else
        //        {

                  
        //        }

             

        //    }

           
           MyConnection.Close();

        }

    protected void Duplicate_Records()
    
    {



        for (int i = 0; i < grd_Import.Rows.Count; i++)
        {

            ex2.Visible = true;


            string State1 = grd_Import.Rows[i].Cells[0].Text.ToString();
            string County1 = grd_Import.Rows[i].Cells[1].Text.ToString();
            for (int j = 0; j < grd_Import.Rows.Count; j++)
            {

                string State = grd_Import.Rows[j].Cells[0].Text.ToString();
                string County = grd_Import.Rows[j].Cells[1].Text.ToString();


             Hashtable htgetsate_ID = new Hashtable();
                DataTable dtstate_id = new DataTable();
                htgetsate_ID.Add("@Trans", "GET_STATE_ID");
                htgetsate_ID.Add("@StateName", grd_Import.Rows[i].Cells[0].Text);
                dtstate_id = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htgetsate_ID);
                if (dtstate_id.Rows.Count > 0)
                {

                    State_Id = int.Parse(dtstate_id.Rows[0]["State_ID"].ToString());
                }
                else
                {

                    State_Id = 0;
                }

                if (State_Id != 0)
                {
                    Hashtable htgetcounty_ID = new Hashtable();
                    DataTable dtcounty_id = new DataTable();
                    htgetcounty_ID.Add("@Trans", "GET_County_ID");
                    htgetcounty_ID.Add("@State", State_Id);
                    htgetcounty_ID.Add("@county_Name", grd_Import.Rows[i].Cells[1].Text);
                    dtcounty_id = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htgetcounty_ID);
                    if (dtcounty_id.Rows.Count > 0)
                    {

                        County_ID = int.Parse(dtcounty_id.Rows[0]["County_ID"].ToString());
                    }
                    else
                    {

                        County_ID = 0;
                    }

                }

                if (County_ID != 0)
                {
                    Hashtable htcheck = new Hashtable();
                    DataTable dtcheck = new DataTable();
                    htcheck.Add("@Trans", "Check");
                    htcheck.Add("@State", State_Id);
                    htcheck.Add("@County", County_ID);
                    dtcheck = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htcheck);
                    if (dtstate_id.Rows.Count > 0)
                    {

                        check = int.Parse(dtcheck.Rows[0]["count"].ToString());
                    }
                    else
                    {

                        check = 0;
                    }

                    if (check > 0)
                    {
                        grd_Import.Rows[j].BackColor = System.Drawing.Color.LightYellow;

                    }
                }
                else if(County_ID==0)
                {

                    grd_Import.Rows[j].BackColor = System.Drawing.Color.Pink;
                }
               



            }
        }

    }
       
     
 
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        Clear();
       
        tbl_Add_New.Visible = true;
        tr_AddNew.Visible = false;

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {

        string filePath = "~/Admin/TaxAssesmentImport.xlsx";
    
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void grd_SubProcess_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void grd_SubProcess_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void grd_SubProcess_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    protected void btn_Save_Click(object sender, EventArgs e)
    {

    }
    protected void ddl_ClientWiseSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grdiview_Bind_Tax_County_Link();
    }
   
    protected void grd_Import_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //for (int j = 0; j < grd_Import.Rows.Count; j++)
        //{

        //    string State = grd_Import.Rows[j].Cells[0].Text.ToString();
        //    string County = grd_Import.Rows[j].Cells[1].Text.ToString();


        //    Hashtable htcheck = new Hashtable();
        //            DataTable dtcheck = new DataTable();
        //            htcheck.Add("@Trans", "Check");
        //            htcheck.Add("@State", State);
        //            htcheck.Add("@county_Name", County);
        //            dtcheck = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htcheck);
        //            if (dtcheck.Rows.Count > 0)
        //            {


        //            }

        //    if (County == County)
        //    {

        //        Value1 = 1;
        //        break;
        //    }
        //    else
        //    {

        //        Value2 = 0;
        //    }

        //    if (Value1 == 1)
        //    {


        //        grd_Import.Rows[j].BackColor = System.Drawing.Color.Yellow;

        //    }


        //}

    }

    protected void Grid_Orer_Import_Bind()
    {
        Hashtable htgetsate_ID = new Hashtable();
        DataTable dtstate_id = new DataTable();
        htgetsate_ID.Add("@Trans", "Check");
        htgetsate_ID.Add("@State",State_Id);
        htgetsate_ID.Add("@County",County_ID);
        dtstate_id = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htgetsate_ID);
        if (dtstate_id.Rows.Count > 0)
        {

            check = int.Parse(dtstate_id.Rows[0]["count"].ToString());
            return;
        }
        else
        {

            check = 0;
            return;
        }


    

    }
    protected void btn_Insert_Click(object sender, EventArgs e)
    {

        if (grd_Import.Rows.Count > 0)
        {
            for (int i = 0; i < grd_Import.Rows.Count; i++)
            {
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");
                Hashtable htgetsate_ID = new Hashtable();
                DataTable dtstate_id = new DataTable();
                htgetsate_ID.Add("@Trans", "GET_STATE_ID");
                htgetsate_ID.Add("@StateName", grd_Import.Rows[i].Cells[0].Text);
                dtstate_id = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htgetsate_ID);
                if (dtstate_id.Rows.Count > 0)
                {

                    State_Id = int.Parse(dtstate_id.Rows[0]["State_ID"].ToString());
                }
                else
                {

                    State_Id = 0;
                }

                if (State_Id != 0)
                {
                    Hashtable htgetcounty_ID = new Hashtable();
                    DataTable dtcounty_id = new DataTable();
                    htgetcounty_ID.Add("@Trans", "GET_County_ID");
                    htgetcounty_ID.Add("@State", State_Id);
                    htgetcounty_ID.Add("@county_Name", grd_Import.Rows[i].Cells[1].Text);
                    dtcounty_id = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htgetcounty_ID);
                    if (dtcounty_id.Rows.Count > 0)
                    {

                        County_ID = int.Parse(dtcounty_id.Rows[0]["County_ID"].ToString());
                    }
                    else
                    {

                        County_ID = 0;
                    }

                }

                if (County_ID != 0)
                {
                    Hashtable htcheck = new Hashtable();
                    DataTable dtcheck = new DataTable();
                    htcheck.Add("@Trans", "Check");
                    htcheck.Add("@State", State_Id);
                    htcheck.Add("@County", County_ID);
                    dtcheck = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htcheck);
                    if (dtstate_id.Rows.Count > 0)
                    {

                        check = int.Parse(dtcheck.Rows[0]["count"].ToString());
                    }
                    else
                    {

                        check = 0;
                    }

                    if (check == 0)
                    {
                        Hashtable htinsert = new Hashtable();
                        DataTable dtinsert = new DataTable();
                        htinsert.Add("@Trans", "INSERT");
                        htinsert.Add("@State", State_Id);
                        htinsert.Add("@County", County_ID);
                        htinsert.Add("@CountyTax_Link", grd_Import.Rows[i].Cells[2].Text);
                        htinsert.Add("@Tax_PhoneNo", grd_Import.Rows[i].Cells[3].Text);
                        htinsert.Add("@Assessor_Link", grd_Import.Rows[i].Cells[4].Text);
                        htinsert.Add("@Assessor_PhoneNo", grd_Import.Rows[i].Cells[5].Text);
                        htinsert.Add("@Inserted_By", userid);
                        htinsert.Add("@Inserted_date", dateeval);

                        htinsert.Add("@Status", "True");
                        dtinsert = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htinsert);
                    }

                }
            }

            grd_Import.DataSource = null;
            grd_Import.EmptyDataText = "No Orders to Import";
            grd_Import.DataBind();
        }
    }

    protected void Grdiview_Bind_Tax_County_Link()
    {
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
       
        if (ddl_State_Wise.SelectedIndex > 0)
        {
            htselect.Add("@Trans", "SELECT_BY_STATE_WISE");
            htselect.Add("@State",ddl_State_Wise.SelectedValue.ToString());

        }
        else
        {

            htselect.Add("@Trans", "SELECT_BY_STATE");
        }
     
       
        dtselect = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htselect);
        if (dtselect.Rows.Count > 0)
        {

            Grd_Tax_County_Link.DataSource = dtselect;
            Grd_Tax_County_Link.DataBind();


        }
        else
        {
            Grd_Tax_County_Link.DataSource = null;
            Grd_Tax_County_Link.DataBind();


        }

    }
    protected void btn_Add_New_Click(object sender, EventArgs e)
    {
        tr_AddNew.Visible = true;
        tbl_Add_New.Visible = false;
        tblimport.Visible = false;
        Grdiview_Bind_Tax_County_Link();
    }
    protected void btn_Import_Click(object sender, EventArgs e)
    {
        tbl_Add_New.Visible = false;
        tr_AddNew.Visible = false;
        tblimport.Visible = true;
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        tbl_Add_New.Visible = false;
        tr_AddNew.Visible = true;
        tblimport.Visible = false;
    }
    protected void ddl_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_State.SelectedIndex > 0)
        {


            dbc.BindCounty(ddl_County, int.Parse(ddl_State.SelectedValue.ToString()));
        }
    }
    private bool validate()
    {

        if (ddl_State.SelectedIndex <= 0)
        {

           
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select State Name')</script>", false);
            ddl_State.Focus();
            return false;

        }
        if (ddl_County.SelectedIndex <= 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select County Name')</script>", false);
            ddl_County.Focus();
            return false;
        
        

        }
        return true;
    }
    protected void btn_Add_New_Tax_Click(object sender, EventArgs e)
    {
        date = DateTime.Now;
        string dateeval = date.ToString("dd/MM/yyyy");
        string time = date.ToString("hh:mm tt");
        if (validate() != false)
        {
            if (btn_Add_New_Tax.Text == "Add New TaxAssesment")
            {
                State_Id = int.Parse(ddl_State.SelectedValue.ToString());
                County_ID = int.Parse(ddl_County.SelectedValue.ToString());
                Hashtable htcheck = new Hashtable();
                DataTable dtcheck = new DataTable();
                htcheck.Add("@Trans", "Check");
                htcheck.Add("@State", State_Id);
                htcheck.Add("@County", County_ID);
                dtcheck = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htcheck);
                if (dtcheck.Rows.Count > 0)
                {

                    check = int.Parse(dtcheck.Rows[0]["count"].ToString());
                }
                else
                {

                    check = 0;
                }

                if (check == 0)
                {
                    Hashtable htinsert = new Hashtable();
                    DataTable dtinsert = new DataTable();
                    htinsert.Add("@Trans", "INSERT");
                    htinsert.Add("@State", State_Id);
                    htinsert.Add("@County", County_ID);
                    htinsert.Add("@CountyTax_Link", txt_County_Taxes_Link.Text);
                    htinsert.Add("@Tax_PhoneNo", txt_tax_office_phone_no.Text);
                    htinsert.Add("@Assessor_Link", txt_poperty_Assessor_link.Text);
                    htinsert.Add("@Assessor_PhoneNo", txt_assessor_phone_no.Text);
                    htinsert.Add("@Inserted_By", userid);
                    htinsert.Add("@Inserted_date", dateeval);

                    htinsert.Add("@Status", "True");
                    dtinsert = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htinsert);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Record Added Sucessfully')</script>", false);
                    Clear();
                    Grdiview_Bind_Tax_County_Link();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Record already Exsit')</script>", false);
                    Clear();

                }
            }
            else if (btn_Add_New_Tax.Text == "Edit")
            {
                State_Id = int.Parse(ddl_State.SelectedValue.ToString());
                County_ID = int.Parse(ddl_County.SelectedValue.ToString());
               int link_id=int.Parse(ViewState["Tax_County_Link_Id"].ToString());
                    Hashtable htinsert = new Hashtable();
                    DataTable dtinsert = new DataTable();
                    htinsert.Add("@Trans", "UPDATE_LINK");
                    htinsert.Add("@County_Assement_Link_Id", link_id);
                    htinsert.Add("@CountyTax_Link", txt_County_Taxes_Link.Text);
                    htinsert.Add("@Tax_PhoneNo", txt_tax_office_phone_no.Text);
                    htinsert.Add("@Assessor_Link", txt_poperty_Assessor_link.Text);
                    htinsert.Add("@Assessor_PhoneNo", txt_assessor_phone_no.Text);


                    dtinsert = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htinsert);
                    Grdiview_Bind_Tax_County_Link();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Record Updated Sucessfully')</script>", false);
                    Clear();
                  
                
            }

        }
    }
    protected void Clear()
    { 
    txt_County_Taxes_Link.Text="";
    txt_tax_office_phone_no.Text="";
    txt_poperty_Assessor_link.Text="";
    txt_assessor_phone_no.Text = "";
    ddl_State.SelectedIndex = 0;
    btn_Add_New_Tax.Text = "Add New TaxAssesment";

    }
    protected void Grd_Tax_County_Link_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRecord")
        {
            tbl_Add_New.Visible = true;
            tr_AddNew.Visible = false;
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_Tax_County_id = (Label)row.FindControl("lbl_County_Assement_Link_Id");
            Label lbl_stat_id = (Label)row.FindControl("lbl_State_Id");
            Label lbl_county_id = (Label)row.FindControl("lbl_county_Id");
            Label lbltax_County_Link = (Label)row.FindControl("lblCountyTax_Link");
            Label lbltax_phone_no = (Label)row.FindControl("lblTax_PhoneNo");
            Label lbltax_assessor_link = (Label)row.FindControl("lblAssessor_Link");
            Label lbltax_assessor_phone_no = (Label)row.FindControl("lblAssessor_PhoneNo");
            ViewState["Tax_County_Link_Id"] = lbl_Tax_County_id.Text;
            ddl_State.SelectedValue =lbl_stat_id.Text;
            dbc.BindCounty(ddl_County, int.Parse(ddl_State.SelectedValue));
            ddl_County.SelectedValue = lbl_county_id.Text;


            txt_County_Taxes_Link.Text = lbltax_County_Link.Text;
            txt_tax_office_phone_no.Text = lbltax_phone_no.Text;
            txt_poperty_Assessor_link.Text = lbltax_assessor_link.Text;
            txt_assessor_phone_no.Text = lbltax_assessor_phone_no.Text;
            btn_Add_New_Tax.Text = "Edit";
         



        }
        else if (e.CommandName == "DeleteRecord")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lbl_Tax_County_id = (Label)row.FindControl("lbl_County_Assement_Link_Id");
            int Tax_County_id = int.Parse(lbl_Tax_County_id.Text.ToString());
            Hashtable htdelete = new Hashtable();
            DataTable dtdelete = new DataTable();
            htdelete.Add("@Trans", "DELETE");
            htdelete.Add("@County_Assement_Link_Id", Tax_County_id);

            dtdelete = dataaccess.ExecuteSP("Sp_County_Tax_Assesment_Link", htdelete);


            Grdiview_Bind_Tax_County_Link();


        }

    }
    protected void Grd_Tax_County_Link_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grd_Tax_County_Link.PageIndex = e.NewPageIndex;
        Grdiview_Bind_Tax_County_Link();
    }
    protected void btn_Cance_Export_Click(object sender, EventArgs e)
    {
        grd_Import.DataSource = null;
        grd_Import.DataBind();
    }
    protected void txt_County_Taxes_Link_TextChanged(object sender, EventArgs e)
    {

    }
}