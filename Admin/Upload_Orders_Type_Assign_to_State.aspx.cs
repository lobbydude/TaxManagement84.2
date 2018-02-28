using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class Admin_Upload_Orders : System.Web.UI.Page
{
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    string Path1;
    string strFileType = "";
    int userid;
    string Empname;
      Hashtable htselect = new Hashtable();
    DataTable dtselect = new DataTable();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_Submit.Visible = false;
        btn_Cancel.Visible = false;
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
          //  dbc.BindSubProcessNumber(ddl_Subprocess);
        }
    }
    protected void btn_ImportExcel_Click(object sender, EventArgs e)
    {
            strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
            if (fileuploadExcel.HasFile)
            {
                if ((strFileType.Trim() == ".xls") || (strFileType.Trim() == ".xlsx"))
                {
                    string filename = fileuploadExcel.FileName;
                    fileuploadExcel.SaveAs(Server.MapPath(filename));
                    ImportToGrid(Server.MapPath(filename));
                }
                else
                {
                    lblMessage.Text = "Sorry! The Extension format is Incorrect111";
                    return;
                }
            }
        }      
    
    protected void Gv_Subprocess_Load()
    {
        //Hashtable ht = new Hashtable();
        //DataTable dt=new DataTable();
        //ht.Add("@Trans", "SELECT");
        //dt = dataaccess.ExecuteSP("Sp_Client_SubProcess", ht);
        //if (dt.Rows.Count > 0)
        //{
        //    Grd_Assign_order_Type_to_State.DataSource = dt;
        //    Grd_Assign_order_Type_to_State.DataBind();
        //}
       
    }
    protected void ImportToGrid(String path)
    {
        
        DataTable dt = new DataTable();
        Path1 = path;
        OleDbConnection MyConnection = null;
        DataSet DtSet = null;
        OleDbDataAdapter MyCommand = null;
        strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
        //use below connection string if your excel file .xslx 2007 format
        if (strFileType.Trim() == ".xls")
        {
            MyConnection = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0; Data Source='" + path + "';Extended Properties=Excel 8.0;");
        }
        else if (strFileType.Trim() == ".xlsx")
        {
            MyConnection = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + path + "';Extended Properties=Excel 12.0;");
        }
        else
        {
            lblMessage.Text = "Sorry! The Extension format is Incorrect";
            return;
        }
        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [Sheet1$]", MyConnection);
        DtSet = new System.Data.DataSet();
        MyCommand.Fill(DtSet, "[Sheet1]");
        dt = DtSet.Tables[0];
        MyConnection.Close();
        if (dt.Rows.Count > 0)
        {
            Grd_Assign_order_Type_to_State.DataSource = dt;
            Grd_Assign_order_Type_to_State.DataBind();
            btn_Submit.Visible = true;
            btn_Cancel.Visible = true;
        }
        if (System.IO.File.Exists(path))
        {
            System.IO.File.Delete(path);
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
     {
         DateTime date = new DateTime();
         date = DateTime.Now;
         Hashtable ht= new Hashtable();
         DataTable dt = new DataTable();
         int Order_type_to_state_count = 0;
        for (int i = 0; i < Grd_Assign_order_Type_to_State.Rows.Count; i++)
        { 
            string orderNo = Grd_Assign_order_Type_to_State.Rows[i].Cells[0].Text.ToString();
            int State_Id = 0;
            int Order_Type_Id = 0;
            ht.Add("@Trans", "Select_Sate");
            ht.Add("@State", Grd_Assign_order_Type_to_State.Rows[i].Cells[1].Text.ToString());
            dt = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht);
            if(dt.Rows.Count>0)
            {
                State_Id =int.Parse(dt.Rows[0]["State_ID"].ToString());
                Hashtable ht_Update = new Hashtable();
                DataTable dt_Update = new DataTable();
                ht_Update.Add("@Trans", "Update_Sate");
                ht_Update.Add("@State_ID", State_Id);
                ht_Update.Add("@State", Grd_Assign_order_Type_to_State.Rows[i].Cells[1].Text.ToString());
                ht_Update.Add("@Abbreviation", Grd_Assign_order_Type_to_State.Rows[i].Cells[2].Text.ToString());
                dt_Update = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Update);
             // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New State Updated')</script>", false); 
            }
            else 
            {
                Hashtable ht_Insert = new Hashtable();
                DataTable dt_Insert = new DataTable();
                ht_Insert.Add("@Trans", "Insert_Sate");
                ht_Insert.Add("@State", Grd_Assign_order_Type_to_State.Rows[i].Cells[1].Text.ToString());
                ht_Insert.Add("@Abbreviation", Grd_Assign_order_Type_to_State.Rows[i].Cells[2].Text.ToString());
                dt_Insert = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Insert);
                // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New State Inserted')</script>", false); 
             }
                Hashtable ht_Select = new Hashtable();
                DataTable dt_Select = new DataTable();
                ht_Select.Add("@Trans", "Select_Order_Type");
                ht_Select.Add("@Order_Type", Grd_Assign_order_Type_to_State.Rows[i].Cells[3].Text.ToString());
                dt_Select = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Select);
                if (dt_Select.Rows.Count <= 0)
                {
                    Hashtable ht_Insert = new Hashtable();
                    DataTable dt_Insert = new DataTable();
                    ht_Insert.Add("@Trans", "Insert_Order_Type");
                    ht_Insert.Add("@Order_Type", 0);
                    ht_Insert.Add("@Inserted_By", userid);
                    ht_Insert.Add("@Instered_Date", DateTime.Now);
                    dt_Insert = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Insert);
                   // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New Order type Inserted')</script>", false); 
                }
                else
                {
                    Order_Type_Id=int.Parse(dt_Select.Rows[0]["Order_Type_ID"].ToString());
                    Hashtable ht_Update_order_Type = new Hashtable();
                    DataTable dt_Update_Order_Type = new DataTable();
                    ht_Update_order_Type.Add("@Trans", "Update_Order_Type");
                    ht_Update_order_Type.Add("@Order_Type_ID",dt_Select.Rows[0]["Order_Type_ID"]);
                    ht_Update_order_Type.Add("@Order_Type", Grd_Assign_order_Type_to_State.Rows[i].Cells[3].Text.ToString());
                    ht_Update_order_Type.Add("@Modified_By", userid);
                    ht_Update_order_Type.Add("@Modified_Date", DateTime.Now);
                    dt_Update_Order_Type = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Update_order_Type);
                }
                ht_Select.Clear();
                dt_Select.Clear();
                ht_Select.Add("@Trans", "Select_Assign_Order_Type_To_State");
                ht_Select.Add("@Order_Type", Grd_Assign_order_Type_to_State.Rows[i].Cells[3].Text.ToString());
                ht_Select.Add("@State", Grd_Assign_order_Type_to_State.Rows[i].Cells[1].Text.ToString());
                dt_Select = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Select);
                if (dt_Select.Rows.Count > 0)
                {
                    Hashtable ht_Update_Assign_Order_Type_To_State = new Hashtable();
                    DataTable dt_Update_Assign_Order_Type_To_State = new DataTable();
                    ht_Update_Assign_Order_Type_To_State.Add("@Trans", "Update_Assign_Order_Type_To_State");
                    ht_Update_Assign_Order_Type_To_State.Add("@Order_Type_State_Assign_Id", dt_Select.Rows[0]["Order_Type_State_Assign_Id"].ToString());
                    ht_Update_Assign_Order_Type_To_State.Add("@State_ID", State_Id);
                    ht_Update_Assign_Order_Type_To_State.Add("@Modified_By", userid);
                    ht_Update_Assign_Order_Type_To_State.Add("@Modified_Date", DateTime.Now);
                    ht_Update_Assign_Order_Type_To_State.Add("@Order_Type_ID", dt_Select.Rows[0]["Order_Type_ID"]);
                    dt_Update_Assign_Order_Type_To_State = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Update_Assign_Order_Type_To_State);
                 }
                else
                {
                    Hashtable ht_Insert_Assign_Order_Type_To_State = new Hashtable();
                    DataTable dt_Insert_Assign_Order_Type_To_State = new DataTable();
                    ht_Insert_Assign_Order_Type_To_State.Add("@Trans", "Insert_Assign_Order_Type_To_State");
                    ht_Insert_Assign_Order_Type_To_State.Add("@State_ID", State_Id);
                    ht_Insert_Assign_Order_Type_To_State.Add("@Order_Type_ID", Order_Type_Id);
                    ht_Insert_Assign_Order_Type_To_State.Add("@Inserted_By", userid);
                    ht_Insert_Assign_Order_Type_To_State.Add("@Instered_Date", DateTime.Now);
                    dt_Insert_Assign_Order_Type_To_State = dataaccess.ExecuteSP("Sp_Upload_Assign_Order_Type_To_State", ht_Insert_Assign_Order_Type_To_State);
                    Order_type_to_state_count = Order_type_to_state_count + 1;
                 }
                dt.Clear();
                ht.Clear();
        }
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('" + Order_type_to_state_count + " are Newely Assigned')</script>", false); 
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Page_Load(sender,e);
    }
    protected void Btn_ExampleExcel_Click(object sender, EventArgs e)
    {
        FileInfo file = new FileInfo(Server.MapPath("~/Uploads/Web call states - Taxes.xlsx"));
            if (file.Exists)
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=" + "Web call states - Taxes.xlsx");
                Response.AddHeader("Content-Type", "application/Excel");
                Response.ContentType = "application/vnd.xlsx";
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.WriteFile(file.FullName);
                Response.End();
            }
            else
            {
                Response.Write("This file does not exist.");
            }
       //  ExportToGrid(Server.MapPath("~/Uploads/Order_Excel.xls"));
    }
}