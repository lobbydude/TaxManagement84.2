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
    int Com_ID;
    DropDownistBindClass dbc = new DropDownistBindClass();
    int userid;
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
            LoadGrid();
            dbc.BindCountry(ddl_company_country);
            ViewGrid();
            //  dbc.BindState(ddl_company_state);
            if (ddl_company_country.SelectedIndex > 0)
            {
                dbc.BindState1(ddl_company_state, int.Parse(ddl_company_country.SelectedValue));
            }
            if (ddl_company_state.SelectedIndex > 0)
            {
                dbc.BindDistrict(ddl_company_district, int.Parse(ddl_company_state.SelectedValue.ToString()));
            }
            Divcreate.Visible = false;
            DivView.Visible = true;
            //lblhead.Text = "View Company";


            lbl_RecordAddedOn.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            lbl_RecordAddedBy.Text = Empname;
           
        }

       
       
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
       
        if (ChkDefault.Checked == true)
        {
            hsforSP.Add("@Trans", "ChkDefault");
            dt = dataAccess.ExecuteSP("Sp_Company", hsforSP);
            hsforSP.Clear();
        }
        img = (byte[])Session["imgempphoto"];
        try
        {
            if (ddl_company_country.SelectedValue != "SELECT" && ddl_company_state.SelectedValue != "SELECT" && ddl_company_district.SelectedValue != "SELECT")
            {
                
                if (lbl_company_id.Text == "" && Validation() != false)
                {
                    model1.Show();
                    //Insert
                    img = (byte[])Session["imgempphoto"];
                    hsforSP.Add("@Trans", "INSERT");
                    //hsforSP.Add("@Company_Id", txt_companyname.Text);
                    hsforSP.Add("@Company_Name", txt_companyname.Text);
                    hsforSP.Add("@Comp_slogan", txt_company_slogan.Text);
                    hsforSP.Add("@Comp_RegistrationNo", txt_company_registrationno.Text);
                    hsforSP.Add("@Comp_Address", txt_company_address.Text);
                    hsforSP.Add("@Comp_Country", ddl_company_country.SelectedValue);
                    hsforSP.Add("@Comp_State", ddl_company_state.SelectedValue);
                    hsforSP.Add("@Comp_District", ddl_company_district.SelectedValue);
                    hsforSP.Add("@Comp_City", txt_company_city.Text);
                    hsforSP.Add("@Comp_Pincode", txt_company_Pincode.Text);
                    hsforSP.Add("@Comp_Phone", txt_company_phono.Text);
                    hsforSP.Add("@Comp_Fax", txt_company_fax.Text);
                    hsforSP.Add("@Comp_Email", txt_company_email.Text);
                    hsforSP.Add("@Comp_Web", txt_company_website.Text);
                    hsforSP.Add("@Comp_Logo", img);
                    hsforSP.Add("@Com_SetDefault", ChkDefault.Checked);
                    hsforSP.Add("@Inserted_By", userid);
                  hsforSP.Add("@Inserted_date", DateTime.Now);
                    ////hsforSP.Add("@Modified_By", supportContractStartDate);
                    ////hsforSP.Add("@Modified_Date", supportContractEndDate);
                    ////hsforSP.Add("@status", endofSupportLife);

                    dt = dataAccess.ExecuteSP("Sp_Company", hsforSP);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Company Created Sucessfully')</script>", false);

                    clear();
                    model1.Hide();
                }

                else if (lbl_company_id.Text != "")
                {
                    model1.Show();
                    //Update
                    hsforSP.Add("@Trans", "UPDATE");
                    hsforSP.Add("@Company_Id",lbl_company_id.Text);
                    hsforSP.Add("@Company_Name", txt_companyname.Text);
                    hsforSP.Add("@Comp_slogan", txt_company_slogan.Text);
                    hsforSP.Add("@Comp_RegistrationNo", txt_company_registrationno.Text);
                    hsforSP.Add("@Comp_Address", txt_company_address.Text);
                    hsforSP.Add("@Comp_Country", ddl_company_country.SelectedValue);
                    hsforSP.Add("@Comp_State", ddl_company_state.SelectedValue);
                    hsforSP.Add("@Comp_District", ddl_company_district.SelectedValue);
                    hsforSP.Add("@Comp_City", txt_company_city.Text);
                    hsforSP.Add("@Comp_Pincode", txt_company_Pincode.Text);
                    hsforSP.Add("@Comp_Phone", txt_company_phono.Text);
                    hsforSP.Add("@Comp_Fax", txt_company_fax.Text);
                    hsforSP.Add("@Comp_Email", txt_company_email.Text);
                    hsforSP.Add("@Comp_Web", txt_company_website.Text);
                    hsforSP.Add("@Comp_Logo", img);
                    hsforSP.Add("@Com_SetDefault", ChkDefault.Checked);
                    // hsforSP.Add("@Inserted_By", Empname);
                   //  hsforSP.Add("@Inserted_date", DateTime.Now);
                    hsforSP.Add("@Modified_By", userid);
                    hsforSP.Add("@Modified_Date", DateTime.Now);
                    ////hsforSP.Add("@status", endofSupportLife);
                    dt = dataAccess.ExecuteSP("Sp_Company", hsforSP);
                    model1.Hide();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Company Updated Sucessfully')</script>", false);
                
                }
                clear();
                Divcreate.Visible = false;
                DivView.Visible = true;

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Country , State  And District')</script>", false);
            }
        }

        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('" + ex + "')</script>", false);
        }

        }

    protected void LoadGrid()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "SELECT");

        dt = dataAccess.ExecuteSP("Sp_Company", ht);
        if (dt.Rows.Count > 0)
        {
            gv_Company.Visible = true;
            gv_Company.DataSource = dt;
            gv_Company.DataBind();
        }

        model1.Hide();
    }
    protected void gv_Company_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int id = int.Parse(gv_Company.DataKeys[e.RowIndex].Values["Company_Id"].ToString());
        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Sure you want Delete this Record'); </script>", false);
        hsforSP.Add("@Trans", "DELETE");
        hsforSP.Add("@Company_Id", id);
        dt = dataAccess.ExecuteSP("Sp_Company", hsforSP);
        int count = dt.Rows.Count;
        bindCompanyDetails();
        model1.Hide();
    }
    protected void bindCompanyDetails()
    {
        model1.Show();
        Hashtable ht = new Hashtable();
        ht.Add("@Trans", "Select");

        dt = dataAccess.ExecuteSP("Sp_Company", ht);
        if (dt.Rows.Count >= 0)
        {
            gv_Company.Visible = true;
            gv_Company.DataSource = dt;
            gv_Company.DataBind();
        }
        model1.Hide();
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        model1.Show();
        Divcreate.Visible = true;
        DivView.Visible = false;
       clear();
    //   lblhead.Text = "Add Company";
       btn_Save.Text = "Add Company";
       lbl_RecordAddedBy.Text = Empname;
       lbl_RecordAddedOn.Text = DateTime.Now.ToString();
       model1.Hide();
    }
    protected void News_Click(object sender, EventArgs e)
    {

        Divcreate.Visible = false;
        DivView.Visible = true;
        LoadGrid();
       
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void clear()
    {
        lbl_company_id.Text = "";

        txt_companyname.Text = "";
        txt_company_slogan.Text = "";
        txt_company_registrationno.Text = "";
        txt_company_address.Text = "";
        ddl_company_country.SelectedValue = "SELECT";
        ddl_company_state.SelectedValue = "SELECT";
        ddl_company_district.SelectedValue = "SELECT";
        txt_company_city.Text = "";
        txt_company_Pincode.Text = "";
        txt_company_phono.Text = "";
        txt_company_fax.Text = "";
        txt_company_email.Text = "";
        txt_company_website.Text = "";
        fileup_comapny_logo = null;
        ChkDefault.Checked = false;
        lbl_RecordAddedBy.Text = Empname;
        lbl_RecordAddedOn.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");

        btn_Save.Text = "Create Company";
        btn_Back.Text = "Add Company";
    }
 
 protected void txt_Order_Type_TextChanged(object sender, EventArgs e)
 {
  
 }
 protected void btn_Import_Click(object sender, EventArgs e)
 {
     Response.Redirect("~/Admin/Upload_Orders_Type_Assign_to_State.aspx");
 }
 protected void btn_upload_Click(object sender, EventArgs e)
 {
     model1.Show();
     string fname = fileup_comapny_logo.FileName;
     imgName = fileup_comapny_logo.FileName;
     img = fileup_comapny_logo.FileBytes;
     Session["imgempphoto"] = img;
     // ViewState["imgempphoto"] = img;
     StartUpLoad();
     model1.Hide();
 }
 private void StartUpLoad()
 {
     imgName = fileup_comapny_logo.FileName;
     strimgnm = imgName;
     string imgPath = imgName;
     //int imgSize = Asyncfileup_comapny_logo.PostedFile.ContentLength;
     if (fileup_comapny_logo.PostedFile != null && fileup_comapny_logo.PostedFile.FileName != "")
     {
         if (fileup_comapny_logo.PostedFile.ContentLength > 652000000)
         {
             Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
         }
         else
         {
             string empimagename = "Image.jpg";
             HttpPostedFile myFile = fileup_comapny_logo.PostedFile;
             int nFileLen = myFile.ContentLength;
             imagenme = empimagename;
             if (nFileLen == 0)
             {
                 return;
             }
             // Check file extension (must be JPG)
             if (System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpg")
             {
                 return;
             }
             else
             {
                 myFile.SaveAs(MapPath(System.IO.Path.GetFileName(imagenme).ToLower().ToString()));
                 // empimage.ImageUrl = System.IO.Path.GetFileName(imagenme).ToLower().ToString();
             }
         }
     }
 }

 private bool Validation()
 {
     if (txt_companyname.Text == "")
     {
         ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script>alert('Enter Company Name');</script>", false);
         txt_companyname.Focus();
         txt_companyname.BorderColor = System.Drawing.Color.Red;
         return false;
     }
     return true;
 }
 protected void gv_Company_SelectedIndexChanged(object sender, EventArgs e)
 {
     model1.Show();
     GridViewRow row = gv_Company.SelectedRow;
     Label lbl_Companyid = (Label)row.FindControl("lbl_Company_Id");

     Session["Com_ID"] = row.Cells[0].Text;

     lbl_company_id.Text = lbl_Companyid.Text;
     ViewGrid();
     if (ddl_company_country.SelectedIndex > 0)
     {
         dbc.BindState1(ddl_company_state, int.Parse(ddl_company_country.SelectedValue));
     }
     if (ddl_company_state.SelectedIndex > 0)
     {
         dbc.BindDistrict(ddl_company_district, int.Parse(ddl_company_state.SelectedValue.ToString()));
     }
     Divcreate.Visible = true;
     DivView.Visible = false;
     //lblhead.Text = "Edit Company";
     btn_Save.Text = "Edit Company";

     model1.Hide();
 }
 protected void ViewGrid()
 {
     model1.Show();
     if (lbl_company_id.Text!= "")
     {
         string Checked;
         string logo;
         Hashtable hsforSP = new Hashtable();
         DataRow dr = null;
         hsforSP.Add("@Trans", "SELECTGRID");
         hsforSP.Add("@Company_Id", lbl_company_id.Text);
         dt = dataAccess.ExecuteSP("Sp_Company", hsforSP);
         dr = dt.NewRow();
         //txt_Com_Id.Text =dt.Rows[0]["Company_Name"].ToString();;
         txt_companyname.Text = dt.Rows[0]["Company_Name"].ToString();
         txt_company_slogan.Text = dt.Rows[0]["Comp_slogan"].ToString();
         txt_company_registrationno.Text = dt.Rows[0]["Comp_RegistrationNo"].ToString();
         txt_company_address.Text = dt.Rows[0]["Comp_Address"].ToString();
         txt_company_Pincode.Text = dt.Rows[0]["Comp_Pincode"].ToString();
         txt_company_phono.Text = dt.Rows[0]["Comp_Phone"].ToString();
         txt_company_fax.Text = dt.Rows[0]["Comp_Fax"].ToString();
         txt_company_email.Text = dt.Rows[0]["Comp_Email"].ToString();
         txt_company_website.Text = dt.Rows[0]["Comp_Web"].ToString();
         txt_company_city.Text = dt.Rows[0]["Comp_City"].ToString();
         ddl_company_country.SelectedValue = dt.Rows[0]["Comp_Country"].ToString();
         ddl_company_state.SelectedValue = dt.Rows[0]["Comp_State"].ToString();
         ddl_company_district.SelectedValue = dt.Rows[0]["Comp_District"].ToString();
        // byte[] imageBytes = Convert.FromBase64String(dt.Rows[0]["Comp_Logo"].ToString()); 
         if (dt.Rows[0]["Modifiedby"].ToString() != "")
         {
             lbl_RecordAddedBy.Text = dt.Rows[0]["Modifiedby"].ToString();
            lbl_RecordAddedOn.Text = dt.Rows[0]["Modified_Date"].ToString();
         }
         else if (dt.Rows[0]["Modifiedby"].ToString() == "")
         {
             lbl_RecordAddedBy.Text = dt.Rows[0]["Insertedby"].ToString();
             lbl_RecordAddedOn.Text = dt.Rows[0]["Instered_Date"].ToString();
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
     else if (lbl_company_id.Text == "")
     {
         clear();

     }
     model1.Hide();
 }
 protected void ddl_company_country_SelectedIndexChanged1(object sender, EventArgs e)
 {
     if (ddl_company_country.SelectedIndex > 0)
     {
         dbc.BindState1(ddl_company_state, int.Parse(ddl_company_country.SelectedValue.ToString()));
     }
 }
 protected void ddl_company_state_SelectedIndexChanged(object sender, EventArgs e)
 {
     if (ddl_company_state.SelectedIndex > 0)
     {

         dbc.BindDistrict(ddl_company_district, int.Parse(ddl_company_state.SelectedValue.ToString()));

     }
 }
 protected void btn_Back_Click(object sender, EventArgs e)
 {
     Divcreate.Visible = false;
     DivView.Visible = true;
 }
}
