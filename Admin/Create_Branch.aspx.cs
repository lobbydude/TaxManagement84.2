using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Net;
using System.IO;

public partial class Admin_Create_Order_Type : System.Web.UI.Page
{
    string imgName, strimgnm;
    byte[] img;
    public string imagenme = "";
    Commonclass cc = new Commonclass();
    DataAccess dataAccess = new DataAccess();
    string qryString = null;
    DataTable dt = new DataTable();
    public Hashtable hsforSP = new Hashtable();
    
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
    int Branch_ID;

    string BranchBankid;
   
    string Empname;
    string duplicate;
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
            Divcreate.Visible = false;
            DivView.Visible = true;
            lblhead.Text = "View Branch";
          
            lbl_RecordAddedOn0.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            lbl_RecordAddedBy0.Text = Empname;
           
            dbc.BindCountry(ddl_Branch_country);
            dbc.BindCompany(ddl_Company);
            LoadGrid();
          //  dbc.BindState(ddl_company_state);
            if (ddl_Branch_country.SelectedIndex > 0)
            {
                dbc.BindState1(ddl_Branch_state, int.Parse(ddl_Branch_country.SelectedValue));
            }
            if (ddl_Branch_state.SelectedIndex > 0)
            {
                dbc.BindDistrict(ddl_Branch_district, int.Parse(ddl_Branch_state.SelectedValue.ToString()));
            }


            lbl_branch_id.Text = "";
        }
    }
    protected void ViewGrid()
    {
        model1.Show();
        if (Branch_ID != 0)
        {
            Hashtable hsforSP = new Hashtable();
            DataRow dr = null;
            string Checked;
            hsforSP.Add("@Trans", "SELECT");
            hsforSP.Add("@Branch_ID", Branch_ID);
            dt = dataAccess.ExecuteSP("Sp_Branch", hsforSP);
            dr = dt.NewRow();
            lbl_branch_id.Text = Branch_ID.ToString();
            int sample=int.Parse(dt.Rows[0]["State_Address_ID"].ToString());
            ddl_Company.SelectedValue = dt.Rows[0]["Company_Id"].ToString();
            txt_Branchname.Text = dt.Rows[0]["Branch_Name"].ToString();
            txt_Branch_Code.Text = dt.Rows[0]["Branch_Code"].ToString();
            ddl_Branch_country.SelectedValue = dt.Rows[0]["Country_ID"].ToString();
            ddl_Branch_state.SelectedValue = dt.Rows[0]["State_Address_ID"].ToString();
            ddl_Branch_district.SelectedValue = dt.Rows[0]["District_Id"].ToString();
            txt_Branch_address.Text = dt.Rows[0]["Branch_Address"].ToString();
            txt_Branch_city.Text = dt.Rows[0]["Branch_City"].ToString();
            txt_Branch_email.Text = dt.Rows[0]["Branch_Email"].ToString();
            txt_Branch_fax.Text = dt.Rows[0]["Branch_Fax"].ToString();
            txt_Branch_phono.Text = dt.Rows[0]["Branch_Phone"].ToString();
            txt_branch_Pincode.Text = dt.Rows[0]["Branch_Pincode"].ToString();
            txt_Branch_website.Text = dt.Rows[0]["Branch_Web"].ToString();
            if (dt.Rows[0]["Modifiedby"].ToString() != "")
            {
                lbl_RecordAddedBy0.Text = dt.Rows[0]["Modifiedby"].ToString();
                lbl_RecordAddedOn0.Text = dt.Rows[0]["Modified_Date"].ToString();
            }
            else if (dt.Rows[0]["Modifiedby"].ToString() == "")
            {
                lbl_RecordAddedBy0.Text = dt.Rows[0]["Insertedby"].ToString();
                lbl_RecordAddedOn0.Text = dt.Rows[0]["Instered_Date"].ToString();
            }
            Checked = dt.Rows[0]["SetDefault"].ToString();
            if (Checked == "True")
            {
                ChkDefault.Checked = true;
            }
            else if (Checked == "False")
            {
                ChkDefault.Checked = false;
            }
        }
        else if (Branch_ID == 0)
        {
            Clear();
        }
        model1.Hide();
    }
  
    private bool Validation()
    {
        if (txt_Branchname.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script>alert('Enter Branch Name');</script>", false);
         
            return false;
        }
        return true;
    }
    protected void Clear()
    {
        model1.Show();
        txt_Branchname.Text = "";
        lbl_branch_id.Text = "";
        txt_Branch_Code.Text = "";
        txt_Branch_address.Text = "";
        txt_Branch_city.Text = "";
        txt_Branch_Code.Text = "";
        txt_Branch_email.Text = "";
        txt_Branch_fax.Text = "";
        txt_Branch_phono.Text = "";
        txt_branch_Pincode.Text = "";
        txt_Branch_website.Text = "";
       
        ddl_Branch_district.SelectedValue = "SELECT";
        ddl_Branch_country.SelectedValue = "SELECT";
        ddl_Branch_state.SelectedValue = "SELECT";
        ChkDefault.Checked = false;
        lbl_RecordAddedBy0.Text = Empname;
        lbl_RecordAddedOn0.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        model1.Hide();
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        if (ChkDefault.Checked == true)
        {
            hsforSP.Add("@Trans", "ChkDefault");
            dt = dataAccess.ExecuteSP("Sp_Branch", hsforSP);
            hsforSP.Clear();
        }

        try
        {
            if (lbl_branch_id.Text == "" && Validation() != false)
            {
                model1.Show();
                hsforSP.Add("@Trans", "INSERT");
                //hsforSP.Add("@Company_Id", txt_companyname.Text);
                hsforSP.Add("@Company_Id", ddl_Company.SelectedValue);
                hsforSP.Add("@Branch_Name", txt_Branchname.Text);
                hsforSP.Add("@Branch_Code", txt_Branch_Code.Text);
                hsforSP.Add("@Branch_Address", txt_Branch_address.Text);
                hsforSP.Add("@Branch_Country", ddl_Branch_country.SelectedValue);
                hsforSP.Add("@Branch_State", ddl_Branch_state.SelectedValue);
                hsforSP.Add("@Branch_District", ddl_Branch_district.SelectedValue);
                hsforSP.Add("@Branch_City", txt_Branch_city.Text);
                hsforSP.Add("@Branch_Pincode", txt_branch_Pincode.Text);
                hsforSP.Add("@Branch_Phone", txt_Branch_phono.Text);
                hsforSP.Add("@Branch_Fax", txt_Branch_fax.Text);
                hsforSP.Add("@Branch_Email", txt_Branch_email.Text);
                hsforSP.Add("@Branch_Web", txt_Branch_website.Text);
                hsforSP.Add("@Branch_Chk_Default", ChkDefault.Checked);
                hsforSP.Add("@Inserted_By", userid);
                hsforSP.Add("@Inserted_date", DateTime.Now);
                //hsforSP.Add("@Modified_By", supportContractStartDate);
                //hsforSP.Add("@Modified_Date", supportContractEndDate);
                //hsforSP.Add("@status", endofSupportLife);
                dt = dataAccess.ExecuteSP("Sp_Branch", hsforSP);
                model1.Hide();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Branch Created Sucessfully')</script>", false);
                Clear();
              
            }
            else if (lbl_branch_id.Text != "")
            {
                //Update
                model1.Show();
                hsforSP.Add("@Trans", "UPDATE");
                //hsforSP.Add("@Company_Id", txt_companyname.Text);
                hsforSP.Add("@Company_Id", ddl_Company.SelectedValue);
                hsforSP.Add("@Branch_ID", lbl_branch_id.Text);
                hsforSP.Add("@Branch_Name", txt_Branchname.Text);
                hsforSP.Add("@Branch_Code", txt_Branch_Code.Text);
                hsforSP.Add("@Branch_Address", txt_Branch_address.Text);
                hsforSP.Add("@Branch_Country", ddl_Branch_country.SelectedValue);
                hsforSP.Add("@Branch_State", ddl_Branch_state.SelectedValue);
                hsforSP.Add("@Branch_District", ddl_Branch_district.SelectedValue);
                hsforSP.Add("@Branch_City", txt_Branch_city.Text);
                hsforSP.Add("@Branch_Pincode", txt_branch_Pincode.Text);
                hsforSP.Add("@Branch_Phone", txt_Branch_phono.Text);
                hsforSP.Add("@Branch_Fax", txt_Branch_fax.Text);
                hsforSP.Add("@Branch_Email", txt_Branch_email.Text);
                hsforSP.Add("@Branch_Web", txt_Branch_website.Text);
                hsforSP.Add("@Branch_Chk_Default", ChkDefault.Checked);
                // hsforSP.Add("@Inserted_By", lblusername.Text);
                //hsforSP.Add("@Inserted_date", IsSupportContracted);
                hsforSP.Add("@Modified_By", userid);
                hsforSP.Add("@Modified_Date", DateTime.Now);
                //hsforSP.Add("@status", endofSupportLife);
                dt = dataAccess.ExecuteSP("Sp_Branch", hsforSP);
                model1.Hide();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Branch Update Sucessfully')</script>", false);
                Clear();
              
            }
            Divcreate.Visible = false;
            DivView.Visible = true;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('" + ex + "')</script>", false);
        }
    }
    protected void ddl_Branch_country_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Branch_country.SelectedIndex > 0)
        {
            dbc.BindState1(ddl_Branch_state, int.Parse(ddl_Branch_country.SelectedValue.ToString()));
        }
    }
    protected void ddl_Branch_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Branch_state.SelectedIndex > 0)
        {
            dbc.BindDistrict(ddl_Branch_district, int.Parse(ddl_Branch_state.SelectedValue.ToString()));
        }
    }
   
  
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        lbl_branch_id.Text = "";
        Divcreate.Visible = true;
        DivView.Visible = false;
       Clear();
       lblhead.Text = "Add Branch";
       btn_Save.Text = "Add Branch";
       lbl_RecordAddedBy0.Text = Empname;
       lbl_RecordAddedOn0.Text = DateTime.Now.ToString();
       
    }
    protected void News_Click(object sender, EventArgs e)
    {

        Divcreate.Visible = false;
        DivView.Visible = true;
        LoadGrid();
       
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void LoadGrid()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "SELECTGRID");

        dt = dataAccess.ExecuteSP("Sp_Branch", ht);
        if (dt.Rows.Count >= 0)
        {
            gv_Branch.Visible = true;
            gv_Branch.DataSource = dt;
            gv_Branch.DataBind();

        }
        model1.Hide();
    }
    protected void gv_Branch_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = gv_Branch.SelectedRow;
        Label lbl_branch_id = (Label)row.FindControl("lbl_Branch_id");

        lbl_branch_id.Text = lbl_branch_id.Text.ToString();
        Branch_ID = int.Parse(lbl_branch_id.Text.ToString());
        ViewGrid();
        if (ddl_Branch_country.SelectedIndex > 0)
        {
            dbc.BindState1(ddl_Branch_state, int.Parse(ddl_Branch_country.SelectedValue));
        }
        if (ddl_Branch_state.SelectedIndex > 0)
        {
            dbc.BindDistrict(ddl_Branch_district, int.Parse(ddl_Branch_state.SelectedValue.ToString()));
        }
        Divcreate.Visible = true;
        DivView.Visible = false;
        lblhead.Text = "Edit Branch";
        btn_Save.Text = "Edit Branch";
        model1.Hide();
    }
    protected void gv_Branch_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int id = int.Parse(gv_Branch.DataKeys[e.RowIndex].Values["Branch_ID"].ToString());
        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Sure you want Delete this Record'); </script>", false);
        hsforSP.Add("@Trans", "DELETE");
        hsforSP.Add("@Branch_ID", id);
        dt = dataAccess.ExecuteSP("Sp_Branch", hsforSP);
        int count = dt.Rows.Count;
        model1.Hide();
        LoadGrid();

    }
 protected void txt_Order_Type_TextChanged(object sender, EventArgs e)
 {
  
 }


 //protected void btn_upload_Click(object sender, EventArgs e)
 //{
 //    string fname = fileup_comapny_logo.FileName;
 //    imgName = fileup_comapny_logo.FileName;
 //    img = fileup_comapny_logo.FileBytes;
 //    Session["imgempphoto"] = img;
 //    // ViewState["imgempphoto"] = img;
 //    StartUpLoad();
 //}
 //private void StartUpLoad()
 //{
 //    imgName = fileup_comapny_logo.FileName;
 //    strimgnm = imgName;
 //    string imgPath = imgName;
 //    //int imgSize = Asyncfileup_comapny_logo.PostedFile.ContentLength;
 //    if (fileup_comapny_logo.PostedFile != null && fileup_comapny_logo.PostedFile.FileName != "")
 //    {
 //        if (fileup_comapny_logo.PostedFile.ContentLength > 652000000)
 //        {
 //            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
 //        }
 //        else
 //        {
 //            string empimagename = "Image.jpg";
 //            HttpPostedFile myFile = fileup_comapny_logo.PostedFile;
 //            int nFileLen = myFile.ContentLength;
 //            imagenme = empimagename;
 //            if (nFileLen == 0)
 //            {
 //                return;
 //            }
 //            // Check file extension (must be JPG)
 //            if (System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpg")
 //            {
 //                return;
 //            }
 //            else
 //            {
 //                myFile.SaveAs(MapPath(System.IO.Path.GetFileName(imagenme).ToLower().ToString()));
 //                // empimage.ImageUrl = System.IO.Path.GetFileName(imagenme).ToLower().ToString();
 //            }
 //        }
 //    }
 //}
}
