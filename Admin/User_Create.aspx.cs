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
using System.Net.Mail;
public partial class Admin_User_Create : System.Web.UI.Page
{
    string imgName, strimgnm;
    byte[] img;
    public string imagenme = "";
    Commonclass commnclass = new Commonclass();
    DataAccess dataaccess = new DataAccess();
    DropDownistBindClass dbc = new DropDownistBindClass();
    Checkboxbindclass chk = new Checkboxbindclass();
    int userroleid; int? userid;
    int countuserid;
    string Empname;
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

        //txt_password1.Text = "";
        //txt_confirmpassword.Text = "";
        txt_password1.Attributes.Add("value", txt_password1.Text);
        txt_confirmpassword.Attributes.Add("value", txt_confirmpassword.Text);
        if (!IsPostBack)
        {
            dbc.BindCompany(ddl_Company);
            dbc.BindBranch(ddl_branchname, int.Parse(ddl_Company.SelectedValue.ToString()));
            DivNewsView.Visible = true;
            DivNewcreate.Visible = false;
            dbc.Bindrole(ddl_role);
            grd_Master.Visible = true;
            grd_UpdateMaster.Visible = false;
          
            trpassword.Visible = true;
            trconpassword.Visible = true;
            grd_UpdateMaster.Visible = false;
            grd_Master.Visible = true;
            GridviewbindMaster();
            Get_Userdetails();
            UserRoleShow();
            //Cache.Remove(key);
           // Session["imgempphoto"] = null;
      }
        lbl_Record_Addedby.Text = Empname.ToString();
        lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        
    }

    protected void GetUserdetails()
    {
        model1.Show();
        Hashtable htselectuser = new Hashtable();
        DataTable dtselectuser = new DataTable();
        htselectuser.Add("@Trans", "USERWISE");
        htselectuser.Add("@User_id", userid);
        dtselectuser = dataaccess.ExecuteSP("Sp_User", htselectuser);

        txt_username1.Text = dtselectuser.Rows[0]["User_Name"].ToString();
        txt_password1.Text = dtselectuser.Rows[0]["Password"].ToString();
        txt_confirmpassword.Text = txt_password1.Text;
        ViewState["password"] = txt_password1.Text;
        txt_email.Text = dtselectuser.Rows[0]["Email"].ToString();
        txt_mobileno.Text = dtselectuser.Rows[0]["Mobileno"].ToString();
        ddl_role.SelectedValue = dtselectuser.Rows[0]["User_RoleId"].ToString();
        model1.Hide();


    }
    protected void  GetuserPermission()
    {
        model1.Show();
        Hashtable htselectusermasterpermision = new Hashtable();
        DataTable dtselectusermasterpermission = new DataTable();
        htselectusermasterpermision.Add("@Trans", "VIEWMASTER");
        htselectusermasterpermision.Add("@User_Id", ViewState["Userid"]);
        dtselectusermasterpermission = dataaccess.ExecuteSP("Sp_User_Permission", htselectusermasterpermision);

        if (dtselectusermasterpermission.Rows.Count > 0)
        {
            grd_Master.Visible = false;
            grd_UpdateMaster.Visible = true;
            grd_UpdateMaster.DataSource = dtselectusermasterpermission;
            grd_UpdateMaster.DataBind();
        }
        else
        {
            grd_UpdateMaster.DataSource = null;
            grd_UpdateMaster.EmptyDataText = "No Permission added";
            grd_UpdateMaster.DataBind();

        }
        model1.Hide();
    }
    protected void Gridview_BindUpdatedmaster()
    {
        model1.Show();
        Hashtable htselectusermasterpermision = new Hashtable();
        DataTable dtselectusermasterpermission = new DataTable();
        htselectusermasterpermision.Add("@Trans", "VIEWMASTER");
        htselectusermasterpermision.Add("@User_Id", ViewState["Userid"]);
        dtselectusermasterpermission = dataaccess.ExecuteSP("Sp_User_Permission", htselectusermasterpermision);

        if (dtselectusermasterpermission.Rows.Count > 0)
        {
            grd_UpdateMaster.DataSource = dtselectusermasterpermission;
            grd_UpdateMaster.DataBind();
        }
        else
        {
            grd_UpdateMaster.DataSource = null;
            grd_UpdateMaster.EmptyDataText = "No Permission added";
            grd_UpdateMaster.DataBind();

        }
        model1.Hide();

    }

    protected void GridviewbindMaster()
    {
        model1.Show();
        Hashtable htmaster = new Hashtable();
        DataTable dtmaster = new DataTable();
        htmaster.Add("@Trans", "SELECTMASTER");
        dtmaster = dataaccess.ExecuteSP("Sp_User_Permission", htmaster);
        if (dtmaster.Rows.Count > 0)
        {

            grd_Master.DataSource = dtmaster;
            grd_Master.DataBind();

        }
        else
        {

            grd_Master.DataSource = null;
            grd_Master.EmptyDataText = "No Masters added";
            grd_Master.DataBind();
        }
        model1.Hide();
    }
    
    protected void grd_Master_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grd_Master.PageIndex = e.NewPageIndex;
        GridviewbindMaster();
    }



    private bool Validation()
    {


        if (txt_username1.Text == "")
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Username')</script>", false);
            txt_username1.Focus();
            txt_username1.BorderColor = System.Drawing.Color.Red;
            return false;

        }
        else
        {
            txt_username1.BorderColor = System.Drawing.Color.DarkBlue;
        }



        //if (txt_password1.Text == "")
        //{

        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Password')</script>", false);
        //    txt_password1.Focus();
        //    txt_password1.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else
        //{
        //    txt_password1.BorderColor = System.Drawing.Color.DarkBlue;
        //}

        //if (txt_confirmpassword.Text == "")
        //{

        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Confirm Password')</script>", false);
        //    txt_confirmpassword.Focus();
        //    txt_confirmpassword.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else
        //{
        //    txt_confirmpassword.BorderColor = System.Drawing.Color.DarkBlue;
        //}
        //if (txt_email.Text == "")
        //{

        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Emails')</script>", false);
        //    txt_email.Focus();
        //    txt_email.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else  
        //{
        //    txt_email.BorderColor = System.Drawing.Color.DarkBlue;
        //}
        //if (txt_mobileno.Text == "")
        //{

        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Enter Mobile Number')</script>", false);
        //    txt_mobileno.Focus();
        //    txt_mobileno.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else
        //{ 
        //    txt_mobileno.BorderColor = System.Drawing.Color.DarkBlue;
        //}
        //if (ddl_role.SelectedIndex <= 0)
        //{

        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Select Role')</script>", false);
        //    ddl_role.Focus();
        //    ddl_role.BorderColor = System.Drawing.Color.Red;
        //    return false;

        //}
        //else
        //{
        //    ddl_role.BorderColor = System.Drawing.Color.DarkBlue;
        //}
       
        return true;
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        img = (byte[])Session["imgempphoto"];
        if (User_Chk_Img.ImageUrl != "~/Admin/MsgImage/Delete1.png")
        {
            if (Validation() != false && btn_Save.Text == "Add New User")
            {
                Checkuserid();
                string username = txt_username1.Text.ToString();
                this.txt_password1.Attributes.Add("value", this.txt_password1.Text);
                string password = txt_password1.Text.ToString();
                string confirmpassword = txt_confirmpassword.Text.ToString();
                if (password != confirmpassword)
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('password is not matching')</script>", false);
                }
                else
                {
                    model1.Show();
                    string email = txt_email.Text.ToString();
                    string mobile = txt_mobileno.Text.ToString();
                    int roleid = int.Parse(ddl_role.SelectedValue.ToString());
                    string employeename = txt_employeeName.Text.ToUpper().ToString();
                 

                    Hashtable htuser = new Hashtable();
                    DataTable dtuser = new DataTable();

                    DataTable dttranspermission = new DataTable();
                    DataTable dtpermission = new DataTable();
                    DateTime date = new DateTime();
                    date = DateTime.Now;
                    string dateeval = date.ToString("dd/MM/yyyy");
                    htuser.Add("@Trans", "INSERT");
                    htuser.Add("@Branch_ID", int.Parse(ddl_branchname.SelectedValue.ToString()));
                    htuser.Add("@User_RoleId", roleid);
                    htuser.Add("@Employee_Name", employeename);
                    htuser.Add("@User_Name", username);
                    htuser.Add("@Password", password);
                    htuser.Add("@Mobileno", mobile);
                    htuser.Add("@User_Photo", img);
                    htuser.Add("@Email", email);
                    htuser.Add("@Inserted_By", userid);
                    htuser.Add("@Inserted_date", date);
                    htuser.Add("@status", true);
                    dtuser = dataaccess.ExecuteSP("Sp_User", htuser);

                    ViewState["createduser"] = username.ToString();
                    Hashtable htusername = new Hashtable();
                    DataTable dtusername = new DataTable();
                    htusername.Add("@Trans", "SELUSER");
                    htusername.Add("@User_Name", ViewState["createduser"].ToString());
                    dtusername = dataaccess.ExecuteSP("Sp_User", htusername);
                    if (dtusername.Rows.Count > 0)
                    {
                        userid = int.Parse(dtusername.Rows[0]["User_id"].ToString());
                    }


                    for (int i = 0; i < grd_Master.Rows.Count; i++)
                    {

                        bool read, write, delete, full;
                        Label lblmasterid = (Label)grd_Master.Rows[i].Cells[0].FindControl("lblmasterid");
                        int masterid = int.Parse(lblmasterid.Text.ToString());
                        //string mastername = grd_Master.Rows[i].Cells[1].ToString();
                        CheckBox chk_mastread = (CheckBox)grd_Master.Rows[i].Cells[2].FindControl("chk_mstread");
                        CheckBox chk_mastwrite = (CheckBox)grd_Master.Rows[i].Cells[3].FindControl("chk_mstwrite");
                        CheckBox chk_mastdelete = (CheckBox)grd_Master.Rows[i].Cells[4].FindControl("chk_mstdelete");
                        CheckBox chk_mastfull = (CheckBox)grd_Master.Rows[i].Cells[5].FindControl("chk_mstfull");

                        if (chk_mastread.Checked == true) { read = true; } else { read = false; }
                        if (chk_mastwrite.Checked == true) { write = true; } else { write = false; }
                        if (chk_mastdelete.Checked == true) { delete = true; } else { delete = false; }
                        if (chk_mastfull.Checked == true) { full = true; } else { full = false; }

                        Hashtable htpermission = new Hashtable();

                        htpermission.Add("@Trans", "INSERT");
                        htpermission.Add("@User_Id", userid);
                        htpermission.Add("@Master_Id", masterid);
                        htpermission.Add("@Read_Info", read);
                        htpermission.Add("@Write_Info", write);
                        htpermission.Add("@Delete_Info", delete);
                        htpermission.Add("@Full_Access", full);

                        dtpermission = dataaccess.ExecuteSP("Sp_User_Permission", htpermission);



                    }





                    txt_password1.Text = "";
                    txt_confirmpassword.Text = "";
                    model1.Hide();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('User Created Sucessfully')</script>", false);
                    clear();
                    Get_Userdetails();
                }

            }

            else if (btn_Save.Text == "Edit User")
            {


                Checkuserid();
                model1.Show();
                string username = txt_username1.Text.ToString();



                string email = txt_email.Text.ToString();
                string mobile = txt_mobileno.Text.ToString();
                int roleid = int.Parse(ddl_role.SelectedValue.ToString());
                string employeename = txt_employeeName.Text.ToUpper().ToString();
                string user = "";

                Hashtable htuser = new Hashtable();
                DataTable dtuser = new DataTable();

                DataTable dttranspermission = new DataTable();
                DataTable dtpermission = new DataTable();
                DateTime date = new DateTime();
                date = DateTime.Now;
                string dateeval = date.ToString("dd/MM/yyyy");
                htuser.Add("@Trans", "UPDATE");
                htuser.Add("@Branch_ID", int.Parse(ddl_branchname.SelectedValue.ToString()));
                htuser.Add("@User_RoleId", roleid);
                htuser.Add("@User_id", ViewState["Userid"]);
                htuser.Add("@Employee_Name", employeename);
                htuser.Add("@User_Name", username);

                htuser.Add("@Mobileno", mobile);
                htuser.Add("@User_Photo", img);
                htuser.Add("@Email", email);
                htuser.Add("@Modified_By", userid);
                htuser.Add("@Modified_Date", date);
                htuser.Add("@status", true);
                dtuser = dataaccess.ExecuteSP("Sp_User", htuser);



                if (countuserid > 0)
                {
                    for (int i = 0; i < grd_UpdateMaster.Rows.Count; i++)
                    {


                        bool read, write, delete, full;
                        Label lblmasterid = (Label)grd_UpdateMaster.Rows[i].Cells[0].FindControl("lblupmasterid");
                        int masterid = int.Parse(lblmasterid.Text.ToString());
                        //string mastername = grd_Master.Rows[i].Cells[1].ToString();
                        CheckBox chk_mastread = (CheckBox)grd_UpdateMaster.Rows[i].Cells[2].FindControl("chk_upmstread");
                        CheckBox chk_mastwrite = (CheckBox)grd_UpdateMaster.Rows[i].Cells[3].FindControl("chk_upmstwrite");
                        CheckBox chk_mastdelete = (CheckBox)grd_UpdateMaster.Rows[i].Cells[4].FindControl("chk_upmstdelete");
                        CheckBox chk_mastfull = (CheckBox)grd_UpdateMaster.Rows[i].Cells[5].FindControl("chk_upmstfull");

                        if (chk_mastread.Checked == true) { read = true; } else { read = false; }
                        if (chk_mastwrite.Checked == true) { write = true; } else { write = false; }
                        if (chk_mastdelete.Checked == true) { delete = true; } else { delete = false; }
                        if (chk_mastfull.Checked == true) { full = true; } else { full = false; }

                        Hashtable htpermission = new Hashtable();

                        htpermission.Add("@Trans", "UPDATEMASTER");
                        htpermission.Add("@User_Id", ViewState["Userid"]);
                        htpermission.Add("@Master_Id", masterid);
                        htpermission.Add("@Read_Info", read);
                        htpermission.Add("@Write_Info", write);
                        htpermission.Add("@Delete_Info", delete);
                        htpermission.Add("@Full_Access", full);

                        dtpermission = dataaccess.ExecuteSP("Sp_User_Permission", htpermission);



                    }


                }
                else if (countuserid <= 0)
                {


                    for (int i = 0; i < grd_Master.Rows.Count; i++)
                    {

                        bool read, write, delete, full;
                        Label lblmasterid = (Label)grd_Master.Rows[i].Cells[0].FindControl("lblmasterid");
                        int masterid = int.Parse(lblmasterid.Text.ToString());
                        //string mastername = grd_Master.Rows[i].Cells[1].ToString();
                        CheckBox chk_mastread = (CheckBox)grd_Master.Rows[i].Cells[2].FindControl("chk_mstread");
                        CheckBox chk_mastwrite = (CheckBox)grd_Master.Rows[i].Cells[3].FindControl("chk_mstwrite");
                        CheckBox chk_mastdelete = (CheckBox)grd_Master.Rows[i].Cells[4].FindControl("chk_mstdelete");
                        CheckBox chk_mastfull = (CheckBox)grd_Master.Rows[i].Cells[5].FindControl("chk_mstfull");

                        if (chk_mastread.Checked == true) { read = true; } else { read = false; }
                        if (chk_mastwrite.Checked == true) { write = true; } else { write = false; }
                        if (chk_mastdelete.Checked == true) { delete = true; } else { delete = false; }
                        if (chk_mastfull.Checked == true) { full = true; } else { full = false; }

                        Hashtable htpermission = new Hashtable();

                        htpermission.Add("@Trans", "INSERT");
                        htpermission.Add("@User_Id", userid);
                        htpermission.Add("@Master_Id", masterid);
                        htpermission.Add("@Read_Info", read);
                        htpermission.Add("@Write_Info", write);
                        htpermission.Add("@Delete_Info", delete);
                        htpermission.Add("@Full_Access", full);

                        dtpermission = dataaccess.ExecuteSP("Sp_User_Permission", htpermission);



                    }




                }

                //if (dtuser.Rows.Count > 0 && dtpermission.Rows.Count > 0 && dttranspermission.Rows.Count > 0)
                //{
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('User Updated Sucessfully')</script>", false);
                model1.Hide();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:if (confirm('User Updated Sucessfully ')) { location.href = '../Admin/User_Create.aspx'; }", true);
                btn_Save.Text = "Add New User";
                GridviewbindMaster();
                Get_Userdetails();
              //  UserRoleShow();
                clear();
                //Response.Redirect("~/Users/View_Users.aspx");
                //}
                //elsehttp://localhost:49435/Payrollmanagement10.0
                //{
                //    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Problem in creating User')</script>", false);
                //}



            }
        }
        else if (User_Chk_Img.ImageUrl == "~/Admin/img/iconCross3.png")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Msg", "<script> alert('Username already exists')</script>", false);
        }

      
    }






    protected void clear()
    {
        model1.Show();
        trpassword.Visible = true;
        trconpassword.Visible = true;
        grd_UpdateMaster.Visible = false;
      
        grd_Master.Visible = true;
        txt_employeeName.Text = "";
        txt_username1.Text = "";
        txt_password1.Text = "";
        txt_confirmpassword.Text = "";
        txt_mobileno.Text = "";
        txt_email.Text = "";
        ddl_role.SelectedIndex = 0;
        emp_image.ImageUrl = null;
        User_Chk_Img.ImageUrl = null;
        lblhead.Text = "Add New User";
        btn_Save.Text = "Add New User";
        foreach (GridViewRow rowmaster in grd_Master.Rows)
        {
            CheckBox chk_read = (CheckBox)rowmaster.FindControl("chk_mstread");
            CheckBox chk_write = (CheckBox)rowmaster.FindControl("chk_mstwrite");
            CheckBox chk_delete = (CheckBox)rowmaster.FindControl("chk_mstdelete");
            CheckBox chk_full = (CheckBox)rowmaster.FindControl("chk_mstfull");
                chk_read.Checked = false;
                chk_write.Checked = false;
                chk_delete.Checked = false;
                chk_full.Checked = false;
        }
        lbl_Record_Addedby.Text = Empname.ToString();
        lbl_Record_AddedDate.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
        txt_password1.Text = "  ";
        txt_username1.Text = " ";
        model1.Hide();
       
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void grd_Master_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        model1.Show();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");

            CheckBox chk_mastfull = (CheckBox)e.Row.FindControl("chk_mstfull");
            CheckBox chk_read = (CheckBox)e.Row.FindControl("chk_mstread");
            CheckBox chk_write = (CheckBox)e.Row.FindControl("chk_mstwrite");
            CheckBox chk_delete = (CheckBox)e.Row.FindControl("chk_mstdelete");

            if (chk_mastfull.Checked == true)
            {
                chk_read.Checked = true;
                chk_write.Checked = true;
                chk_delete.Checked = true;

            }
            else
            {
                chk_read.Checked = false;
                chk_write.Checked = false;
                chk_delete.Checked = false;

            }
        }
        model1.Hide();
    }
    protected void grd_Transaction_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }

    }
    protected void chk_mstfull_Checkchanged(object sender, EventArgs e)
    {


        GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
        int index = row.RowIndex;
        CheckBox chk_full = (CheckBox)grd_Master.Rows[index].FindControl("chk_mstfull");
        CheckBox chk_write = (CheckBox)grd_Master.Rows[index].FindControl("chk_mstwrite");
        CheckBox chk_read = (CheckBox)grd_Master.Rows[index].FindControl("chk_mstread");
        CheckBox chk_delete = (CheckBox)grd_Master.Rows[index].FindControl("chk_mstdelete");
        if (chk_full.Checked == true)
        {
            chk_read.Checked = true;
            chk_write.Checked = true;
            chk_delete.Checked = true;
        }

        else if (chk_full.Checked == false)
        {
            chk_read.Checked = false;
            chk_write.Checked = false;
            chk_delete.Checked = false;
        }


    }
    protected void chk_upmstfull_Checkchanged(object sender, EventArgs e)
    {


        GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
        int index = row.RowIndex;
        CheckBox chk_upfull = (CheckBox)grd_UpdateMaster.Rows[index].FindControl("chk_upmstfull");
        CheckBox chk_upwrite = (CheckBox)grd_UpdateMaster.Rows[index].FindControl("chk_upmstwrite");
        CheckBox chk_upread = (CheckBox)grd_UpdateMaster.Rows[index].FindControl("chk_upmstread");
        CheckBox chk_updelete = (CheckBox)grd_UpdateMaster.Rows[index].FindControl("chk_upmstdelete");
        if (chk_upfull.Checked == true)
        {
            chk_upread.Checked = true;
            chk_upwrite.Checked = true;
            chk_updelete.Checked = true;
        }

        else if (chk_upfull.Checked == false)
        {
            chk_upread.Checked = false;
            chk_upwrite.Checked = false;
            chk_updelete.Checked = false;
        }


    }
    
  
    protected void UserRoleShow()
    {
        model1.Show();
        if (ddl_role.SelectedIndex != 0)
        {

           

            string role;
            foreach (GridViewRow rowmaster in grd_Master.Rows)
            {

                CheckBox chk_read = (CheckBox)rowmaster.FindControl("chk_mstread");
                CheckBox chk_write = (CheckBox)rowmaster.FindControl("chk_mstwrite");
                CheckBox chk_delete = (CheckBox)rowmaster.FindControl("chk_mstdelete");
                CheckBox chk_full = (CheckBox)rowmaster.FindControl("chk_mstfull");

                role = ddl_role.SelectedItem.ToString();
                if (role == "ADMIN")
                {

                    chk_read.Checked = true;
                    chk_write.Checked = true;
                    chk_delete.Checked = true;
                    chk_full.Checked = true;
                }
                else if (role != "ADMIN" && role != "MULTIPLE ROLE")
                {
                    chk_read.Checked = false;
                    chk_write.Checked = false;
                    chk_delete.Checked = false;
                    chk_full.Checked = false;

                }
               


            }

           
        }
        else if (userid != null)
        {


            if (countuserid > 0)
            {
                string role;
                foreach (GridViewRow rowmaster in grd_UpdateMaster.Rows)
                {

                    CheckBox chk_upread = (CheckBox)rowmaster.FindControl("chk_upread");
                    CheckBox chk_upwrite = (CheckBox)rowmaster.FindControl("chk_upwrite");
                    CheckBox chk_updelete = (CheckBox)rowmaster.FindControl("chk_updelete");
                    CheckBox chk_upfull = (CheckBox)rowmaster.FindControl("chk_upfull");

                    role = ddl_role.SelectedItem.ToString();
                    if (role == "ADMIN")
                    {

                        chk_upread.Checked = true;
                        chk_upwrite.Checked = true;
                        chk_updelete.Checked = true;
                        chk_upfull.Checked = true;
                    }
                    else if (role != "ADMIN")
                    {
                        chk_upwrite.Checked = false;
                        chk_upwrite.Checked = false;
                        chk_updelete.Checked = false;
                        chk_upfull.Checked = false;

                    }

                }

               
                
                
            }
            else if (countuserid == 0)
            {
                string role;
                foreach (GridViewRow rowmaster in grd_Master.Rows)
                {

                    CheckBox chk_read = (CheckBox)rowmaster.FindControl("chk_mstread");
                    CheckBox chk_write = (CheckBox)rowmaster.FindControl("chk_mstwrite");
                    CheckBox chk_delete = (CheckBox)rowmaster.FindControl("chk_mstdelete");
                    CheckBox chk_full = (CheckBox)rowmaster.FindControl("chk_mstfull");

                    role = ddl_role.SelectedItem.ToString();
                    if (role == "ADMIN")
                    {

                        chk_read.Checked = true;
                        chk_write.Checked = true;
                        chk_delete.Checked = true;
                        chk_full.Checked = true;
                    }
                    else if (role != "ADMIN" && role != "MULTIPLE ROLE")
                    {
                        chk_read.Checked = false;
                        chk_write.Checked = false;
                        chk_delete.Checked = false;
                        chk_full.Checked = false;

                    }
                  



                }

              

            }
        }
        model1.Hide();
    }
    protected void ddl_role_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        if (ddl_role.SelectedIndex != 0 && userid == null)
        {

           

            string role;
            foreach (GridViewRow rowmaster in grd_Master.Rows)
            {

                CheckBox chk_read = (CheckBox)rowmaster.FindControl("chk_mstread");
                CheckBox chk_write = (CheckBox)rowmaster.FindControl("chk_mstwrite");
                CheckBox chk_delete = (CheckBox)rowmaster.FindControl("chk_mstdelete");
                CheckBox chk_full = (CheckBox)rowmaster.FindControl("chk_mstfull");

                role = ddl_role.SelectedItem.ToString();
                if (role == "ADMIN")
                {

                    chk_read.Checked = true;
                    chk_write.Checked = true;
                    chk_delete.Checked = true;
                    chk_full.Checked = true;
                }
                else if (role != "ADMIN" && role != "MULTIPLE ROLE")
                {
                    chk_read.Checked = false;
                    chk_write.Checked = false;
                    chk_delete.Checked = false;
                    chk_full.Checked = false;

                }
               
            }
            
            
        }
        else if (userid != null)
        {


            if (countuserid > 0)
            {
                string role;
                foreach (GridViewRow rowmaster in grd_UpdateMaster.Rows)
                {

                    CheckBox chk_upread = (CheckBox)rowmaster.FindControl("chk_upread");
                    CheckBox chk_upwrite = (CheckBox)rowmaster.FindControl("chk_upwrite");
                    CheckBox chk_updelete = (CheckBox)rowmaster.FindControl("chk_updelete");
                    CheckBox chk_upfull = (CheckBox)rowmaster.FindControl("chk_upfull");

                    role = ddl_role.SelectedItem.ToString();
                    if (role == "ADMIN")
                    {

                        chk_upread.Checked = true;
                        chk_upwrite.Checked = true;
                        chk_updelete.Checked = true;
                        chk_upfull.Checked = true;
                    }
                    else if (role != "ADMIN")
                    {
                        chk_upwrite.Checked = false;
                        chk_upwrite.Checked = false;
                        chk_updelete.Checked = false;
                        chk_upfull.Checked = false;

                    }

                }

              

            }
            else if (countuserid == 0)
            {
                string role;
                foreach (GridViewRow rowmaster in grd_Master.Rows)
                {

                    CheckBox chk_read = (CheckBox)rowmaster.FindControl("chk_mstread");
                    CheckBox chk_write = (CheckBox)rowmaster.FindControl("chk_mstwrite");
                    CheckBox chk_delete = (CheckBox)rowmaster.FindControl("chk_mstdelete");
                    CheckBox chk_full = (CheckBox)rowmaster.FindControl("chk_mstfull");

                    role = ddl_role.SelectedItem.ToString();
                    if (role == "ADMIN")
                    {

                        chk_read.Checked = true;
                        chk_write.Checked = true;
                        chk_delete.Checked = true;
                        chk_full.Checked = true;
                    }
                    else if (role != "ADMIN")
                    {
                        chk_read.Checked = false;
                        chk_write.Checked = false;
                        chk_delete.Checked = false;
                        chk_full.Checked = false;

                    }
                   



                }

               

            }
        }
        model1.Hide();

    }
    protected void grd_UpdateMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }
    }
    protected void grd_UpdateMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_UpdateMaster.PageIndex = e.NewPageIndex;
        Gridview_BindUpdatedmaster();

    }


    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        DivNewcreate.Visible = true;
        DivNewsView.Visible = false;
        clear();
        txt_password1.Text = "  ";
        txt_username1.Text = " ";
        lblhead.Text = "Add New User";
        btn_Save.Text = "Add New User";

    }
    protected void Get_Userdetails()
    {
        model1.Show();
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new DataTable();
        htuser.Add("@Trans", "SELECT");
        dtuser = dataaccess.ExecuteSP("Sp_User", htuser);
        if (dtuser.Rows.Count > 0)
        {
            grd_Userdetails.DataSource = dtuser;
            grd_Userdetails.DataBind();


        }
        else
        {
            grd_Userdetails.DataSource = null;
            grd_Userdetails.EmptyDataText = "No Users Added";
            grd_Userdetails.DataBind();
        }

        model1.Hide();
    }
    protected void grd_Userdetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        model1.Show();
        GridViewRow row = grd_Userdetails.SelectedRow;
        Label lbl_User_Id = (Label)row.FindControl("lbl_User_Id");
        ViewState["Userid"] = lbl_User_Id.Text;
        txt_employeeName.Text = row.Cells[3].Text;
        int user_id1 = int.Parse(lbl_User_Id.Text.ToString());

        dbc.Bindrole(ddl_role);
        if (ddl_role.Items.FindByText(row.Cells[4].Text).Value != null)
        {

            ddl_role.Items.FindByText(row.Cells[4].Text).Selected = true;
        }
        Hashtable htuser = new Hashtable();
        DataTable dtuser = new DataTable();
        htuser.Add("@Trans", "SELPASS");
        htuser.Add("@User_id", ViewState["Userid"].ToString());
        dtuser = dataaccess.ExecuteSP("Sp_User", htuser);
        if (dtuser.Rows[0]["Modifiedby"].ToString() != "")
        {
            lbl_Record_Addedby.Text = dtuser.Rows[0]["Modifiedby"].ToString();
            lbl_Record_AddedDate.Text = dtuser.Rows[0]["Modified_Date"].ToString();
        }
        else if (dtuser.Rows[0]["Modifiedby"].ToString() == "")
        {
            lbl_Record_Addedby.Text = dtuser.Rows[0]["Insertedby"].ToString();
            lbl_Record_AddedDate.Text = dtuser.Rows[0]["Inserted_date"].ToString();
        }
        DivNewsView.Visible = false;
        DivNewcreate.Visible = true;
        trpassword.Visible = false;
        trconpassword.Visible = false;
        btn_Save.Text = "Edit User";
        ddl_branchname.SelectedItem.Text = row.Cells[2].Text;
        txt_username1.Text = row.Cells[5].Text;
        txt_mobileno.Text = row.Cells[6].Text;
        txt_email.Text = row.Cells[7].Text;
        emp_image.ImageUrl = "~/Admin/UserHandler.ashx?User_id=" + ViewState["Userid"];
        GetuserPermission();
         lblhead.Text = "Edit User";
         model1.Hide();
    }
    protected void grd_Userdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_Userdetails.PageIndex = e.NewPageIndex;
        Get_Userdetails();
    }
    protected void grd_Userdetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                e.Row.Attributes.Add("onmouseover", "self.MouseOverOldColor=this.style.backgroundColor;this.style.backgroundColor='#BACFF8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=self.MouseOverOldColor");
        }
    }
    protected void News_Click(object sender, EventArgs e)
    {
        DivNewsView.Visible = true;
        DivNewcreate.Visible = false;
       // dbc.Bindrole(ddl_role);
        grd_Master.Visible = true;
        grd_UpdateMaster.Visible = false;

        trpassword.Visible = true;
        trconpassword.Visible = true;
        grd_UpdateMaster.Visible = false;
        grd_Master.Visible = true;
        GridviewbindMaster();
        Get_Userdetails();
        
    }

    protected void Checkuserid()
    {
        model1.Show();
 Hashtable htuser = new Hashtable();
        DataTable dtuser = new DataTable();
        htuser.Add("@Trans", "CHECKUSER");
        htuser.Add("@User_id", ViewState["Userid"]);
        dtuser = dataaccess.ExecuteSP("Sp_User", htuser);
        if (dtuser.Rows.Count > 0)
        {
            countuserid = int.Parse(dtuser.Rows[0]["COUNT"].ToString());

        }
        else
        { 
        countuserid=0;
        }
        model1.Hide();
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
                string empimagename = "Image.jpg";
                HttpPostedFile myFile = fileup_User_Photo.PostedFile;
                int nFileLen = myFile.ContentLength;
                imagenme = empimagename;
                if (nFileLen == 0)
                {
                    return;
                }
                // Check file extension (must be JPG)
                //if (System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpg")
                //{
                //    return;
                //}
                //else
                //{
                    myFile.SaveAs(MapPath(System.IO.Path.GetFileName(imagenme).ToLower().ToString()));
                    emp_image.ImageUrl = System.IO.Path.GetFileName(imagenme).ToLower().ToString();
                //}
            }
        }
    }
    protected void txt_username1_TextChanged(object sender, EventArgs e)
    {
        model1.Show();
        Hashtable htuser1 = new Hashtable();
        DataTable dtuser1 = new DataTable();
        string userchk;
        userchk = txt_username1.Text.ToUpper();
        htuser1.Add("@Trans", "CHECKUSERUNIQ");
        dtuser1 = dataaccess.ExecuteSP("Sp_User", htuser1);
        for (int i = 0; i < dtuser1.Rows.Count; i++)
        {
            if (userchk == dtuser1.Rows[i]["User_Name"].ToString())
            {
                User_Chk_Img.ImageUrl = "~/Admin/MsgImage/Delete1.png";
                break;


            }
            else if (userchk != dtuser1.Rows[i]["User_Name"].ToString())
            {
                User_Chk_Img.ImageUrl = "~/Admin/MsgImage/Sucess.png";
            }
        }
        model1.Hide();
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        DivNewcreate.Visible = false;
        DivNewsView.Visible = true;
        clear();
        //txt_password1.Text = " ";
        //txt_username1.Text = " ";
        //lblhead.Text = "Add New User";
        //btn_Save.Text = "Add New User";
    }
}