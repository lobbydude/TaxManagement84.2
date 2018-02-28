using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserControls_OKMessageBox : System.Web.UI.UserControl
{
    string User_Role_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnOk.OnClientClick = String.Format("fnClickOK('{0}','{1}')", btnOk.UniqueID, "");

        User_Role_Id = Session["Role_Id"].ToString();
        if (!IsPostBack)
        { 
        

        }
    }

    public void ShowMessage(string Message)
    {
        lblMessage.Text = Message;
        lblCaption.Text = "";
    
        mpext.Show();
    }

    public void ShowMessage(string Message, string Caption)
    {
        lblMessage.Text = Message;
        lblCaption.Text = Caption;
        if (Caption == "Success")
        {
            lblCaption.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'15px';top:10px");
            top_handle.Attributes.Add("style", "width:100%;height:22px;background:#000;text-align:center;vertical-align:middle");
            lblMessage.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'25px';top:10px");
            pop_body.Attributes.Add("style", "background-color:#25A741;height:130px");
            mpext.Show();
            btnOk.Text = "Ok";
        }
        if (Caption == "Warning")
        {
            lblCaption.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'15px';top:10px");
            top_handle.Attributes.Add("style", "width:100%;height:22px;background:#000;text-align:center;vertical-align:middle");
            lblMessage.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'25px';top:10px");
            pop_body.Attributes.Add("style", "background-color:#BD2727;height:130px");
            mpext.Show();
        }
        if (Caption == "Email Message")
        {
            lblCaption.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'15px';top:10px");
            top_handle.Attributes.Add("style", "width:100%;height:22px;background:#000;text-align:center;vertical-align:middle");
            lblMessage.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'25px';top:10px");
            pop_body.Attributes.Add("style", "background-color:#25A741;height:150px");
            mpext.Show();
            btnOk.Width = 130;
            btnOk.Text = "Go Login Page";
        }
       
        
    }
    public void ShowMessage(string Ticketno, string Message, string Caption)
    {
        lbl_ticketno.Text = Message;
        lblCaption.Text = Caption;
        lblMessage.Text = Ticketno;
        lblCaption.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'15px';top:10px");
        top_handle.Attributes.Add("style", "width:100%;height:22px;background:#000;text-align:center;vertical-align:middle");
        lblMessage.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'25px';top:10px");
        lbl_ticketno.Attributes.Add("style", "color:#fff;vertical-align:middle;font-family:'Segoe UI';font-size:'25px';top:10px");
        pop_body.Attributes.Add("style", "background-color:#25A741;height:130px");
      
        mpext.Show();
        btnOk.Text = "Ok";
       
    }
    
    private void Hide()
    {
        lblMessage.Text = "";
        lblCaption.Text = "";
        mpext.Hide();        
    }

   


    public void btnOk_Click(object sender, EventArgs e)
    {
        if (btnOk.Text == "Ok")
        {
            if (User_Role_Id == "1")
            {
                Response.Redirect("~/Tax_Admin_Home.aspx");
            }
            else if (User_Role_Id == "2")
            {

                Response.Redirect("~/Admin/Dashboard.aspx");
            }
        }
        else if (btnOk.Text == "Go Login Page")
        {
            Response.Redirect("~/Login.aspx");
        }

        else
        {
            OnOkButtonPressed(e);
        }
        
      
    }

    public delegate void OkButtonPressedHandler(object sender, EventArgs args);
    public event OkButtonPressedHandler OkButtonPressed;
    protected virtual void OnOkButtonPressed(EventArgs e)
    {
        if (OkButtonPressed != null)
            OkButtonPressed(btnOk, e);
    }
    
}

