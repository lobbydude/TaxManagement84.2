using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
public partial class Admin_Admin : System.Web.UI.MasterPage
{
    int userid;
    string Empname;
    string User_Role_Id;
    string Last_Login;
    Commonclass Comclass = new Commonclass();
    DataAccess Dataaccess = new DataAccess();
    int client_Id, Subprocess_id;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        User_Role_Id = Session["Role_Id"].ToString();
        if (Session["userid"] == null )
        {

            //Response.Redirect("~/Login.aspx");
        }
        else
        {

            userid = int.Parse(Session["userid"].ToString());
            Empname = Session["Empname"].ToString();
            lblusername.Text = Empname.ToString();
        }
      
        if (Session["LastLogin"] != "")
        {

            lastlogin.Text = Session["LastLogin"].ToString();

        }
        else
        {

            lastlogin.Text = DateTime.Now.ToString();
        }
        if (!IsPostBack)
        {


            Img_User.ImageUrl = "~/Admin/UserHandler.ashx?User_id=" + userid;
            User_Wise_Restrict();
           
        }
    }
    protected void User_Wise_Restrict()
    {


        if (User_Role_Id == "1")
        {

            li_users.Visible = true;
            limasters.Visible = true;
            liReports.Visible = true;
            liTax_Masters.Visible = true;
        }
        else if(User_Role_Id=="2")
        {
            li_users.Visible = false;
            limasters.Visible = false;
            liReports.Visible = false;
            liTax_Masters.Visible = false;

        }


    }
    //protected void Log_Out(object sender, EventArgs e)
    //{
    //    Update_LastLogin();
    //    Response.Redirect("~/Login.aspx");


    //}
    protected void Update_LastLogin()
    {

        Hashtable htuser = new Hashtable();
        DataTable dtuser = new DataTable();

        htuser.Add("@Trans", "UPDATE_LAST_LOGIN");
        htuser.Add("@Last_login", DateTime.Now);
        htuser.Add("@User_id", userid);
        dtuser = Dataaccess.ExecuteSP("Sp_User", htuser);
    }

    protected void lnk_Home_Click(object sender, EventArgs e)
    {

        if (User_Role_Id == "2")
        {
            Session["cn_id"] = client_Id.ToString();
            Session["s_id"] = Subprocess_id.ToString();
            Response.Redirect("~/Admin/Admin_Dashboard.aspx");
        }
        else if (User_Role_Id == "1")
        {

            Response.Redirect("~/Admin/Admin_Home.aspx");
        }
    }
  
}
