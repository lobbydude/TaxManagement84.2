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

public partial class Admin_Orders_View : System.Web.UI.Page
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
    string OrderType = "";
    int client_Id, Subprocess_id;
    protected void Page_Load(object sender, EventArgs e)
    {

        OrderType = Session["OrderType"].ToString();
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
        if (!IsPostBack)
        {


            Gridview_Bind_Assigned_Orders(OrderType);
           
        }

    }
    protected void Gridview_Bind_Assigned_Orders(string ordertype)
    {
        if (OrderType == "WEB_ALLOCATED")
        {

            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_ALLOCATED_WEB_ORDERS");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }
        }
        else if(OrderType == "MAIL_ALLOCATED" )
        {
           Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_ALLOCATED_MAIL_ORDERS");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }

        }
        else if(OrderType == "QC_ORDERS_FOR_USER" )
        {
           Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_ALLOCATED_QC_ORDERS");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }

        }
         else if(OrderType == "ORDER_EXPORT" )
        {
           Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_ORDERS_EXPORT");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }

        }

        else if (OrderType == "WEB_ORDERS")
        {
            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_PENDING_WEB_ORDERS");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            htuser.Add("@User_Id",userid);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }

        }
        else if (OrderType == "MAIL_ORDERS")
        {
            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_PENDING_MAIL_ORDERS");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            htuser.Add("@User_Id", userid);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }

        }
        else if (OrderType == "QC_ORDERS")
        {
            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            htuser.Add("@Trans", "GET_PENDING_QC_ORDERS");
            htuser.Add("@Sub_ProcessId", Subprocess_id);
            htuser.Add("@User_Id", userid);
            dtuser = dataaccess.ExecuteSP("Sp_OrdersDetails_ForDashboard", htuser);
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
                grd_Assigned_Orders.EmptyDataText = "No Orders Are Avilable";
                grd_Assigned_Orders.DataBind();

            }

        }
    }
}