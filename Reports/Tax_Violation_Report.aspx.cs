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


public partial class Tax_Violation_Report : System.Web.UI.Page
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
        GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
        Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
   
        Session["order_id"] = lbl_Order_ID.Text;
        Session["Order_Type"] = "Report";
        Response.Redirect("~/Admin/Order_View.aspx");
    }

  
    protected void rbtn_Completed_CheckedChanged(object sender, EventArgs e)
    {
        if (rbtn_Code.Checked == true)
        {
            rbtn_Tax.Checked = false;
            rbtn_Hoa.Checked = false;

        }

    }
    protected void rbtn_All_CheckedChanged(object sender, EventArgs e)
    {
          if (rbtn_Hoa.Checked == true)
        {
            rbtn_Tax.Checked = false;
            rbtn_Code.Checked = false;

        }
    }
    protected void rdo_Pending_CheckedChanged(object sender, EventArgs e)
    {
        
        if (rbtn_Tax.Checked == true)
        {


            rbtn_Code.Checked = false;
            rbtn_Hoa.Checked = false;


        }
        
       
    }

    protected void Gridview_Bind_Orders()
    {

        if (txt_From_Date.Text != "" && txt_Todate.Text != "")
        {

            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            if (rbtn_Tax.Checked == true)
            {
                htuser.Add("@Trans", "SELECT_TAX_CERTIFICATE");

            }

            else if (rbtn_Code.Checked == true)
            {
                htuser.Add("@Trans", "CODE_VIOLATION");

            }
            


            htuser.Add("@From_Date", txt_From_Date.Text);
            htuser.Add("@To_Date", txt_Todate.Text);

            dtuser = dataaccess.ExecuteSP("Sp_Tax_Code_Violation_Report", htuser);
            ViewState["Data"] = dtuser;

            if (dtuser.Rows.Count > 0)
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
                        if (rbtn_Tax.Checked == true)
                        {
                            Response.AddHeader("content-disposition", "attachment;filename=TaxCertificate.xlsx");
                        }
                        else if (rbtn_Code.Checked == true)
                        {
                            Response.AddHeader("content-disposition", "attachment;filename=Code_Violation.xlsx");
                        } 
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
            //if (dtuser.Rows.Count > 0)
            //{
            //    //ex2.Visible = true;
            //    grd_Orders.Visible = true;
            //    grd_Orders.DataSource = dtuser;
            //    grd_Orders.DataBind();

            //}
            //else
            //{

            //    grd_Orders.DataSource = null;
            //    grd_Orders.EmptyDataText = "No Records Found";
            //    grd_Orders.DataBind();

            //}

        }
        //else
        //{

        //    grd_Orders.DataSource = null;
        //    grd_Orders.EmptyDataText = "No Records Found";
        //    grd_Orders.DataBind();

        //}

    }
    protected void grd_Orders_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grd_Orders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void grd_Orders_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void rbtn_Tax_CheckedChanged(object sender, EventArgs e)
    {
        rbtn_Code.Checked = false;
        
        rbtn_Hoa.Checked = false;

        rbtn_Mortgage.Checked = false;

    }
    protected void rbtn_Code_CheckedChanged(object sender, EventArgs e)
    {
        rbtn_Tax.Checked = false;

        rbtn_Hoa.Checked = false;

        rbtn_Mortgage.Checked = false;

    }
    protected void rbtn_Hoa_CheckedChanged(object sender, EventArgs e)
    {
        rbtn_Tax.Checked = false;

        rbtn_Code.Checked = false;

        rbtn_Mortgage.Checked = false;
    }
    protected void rbtn_Mortgage_CheckedChanged(object sender, EventArgs e)
    {
        rbtn_Tax.Checked = false;

        rbtn_Code.Checked = false;

        rbtn_Hoa.Checked = false;

    }
}