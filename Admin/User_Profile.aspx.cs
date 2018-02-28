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
using System.Net.Mail;

public partial class Admin_User_Profile : System.Web.UI.Page
{
    string imgName, strimgnm;
    byte[] img;
    public string imagenme = "";
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    Checkboxbindclass chk = new Checkboxbindclass();
    int userroleid; int? userid;
    int countuserid;
    string Empname;
    string user_Photo;
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
            user_Photo = Session["User_Photo"].ToString();
        }
        if (!IsPostBack)
        {

            Get_Userdetails();
        }


    }
    protected void Get_Userdetails()
    {
      
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new DataTable();
        htuser.Add("@Trans", "USER_IDWISE");
        htuser.Add("@User_id",userid);
        dtuser = dataaccess.ExecuteSP("Sp_User", htuser);
        if (dtuser.Rows.Count > 0)
        {

            lbl_Company_Name.Text = dtuser.Rows[0]["Company_Name"].ToString();
            Labelbranch_name.Text = dtuser.Rows[0]["Branch_Name"].ToString();
            lbl_User_Profile_Name.Text = dtuser.Rows[0]["Employee_Name"].ToString();
            lbl_user_Name.Text = dtuser.Rows[0]["User_Name"].ToString();
            lbl_User_Role.Text = dtuser.Rows[0]["Role_Name"].ToString();
            lbl_user_Mobile.Text = dtuser.Rows[0]["Mobileno"].ToString();
            lbl_user_Email.Text = dtuser.Rows[0]["Email"].ToString();
            if (user_Photo == "0")
            {
                emp_image.ImageUrl =  "~/images/default-emp.jpg";
            }
            else
            {
                emp_image.ImageUrl = "~/Admin/UserHandler.ashx?User_id=" + userid.ToString();

            }
          

        }
       
    }
}