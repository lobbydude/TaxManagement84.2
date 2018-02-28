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

public partial class Gls_Gls_Tax_Order_Report : System.Web.UI.Page
{
    DataAccess dataaccess = new DataAccess();
    DataTable dt = new DataTable();
    Hashtable ht = new Hashtable();
    Genral gn = new Genral();
    int Subprocess_id, client_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        //{

           // client_Id = int.Parse(Session["client_Id"].ToString());
        if(!IsPostBack)
        {
            Subprocess_id = 4;
            LoadGrid();
        }
        
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {


        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Export_ClientName_Pending.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        grd_Orders.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void LoadGrid()
     {
        DataTable dtget = new DataTable();
        Hashtable htget = new Hashtable();

        int iRowcount = 0;
       // htget.Add("@Trans", "SELECT");
        htget.Add("@Subprocess_id", Convert.ToString(Subprocess_id));
        dtget = dataaccess.ExecuteSP("Sp_Gls_tax_order_Report", htget);
       // dt = dataaccess.ExecuteSP("Sp_Client_Gls_Tax_Order_Report", ht);
        if (dtget.Rows.Count > 0)
        {

            grd_Orders.Visible = true;
            grd_Orders.DataSource = dtget;
            grd_Orders.DataBind();
            // iRowcount = iRowcount + 1;
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
}