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

public partial class Reports_Clients_Lereta_Lereta_Tax_Order_Preview : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    CustomerBowser browser = new CustomerBowser();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    ReportDocument rptDoc = new ReportDocument();
    ReportDocument subRepDoc = new ReportDocument();
   // public string Connection = ConfigurationManager.ConnectionStrings["TicketRisingSystemConnectionString"].ConnectionString.ToString();
    string Order_Id;
    string Request_Type_Id, Client_Id, Status_Id, Priority_Id, Trans, User_Id, Fromdate, Todate, branch_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        rptDoc.Load(Server.MapPath("~/Reports/Clients/Lereta/Rpt_Tax_Information_Client_Lereta.rpt"));

        // Order_Details_Page_1 Parameterhttp:
        rptDoc.SetParameterValue("@Order_Id", Order_Id);
        rptDoc.SetParameterValue("@Order_Id", Order_Id, "Current Year-Header");
        rptDoc.SetParameterValue("@Order_Id", Order_Id, "Annual-Year");
        rptDoc.SetParameterValue("@Order_Id", Order_Id, "Prior-Year");

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
        //rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~/Reports/Clients/GLS/Rpt_Tax_Information_Client_Granit.pdf"));
       // CrystalReportViewer1.ReportSource = rptDoc;
        MemoryStream oStream = default(MemoryStream);
        oStream = (MemoryStream)rptDoc.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/pdf";
        Response.BinaryWrite(oStream.ToArray());
        Response.End();
      //  RadPdfTableTruncate();
      //  PdfView();

        Session["order_id"] = Order_Id.ToString();
        Response.Redirect("~/Gls/Gls_Tax_Report_Preview.aspx");

    }
}