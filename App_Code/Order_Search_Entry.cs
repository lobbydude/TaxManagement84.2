using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

/// <summary>
/// Summary description for Order_Search
/// </summary>
public class Order_Search
{
    DataAccess da = new DataAccess();
    DataTable dt = new DataTable();
	public Order_Search()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void BindAPNnumber(DropDownList ddlName, int orderid)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        htParam.Add("@Order_Id", orderid);
        dt = da.ExecuteSP("Sp_Orders_Parcel_Information", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "APN_Number";
        ddlName.DataValueField = "Parcel_Id";
        ddlName.DataBind();
     
    }
    public void BindRealsExtateTax(DropDownList ddlName, int orderid,int parcelid)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECTMAXREAL");
        htParam.Add("@Order_Id", orderid);
        htParam.Add("@Parcel_Id", parcelid);
        dt = da.ExecuteSP("Sp_Orders_Parcel_Information", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Real_Estate_Tax";
        ddlName.DataValueField = "Parcel_Id";
        ddlName.DataBind();

    }
    public void BindUnrelasedMotagaor(DropDownList ddlName, int orderid)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        htParam.Add("@Order_Id", orderid);
        dt = da.ExecuteSP("Sp_Orders_Unrelesed_Record_Information", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Document_Number";
        ddlName.DataValueField = "Unreleased_Id";
        ddlName.DataBind();

    }
   

}