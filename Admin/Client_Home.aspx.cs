using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Admin_Client_Home : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
    string duplicate;
    string User_Role_Id;
    protected void Page_Load(object sender, EventArgs e)
    {

        User_Role_Id = Session["Role_Id"].ToString();
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

            dbc.BindClientName(ddl_Client_Name);

        }
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {

        if (ddl_Client_Name.SelectedIndex > 0 && ddl_Client_SubProcess.SelectedIndex>0)
        {

            Session["client_Id"] = int.Parse(ddl_Client_Name.SelectedValue.ToString()); 
            Session["subProcess_id"] = int.Parse(ddl_Client_SubProcess.SelectedValue.ToString());
            Session["Role_Id"] = User_Role_Id.ToString();
            Response.Redirect("~/Admin/Admin_Dashboard.aspx");

        }
        else
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Please Select Client Name to Continue')</script>", false);
        }
    }
    protected void ddl_Client_Name_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Client_Name.SelectedValue != "0")
        {

            dbc.BindSubProcessName(ddl_Client_SubProcess,int.Parse(ddl_Client_Name.SelectedValue));
        }
    }
}