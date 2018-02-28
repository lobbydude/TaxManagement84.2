using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Admin_Create_SubProcess : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
    Int64 Subprocesnum;
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
           // GetMaximumSubprocessNumber();
            DivView.Visible = true;
            Divcreate.Visible = false;
            lblhead.Text = "View Clients";
            DdlbindClients();
            lbl_Record_Addedby.Text = Empname.ToString();
            lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            GridviewbindSubProcess();
        }
        txt_ClientNumber.Text = "";
    }
    protected void DdlbindClients()
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Client", htselect);
        if (dtselect.Rows.Count > 0)
        {
            ddl_ClientName.DataSource = dtselect;
            ddl_ClientName.DataTextField = "Client_Name";
            ddl_ClientName.DataValueField = "Client_Id";
            ddl_ClientName.DataBind();
            ddl_ClientName.Items.Insert(0,"SELECT");
            
            ddl_ClientWiseSearch.DataSource = dtselect;
            ddl_ClientWiseSearch.DataTextField = "Client_Name";
            ddl_ClientWiseSearch.DataValueField = "Client_Id";
            ddl_ClientWiseSearch.DataBind();
            ddl_ClientWiseSearch.Items.Insert(0, "SELECT");
            ddl_ClientWiseSearch.Items.Insert(1, "ALL");
        }
        model1.Hide();
    }
    protected void GetMaximumClientNumber()
    {
        model1.Show();
        if (ddl_ClientName.SelectedIndex > 0)
        {
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
            Hashtable htselect = new Hashtable();
            DataTable dtselect = new DataTable();

            htselect.Add("@Trans", "MAXCLIENTNUM");
            htselect.Add("@Client_Id", clientid);
            dtselect = dataaccess.ExecuteSP("Sp_Client_SubProcess", htselect);
            if (dtselect.Rows.Count > 0)
            {

              
                txt_ClientNumber.Text = dtselect.Rows[0]["Client_Number"].ToString();
            }
        }
        model1.Hide();

    }
    protected void GetMaximumSubprocessNumber()
    {
        model1.Show();
        if (ddl_ClientName.SelectedIndex > 0)
        {
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
            Hashtable htselect = new Hashtable();
            DataTable dtselect = new DataTable();

            htselect.Add("@Trans", "MAXSUBPROCESSNUMBER");
            htselect.Add("@Client_Id",clientid);
            dtselect = dataaccess.ExecuteSP("Sp_Client_SubProcess", htselect);
            if (dtselect.Rows.Count > 0)
            {
                Subprocesnum = Convert.ToInt64(dtselect.Rows[0]["Subprocess_Number"].ToString());
                if (Subprocesnum == 1)
                {
                    Int64 maxsubno;
                    maxsubno = int.Parse(txt_ClientNumber.Text.ToString()) + Subprocesnum;
                    txt_SubProcessNumber.Text = maxsubno.ToString();
                }
                else
                {

                    txt_SubProcessNumber.Text = Subprocesnum.ToString();

                }
            }
        }
        model1.Hide();

    }
    private bool Validation()
    {

        if (ddl_ClientName.SelectedIndex <=0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Client Name')</script>", false);
            ddl_ClientName.Focus();
            ddl_ClientName.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            ddl_ClientName.BorderColor = System.Drawing.Color.DarkBlue;
        }
        if (txt_SubProcessName.Text =="")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Sub Process Name')</script>", false);
            txt_SubProcessName.Focus();
            txt_SubProcessName.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_SubProcessName.BorderColor = System.Drawing.Color.DarkBlue;
        }
        return true;
    }
    protected void ddl_ClientName_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetMaximumClientNumber();
        GetMaximumSubprocessNumber();
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {

        Validation1();
        if (Validation() != false && btn_Save.Text == "Add New Sub Process" && duplicate != "Duplicate Data")
        {
            model1.Show();
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
            int SubProcessnaumber = Convert.ToInt32(txt_SubProcessNumber.Text);
            string SubProcessname = txt_SubProcessName.Text.ToUpper().ToString();

            Hashtable htinsert = new Hashtable();
            DataTable dtinsert = new DataTable();
            DataTable dt = new DataTable();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            htinsert.Add("@Trans", "INSERT");
            htinsert.Add("@Subprocess_Number", SubProcessnaumber);
            htinsert.Add("@Client_Id", clientid);
            htinsert.Add("@Sub_ProcessName", SubProcessname);
            htinsert.Add("@Sub_Process_Email", txt_SubProcess_Email.Text);
            htinsert.Add("@Inserted_By", userid);
            htinsert.Add("@Inserted_date", date);
            htinsert.Add("@status", "True");
            dtinsert = dataaccess.ExecuteSP("Sp_Client_SubProcess", htinsert);
            model1.Hide();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New Sub Process Added Sucessfully')</script>", false);
            // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script> alert('New Client Added Sucessfully')</script>;", false);
            
            ddl_ClientName.SelectedIndex = 0;
            txt_SubProcessName.Text = "";
            txt_ClientNumber.Text = "";
            txt_SubProcessNumber.Text = "";
            GridviewbindSubProcess();
            GetMaximumClientNumber();
            GetMaximumSubprocessNumber();

        }
        else if (btn_Save.Text == "Edit Sub Process")
        {
            model1.Show();
            int clientid = int.Parse(ddl_ClientName.SelectedValue.ToString());
            int SubProcessnaumber = Convert.ToInt32(txt_SubProcessNumber.Text);
            string SubProcessname = txt_SubProcessName.Text.ToUpper().ToString();

            Hashtable htupdate = new Hashtable();
            DataTable dtupdate = new DataTable();
            DataTable dt = new DataTable();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            int roleid = int.Parse(ViewState["sid"].ToString());
            htupdate.Add("@Trans", "UPDATE");
            htupdate.Add("@Subprocess_Id", roleid);
            htupdate.Add("@Subprocess_Number", SubProcessnaumber);
            htupdate.Add("@Client_Id", clientid);
            htupdate.Add("@Sub_ProcessName", SubProcessname);
            htupdate.Add("@Sub_Process_Email", txt_SubProcess_Email.Text);
            htupdate.Add("@Inserted_By", userid);
            htupdate.Add("@Inserted_date", date);
            htupdate.Add("@status", "True");
            dtupdate = dataaccess.ExecuteSP("Sp_Client_SubProcess", htupdate);
            GridviewbindSubProcess();
            btn_Save.Text = "Add New Sub Process";
            //ddl_ClientName.SelectedIndex = 0;
            txt_SubProcessName.Text = "";

            GetMaximumClientNumber();
            GetMaximumSubprocessNumber();
            model1.Hide();
        }
        clear();
        DivView.Visible = true;
        Divcreate.Visible = false;
        lblhead.Text = "View Clients";
        GridviewbindSubProcess();
    }
    protected void GridviewbindSubProcess()
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Client_SubProcess", htselect);
        if (dtselect.Rows.Count > 0)
        {
            grd_SubProcess.Visible = true;
            grd_SubProcess.DataSource = dtselect;
            grd_SubProcess.DataBind();
            

        }
        else
        {
            grd_SubProcess.Visible = true;
            grd_SubProcess.DataSource = null;
            grd_SubProcess.EmptyDataText = "No Sub Process Added";
            grd_SubProcess.DataBind();

        }
        model1.Hide();
    }
    protected void GridviewbindSubProcess(int clientid)
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "SELECTCLIENTWISE");
        htselect.Add("@Client_Id",clientid);
        dtselect = dataaccess.ExecuteSP("Sp_Client_SubProcess", htselect);
        if (dtselect.Rows.Count > 0)
        {
            grd_SubProcess.Visible = true;
            grd_SubProcess.DataSource = dtselect;
            grd_SubProcess.DataBind();


        }
        else
        {
            grd_SubProcess.Visible = true;
            grd_SubProcess.DataSource = null;
            grd_SubProcess.EmptyDataText = "No Sub Process Added";
            grd_SubProcess.DataBind();

        }
        model1.Hide();
    }
    protected void grd_SubProcess_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = grd_SubProcess.SelectedRow;
        Label lblSubprocessid = (Label)row.FindControl("lblSubprocessid");
        ViewState["sid"] = lblSubprocessid.Text;
        txt_SubProcessNumber.Text = row.Cells[1].Text;
        txt_ClientNumber.Text = row.Cells[2].Text;
        txt_SubProcess_Email.Text = row.Cells[5].Text;
        DdlbindClients();
        if (ddl_ClientName.Items.FindByText(row.Cells[3].Text).Value != null)
        {

            ddl_ClientName.Items.FindByText(row.Cells[3].Text).Selected = true;
        }
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
        txt_SubProcessName.Text = row.Cells[4].Text;
        htselect.Add("@Trans", "SELECTSUBPROCESSWISE");
        htselect.Add("@Subprocess_Id", ViewState["sid"].ToString());
        dtselect = dataaccess.ExecuteSP("Sp_Client_SubProcess", htselect);
        
        if (dtselect.Rows[0]["Modifiedby"].ToString() != "")
        {
            lbl_Record_Addedby.Text = dtselect.Rows[0]["Modifiedby"].ToString();
            lbl_Record_AddedDate.Text = dtselect.Rows[0]["Modified_Date"].ToString();
        }
        else if (dtselect.Rows[0]["Modifiedby"].ToString() == "")
        {
            lbl_Record_Addedby.Text = dtselect.Rows[0]["Insertedby"].ToString();
            lbl_Record_AddedDate.Text = dtselect.Rows[0]["Inserted_date"].ToString();
        }


        btn_Save.Text = "Edit Sub Process";
        lblhead.Text = "Edit Sub Process";
        Divcreate.Visible = true;
        DivView.Visible = false;
        model1.Hide();
    }
    protected void grd_SubProcess_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_SubProcess.PageIndex = e.NewPageIndex;
        GridviewbindSubProcess();
    }

    protected void grd_SubProcess_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }

    }
    protected void grd_SubProcess_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int subprocessid = int.Parse(grd_SubProcess.DataKeys[e.RowIndex].Values["Subprocess_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Subprocess_Id", subprocessid);
        dtdelete = dataaccess.ExecuteSP("Sp_Client_SubProcess", htdelete);
        GridviewbindSubProcess();
        model1.Hide();
    }
    protected void ddl_ClientWiseSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_ClientWiseSearch.SelectedIndex > 0 && ddl_ClientWiseSearch.SelectedValue=="ALL")
        {

            GridviewbindSubProcess();
            

        }
        else if (ddl_ClientWiseSearch.SelectedIndex > 0 && ddl_ClientWiseSearch.SelectedValue != "ALL")
        {

            GridviewbindSubProcess(int.Parse(ddl_ClientWiseSearch.SelectedValue));
        }
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
       
        //GetMaximumSubprocessNumber();
        Divcreate.Visible = true;
        DivView.Visible = false;
        lblhead.Text = "Add New Sub Process";
        clear();
        txt_ClientNumber.Text = "";
    }
    protected void News_Click(object sender, EventArgs e)
    {
        Divcreate.Visible = false;
        DivView.Visible = true;
        lblhead.Text = "View Sub Process";
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void clear()
    {
        model1.Show();
        ddl_ClientName.SelectedIndex = 0;
        txt_SubProcessName.Text = "";
        txt_SubProcess_Email.Text = "";
        txt_SubProcessNumber.Text = "";
       
       // GetMaximumSubprocessNumber();
        lbl_Record_Addedby.Text = Empname;
        lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        model1.Hide();
    }
    protected void Validation1()
    {
        Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        ht.Add("@Trans", "SELECT");
        dt = dataaccess.ExecuteSP("Sp_Client_SubProcess", ht);
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            string DtOrderType = (dt.Rows[i]["Sub_ProcessName"].ToString()).ToLower();

            string OrderType = (txt_SubProcessName.Text).ToLower();
            if (DtOrderType == OrderType && btn_Save.Text != "Edit Sub Process")
            {
                duplicate = "Duplicate Data";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Sup Process Name Already Exists ')</script>", false);
                return;
            }
        }
    }
}