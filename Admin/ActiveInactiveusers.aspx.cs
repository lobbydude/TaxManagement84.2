using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

public partial class Users_ActiveInactiveusers : System.Web.UI.Page
{
    DataAccess data = new DataAccess();
    Commonclass common = new Commonclass();
    DropDownistBindClass dbc = new DropDownistBindClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (ddl_activeInactive.SelectedValue == "1")
            {

                GetActiveUsersDetails();

            }
            else if (ddl_activeInactive.SelectedValue == "2")
            {
                GetInactiveUsersDetails();
            }
            else if (ddl_activeInactive.SelectedValue == "3")
            {

                GetInactiveActiveUsersDetails();
            }



        }
    }
    protected void GetActiveUsersDetails()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        ht.Add("@Trans", "VIEWACTIVE");

        dt = data.ExecuteSP("Sp_User", ht);
        if (dt.Rows.Count > 0)
        {
            grd_Userdetails.DataSource = dt;
            grd_Userdetails.DataBind();

        }
        else
        {
            grd_Userdetails.DataSource = null;
            grd_Userdetails.EmptyDataText = "No Users Added ";
            grd_Userdetails.DataBind();
        }
        model1.Hide();
    }
    protected void GetInactiveUsersDetails()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        ht.Add("@Trans", "VIEWINACTIVE");
        dt = data.ExecuteSP("Sp_User", ht);
        if (dt.Rows.Count > 0)
        {
            grd_Userdetails.DataSource = dt;
            grd_Userdetails.DataBind();
            
        }
        else
        {
            grd_Userdetails.DataSource = null;
            grd_Userdetails.EmptyDataText = "No Users Added ";
            grd_Userdetails.DataBind();
        }
        model1.Hide();
    }
    protected void GetInactiveActiveUsersDetails()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        ht.Add("@Trans", "ALL");
        dt = data.ExecuteSP("Sp_User", ht);
        if (dt.Rows.Count > 0)
        {
            grd_Userdetails.DataSource = dt;
            grd_Userdetails.DataBind();

        }
        else
        {
            grd_Userdetails.DataSource = null;
            grd_Userdetails.EmptyDataText = "No Users Added ";
            grd_Userdetails.DataBind();
        }
        model1.Hide();
    }
    protected void grd_Userdetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        model1.Show();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //CheckBox chkTest = (CheckBox)sender;
            CheckBox chk = (CheckBox)e.Row.FindControl("CheckBox1");
            GridViewRow grdRow = (GridViewRow)chk.NamingContainer;
            if (chk.Checked == true)
            {
                grdRow.BackColor = System.Drawing.Color.LightSkyBlue;
            }
            else if (chk.Checked == false)
            {

                grdRow.BackColor = System.Drawing.Color.LightPink;
            }
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }
        model1.Hide();
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
        int index = row.RowIndex;
        CheckBox chkactive = (CheckBox)grd_Userdetails.Rows[index].FindControl("CheckBox1");
        Label lbluserid = (Label)grd_Userdetails.Rows[index].FindControl("lbluserid");
        int userid = int.Parse(lbluserid.Text);
        if (chkactive.Checked == true)
        {

            Hashtable htactive = new Hashtable();
            DataTable dt = new DataTable();
            htactive.Add("@Trans", "ACTIVE");
            htactive.Add("@User_id", lbluserid.Text);
            dt = data.ExecuteSP("Sp_User", htactive);



        }
        else if (chkactive.Checked == false)
        {
            Hashtable htinactive = new Hashtable();
            DataTable dt = new DataTable();
            htinactive.Add("@Trans", "INACTIVE");
            htinactive.Add("User_id", userid);
            dt = data.ExecuteSP("Sp_User", htinactive);

        }
        if (ddl_activeInactive.SelectedValue == "1")
        {

            GetActiveUsersDetails();

        }
        else if (ddl_activeInactive.SelectedValue == "2")
        {
            GetInactiveUsersDetails();
        }
        else if (ddl_activeInactive.SelectedValue == "3")
        {

            GetInactiveActiveUsersDetails();
        }
        model1.Hide();
    }
    protected void ddl_activeInactive_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_activeInactive.SelectedValue == "1")
        {

            GetActiveUsersDetails();

        }
        else if (ddl_activeInactive.SelectedValue == "2")
        {
            GetInactiveUsersDetails();
        }
        else if (ddl_activeInactive.SelectedValue == "3")
        {

            GetInactiveActiveUsersDetails();
        }

    }
    protected void grd_Userdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void grd_Userdetails_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}