using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Net;
using System.IO;
using System.Drawing;

public partial class Admin_Tax_Info : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    Checkboxbindclass chk = new Checkboxbindclass();
    DataTable dt = new DataTable();
    Hashtable ht = new Hashtable();
    int userid;
    string Empname;
    string duplicate;
    int Tax_Type_Id;
    int Tax_Status_Id;
    int Tax_Period_Id;
    int tabtaxtype=0, tabtxperiod=0, tabtaxstatus=0;
    Color bgcr = ColorTranslator.FromHtml("#12B61F");
    Color focr = ColorTranslator.FromHtml("#ffffff");
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

        Color bgclr = ColorTranslator.FromHtml("#33CCFF");
        Color foclr = ColorTranslator.FromHtml("#303030");
        tab_TaxPeriod.BackColor = bgclr;
        tab_TaxPeriod.ForeColor = foclr;
        tab_TaxStatus.BackColor = bgclr;
        tab_TaxStatus.ForeColor = foclr;
        tab_Taxtype.BackColor = bgclr;
        tab_Taxtype.ForeColor = foclr;

        if (!IsPostBack)
        {
            TabControl();
            clear();
            Load_Grd_Tax_Type();
            Load_Grd_Tax_Periode();
            Load_Grd_Tax_Status();
           

        }
        lbl_Record_Add_by.Text = Empname;
        lblRecordAddby.Text = Empname;
        lbl_RecordAddedBy.Text = Empname;
        lbl_Record_Add_on.Text = DateTime.Now.ToString();
        lbl_RecordAddedOn.Text = DateTime.Now.ToString();
        lblRecordAddon.Text = DateTime.Now.ToString();
    }
    protected void Load_Grd_Tax_Type()
    {
        model1.Show();
        dt.Clear();
        ht.Clear();
        int iRowcount = 0;
        ht.Add("@Trans", "SELECT");
        dt = dataaccess.ExecuteSP("Sp_Tax_Type", ht);
        if (dt.Rows.Count > 0)
        {

            grd_Tax_Type1.Visible = true;
            grd_Tax_Type1.DataSource = dt;
            grd_Tax_Type1.DataBind();
            iRowcount = iRowcount + 1;
        }
        model1.Hide();
    }
    protected void Load_Grd_Tax_Periode()
    {
        model1.Show();
        dt.Clear();
        ht.Clear();
        int iRowcount = 0;
        ht.Add("@Trans", "SELECT");
        dt = dataaccess.ExecuteSP("Sp_Tax_Periode", ht);
        if (dt.Rows.Count > 0)
        {

            Grd_Tax_Periode.Visible = true;
            Grd_Tax_Periode.DataSource = dt;
            Grd_Tax_Periode.DataBind();
            iRowcount = iRowcount + 1;
        }
        model1.Hide();
    }
    protected void btn_Save_Tax_Periode_Click(object sender, EventArgs e)
    {
        
    }
    protected void clear()
    {
        lbl_Periode_id.Text = "";
        txt_Tax_Periode.Text = "";
        lbl_Type_Id.Text = "";
        txt_Tax_Type.Text = "";
        txt_Tax_Status.Text = "";
        lbl_Status_Id.Text = "";
        lbl_Record_Add_by.Text = Empname;
        lbl_Record_Add_on.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        lbl_RecordAddedBy.Text = Empname;
        lbl_RecordAddedOn.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        lblRecordAddby.Text = Empname;
        lblRecordAddon.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        btn_TaxTypeAdd.Text = "Add Tax Periode";
        btn_TaxPeriodAdd.Text = "Add Tax Type";
        btn_TaxStatusAdd.Text = "Add Tax Status";
    }
    protected void btn_Cancel_Tax_Periode_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void btn_Save_Tax_Type_Click(object sender, EventArgs e)
    {
        
    }
    protected void Grd_Tax_Periode_details_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr_TaxPeriod.Visible = true;
        tr_TaxPeriod1.Visible = true;
        tr_TaxPeriod2.Visible = true;
        model1.Show();
        lbl_Periode_id.Text = Grd_Tax_Periode.SelectedDataKey.Value.ToString();
        Tax_Period_Id = int.Parse(Grd_Tax_Periode.SelectedDataKey.Value.ToString());
        ht.Add("@Trans", "SELECT_ID");
        ht.Add("@Tax_Period_Id", Tax_Period_Id);
        dt = dataaccess.ExecuteSP("Sp_Tax_Periode", ht);
        txt_Tax_Periode.Text = dt.Rows[0]["Tax_Period"].ToString();
        if (dt.Rows[0]["Modifiedby"].ToString() != "")
        {
            lbl_Record_Add_by.Text = dt.Rows[0]["Modifiedby"].ToString();
            lbl_Record_Add_on.Text = dt.Rows[0]["Modified_Date"].ToString();
        }
        else if (dt.Rows[0]["Modifiedby"].ToString() == "")
        {
            lbl_Record_Add_by.Text = dt.Rows[0]["Insertedby"].ToString();
            lbl_Record_Add_on.Text = dt.Rows[0]["Inserted_date"].ToString();
        }
        btn_TaxPeriodAdd.Text = "Update Tax Periode";
        model1.Hide();
    }
    protected void grd_Tax_Type_details_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr_Tax.Visible = true;
        tr_Tax1.Visible = true;
        tr_Tax2.Visible = true;
        model1.Show();
        lbl_Type_Id.Text = grd_Tax_Type1.SelectedDataKey.Value.ToString();
        Tax_Type_Id = int.Parse(grd_Tax_Type1.SelectedDataKey.Value.ToString());
        ht.Add("@Trans", "SELECT_ID");
        ht.Add("@Tax_Type_Id", Tax_Type_Id);
        dt = dataaccess.ExecuteSP("Sp_Tax_Type", ht);
        txt_Tax_Type.Text = dt.Rows[0]["Tax_Type"].ToString();
        if (dt.Rows[0]["Modifiedby"].ToString() != "")
        {
            lbl_RecordAddedBy.Text = dt.Rows[0]["Modifiedby"].ToString();
            lbl_RecordAddedOn.Text = dt.Rows[0]["Modified_Date"].ToString();
        }
        else if (dt.Rows[0]["Modifiedby"].ToString() == "")
        {
            lbl_RecordAddedBy.Text = dt.Rows[0]["Insertedby"].ToString();
            lbl_RecordAddedOn.Text = dt.Rows[0]["Inserted_date"].ToString();
        }
        btn_TaxTypeAdd.Text = "Update Tax Type";
        model1.Hide();

    }
    protected void grd_Tax_Type_details_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int id = int.Parse(grd_Tax_Type1.DataKeys[e.RowIndex].Values["Tax_Type_Id"].ToString());
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "DELETE");
        ht.Add("@Tax_Type_Id", id);
        ht.Add("@Modified_By", userid);
        ht.Add("@Modified_Date", DateTime.Now);
        dt = dataaccess.ExecuteSP("Sp_Tax_Type", ht);
        Load_Grd_Tax_Type();
        model1.Hide();
    }
    protected void grd_Tax_Status_details_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int id = int.Parse(grd_Tax_Status.DataKeys[e.RowIndex].Values["Tax_Status_Id"].ToString());
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "DELETE");
        ht.Add("@Tax_Status_Id", id);
        ht.Add("@Modified_By", userid);
        ht.Add("@Modified_Date", DateTime.Now);
        dt = dataaccess.ExecuteSP("Sp_Tax_Status", ht);
        Load_Grd_Tax_Status();
        model1.Hide();
    }
    protected void Grd_Tax_Periode_details_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int id = int.Parse(Grd_Tax_Periode.DataKeys[e.RowIndex].Values["Tax_Period_Id"].ToString());
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "DELETE");
        ht.Add("@Tax_Period_Id", id);
        ht.Add("@Modified_By", userid);
        ht.Add("@Modified_Date", DateTime.Now);
        dt = dataaccess.ExecuteSP("Sp_Tax_Periode", ht);
        Load_Grd_Tax_Periode();
        model1.Hide();
    }
    protected void btn_Clear_Tax_Type_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void btn_Save_Tax_Status_Click(object sender, EventArgs e)
    {
        
    }
    protected void Load_Grd_Tax_Status()
    {
        model1.Show();
        dt.Clear();
        ht.Clear();
        int iRowcount = 0;
        ht.Add("@Trans", "SELECT");
        dt = dataaccess.ExecuteSP("Sp_Tax_Status", ht);
        if (dt.Rows.Count > 0)
        {

            grd_Tax_Status.Visible = true;
            grd_Tax_Status.DataSource = dt;
            grd_Tax_Status.DataBind();
            iRowcount = iRowcount + 1;
        }
        model1.Hide();
    }
    protected void grd_Tax_Status_details_SelectedIndexChanged(object sender, EventArgs e)
    {
        tr_TaxStatus.Visible = true;
        tr_TaxStatus1.Visible = true;
        tr_TaxStatus2.Visible = true;
        model1.Show();
        lbl_Status_Id.Text = grd_Tax_Status.SelectedDataKey.Value.ToString();
        Tax_Status_Id = int.Parse(grd_Tax_Status.SelectedDataKey.Value.ToString());
        ht.Add("@Trans", "SELECT_ID");
        ht.Add("@Tax_Status_Id", Tax_Status_Id);
        dt = dataaccess.ExecuteSP("Sp_Tax_Status", ht);
        txt_Tax_Status.Text = dt.Rows[0]["Tax_Status"].ToString();
        if (dt.Rows[0]["Modifiedby"].ToString() != "")
        {
            lblRecordAddby.Text = dt.Rows[0]["Modifiedby"].ToString();
            lblRecordAddon.Text = dt.Rows[0]["Modified_Date"].ToString();
        }
        else if (dt.Rows[0]["Modifiedby"].ToString() == "")
        {
            lblRecordAddby.Text = dt.Rows[0]["Insertedby"].ToString();
            lblRecordAddon.Text = dt.Rows[0]["Inserted_date"].ToString();
        }
        btn_TaxStatusAdd.Text = "Update Tax Status";
        model1.Hide();

    }
    protected void btn_Clear_Tax_Status_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void tab_Taxtype_Click(object sender, EventArgs e)
    {
        Tax_Type.Visible = true;
        Tax_Period.Visible = false;
        Tax_Status.Visible = false;
        
        tabtaxtype = 1;
        if (tabtaxtype == 1)
        {
            tab_Taxtype.ForeColor = focr;
            tab_Taxtype.BackColor = bgcr;
        }
        
    }

    private void TabControl()
    {
        Tax_Type.Visible = true;
        Tax_Period.Visible = false;
        Tax_Status.Visible = false;

        
        if (tabtaxtype == 0 && tabtxperiod==0 && tabtaxstatus==0)
        {
            tab_Taxtype.ForeColor = focr;
            tab_Taxtype.BackColor = bgcr;
        }
    }
    protected void tab_TaxPeriod_Click(object sender, EventArgs e)
    {
        Tax_Type.Visible = false;
        Tax_Period.Visible = true;
        Tax_Status.Visible = false;
        tabtxperiod = 1;
        if (tabtxperiod == 1)
        {
            tab_TaxPeriod.BackColor = bgcr;
            tab_TaxPeriod.ForeColor = focr;
        }
    }
    protected void tab_TaxStatus_Click(object sender, EventArgs e)
    {
        Tax_Type.Visible = false;
        Tax_Period.Visible = false;
        Tax_Status.Visible = true;
        tabtaxstatus = 1;
        if (tabtaxstatus == 1)
        {
            tab_TaxStatus.BackColor = bgcr;
            tab_TaxStatus.ForeColor= focr;
        }

    }
    protected void btn_AddTaxInfo_Click(object sender, ImageClickEventArgs e)
    {
        tr_Tax.Visible = true;
        tr_Tax1.Visible = true;
        tr_Tax2.Visible = true;
    }

    protected void btn_AddTaxPeriod_Click(object sender, ImageClickEventArgs e)
    {
        tr_TaxPeriod.Visible = true;
        tr_TaxPeriod1.Visible = true;
        tr_TaxPeriod2.Visible = true;
    }
    protected void btn_AddTaxStatus_Click(object sender, ImageClickEventArgs e)
    {
        tr_TaxStatus.Visible = true;
        tr_TaxStatus1.Visible = true;
         tr_TaxStatus2.Visible = true;
    }
    protected void btn_TaxTypeAdd_Click(object sender, EventArgs e)
    {
        model1.Show();
        dt.Clear();
        ht.Clear();
        if (lbl_Type_Id.Text == "")
        {
            ht.Add("@Trans", "INSERT");
            ht.Add("@Tax_Type", txt_Tax_Type.Text);
            ht.Add("@Inserted_By", userid);
            ht.Add("@Inserted_Date", DateTime.Now);
            dt = dataaccess.ExecuteSP("Sp_Tax_Type", ht);
        }
        else if (lbl_Type_Id.Text != "")
        {
            ht.Add("@Trans", "UPDATE");
            ht.Add("@Tax_Type_Id", int.Parse(lbl_Type_Id.Text.ToString()));
            ht.Add("@Tax_Type", txt_Tax_Type.Text);
            ht.Add("@Modified_By", userid);
            ht.Add("@Modified_Date", DateTime.Now);
            dt = dataaccess.ExecuteSP("Sp_Tax_Type", ht);
        }
        Load_Grd_Tax_Type();
        clear();
        model1.Hide();
    }
    protected void btn_TaxPeriodAdd_Click(object sender, EventArgs e)
    {
        model1.Show();
        dt.Clear();
        ht.Clear();
        if (lbl_Periode_id.Text == "")
        {
            ht.Add("@Trans", "INSERT");
            ht.Add("@Tax_Period", txt_Tax_Periode.Text);
            ht.Add("@Inserted_By", userid);
            ht.Add("@Inserted_Date", DateTime.Now);
            dt = dataaccess.ExecuteSP("Sp_Tax_Periode", ht);
        }
        else if (lbl_Periode_id.Text != "")
        {
            ht.Add("@Trans", "UPDATE");
            ht.Add("@Tax_Period_Id", int.Parse(lbl_Periode_id.Text.ToString()));
            ht.Add("@Tax_Period", txt_Tax_Periode.Text);
            ht.Add("@Modified_By", userid);
            ht.Add("@Modified_Date", DateTime.Now);
            dt = dataaccess.ExecuteSP("Sp_Tax_Periode", ht);
        }
        clear();
        Load_Grd_Tax_Periode();
        model1.Hide();
    }
    protected void btn_TaxStatusAdd_Click(object sender, EventArgs e)
    {
        model1.Show();
        dt.Clear();
        ht.Clear();
        if (lbl_Periode_id.Text == "")
        {
            ht.Add("@Trans", "INSERT");
            ht.Add("@Tax_Status", txt_Tax_Status.Text);
            ht.Add("@Inserted_By", userid);
            ht.Add("@Inserted_Date", DateTime.Now);
            dt = dataaccess.ExecuteSP("Sp_Tax_Status", ht);
        }
        else if (lbl_Periode_id.Text != "")
        {
            ht.Add("@Trans", "UPDATE");
            ht.Add("@Tax_Status_Id", int.Parse(lbl_Periode_id.Text.ToString()));
            ht.Add("@Tax_Status", txt_Tax_Status.Text);
            ht.Add("@Modified_By", userid);
            ht.Add("@Modified_Date", DateTime.Now);
            dt = dataaccess.ExecuteSP("Sp_Tax_Status", ht);
        }
        clear();
        Load_Grd_Tax_Status();
        model1.Hide();
    }
    protected void btn_Cancel_Complaint_Click(object sender, EventArgs e)
    {
       
    }
}