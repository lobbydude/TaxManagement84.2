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

public partial class Admin_Create_Order_Status : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    Checkboxbindclass chk = new Checkboxbindclass();
    DataTable dt = new DataTable();
    int userroleid; int userid;
    string Empname;
    int countuserid;
    string duplicate;
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
           
            Divcreate.Visible = false;
            DivView.Visible = true;
            LoadGrid();
            lbl_RecordAddedOn.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            lbl_RecordAddedBy.Text = Empname;
            lblhead.Text = "View Order Status";
        }
       
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Validation();
        try
        {

            if (btn_Save.Text == "Add New Order Status" && duplicate != "Duplicate Data")
            {
                if (txt_Order_Status.Text != "")
                {
                    model1.Show();
                    Hashtable ht = new Hashtable();
                    ht.Add("@Trans", "INSERT");
                    ht.Add("@Order_Status", txt_Order_Status.Text);
                    string ChkStatus;
                    if (Chk_Status.Checked == true)
                    {
                        ChkStatus = "True";
                    }
                    else
                    {
                        ChkStatus = "False";
                    }
                    ht.Add("@Status", ChkStatus);
                    ht.Add("@Inserted_By", userid);
                    ht.Add("@Inserted_Date", Convert.ToDateTime(DateTime.Now.ToString()));
                    dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
                    model1.Hide();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Type Created Sucessfully')</script>", false);
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Order Type')</script>", false);
                }

            }

            else if (btn_Save.Text == "Edit Order Status")
            {
                if (txt_Order_Status.Text != "")
                {
                    model1.Show();
                    Hashtable ht = new Hashtable();
                    ht.Add("@Trans", "UPDATE");
                    ht.Add("@Order_Status_ID", int.Parse(txt_Order_No.Text.ToString()));
                    ht.Add("@Order_Status", txt_Order_Status.Text);
                    string ChkStatus;
                    if (Chk_Status.Checked == true)
                    {
                        ChkStatus = "True";
                    }
                    else
                    {
                        ChkStatus = "False";
                    }
                    ht.Add("@Status", ChkStatus);
                    ht.Add("@Modified_By", userid);
                    ht.Add("@Modified_Date", Convert.ToDateTime(DateTime.Now.ToString()));
                    dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
                    model1.Hide();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Type Updated Sucessfully')</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Order Type')</script>", false);
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('" + ex + "')</script>", false);
        }
      
        LoadGrid();
        Divcreate.Visible = false;
        DivView.Visible = true;
        clear();
    }

    protected void LoadGrid()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        int iRowcount = 0;
        ht.Add("@Trans", "BIND");
        dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
        if (dt.Rows.Count > 0)
        {

            grd_Order_Status_details.Visible = true;
            grd_Order_Status_details.DataSource = dt;
            grd_Order_Status_details.DataBind();
            iRowcount = iRowcount + 1;
        }
        model1.Hide();
    }
    protected void grd_Order_Status_details_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int id = int.Parse(grd_Order_Status_details.DataKeys[e.RowIndex].Values["Order_Status_ID"].ToString());
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "DELETE");
        ht.Add("@Order_Status_ID", id);
        dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
        LoadGrid();
        model1.Hide();
    }
    protected void grd_Order_Status_details_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = grd_Order_Status_details.SelectedRow;
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "SELECT");
        ht.Add("@Order_Status_ID", int.Parse(row.Cells[0].Text.ToString()));
        dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
        txt_Order_No.Text = dt.Rows[0]["Order_Status_ID"].ToString();
        txt_Order_Status.Text = dt.Rows[0]["Order_Status"].ToString();
        string ChkStatus = dt.Rows[0]["Status"].ToString();
        if ( ChkStatus=="True")
        {
            Chk_Status.Checked = true;
        }
        else
        {
            Chk_Status.Checked = false;
        }
        if (dt.Rows[0]["Modifiedby"].ToString() != "")
        {
            lbl_RecordAddedBy.Text = dt.Rows[0]["Modifiedby"].ToString();
            lbl_RecordAddedOn.Text = dt.Rows[0]["Modified_Date"].ToString();
        }
        else if (dt.Rows[0]["Modifiedby"].ToString() == "")
        {
            lbl_RecordAddedBy.Text = dt.Rows[0]["Insertedby"].ToString();
            lbl_RecordAddedOn.Text = dt.Rows[0]["Instered_Date"].ToString();
        }
        Divcreate.Visible = true;
        DivView.Visible = false;
        lblhead.Text = "Edit Order Status";
        btn_Save.Text = "Edit Order Status";
        model1.Hide();
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = grd_Order_Status_details.SelectedRow;
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "MAXORDERSTATUSNUMBER");
        dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
        txt_Order_No.Text = dt.Rows[0]["ORDERSTATUSNUMBER"].ToString();
        Divcreate.Visible = true;
        DivView.Visible = false;
        clear();
        lblhead.Text = "Add New Order Status";
        btn_Save.Text = "Add New Order Status";
        model1.Hide();
    }
    protected void News_Click(object sender, EventArgs e)
    {

        Divcreate.Visible = false;
        DivView.Visible = true;
        LoadGrid();
       
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void clear()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        dt.Clear();
        txt_Order_Status.Text = "";
        Chk_Status.Checked = true;
        lbl_RecordAddedBy.Text = Empname;
        lbl_RecordAddedOn.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        Chk_Status.Checked = false;
        ht.Add("@Trans", "MAXORDERSTATUSNUMBER");
        dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
        txt_Order_No.Text = dt.Rows[0]["ORDERSTATUSNUMBER"].ToString();
        lblhead.Text = "Add New Order Status";
        btn_Save.Text = "Add New Order Status";
        model1.Hide();
    }
    protected void Validation()
    {
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "BIND");
        dt = dataaccess.ExecuteSP("Sp_Order_Status", ht);
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            string DtOrderType = (dt.Rows[i]["Order_Status"].ToString()).ToLower();

            string OrderType = (txt_Order_Status.Text).ToLower();
            if (DtOrderType == OrderType && btn_Save.Text != "Edit Order Status")
            {
                duplicate = "Duplicate Data";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Status Already Exists')</script>", false);
                return;
            }
        }
    }
}