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
using System.Globalization;
using ClosedXML.Excel;


public partial class Reports_User_Production_Report : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
  
    DataTable dtsearch = new DataTable();
    DataTable dtgrid = new DataTable("Grid");
   
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
                dbc.BindClientName_Report(ddl_Client);
                dbc.BindOrderType_Report(ddl_Order_Type);
                dbc.BindUserName_Report(ddl_UserName);
                dbc.BindOrderTask_Report(ddl_Order_Task);
                dbc.BindOrderStatus_Report(ddl_Order_Status);

                if (ddl_Client.SelectedIndex > 0)
                {
                    dbc.BindSubProcessName_Report(ddl_SubClient, int.Parse(ddl_Client.SelectedValue.ToString()));

                }
                else
                {
                    dbc.BindSubProcessName_Report(ddl_SubClient, 0);
                    ddl_SubClient.SelectedIndex = 0;
                }

            }
        

    }
    protected void ddl_Client_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Client.SelectedIndex > 0)
        {
            dbc.BindSubProcessName_Report(ddl_SubClient, int.Parse(ddl_Client.SelectedValue.ToString()));

        }
        else
        {

            ddl_SubClient.SelectedIndex = 0;
        }
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string From_Date = txt_From_Date.Text;
        string Todate = txt_Todate.Text;
        string Client = ddl_Client.SelectedValue.ToString();
        string Sub_Client = ddl_SubClient.SelectedValue.ToString();
        string Order_Type = ddl_Order_Type.SelectedValue.ToString();
        string User_Name = ddl_UserName.SelectedValue.ToString();
        string Order_Task = ddl_Order_Task.SelectedValue.ToString();
        string Orde_Status = ddl_Order_Status.SelectedValue.ToString();

        Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "All");

        }
        else if (Client != "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "Client_Wise");
        }
        else if (Client != "ALL" && Sub_Client != "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "Client and Sub_Process_Wise");
        }
        else if (Client != "ALL" && Sub_Client == "ALL" && Order_Type != "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "Client_And_Order_Type");
        }
        else if (Client != "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name != "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "Cleint_and_UserName");
        }
        else if (Client != "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task != "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "Client_And_Order_Task");
        }
        else if (Client != "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status != "ALL")
        {

            ht.Add("@Trans", "Client_And_Order_Status");
        }
        else if (Client != "ALL" && Sub_Client != "ALL" && Order_Type != "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "Client_Sub_Client_Order_Type");
        }
        else if (Client != "ALL" && Sub_Client != "ALL" && Order_Type != "ALL" && User_Name != "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "SELECT_CLIENT_SUBPROCESS_ORDERTYPE_USER_NAME");
        }
        else if (Client != "ALL" && Sub_Client != "ALL" && Order_Type != "ALL" && User_Name != "ALL" && Order_Task != "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "CLIENT_SUB_CLINET_ORDER_TYPE_USER_NAME_TASK");
        }
        else if (Client != "ALL" && Sub_Client != "ALL" && Order_Type != "ALL" && User_Name != "ALL" && Order_Task != "ALL" && Orde_Status != "ALL")
        {

            ht.Add("@Trans", "CLIENT_SUB_CLINET_ORDER_TYPE_USER_NAME_TASK_STATUS");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type != "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "ORDER_TYPE");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type != "ALL" && User_Name != "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "ORDER_TYPE_USERNAME");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type != "ALL" && User_Name == "ALL" && Order_Task != "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "ORDER_TYPE_TASK");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type != "ALL" && User_Name != "ALL" && Order_Task != "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "ORDER_TYPE_USEER_NAME_TASK");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name != "ALL" && Order_Task == "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "USER_NAME");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name != "ALL" && Order_Task != "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "USER_NAME_TASK");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name != "ALL" && Order_Task == "ALL" && Orde_Status != "ALL")
        {

            ht.Add("@Trans", "USER_NAME_STATUS");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name != "ALL" && Order_Task != "ALL" && Orde_Status != "ALL")
        {

            ht.Add("@Trans", "USER_NAME_TASK_STATUS");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task != "ALL" && Orde_Status == "ALL")
        {

            ht.Add("@Trans", "TASK");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task != "ALL" && Orde_Status != "ALL")
        {

            ht.Add("@Trans", "TASK_STATUS");
        }
        else if (Client == "ALL" && Sub_Client == "ALL" && Order_Type == "ALL" && User_Name == "ALL" && Order_Task == "ALL" && Orde_Status != "ALL")
        {

            ht.Add("@Trans", "STATUS");
        }
     
          ht.Add("@Fromdate",From_Date);
          ht.Add("@Todate",Todate);
          ht.Add("@Client",Client);
          ht.Add("@Sub_Client",Sub_Client);
          ht.Add("@Order_Type",Order_Type);
          ht.Add("@Order_Status", Orde_Status);
          ht.Add("@Order_Task_Id ",Order_Task);
          ht.Add("@User_Id",User_Name);
          dt = dataaccess.ExecuteSP("Sp_User_Production_Report", ht);
          ViewState["data"] = dt;
          if (dt.Rows.Count > 0)
          {

              grd_Orders.DataSource = dt;
              grd_Orders.DataBind();


          }
          else
          {
              grd_Orders.DataSource = null;
              grd_Orders.EmptyDataText = "No Records Were Found";
              grd_Orders.DataBind();
              
          }

  


    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Reports/User_Production_Report.aspx");
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        if (ViewState["data"] != null || ViewState["data"] != "")
        {
            dtgrid = (DataTable)ViewState["data"];

            dtgrid.TableName = "DataGrid";
            using (XLWorkbook wb = new XLWorkbook())
            {

                wb.Worksheets.Add(dtgrid);

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=UserProductionReport.xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
    protected void grd_Orders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
        Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
   
        Session["order_id"] = lbl_Order_ID.Text;
        Session["Order_Type"] = "Report";
        Response.Redirect("~/Admin/Order_View.aspx");
    }
    protected void btn_Clear_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/User_Production_Report.aspx");
    }
}