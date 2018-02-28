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


public partial class Admin_Rpt_ClientName_Invoice : System.Web.UI.Page
{
    DataAccess dataaccess = new DataAccess();
    DataTable dt = new DataTable();
    Hashtable ht = new Hashtable();
    int Subprocess_id, client_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }
        if (!IsPostBack)
        {
            LoadGrid();
        }
     
    }
    protected void LoadGrid()
    {
       
      //  int iRowcount = 0;
        ht.Add("@Client_Id", client_Id);
        ht.Add("@Sub_ProcessId", Subprocess_id);
        dt = dataaccess.ExecuteSP("Sp_Rpt_ClientName_Pending", ht);
        if (dt.Rows.Count > 0)
        {

            Grd_ClientName_Invoice.Visible = true;
            Grd_ClientName_Invoice.DataSource = dt;
            Grd_ClientName_Invoice.DataBind();
           // iRowcount = iRowcount + 1;
        }

    }
    protected void News_Click(object sender, EventArgs e)
    {

    }
    protected void Export_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Export_ClientName_Pending.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        Grd_ClientName_Invoice.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Admin_Dashboard.aspx");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
}