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

public partial class Admin_Change_Password : System.Web.UI.Page
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

           
        }


    }
    protected void btn_New_Password_Click(object sender, EventArgs e)
    {
        Hashtable htCheck = new Hashtable();
        DataTable dtCheck = new DataTable();
        htCheck.Add("@Trans", "CHECKPASSWORD");
        htCheck.Add("@User_id", userid);
        htCheck.Add("@Password", txt_Old_password.Text);
        dtCheck = dataaccess.ExecuteSP("Sp_User", htCheck);
        if (dtCheck.Rows.Count < 1)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Wrong Old Password')</script>", false);
        }
        else
        {
            if (txt_New_password.Text.ToString() == txt_Conform_password.Text.ToString())
            {
                Hashtable ht = new Hashtable();
                DataTable dt = new DataTable();
                ht.Add("@Trans", "CHANGEPASSWORD");
                ht.Add("@User_id", userid);
                ht.Add("@Modified_By", userid);
                ht.Add("@Modified_Date", DateTime.Now);
                ht.Add("@NewPassword", txt_New_password.Text);
                dt = dataaccess.ExecuteSP("Sp_User", ht);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Password Changed successfully')</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Wrong Password Entered')</script>", false);
            }
        }
    }
    protected void txt_Old_password_TextChanged(object sender, EventArgs e)
    {
        //Hashtable htCheck = new Hashtable();
        //DataTable dtCheck = new DataTable();
        //htCheck.Add("@Trans", "CHECKPASSWORD");
        //htCheck.Add("@User_id", userid);
        //htCheck.Add("@Password", txt_Old_password.Text.ToString());
        //dtCheck = dataaccess.ExecuteSP("Sp_User", htCheck);
        //if (dtCheck.Rows.Count < 1)
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Wrong Password Entered')</script>", false);
        //    txt_Old_password.Focus();
        //}
        //else
        //{
        //    txt_New_password.Focus();
        //}
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        txt_New_password.Text = "";
        txt_Old_password.Text = "";
        txt_Conform_password.Text = "";
    }
}