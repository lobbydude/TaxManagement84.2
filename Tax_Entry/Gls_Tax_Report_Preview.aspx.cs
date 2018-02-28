using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Web.UI.HtmlControls;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

public partial class Gls_Gls_Tax_Report_Preview : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    CustomerBowser browser = new CustomerBowser();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    ReportDocument rptDoc = new ReportDocument();
    ReportDocument subRepDoc = new ReportDocument();
    public string Connection = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString.ToString();
    string Order_Id;
    string Template;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["Param"] != null)
        //{

            if (Session["order_id"] != "")
            {
                 Order_Id = Session["order_id"].ToString();
                 Template = Session["Template"].ToString();
            }
            // Order_Id = Request.QueryString["Param"].ToString();
           
            System.Data.Common.DbConnectionStringBuilder builder = new System.Data.Common.DbConnectionStringBuilder();
            builder.ConnectionString = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
            string server = builder["Data Source"] as string;
            string database = builder["Initial Catalog"] as string;
            string UserID = builder["User ID"] as string;
            string password = builder["Password"] as string;
            //int OrderID = int.Parse(Session["OrderID"].ToString());
            //int ClintID = int.Parse(Session["ClientID"].ToString());
            // string LetterCase = Convert.ToString(Session["CaseLetter"].ToString());
            //int SubProcessID = int.Parse(Session["SubProcessID"].ToString());
            // string Trans = "OrderWise";

            //int ProcessID=1;

            TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            Tables CrTables;
            if (Template == "Template1")
            {
             
                rptDoc.Load(Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.rpt"));
            }
            else if (Template == "Template2")
            {

                rptDoc.Load(Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit_Temp2.rpt"));
            }

            // Order_Details_Page_1 Parameterhttp:
            rptDoc.SetParameterValue("@Order_ID", Order_Id);
            rptDoc.SetParameterValue("@Order_ID", Order_Id, "Notes");

            crConnectionInfo.ServerName = server;
            crConnectionInfo.DatabaseName = database;
            crConnectionInfo.UserID = UserID;
            crConnectionInfo.Password = password;
            CrTables = rptDoc.Database.Tables;
            foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
            {
                crtableLogoninfo = CrTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                CrTable.ApplyLogOnInfo(crtableLogoninfo);
            }

            foreach (ReportDocument sr in rptDoc.Subreports)
            {
                foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in sr.Database.Tables)
                {
                    crtableLogoninfo = CrTable.LogOnInfo;
                    crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                    CrTable.ApplyLogOnInfo(crtableLogoninfo);

                }
            }

            Session["rptDoc"] = rptDoc;
            rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.pdf"));
            // CrystalReportViewer1.ReportSource = rptDoc;
            MemoryStream oStream = default(MemoryStream);
            oStream = (MemoryStream)rptDoc.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.BinaryWrite(oStream.ToArray());
            Response.End();
            //RadPdfTableTruncate();
            //PdfView();
           

       // }


    }
    protected void RadPdfTableTruncate()
    {
        Hashtable Ht = new Hashtable();
        DataTable dt = new DataTable();
        Ht.Add("@Trans", "TruncateRad");
        dt = dataaccess.ExecuteSP("Sb_Rad_Pdf_Truncate", Ht);

    }
    protected void PdfView()
    {
        byte[] pdfData = System.IO.File.ReadAllBytes(Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.pdf"));

        //PdfWebControl1.CreateDocument("Document Name", pdfData);
        //PdfDocumentEditor DocumentEditor1 =
        //    this.PdfWebControl1.EditDocument();
        //PdfWebControl1.HideToolsMenu = true;
        //PdfWebControl1.HideSideBar = true;
        //PdfWebControl1.HideObjectPropertiesBar = true;
        //PdfWebControl1.HideThumbnails = true;
    }
}