using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Admin_Create_Client : System.Web.UI.Page
{
    string imgName, strimgnm;
    byte[] img;
    public string imagenme = "";
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
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
            dbc.BindCompany(ddl_Company);
            dbc.BindBranch(ddl_branchname, int.Parse(ddl_Company.SelectedValue.ToString()));
           // GetMaximumClientNumber();
            DivView.Visible = true;
            Divcreate.Visible = false;
            lblhead.Text = "View Clients";
            GridviewbindClients();
            lbl_Record_Addedby.Text = Empname.ToString();
            lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            dbc.BindCountry(Ddl_Client_Country);
            dbc.BindCompany(ddl_Company);
           
            //  dbc.BindState(ddl_company_state);
            if (Ddl_Client_Country.SelectedIndex > 0)
            {
                dbc.BindState1(Ddl_Client_State, int.Parse(Ddl_Client_Country.SelectedValue));
            }
            if (Ddl_Client_State.SelectedIndex > 0)
            {
                dbc.BindDistrict(ddl_Client_district, int.Parse(Ddl_Client_State.SelectedValue.ToString()));
            }
           

        }
    }
    protected void News_Click(object sender, EventArgs e)
    {
        Divcreate.Visible = false;
        DivView.Visible = true;
        lblhead.Text = "View Clients";
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        clear();
        GetMaximumClientNumber();
        Divcreate.Visible = true;
        DivView.Visible = false;
        lblhead.Text = "Add New Client";
      
        lbl_Record_Addedby.Text = Empname;
        lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
       
    }
    private bool Validation()
    {

        if (txt_ClientName.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Client Name')</script>", false);
            txt_ClientName.Focus();
            txt_ClientName.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {

            txt_ClientName.BorderColor = System.Drawing.Color.DarkBlue;
        }
        return true;
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
    
       
        img = (byte[])Session["imgempphoto"];
        if (Validation() != false && btn_Save.Text == "Add New Client" && duplicate != "Duplicate Data")
        {
            if (Validation1() != false)
            {
                int clientnaumber = Convert.ToInt32(txt_ClientNumber.Text);
                string clientname = txt_ClientName.Text.ToUpper().ToString();

                Hashtable htinsert = new Hashtable();
                DataTable dtinsert = new DataTable();
                DataTable dt = new DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                htinsert.Add("@Trans", "INSERT");
                htinsert.Add("@Branch_ID", int.Parse(ddl_branchname.SelectedValue.ToString()));
                htinsert.Add("@Client_Number", clientnaumber);
                htinsert.Add("@Client_Name", clientname);
                htinsert.Add("@Client_Photo", img);

                htinsert.Add("@Client_Country", int.Parse(Ddl_Client_Country.SelectedValue.ToString()));
                htinsert.Add("@Client_State", int.Parse(Ddl_Client_State.SelectedValue.ToString()));
                htinsert.Add("@Client_District", int.Parse(ddl_Client_district.SelectedValue.ToString()));
                htinsert.Add("@Client_City", txt_Client_city.Text);
                htinsert.Add("@Client_Address", txt_Client_address.Text);
                htinsert.Add("@Client_Phone", txt_Client_phono.Text);
                htinsert.Add("@Client_Pin", Int32.Parse(txt_Client_Pincode.Text.ToString()));
                htinsert.Add("@Client_Fax", txt_Client_fax.Text);
                htinsert.Add("@Client_Email", txt_Client_email.Text);
                htinsert.Add("@Client_Web", txt_Client_website.Text);



                htinsert.Add("@Inserted_By", userid);
                htinsert.Add("@Inserted_date", date);
                htinsert.Add("@status", "True");

                dtinsert = dataaccess.ExecuteSP("Sp_Client", htinsert);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('New Client Added Sucessfully')</script>", false);
                // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "<script> alert('New Client Added Sucessfully')</script>;", false);
                txt_ClientName.Text = "";
                GridviewbindClients();
                GetMaximumClientNumber();
            }

            }
        else if (btn_Save.Text == "Edit Client")
            {

                int clientnaumber = Convert.ToInt32(txt_ClientNumber.Text);
                string clientname = txt_ClientName.Text.ToUpper().ToString();
               
                Hashtable htupdate = new Hashtable();
                DataTable dtupdate = new DataTable();
                DataTable dt = new DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                int roleid = int.Parse(ViewState["cid"].ToString());
                htupdate.Add("@Trans", "UPDATE");
                htupdate.Add("@Client_Id", roleid);
                htupdate.Add("@Branch_ID", int.Parse(ddl_branchname.SelectedValue.ToString()));
                htupdate.Add("@Client_Number", clientnaumber);
                htupdate.Add("@Client_Name", clientname);
                htupdate.Add("@Client_Photo", img);
                htupdate.Add("@Client_Country", int.Parse(Ddl_Client_Country.SelectedValue.ToString()));
                htupdate.Add("@Client_State", int.Parse(Ddl_Client_State.SelectedValue.ToString()));
                htupdate.Add("@Client_District", int.Parse(ddl_Client_district.SelectedValue.ToString()));
                htupdate.Add("@Client_City", txt_Client_city.Text);
                htupdate.Add("@Client_Address", txt_Client_address.Text);
                htupdate.Add("@Client_Phone", txt_Client_phono.Text);
                htupdate.Add("@Client_Pin", Int32.Parse(txt_Client_Pincode.Text.ToString()));
                htupdate.Add("@Client_Fax", txt_Client_fax.Text);
                htupdate.Add("@Client_Email", txt_Client_email.Text);
                htupdate.Add("@Client_Web", txt_Client_website.Text);
                htupdate.Add("@Modified_By", userid);
                htupdate.Add("@Modified_Date", date);
                htupdate.Add("@status", "True");
                dtupdate = dataaccess.ExecuteSP("Sp_Client", htupdate);
                GridviewbindClients();
                btn_Save.Text = "Add New Client";
                txt_ClientName.Text = "";
                GetMaximumClientNumber();

            }
        clear();
        Divcreate.Visible = false;
        DivView.Visible = true;
        GetMaximumClientNumber();
    }
    protected void GridviewbindClients()
    {
        model1.Show();
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "SELECT");
        dtselect = dataaccess.ExecuteSP("Sp_Client", htselect);
        if (dtselect.Rows.Count > 0)
        {
            grd_Client.Visible = true;
            grd_Client.DataSource = dtselect;
            grd_Client.DataBind();

        }
        else
        {
            grd_Client.Visible = true;
            grd_Client.DataSource = null;
            grd_Client.EmptyDataText = "No Clients Added";
            grd_Client.DataBind();

        }
        model1.Hide();
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void clear()
    {
        model1.Show();
        txt_Client_address.Text = "";
        txt_Client_city.Text = "";
        txt_Client_email.Text = "";
        txt_Client_fax.Text = "";
        txt_Client_phono.Text = "";
        txt_Client_Pincode.Text = "";
        txt_Client_website.Text = "";
        txt_ClientName.Text = "";
        txt_ClientNumber.Text = "";
      //  ddl_branchname.SelectedValue = "SELECT";
        Ddl_Client_Country.SelectedValue = "SELECT";
        Ddl_Client_State.SelectedValue = "SELECT";
        ddl_Client_district.SelectedValue = "SELECT";
       // ddl_Company.SelectedValue = "SELECT";
        Client_image.ImageUrl = null;
        lbl_Record_Addedby.Text = Empname;
        lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        model1.Hide();
        
    }
    protected void grd_Client_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = grd_Client.SelectedRow;
        Label lblclientid = (Label)row.FindControl("lblclintid");
        ViewState["cid"] = lblclientid.Text;
        ddl_branchname.SelectedItem.Text = row.Cells[1].Text;
        txt_ClientNumber.Text = row.Cells[2].Text;
        txt_ClientName.Text = row.Cells[3].Text;
        Client_image.ImageUrl = "~/Admin/ClientHandler.ashx?Client_Id=" + ViewState["cid"];
         Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        ht.Add("@Trans", "SELECT_Client_ID");
        ht.Add("@Client_Id", int.Parse(ViewState["cid"].ToString())); 
        dt = dataaccess.ExecuteSP("Sp_Client", ht);
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            Ddl_Client_Country.SelectedValue = dt.Rows[0]["Client_Country"].ToString();
            Ddl_Client_State.SelectedValue = dt.Rows[0]["Client_State"].ToString();
           
            ddl_Client_district.SelectedValue = dt.Rows[0]["Client_District"].ToString();
            txt_Client_city.Text = dt.Rows[0]["Client_City"].ToString();
            txt_Client_Pincode.Text = dt.Rows[0]["Client_Pin"].ToString();
            txt_Client_address.Text = dt.Rows[0]["Client_Address"].ToString();
            txt_Client_phono.Text = dt.Rows[0]["Client_Phone"].ToString();
            txt_Client_fax.Text = dt.Rows[0]["Client_Fax"].ToString();
            txt_Client_email.Text = dt.Rows[0]["Client_Email"].ToString();
            txt_Client_website.Text = dt.Rows[0]["Client_Web"].ToString();
        }

        if (Ddl_Client_Country.SelectedIndex > 0)
        {
            dbc.BindState1(Ddl_Client_State, int.Parse(Ddl_Client_Country.SelectedValue));
        }
        if (Ddl_Client_State.SelectedIndex > 0)
        {
            dbc.BindDistrict(ddl_Client_district, int.Parse(Ddl_Client_State.SelectedValue.ToString()));
        }
        if (dt.Rows[0]["Modifiedby"].ToString() != "")
        {
            lbl_Record_Addedby.Text = dt.Rows[0]["Modifiedby"].ToString();
            lbl_Record_AddedDate.Text = dt.Rows[0]["Modified_Date"].ToString();
        }
        else if (dt.Rows[0]["Modifiedby"].ToString() == "")
        {
            lbl_Record_Addedby.Text = dt.Rows[0]["Insertedby"].ToString();
            lbl_Record_AddedDate.Text = dt.Rows[0]["Inserted_date"].ToString();
        }
        btn_Save.Text = "Edit Client";
        lblhead.Text = "Edit Client";
        Divcreate.Visible = true;
        DivView.Visible = false;
        model1.Hide();
    }
    protected void GetMaximumClientNumber()
    { 
        Hashtable htselect = new Hashtable();
        DataTable dtselect = new DataTable();

        htselect.Add("@Trans", "MAXCLIENTNUMBER");
        dtselect = dataaccess.ExecuteSP("Sp_Client", htselect);
        if (dtselect.Rows.Count > 0)
        {

            txt_ClientNumber.Text = dtselect.Rows[0]["CLIENTNUMBER"].ToString();
        }

    }
    protected void grd_Client_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_Client.PageIndex = e.NewPageIndex;
        GridviewbindClients();
    }
    protected void grd_Client_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        model1.Show();
        int clientid = int.Parse(grd_Client.DataKeys[e.RowIndex].Values["Client_Id"].ToString());
        Hashtable htdelete = new Hashtable();
        DataTable dtdelete = new DataTable();
        htdelete.Add("@Trans", "DELETE");
        htdelete.Add("@Client_Id", clientid);
        dtdelete = dataaccess.ExecuteSP("Sp_Client", htdelete);
        GridviewbindClients();
        model1.Hide();
    }
    protected void grd_Client_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }
    }
    protected bool Validation1()
    {
        Hashtable ht = new Hashtable();
        DataTable dt = new DataTable();
        ht.Add("@Trans", "SELECT");
        dt = dataaccess.ExecuteSP("Sp_Client", ht);
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            string DtOrderType = (dt.Rows[i]["Client_Name"].ToString()).ToLower();

            string OrderType = (txt_ClientName.Text).ToLower();
            if (DtOrderType == OrderType && btn_Save.Text != "Edit Client")
            {
                duplicate = "Duplicate Data";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Client Name Already Exists ')</script>", false);
                return false;
            }
        }
        return true;
    }
    protected void btn_upload_Click(object sender, EventArgs e)
    {
        model1.Show();
        string fname = fileup_User_Photo.FileName;
        imgName = fileup_User_Photo.FileName;
        img = fileup_User_Photo.FileBytes;
        Session["imgempphoto"] = img;
        // ViewState["imgempphoto"] = img;
        StartUpLoad();
        model1.Hide();
      
    }
    private void StartUpLoad()
    {
        imgName = fileup_User_Photo.FileName;
        strimgnm = imgName;
        string imgPath = imgName;
        //int imgSize = Asyncfileup_comapny_logo.PostedFile.ContentLength;
        if (fileup_User_Photo.PostedFile != null && fileup_User_Photo.PostedFile.FileName != "")
        {
            if (fileup_User_Photo.PostedFile.ContentLength > 652000000)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
            }
            else
            {
                string Clientimagename = "Image.jpg";
                HttpPostedFile myFile = fileup_User_Photo.PostedFile;
                int nFileLen = myFile.ContentLength;
                imagenme = Clientimagename;
                if (nFileLen == 0)
                {
                    return;
                }
                // Check file extension (must be JPG)
              
                    myFile.SaveAs(MapPath(System.IO.Path.GetFileName(imagenme).ToLower().ToString()));
                    Client_image.ImageUrl = System.IO.Path.GetFileName(imagenme).ToLower().ToString();
                
            }
        }
    }
    protected void ddl_Branch_country_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Ddl_Client_Country.SelectedIndex > 0)
        {
            dbc.BindState1(Ddl_Client_State, int.Parse(Ddl_Client_Country.SelectedValue));
        }
    }
    protected void ddl_Branch_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Ddl_Client_State.SelectedIndex > 0)
        {
            dbc.BindDistrict(ddl_Client_district, int.Parse(Ddl_Client_State.SelectedValue.ToString()));
        }
    }
}