using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    int userid;
    string Empname;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {

            //Response.Redirect("~/Login.aspx");
        }
        else
        {

            userid = int.Parse(Session["userid"].ToString());
            Empname = Session["Empname"].ToString();
            lblusername.Text = Empname.ToString();
        }
        if (!IsPostBack)
        {


            Img_User.ImageUrl = "~/Admin/UserHandler.ashx?User_id=" + userid;
        }
       
    }
  
}
