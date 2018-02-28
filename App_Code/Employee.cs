using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    DataAccess da = new DataAccess();
    DataTable dt = new DataTable();

	public Employee()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void BindDefaultCompany(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();
        htParam.Add("@Trans", "SELCOMP");
        dt = da.ExecuteSP("Sp_Employee", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Company_Name";
        ddlName.DataValueField = "Company_Id";
        ddlName.DataBind();
       // ddlName.Items.Insert(0, "SELECT");

    }
    public void BindDefultBranch(DropDownList ddlName,int Companyid)
    {
        Hashtable htParam = new Hashtable();
        htParam.Add("@Trans", "SELBRANCH");
        dt = da.ExecuteSP("Sp_Employee", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Branch_Name";
        ddlName.DataValueField = "Branch_ID";
        ddlName.DataBind();
       // ddlName.Items.Insert(0, "SELECT");

    }
}