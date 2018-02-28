using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    CustomerBowser browser = new CustomerBowser();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string s = browser.GetWebpage("http://www.google.com");
            LiteralControl lc = new LiteralControl(s);
            this.PlaceHolder1.Controls.Add(lc);

            
        }
    }
}