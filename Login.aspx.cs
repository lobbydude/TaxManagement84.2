using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
public partial class Login2 : System.Web.UI.Page
{
    Commonclass Comclass = new Commonclass();
    DataAccess Dataaccess = new DataAccess();

    string Confirmusername, ConfirmPassword, Userid, RollName ;
    string EmployeeId;
   static  string userid;
    string Username, password;
    string Empname;
    string USerRoleid;
    int Branch_id;
    string last_login_datetime;
    string strIpAddress;
    protected string msUserID = "";
    string User_Photo;
    protected string msSessionCacheValue = "";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            txt_username.Focus();
        }



    }
    

    


    protected void btn_login_Click(object sender, EventArgs e)
    {
        Hashtable htmastuser = new Hashtable();
        DataTable dtmstuser = new DataTable();
        string Username = txt_username.Text.ToString();
        string password = txt_password.Text.ToString();

        htmastuser.Add("@Trans", "MSTUSER");
        htmastuser.Add("@User_Name", Username);
        dtmstuser = Dataaccess.ExecuteSP("Sp_User", htmastuser);
        Username = txt_username.Text.ToString();
        password = txt_password.Text.ToString();
        if (dtmstuser.Rows.Count > 0)
        {
            Confirmusername = dtmstuser.Rows[0]["User_Name"].ToString();
            ConfirmPassword = dtmstuser.Rows[0]["Password"].ToString();
            Empname = dtmstuser.Rows[0]["Employee_Name"].ToString();
            userid = dtmstuser.Rows[0]["User_id"].ToString();
            USerRoleid = dtmstuser.Rows[0]["User_RoleId"].ToString();
            Branch_id = int.Parse(dtmstuser.Rows[0]["Branch_ID"].ToString());
            last_login_datetime = dtmstuser.Rows[0]["Last_login"].ToString();
            User_Photo = dtmstuser.Rows[0]["User_Photo"].ToString();
        }
        else
        {
            txt_username.Text = "";
            txt_username.Focus();
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Username Does Not Exist');", true);
        }

        if (Confirmusername == Username && ConfirmPassword == password)
        {

            Session["masteruser"] = Username.ToString();
            Session["userid"] = userid.ToString();
            Session["Empname"] = Empname.ToString();
            Session["Branch_id"] = Branch_id.ToString();
            Session["Role_Id"] = USerRoleid.ToString();
            Session["LastLogin"] = last_login_datetime.ToString();
            Session["client_Id"] = "0";
            Session["subProcess_id"] ="0";
            Session["cn_id"] = "0";
            Session["s_id"] = "0";
            Session["User_Photo"] = User_Photo;
            string userID = userid;
            string userIP = Request.UserHostAddress;
          

            IpAddress();
            string sKey = txt_username.Text + txt_password.Text + ViewState["strIpAddress"];
            ViewState["check"] = sKey.ToString();
            string sUser = Convert.ToString(Cache[sKey]);
            if (ViewState["check"] == sKey)
            {
            
                Session["user"] = txt_username.Text + txt_password.Text;
              

                if (USerRoleid=="2")
                {
                    Response.Redirect("~/Tax_Admin_Home.aspx");
                }
                else if(USerRoleid=="1")
                {

                    Response.Redirect("~/Tax_Admin_Home.aspx");
                }
            }
            else
            {
          
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('This User id is Alerday used by Some one');", true);
        
                return;
            }


          


        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Wrong User Name or Password');", true);
            
        }


        Hashtable htuser = new Hashtable();
        DataTable dtuser = new DataTable();
        Username = txt_username.Text.ToString();
        password = txt_password.Text.ToString();
        htuser.Add("@Trans", "SELUSER");
        htuser.Add("@User_Name", Username);
        dtuser = Dataaccess.ExecuteSP("Sp_User", htuser);
        if (dtuser.Rows.Count > 0)
        {
            Confirmusername = dtuser.Rows[0]["User_Name"].ToString();
            userid = dtuser.Rows[0]["User_id"].ToString();
        }
        else
        {
            txt_username.Text = "";
            txt_username.Focus();
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Username Does Not Exist');", true);
        }



        Hashtable htpassword = new Hashtable();
        DataTable dtpassword = new DataTable();
        htpassword.Add("@Trans", "SELPASS");
        htpassword.Add("@User_Name", Username);
        htpassword.Add("@Password", password);
        htpassword.Add("@User_id", userid);

        dtpassword = Dataaccess.ExecuteSP("Sp_User", htpassword);
        if (dtpassword.Rows.Count > 0)
        {

            ConfirmPassword = dtpassword.Rows[0]["Password"].ToString();
            Userid = dtpassword.Rows[0]["User_id"].ToString();

        }
        else
        {


            txt_password.Text = "";
            txt_password.Focus();
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Invalid Password');", true);
            return;

        }
        DataTable dt = new DataTable();
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "USERWISE");
        ht.Add("@User_id", Userid);
        Session["userid"] = userid.ToString();
        dt = Dataaccess.ExecuteSP("Sp_User", ht);
        if (dt.Rows.Count > 0)
        {
            RollName = dt.Rows[0]["Role_Name"].ToString();
            Session["Employee_Id"] = dt.Rows[0]["Employee_Id"].ToString();

        }

    }
    public string IpAddress()
    {
      
        strIpAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (strIpAddress == null)
        {
            strIpAddress = Request.ServerVariables["REMOTE_ADDR"];
        }
        ViewState["strIpAddress"] = strIpAddress.ToString();
        return strIpAddress;
    }
   
}