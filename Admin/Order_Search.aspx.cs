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


public partial class Admin_Order_Search : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    string Empname;
    int Count;
    Hashtable htselect = new Hashtable();
    DataTable dtselect = new DataTable();
    Genral gen = new Genral();
    int BRANCH_ID;
    string User_Role_Id;
    int client_Id, Subprocess_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        User_Role_Id = Session["Role_Id"].ToString();
        if (Session["userid"] == null)
        {

            Response.Redirect("~/Login.aspx");
        }
        else
        {

            userid = int.Parse(Session["userid"].ToString());
            Empname = Session["Empname"].ToString();
            BRANCH_ID = int.Parse(Session["Branch_id"].ToString());
        }
        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }
    }
    protected void Gridview_Bind_Orders()
    {
       

        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();
        htuser.Add("@Trans", "ORDER_PATH_SEARCH");
        htuser.Add("@Client_Order_Number", txt_Order_Number.Text);
        htuser.Add("@Sub_ProcessId",Subprocess_id);
        dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_Assigned_Orders.Visible = true;
            grd_Assigned_Orders.DataSource = dtuser;
            grd_Assigned_Orders.DataBind();

        }
        else
        {

            grd_Assigned_Orders.DataSource = null;
            grd_Assigned_Orders.EmptyDataText = "No Records Found";
            grd_Assigned_Orders.DataBind();

        }

    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        if (txt_Order_Number.Text != "")
        {

            Gridview_Bind_Orders();
        }
        

    }
    protected void txt_Order_Number_TextChanged(object sender, EventArgs e)
    {
        btn_Update_Click(sender, e);

    }
    protected void grd_Assigned_Orders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {


            Label lbl_order_filepath = (Label)e.Row.FindControl("lbl_order_doc_path");
            ImageButton imbtn_orderdoc = (ImageButton)e.Row.FindControl("imgbtndoc");

            if (lbl_order_filepath.Text != "" && lbl_order_filepath.Text != null && User_Role_Id=="1")
            {
              
                imbtn_orderdoc.Visible = true;
                imbtn_orderdoc.Enabled = true;
                
            }
            else
            {

                imbtn_orderdoc.Visible = false;
                imbtn_orderdoc.Enabled = false;
            }



        }



    }
    protected void grd_Assigned_Orders_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = grd_Assigned_Orders.SelectedRow;

        Label lbl_order_filepath = (Label)row.FindControl("lbl_order_doc_path");
        string filePath = lbl_order_filepath.Text;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
}