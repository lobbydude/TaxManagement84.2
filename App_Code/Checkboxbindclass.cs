using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

/// <summary>
/// Summary description for Checkboxbindclass
/// </summary>
public class Checkboxbindclass
{
    DataAccess da = new DataAccess();
    DataTable dt = new DataTable();
	public Checkboxbindclass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void Bindrole(CheckBoxList chk_boxlist)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_User_Role", htparm);
        chk_boxlist.DataSource = dt;
        chk_boxlist.DataTextField = "Role_Name";
        chk_boxlist.DataValueField = "Role_Id";
        chk_boxlist.DataBind();
      


    }
    
}