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
public partial class Admin_Order_Export : System.Web.UI.Page
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
    CultureInfo enGB;
    string createingpath;
    int client_Id, Subprocess_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        enGB = CultureInfo.CreateSpecificCulture("en-GB");
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
            
             Gridview_Bind_Orders_Export();
             Restrict_Controls();
         }

    }
    protected void Restrict_Controls()
    {

      
        if (grd_order.Rows.Count > 0)
        {

            btn_Export.CssClass = "WebButton";


            btn_Export.Enabled = true;
           

        }
        else
        {

            btn_Export.CssClass = "GridButton";


            btn_Export.Enabled = false;
           
        }
        
    }
    protected void Gridview_Bind_Orders_Export()
    {

        Hashtable htuser = new Hashtable();
        DataTable dtuser = new System.Data.DataTable();
        htuser.Add("@Trans", "ORDERS_TO_EXPORT");
       
        dtuser = dataaccess.ExecuteSP("Sp_Order", htuser);
        if (dtuser.Rows.Count > 0)
        {
            //ex2.Visible = true;
            grd_order.Visible = true;
            grd_order.DataSource = dtuser;
            grd_order.DataBind();

        }
        else
        {

            grd_order.DataSource = null;
            grd_order.EmptyDataText = "No Orders Are Avilable";
            grd_order.DataBind();

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



    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        // ModalPopupExtender1.Show();
        foreach (GridViewRow row in grd_order.Rows)
        {

            CheckBox chkeselect = (CheckBox)row.FindControl("chkBxSelect");

            if (chkeselect.Checked == true)
            {
                Label lbl_path = (Label)row.FindControl("lblorder_path");
                Label lbl_Order_Id = (Label)row.FindControl("lblOrder_id");
                Label lbl_Order_Number = (Label)row.FindControl("lblOrder_Number");
              //  string sourceFile = Server.MapPath(lbl_path.Text);

                //string sourcePath = sourceFile;
                //string path = Path.GetDirectoryName(sourcePath);

                //DateTime date1 = new DateTime();
                //date1 = DateTime.Now;
                //string dateeval1 = date1.ToString("dd-MM-yyyy", enGB);

                //string sourceDir = path;
                ////string backupDir = @"E:\Tax Order Files\" + dateeval1.ToString() + "";
                ////string backupDir = @"E:\Tax Order Files\" + dateeval1.ToString() +"\"lbl_Order_Number.Text"";
                //string sub = @"\";
                //string sub1=sub;
                //string dir=@"E:\Tax Order Files\" + dateeval1.ToString()+"";
                //string backupDir = dir + sub1.ToString();

                  // string Upath = "~/Export Report/" + Order_Id + "/" + ViewState["Order_Number"].ToString()+".pdf" + "";
                //DirectoryInfo di = new DirectoryInfo(backupDir);
                //if (di.Exists)
                //{
                //    //di.Delete(true);

                //    Directory.CreateDirectory(backupDir);
                //    createingpath = backupDir;
                //}
                //else if (!di.Exists)
                //{
                //    Directory.CreateDirectory(backupDir);
                //    createingpath = backupDir;
                //}

                //string sourcePath1 = path;
                //string targetPath = backupDir;
                //if (!Directory.Exists(targetPath))
                //{
                //    Directory.CreateDirectory(targetPath);
                //}
                //foreach (var srcPath in Directory.GetFiles(sourcePath1))
                //{
                //    //Copy the file from sourcepath and place into mentioned target path, 
                //    //Overwrite the file if same file is exist in target path
                //    File.Copy(srcPath, srcPath.Replace(sourcePath1, targetPath), true);
                //   // Directory.Delete(srcPath);
                //}
              

                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");
                Hashtable htupdate = new Hashtable();
                DataTable dtupdate = new System.Data.DataTable();
                htupdate.Add("@Trans", "UPDTAE_EXPORT");
                htupdate.Add("@Order_ID", lbl_Order_Id.Text);
                htupdate.Add("@Order_Status",6);
                htupdate.Add("@Modified_By", userid);
                htupdate.Add("@Modified_Date", dateeval);
                dtupdate = dataaccess.ExecuteSP("Sp_Order", htupdate);

                Gridview_Bind_Orders_Export();

                Restrict_Controls();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Order Exported Sucessfully')</script>", false);
            }
        }
    }





    protected void grd_order_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditDetails")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            Label lblProduct_Type_Id = (Label)row.FindControl("lblProduct_Type_Id");

            Label lbl_Order_ID = (Label)row.FindControl("lblOrder_id");
            Label lbl_Subprocess_Id = (Label)row.FindControl("lbl_PendigSubrocessid");
            Label lbl_Clientid = (Label)row.FindControl("lblPendingCustomer_Id");

            Session["order_id"] = lbl_Order_ID.Text;

            Session["Order_Type"] = "QC";
            Session["client_Id"] = lbl_Clientid.Text;
            Session["subProcess_id"] = lbl_Subprocess_Id.Text;


            if (lblProduct_Type_Id.Text == "1")
            {
                Response.Redirect("~/Tax_Entry/Tax_Entry.aspx");
            }
            else if (lblProduct_Type_Id.Text == "2")
            {

                Response.Redirect("~/Tax_Entry/Code_Violation.aspx");
            }

        }

    }
}