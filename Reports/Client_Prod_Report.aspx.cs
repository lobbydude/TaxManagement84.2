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


public partial class Client_Prod_Report : System.Web.UI.Page
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
                //dbc.BindClientName_Report(ddl_Client);
                //dbc.BindOrderType_Report(ddl_Order_Type);
                //dbc.BindUserName_Report(ddl_UserName);
                //dbc.BindOrderTask_Report(ddl_Order_Task);
                //dbc.BindOrderStatus_Report(ddl_Order_Status);

                //if (ddl_Client.SelectedIndex > 0)
                //{
                //    dbc.BindSubProcessName_Report(ddl_SubClient, int.Parse(ddl_Client.SelectedValue.ToString()));

                //}
                //else
                //{

                //    ddl_SubClient.SelectedIndex = 0;
                //}

            }
        

    }
    protected void ddl_Client_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddl_Client.SelectedIndex > 0)
        //{
        //    dbc.BindSubProcessName_Report(ddl_SubClient, int.Parse(ddl_Client.SelectedValue.ToString()));

        //}
        //else
        //{

        //    ddl_SubClient.SelectedIndex = 0;
        //}
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string From_Date = txt_From_Date.Text;
        string Todate = txt_Todate.Text;
        //grd_Orders.DataSource = null;
        //grd_Orders.DataBind();
        Gridview_Bind_Orders();

  


    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Reports/User_Production_Report.aspx");
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        if (ViewState["Data"] != null || ViewState["Data"] != "")
        {
            dtgrid = (DataTable)ViewState["Data"];

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
        if (e.CommandName == "EditDetails")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");

            Session["order_id"] = lbl_Order_ID.Text;
            Session["Order_Type"] = "Report";
            Response.Redirect("~/Admin/Order_View.aspx");
        }
    }

  
    protected void rbtn_Completed_CheckedChanged(object sender, EventArgs e)
    {
        if (rbtn_Completed.Checked == true)
        {
            rdo_Pending.Checked = false;
            rbtn_All.Checked = false;

        }

    }
    protected void rbtn_All_CheckedChanged(object sender, EventArgs e)
    {
          if (rbtn_All.Checked == true)
        {
            rdo_Pending.Checked = false;
            rbtn_Completed.Checked = false;

        }
    }
    protected void rdo_Pending_CheckedChanged(object sender, EventArgs e)
    {
        
        if (rdo_Pending.Checked == true)
        {


            rbtn_Completed.Checked = false;
            rbtn_All.Checked = false;


        }
        
       
    }

    protected void Gridview_Bind_Orders()
    {

        if (txt_From_Date.Text != "" && txt_Todate.Text != "")
        {

            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            if (rdo_Pending.Checked == true)
            {
                htuser.Add("@Trans", "SELECT_ALL");

            }

            else if (rbtn_Completed.Checked == true)
            {
                htuser.Add("@Trans", "SELECT_COMPLETED");

            }
            else if (rbtn_All.Checked == true)
            {
                htuser.Add("@Trans", "GET_ALL_PEND_COMPLETED");

            }


            htuser.Add("@From_Date", txt_From_Date.Text);
            htuser.Add("@To_Date", txt_Todate.Text);

            dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
            ViewState["Data"] = dtuser;
            if (dtuser.Rows.Count > 0)
            {
                //ex2.Visible = true;
                grd_Orders.Visible = true;
                grd_Orders.DataSource = dtuser;
                grd_Orders.DataBind();

            }
            else
            {

                grd_Orders.DataSource = null;
                grd_Orders.EmptyDataText = "No Records Found";
                grd_Orders.DataBind();

            }

        }
        else
        {

            grd_Orders.DataSource = null;
            grd_Orders.EmptyDataText = "No Records Found";
            grd_Orders.DataBind();

        }

    }
    protected void grd_Orders_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grd_Orders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_Orders.PageIndex = e.NewPageIndex;
        Gridview_Bind_Orders();
    }
    protected void grd_Orders_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void btn_Clear_Click(object sender, EventArgs e)
    {
        txt_From_Date.Text = "";
        txt_Todate.Text = "";
        grd_Orders.DataSource = null;
        grd_Orders.DataBind();
    }
}