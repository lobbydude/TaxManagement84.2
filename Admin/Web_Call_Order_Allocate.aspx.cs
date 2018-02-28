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


public partial class Admin_Web_Call_Order_Allocate : System.Web.UI.Page
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
    int client_Id, Subprocess_id;
    string Get_Orders_ToAllocate;
    string Session_OrderType;
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
            BRANCH_ID = int.Parse(Session["Branch_id"].ToString());
        }
        if (Session["client_Id"] != "" && Session["subProcess_id"] != "")
        {

            client_Id = int.Parse(Session["client_Id"].ToString());
            Subprocess_id = int.Parse(Session["subProcess_id"].ToString());


        }
        if (Session["Ordertype"] != "")
        {

            Session_OrderType = Session["Ordertype"].ToString();

            if (Session_OrderType == "Web/Call")
            {

                LblHeader.Text = "Web/Call Orders Allocation";

            }
            else if (Session_OrderType == "Mail/Fax")
            {
                LblHeader.Text = "Mail/Fax Order Allocation";

            }
            else if (Session_OrderType == "QC")
            {

                LblHeader.Text = "QC Orders Allocation";
            }
            else if (Session_OrderType == "Hold")
            {

                LblHeader.Text = "Client Hold Orders Allocation";
            }
            else if (Session_OrderType == "Clarification")
            {

                LblHeader.Text = "Clarification Orders Allocation";
            }
            else if (Session_OrderType == "Cancelled")
            {

                LblHeader.Text = "Cancelled Orders Allocation";
            }
            else if (Session_OrderType == "Completed")
            {

                LblHeader.Text = "Completed Orders Allocation";
            }
        }
        if (!IsPostBack)
        {

            PopulateTreeview();
            Get_Orders_ToAllocate = "CLientAndSubProcess";
            ViewState["Order_Allocate"] = Get_Orders_ToAllocate.ToString();
            Gridview_Bind_All_Orders();
            
            dbc.BindUserName(ddl_UserName);
            Restrict_Controls();
            btn_Allocate.CssClass = "WebButton";
            btn_Allocate.Enabled = false;
            dbc.BindClientName_Rpt(ddl_ClientName);
          
            //Bind_No_of_Allocating_Order();
           
        }
    }

    private void PopulateTreeview()
    {
        try
        {

            //get data from user 
            Hashtable htselect = new Hashtable();
            DataTable dtselect = new System.Data.DataTable();

            //if (Session_OrderType == "Web/Call")
            //{

            //    htselect.Add("@Trans", "INSERT_ALL_USER_ORDERS");

            //}
            //else if (Session_OrderType == "Mail/Fax")
            //{

            //    htselect.Add("@Trans", "INSERT_MAIL_FAX_USER_ORDERS");

            //}
            //else if (Session_OrderType == "QC")
            //{
            //    htselect.Add("@Trans", "INSERT_QC_USER_ORDERS");
            //}
            //else if (Session_OrderType == "Hold")
            //{

            //    htselect.Add("@Trans", "INSERT_HOLD_USER_ORDERS");
            //}
            //else if (Session_OrderType == "Clarification")
            //{

            //    htselect.Add("@Trans", "INSERT_CLARIFICATION_USER_ORDERS");
            //}
            //else if (Session_OrderType == "Cancelled")
            //{

            //    htselect.Add("@Trans", "INSERT_CANCELLED_USER_ORDERS");
            //}
            htselect.Add("@Trans", "INSERT_ALL_USER_ORDERS");
            dtselect = dataaccess.ExecuteSP("Sp_Order_Allocate", htselect);

            DataSet ds = new DataSet();
            DataTable dtparent = new DataTable();
            DataTable dtchild = new DataTable();
            dtparent = gen.FillParentTable();
            dtparent.TableName = "A";

            dtchild = gen.FillChildTable();
            dtchild.TableName = "B";

            ds.Tables.Add(dtparent);
            ds.Tables.Add(dtchild);

            ds.Relations.Add("Main_id", dtparent.Columns["Main_id"], dtchild.
                                                           Columns["Main_id"]);

            if (ds.Tables[0].Rows.Count > 0)
            {
                TreeView1.Nodes.Clear();

                foreach (DataRow masterRow in ds.Tables[0].Rows)
                {
                    TreeNode masterNode = new TreeNode((string)masterRow["Main_Name"],
                                         Convert.ToString(masterRow["Main_Id"]));
                    TreeView1.Nodes.Add(masterNode);
                    TreeView1.CollapseAll();
                    foreach (DataRow childRow in masterRow.GetChildRows("Main_id"))
                    {
                        TreeNode childNode = new TreeNode((string)childRow["User_Name"],
                                               Convert.ToString(childRow["Main_id"]));
                        masterNode.ChildNodes.Add(childNode);
                        childNode.Value = Convert.ToString(childRow["User_id"]);
                    }
                }
            }
            TreeView1.ExpandAll();
        }
        catch (Exception ex)
        {
            throw new Exception("Unable to populate treeview" + ex.Message);
        }
    }
    protected void Restrict_Controls()
    {



        if (grd_order_Allocated.Rows.Count > 0)
        {

          //  btn_Reallocate.CssClass = "Windowbutton";


            //btn_Reallocate.Enabled = true;


        }
        else
        {

           // btn_Reallocate.CssClass = "DropDown";
           // btn_Reallocate.Enabled = false;
        }

        if (txt_order_Number.Text != "")
        {
           // btn_Search.CssClass = "Windowbutton";


            //btn_Search.Enabled = true;

        }
        else
        {
            //btn_Search.CssClass = "DropDown";
           // btn_Search.Enabled = false;
        

        }

    }
    protected void Gridview_Bind_All_Orders()
    {
        

        Hashtable htget = new Hashtable();
        DataTable dtget = new System.Data.DataTable();
        Get_Orders_ToAllocate = ViewState["Order_Allocate"].ToString();
        if (Get_Orders_ToAllocate == "SubProcessWise")
        {
            if (Session_OrderType == "Web/Call")
            {
                htget.Add("@Trans", "GET_WEB_SEARCH_ORDERS_SUBPROCESS_WISE");
            }
            else if (Session_OrderType == "Mail/Fax")
            {
                htget.Add("@Trans", "GET_MAIL_FAX_SEARCH_ORDERS_SUBPROCESS_WISE");

            }
            else if (Session_OrderType == "QC")
            {
                htget.Add("@Trans", "GET_QC_ORDERS_SUBPROCESS_WISE");
            }
            else if (Session_OrderType == "Hold")
            {
                htget.Add("@Trans", "GET_CLIENT_HOLD_ORDERS_SUBPROCESS_WISE");
            }
            else if (Session_OrderType == "Clarification")
            {
                htget.Add("@Trans", "GET_CLARIFICATION_ORDERS_SUBPROCESS_WISE");
            }
            else if (Session_OrderType == "Cancelled")
            {
                htget.Add("@Trans", "GET_CANCELLED_ORDERS_SUBPROCESS_WISE");
            }
            else if (Session_OrderType == "Completed")
            {
                htget.Add("@Trans", "GET_COMPLETED_ORDERS_SUBPROCESS_WISE");
            }
        }
        else if (Get_Orders_ToAllocate == "ClientWise")
        {
            if (Session_OrderType == "Web/Call")
            {
                htget.Add("@Trans", "GET_WEB_SEARCH_ORDERS_CLIENT_WISE");
            }
            else if (Session_OrderType == "Mail/Fax")
            {
                htget.Add("@Trans", "GET_MAIL_FAX_SEARCH_ORDERS_CLIENT_WISE");

            }
            else if (Session_OrderType == "QC")
            {
                htget.Add("@Trans", "GET_QC_ORDERS_CLIENT_WISE");
            }
            else if (Session_OrderType == "Hold")
            {
                htget.Add("@Trans", "GET_CLIENT_HOLD_ORDERS_CLIENT_WISE");
            }
            else if (Session_OrderType == "Clarification")
            {
                htget.Add("@Trans", "GET_CLARIFICATION_ORDERS_CLIENT_WISE");
            }
            else if (Session_OrderType == "Cancelled")
            {
                htget.Add("@Trans", "GET_CANCELLED_ORDERS_CLIENT_WISE");
            }
            else if (Session_OrderType == "Completed")
            {
                htget.Add("@Trans", "GET_COMPLETED_ORDERS_CLIENT_WISE");
            }
        }
        else if (Get_Orders_ToAllocate == "CLientAndSubProcess")
        {
            if (Session_OrderType == "Web/Call")
            {

                htget.Add("@Trans", "GET__WEB_SEARCH_ORDERS_ALL_CLIENT_SUBPROCESS");
            }
            else if (Session_OrderType == "Mail/Fax")
            {
                htget.Add("@Trans", "GET__MAIL_FAX_ORDERS_ALL_CLIENT_SUBPROCESS");

            }
            else if (Session_OrderType == "QC")
            {
                htget.Add("@Trans", "GET__QC_ALL_CLIENT_SUBPROCESS");
            }
            else if (Session_OrderType == "Hold")
            {
                htget.Add("@Trans", "GET_CLIENT_HOLD_ALL_CLIENT_SUBPROCESS");
            }
            else if (Session_OrderType == "Clarification")
            {
                htget.Add("@Trans", "GET_CLARIFICATION_ALL_CLIENT_SUBPROCESS");
            }
            else if (Session_OrderType == "Cancelled")
            {
                htget.Add("@Trans", "GET_CANCELLED_ALL_CLIENT_SUBPROCESS");
            }
            else if (Session_OrderType == "Completed")
            {
                htget.Add("@Trans", "GET_COMPLETED_ALL_CLIENT_SUBPROCESS");
            }
        }
        htget.Add("@Sub_ProcessId", Subprocess_id);
        htget.Add("@Client_Id",client_Id);
        dtget = dataaccess.ExecuteSP("Sp_Order_Allocate", htget);
        if (dtget.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_order.DataSource = dtget;
            grd_order.DataBind();

        }
        else
        {

            grd_order.DataSource = null;
            grd_order.EmptyDataText = "No Orders Are Avilable to Allocate";
            grd_order.DataBind();

        }
    

    }
    protected void Gridview_Bind_Orders_Wise_Selected()
    {
        if (ViewState["User_Id"].ToString() != "")
        {

            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();

            //if (Session_OrderType == "Web/Call")
            //{

            //    htuser.Add("@Trans", "GET_WEB_SEARCH_ORDERS_USERWISE");
            //}
            //else if (Session_OrderType == "Mail/Fax")
            //{
            //    htuser.Add("@Trans", "GET_MAIL_FAX_SEARCH_ORDERS_USERWISE");
            //}
            //else if (Session_OrderType == "QC")
            //{
            //    htuser.Add("@Trans", "GET_QC_SEARCH_ORDERS_USERWISE");
            //}
            //else if (Session_OrderType == "Hold")
            //{
            //    htuser.Add("@Trans", "GET_CLIENT_HOLD_SEARCH_ORDERS_USERWISE");
            //}
            //else if (Session_OrderType == "Clarification")
            //{
            //    htuser.Add("@Trans", "GET_CLIENT_CLARIFICATION_SEARCH_ORDERS_USERWISE");
            //}
            //else if (Session_OrderType == "Cancelled")
            //{
            //    htuser.Add("@Trans", "GET_CLIENT_CANCELLED_SEARCH_ORDERS_USERWISE");
            //}
            htuser.Add("@Trans", "GET_ALL_ORDERS_USERWISE");
            
            htuser.Add("@User_Id", int.Parse(ViewState["User_Id"].ToString()));
            
            dtuser = dataaccess.ExecuteSP("Sp_Order_Allocate", htuser);
            if (dtuser.Rows.Count > 0)
            {
                //ex2.Visible = true;
                grd_order_Allocated.DataSource = dtuser;
                grd_order_Allocated.DataBind();

            }
            else
            {

                grd_order_Allocated.DataSource = null;
                grd_order_Allocated.EmptyDataText = "No Orders Are Avilable";
                grd_order_Allocated.DataBind();

            }
        }

    }
    protected void Gridview_Bind_Orders_SearchData()
    {
        if (txt_order_Number.Text!="")
        {

            Hashtable htuser = new Hashtable();
            DataTable dtuser = new System.Data.DataTable();
            if (Session_OrderType == "Web/Call")
            {
                htuser.Add("@Trans", "WEBSEARCH");
            }
            else if (Session_OrderType == "Mail/Fax")
            {
                htuser.Add("@Trans", "MAIL_ORDER_SEARCH");
            }
            else if (Session_OrderType == "QC")
            {
                htuser.Add("@Trans", "QC_ORDER_SEARCH");
            }
            else if (Session_OrderType == "Hold")
            {
                htuser.Add("@Trans", "CLIENT_HOLD_ORDER_SEARCH");
            }
            else if (Session_OrderType == "Clarification")
            {
                htuser.Add("@Trans", "CLIENT_CLARIFICATION_ORDER_SEARCH");
            }
            else if (Session_OrderType == "Cancelled")
            {
                htuser.Add("@Trans", "CLIENT_CANCELLED_ORDER_SEARCH");
            }
            else if (Session_OrderType == "Completed")
            {
                htuser.Add("@Trans", "CLIENT_COMPLETED_ORDER_SEARCH");
            }
            htuser.Add("@Order_Number", txt_order_Number.Text);
          
            dtuser = dataaccess.ExecuteSP("Sp_Order_Allocate", htuser);
            if (dtuser.Rows.Count > 0)
            {
                //ex2.Visible = true;
                grd_order_Allocated.DataSource = dtuser;
                grd_order_Allocated.DataBind();

            }
            else
            {

                grd_order_Allocated.DataSource = null;
                grd_order_Allocated.EmptyDataText = "No Orders Are Assigned to this user";
                grd_order_Allocated.DataBind();

            }
        }

    }
    protected void Bind_No_of_Allocating_Order()
    {
    
         if(TreeView1.SelectedNode.Text!="")
            {
            

            }
        else
         {
         
             lbl_count_order.Text="0";
         }
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TreeView1.SelectedNode.Text != "")
        {
            var selectedNode = TreeView1.SelectedNode;

            if (selectedNode.Parent == null)
            {
                int NODE = int.Parse(TreeView1.SelectedNode.Value);
                ViewState["SELECTD_MAIN_NODE"] = NODE.ToString();
                Gridview_Bind_All_Orders();
           
                Gridview_Bind_Orders_Wise_Selected();
                Restrict_Controls();
                btn_Allocate.CssClass = "WebButton";
                btn_Allocate.Enabled = true;
                Restrict_Controls();
            }
            else
            {

                lbl_allocated_user.Text = TreeView1.SelectedNode.Text;
                ViewState["User_Id"] = TreeView1.SelectedNode.Value;
                ViewState["User_Wise_Count"] = lbl_allocated_user.Text;
                Gridview_Bind_Orders_Wise_Selected();
                Restrict_Controls();
                btn_Allocate.CssClass = "WebButton";
                btn_Allocate.Enabled = true;
                CountCheckedRows(sender, e);

            }
        }
    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkTest = (CheckBox)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;

        //Label lblrowid = (Label)grdRow.FindControl("lblOrder_id");



        //if (chkTest.Checked == true)
        //{



        //}
        //if (chkTest.Checked == false)
        //{
        //    // grdRow.BackColor = System.Drawing.Color.Pink;


        //}
        CountCheckedRows( sender,  e);

        
    }
    protected void chkAllocatedSelect_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkTest = (CheckBox)sender;
        GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;

        //Label lblrowid = (Label)grdRow.FindControl("lblOrder_id");


    }

    protected void btn_Allocate_Click(object sender, EventArgs e)
    {

        if (ViewState["User_Id"] != "")
        {


            int allocated_Userid = int.Parse(ViewState["User_Id"].ToString());


            foreach (GridViewRow row in grd_order.Rows)
            {


                CheckBox chk = (CheckBox)row.FindControl("chkBxSelect");
               
                if (chk.Checked == true)
                {
                    
                    Label lbl_Order_Id = (Label)row.FindControl("lblOrder_id");
                    Label lbl_OrderType_Id = (Label)row.FindControl("lbl_OrderType_Id");
                    Label lbl_Orderstatus_Id = (Label)row.FindControl("lbl_order_status_id");
                    Label lbl_OrderTask_Id = (Label)row.FindControl("lblOrderTask_Id");
                    Hashtable htinsertrec = new Hashtable();
                    DataTable dtinsertrec = new System.Data.DataTable();
                    DateTime date = new DateTime();
                    date = DateTime.Now;
                    string dateeval = date.ToString("dd/MM/yyyy");
                    string time = date.ToString("hh:mm tt");

                    htinsertrec.Add("@Trans", "INSERT");
                    htinsertrec.Add("@Order_Id", lbl_Order_Id.Text);
                    htinsertrec.Add("@Order_Type", lbl_OrderType_Id.Text);
                    htinsertrec.Add("@Order_Status_Id",4);
                    htinsertrec.Add("@Order_Task_Id",lbl_OrderTask_Id.Text);
                    htinsertrec.Add("@User_Id", allocated_Userid);
                    htinsertrec.Add("@Assigned_Date", dateeval);
                    htinsertrec.Add("@Assigned_By", userid);
                    htinsertrec.Add("@Inserted_By", userid);
                    htinsertrec.Add("@Inserted_date", date);
                    htinsertrec.Add("@status", "True");
                    dtinsertrec = dataaccess.ExecuteSP("Sp_Order_Assignment", htinsertrec);

                    Hashtable htupdate = new Hashtable();
                    DataTable dtupdate = new System.Data.DataTable();
                    htupdate.Add("@Trans", "UPDATE_STATUS");
                    htupdate.Add("@Order_ID", lbl_Order_Id.Text);
                    htupdate.Add("@Order_Status", 4);
                    
                    htupdate.Add("@Modified_By", userid);
                    htupdate.Add("@Modified_Date", date);
                     dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);
                    Hashtable htupdatetask = new Hashtable();
                    DataTable dtupdatetask = new System.Data.DataTable();
                    htupdatetask.Add("@Trans", "UPDATE_TASK");
                    htupdatetask.Add("@Order_ID", lbl_Order_Id.Text);
                    htupdatetask.Add("@Order_Task",lbl_OrderTask_Id.Text);
                    dtupdatetask = dataaccess.ExecuteSP("Sp_Order", htupdatetask);

                
                    Gridview_Bind_All_Orders();
                    Gridview_Bind_Orders_Wise_Selected();
                    Restrict_Controls();
                    PopulateTreeview();
                    //TreeView1.SelectedNode.Value =ViewState["User_Id"].ToString();
                    lbl_allocated_user.Text = ViewState["User_Wise_Count"].ToString();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Allocated Sucessfully')</script>", false);

                   
                }
              
            }


        }
    }

    protected void CountCheckedRows(object sender, EventArgs e)
    {
        int count = 0;
        foreach (GridViewRow row in this.grd_order.Rows)
        {
            CheckBox chkId = (row.FindControl("chkBxSelect") as CheckBox);
            if (chkId.Checked)
            {
                count++;
            }
            this.lbl_count_order.Text = count.ToString();
        }
    }
    protected void btn_Refresh_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Web_Call_Order_Allocate.aspx");
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        if (txt_order_Number.Text != "")
        {
            Gridview_Bind_Orders_SearchData();
            txt_order_Number.Text = "";
           

        }
    }
    protected void btn_Reallocate_Click(object sender, EventArgs e)
    {

       

                foreach (GridViewRow row in grd_order_Allocated.Rows)
                {

                    int Reallocateduser = int.Parse(ddl_UserName.SelectedValue.ToString());

                   
                    CheckBox chk = (CheckBox)row.FindControl("chkAllocatedSelect");
                    if (chk.Checked == true)
                    {

                        Label lbl_Order_Id = (Label)row.FindControl("lblAllocatedOrder_id");
                        Label lbl_Allocated_Id = (Label)row.FindControl("lblAllocated_id");
                        Label lbl_Allocated_Userid = (Label)row.FindControl("Lbl_user_id");
                        Label lblAllocatedOrder_Type_id = (Label)row.FindControl("lblAllocatedOrder_Type_id");
                        Label lbl_Pending_Order_task_id = (Label)row.FindControl("lbl_Pending_Order_task_id");
                        Label lbl_Pending_Status_Id = (Label)row.FindControl("lbl_Pending_Status_Id");
                        int Allocated_Userid=int.Parse(lbl_Allocated_Userid.Text);
                        if (Allocated_Userid != Reallocateduser)
                        {

                            Hashtable htuprec = new Hashtable();
                            DataTable dtuprec = new System.Data.DataTable();
                            DateTime date = new DateTime();
                            date = DateTime.Now;
                            string dateeval = date.ToString("dd/MM/yyyy");
                            string time = date.ToString("hh:mm tt");

                            htuprec.Add("@Trans", "DELETE");
                            htuprec.Add("@Order_Id", lbl_Order_Id.Text);
                            htuprec.Add("@Assign_Id", lbl_Allocated_Id.Text);
                            htuprec.Add("@Modified_By", userid);
                            htuprec.Add("@Modified_Date", dateeval);
                            dtuprec = dataaccess.ExecuteSP("Sp_Order_Assignment", htuprec);


                            Hashtable htinsertrec = new Hashtable();
                            DataTable dtinsertrec = new System.Data.DataTable();
                           

                            htinsertrec.Add("@Trans", "INSERT");
                            htinsertrec.Add("@Order_Id", lbl_Order_Id.Text);
                            htinsertrec.Add("@Order_Type", lblAllocatedOrder_Type_id.Text);
                            htinsertrec.Add("@Order_Status_Id", lbl_Pending_Status_Id.Text);
                            htinsertrec.Add("@Order_Task_Id", lbl_Pending_Order_task_id.Text);
                            htinsertrec.Add("@User_Id", Reallocateduser);
                            htinsertrec.Add("@Assigned_Date", date);
                            htinsertrec.Add("@Assigned_By", userid);
                            htinsertrec.Add("@Modified_By", userid);
                            htinsertrec.Add("@Modified_Date", date);
                            htinsertrec.Add("@status", "True");
                            dtinsertrec = dataaccess.ExecuteSP("Sp_Order_Assignment", htinsertrec);

                            Hashtable htupdate = new Hashtable();
                            DataTable dtupdate = new System.Data.DataTable();
                            htupdate.Add("@Trans", "UPDATE_STATUS");
                            htupdate.Add("@Order_ID", lbl_Order_Id.Text);
                            htupdate.Add("@Order_Status", 4);
                            htupdate.Add("@Modified_By", userid);
                            htupdate.Add("@Modified_Date", dateeval);

                            dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);
                            Get_Orders_ToAllocate = ViewState["Order_Allocate"].ToString();
                            
                            
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Allocated and Reallocated User Should Not Same')</script>", false);
                        }
                    }

                }
                Gridview_Bind_All_Orders();
                Gridview_Bind_Orders_Wise_Selected();
                PopulateTreeview();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Reallocated Sucessfully')</script>", false);


        
        //else
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script> alert('Select User Name To Reallocate')</script>;", false);

        //}


    }
    protected void txt_order_Number_TextChanged(object sender, EventArgs e)
    {
        Restrict_Controls();

    }

    protected void ddl_ClientName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_ClientName.SelectedIndex != 0)
        {
            dbc.BindSubProcessName_Rpt(ddl_SubProcess, int.Parse(ddl_ClientName.SelectedValue.ToString()));
           
        }
        else if (ddl_ClientName.SelectedIndex == 0)
        {
            dbc.BindSubProcessName_Rpt(ddl_SubProcess, 0);
            ddl_SubProcess.SelectedIndex = 0;
        }
      
        Sort_Orders();
    }
    protected void ddl_SubProcess_SelectedIndexChanged(object sender, EventArgs e)
    {

        Sort_Orders();
          
      
    }

    public void Sort_Orders()
    {

       
            string Client = ddl_ClientName.SelectedValue.ToString();
            string SubProcess = ddl_SubProcess.SelectedValue.ToString();

            if ( SubProcess != "" && Client != "ALL" && SubProcess != "ALL")
            {

                Subprocess_id = int.Parse(ddl_SubProcess.SelectedValue.ToString());
                client_Id = int.Parse(ddl_ClientName.SelectedValue.ToString());
                Get_Orders_ToAllocate = "SubProcessWise";
                ViewState["Order_Allocate"] = Get_Orders_ToAllocate.ToString();
                Gridview_Bind_All_Orders();
            }
            else if ( Client != "ALL" && SubProcess == "ALL")
            {



                client_Id = int.Parse(ddl_ClientName.SelectedValue.ToString());
                Get_Orders_ToAllocate = "ClientWise";
                ViewState["Order_Allocate"] = Get_Orders_ToAllocate.ToString();
                Gridview_Bind_All_Orders();

            }
            else if (Client == "ALL" && SubProcess == "ALL")
            {


                Get_Orders_ToAllocate = "CLientAndSubProcess";
                ViewState["Order_Allocate"] = Get_Orders_ToAllocate.ToString();
                Gridview_Bind_All_Orders();


            }
        
    }
    protected void grd_order_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View_Order")
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
         
            Session["order_id"] = lbl_Order_ID.Text;
            Session["Order_Type"] = LblHeader.Text;
            Response.Redirect("~/Admin/Order_View.aspx");
        }
    }
    protected void grd_order_Allocated_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View_Order")
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            Label lbl_Order_ID = (Label)row.FindControl("lblAllocatedOrder_id");

            Session["order_id"] = lbl_Order_ID.Text;
            Session["Order_Type"] = LblHeader.Text;


            Response.Redirect("~/Admin/Order_View.aspx");
        }
    }


    protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
    {

    }
}