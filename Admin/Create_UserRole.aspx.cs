using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;


public partial class Admin_Create_UserRole : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Emp_Name;
    protected void Page_Load(object sender, EventArgs e)
    {
        Emp_Name = Session["EmpName"].ToString();
        userid = int.Parse(Session["userid"].ToString());
        if (!IsPostBack)
        {

            Divcreate.Visible = false;
            DivView.Visible = true;
            GridviebindUserrole();
            lbl_RecordAddedOn.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            lbl_RecordAddedBy.Text = Emp_Name;
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        if (Validation() != false && btn_Save.Text == "Add Role")
        {
            model1.Show();
            string Rolename = txt_Role.Text.ToUpper().ToString();
         
            Hashtable htinsert = new Hashtable();
            DataTable dtinsert = new DataTable();
            DataTable dt = new DataTable();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            htinsert.Add("@Trans", "INSERT");
            htinsert.Add("@Role_Name", Rolename);
            htinsert.Add("@Inserted_By", userid);
            htinsert.Add("@Inserted_date", Convert.ToDateTime(DateTime.Now.ToString()));
            htinsert.Add("@status", "True");
            dtinsert = dataaccess.ExecuteSP("Sp_User_Role", htinsert);
          
            model1.Hide();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script> alert('Role Created Sucessfully')</script>;", false);
            GridviebindUserrole();
            btn_Save.Text = "Submit";
            txt_Role.Text = "";
        
        }
        else if (btn_Save.Text == "Update User Role")
        {
            model1.Show();
            string Rolename = txt_Role.Text.ToUpper().ToString();
          
            Hashtable htupdate = new Hashtable();
            DataTable dtupdate = new DataTable();
            DataTable dt = new DataTable();
            DateTime date = new DateTime();
            date = DateTime.Now;
            string dateeval = date.ToString("dd/MM/yyyy");
            int roleid = int.Parse(ViewState["rid"].ToString());
            htupdate.Add("@Trans", "UPDATE");
            htupdate.Add("@Role_Name", Rolename);
            htupdate.Add("@Role_Id", roleid);
            htupdate.Add("@Modified_By", userid);
            htupdate.Add("@Modified_Date", Convert.ToDateTime(DateTime.Now.ToString()));
            htupdate.Add("@status", "True");
            dtupdate = dataaccess.ExecuteSP("Sp_User_Role", htupdate);
            GridviebindUserrole();
            btn_Save.Text = "Submit";
            txt_Role.Text = "";
            model1.Hide();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script> alert('Role Update Sucessfully')</script>;", false);

        }
    }
    private bool Validation()
    {

        if (txt_Role.Text == "")
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script> alert('Enter Role Name')</script>;", false);
            txt_Role.BorderColor = System.Drawing.Color.Red;
            txt_Role.Focus();

            return false;


        }
        else
        {
            txt_Role.BorderColor = System.Drawing.Color.DarkBlue;

        }
        return true;


    }
    protected void GridviebindUserrole()
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_User_Role", htselect);
        if (dtselect.Rows.Count > 0)
        {
            grd_UserRole.Visible = true;
            grd_UserRole.DataSource = dtselect;
            grd_UserRole.DataBind();

        }
        else
        {
            grd_UserRole.Visible = true;
            grd_UserRole.DataSource = null;
            grd_UserRole.EmptyDataText = "No Roles Added";
            grd_UserRole.DataBind();

        }
        model1.Hide();

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
        htselect.Add("@Trans", "MAXUSERROLLNUMBER");
        dtselect = dataaccess.ExecuteSP("Sp_User_Role", htselect);
        txt_Role_ID.Text = dtselect.Rows[0]["MAXUSERROLLNUMBER"].ToString();
        //txt_Role_ID.Text = "";
        txt_Role.Text = "";
        model1.Hide();

    }
    protected void grd_UserRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = grd_UserRole.SelectedRow;
        ViewState["rid"] = row.Cells[1].Text;
        txt_Role.Text = row.Cells[2].Text;
        txt_Role_ID.Text = row.Cells[1].Text;
        Divcreate.Visible = true;
        DivView.Visible = false;
        lblhead.Text = "Add New User";
        btn_Save.Text = "Update User Role";
        model1.Hide();
    }
    protected void grd_UserRole_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int roleid = int.Parse(grd_UserRole.DataKeys[e.RowIndex].Values["Role_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Role_Id", roleid);
        dtdelete = dataaccess.ExecuteSP("Sp_User_Role", htdelete);
        GridviebindUserrole();
        model1.Hide();
    }
    protected void grd_UserRole_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }
  }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();
        htselect.Add("@Trans", "MAXUSERROLLNUMBER");
        dtselect = dataaccess.ExecuteSP("Sp_User_Role", htselect);
        txt_Role_ID.Text = dtselect.Rows[0]["MAXUSERROLLNUMBER"].ToString();
        Divcreate.Visible = true;
        DivView.Visible = false;
        txt_Role.Text = "";
        //txt_Role_ID.Text = "";
        lblhead.Text = "Add New User";
        btn_Save.Text="Add Role";
        model1.Hide();
    }
    protected void News_Click(object sender, EventArgs e)
    {

        Divcreate.Visible = false;
        DivView.Visible = true;
        GridviebindUserrole();

    }
}