using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

/// <summary>
/// Summary description for DropDownistBindClass
/// </summary>
public class DropDownistBindClass
{
    DataAccess da = new DataAccess();
    DataTable dt = new DataTable();

    public DropDownistBindClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void BindOrderType(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("Sp_Order_Type", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Type";
        ddlName.DataValueField = "Order_Type_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindOrderType_Report(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("Sp_Order_Type", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Type";
        ddlName.DataValueField = "Order_Type_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "ALL");
    }
    public void BindOrderStatus(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("Sp_Order_Status", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Status";
        ddlName.DataValueField = "Order_Status_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindOrderStatus_Report(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("Sp_Order_Status", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Status";
        ddlName.DataValueField = "Order_Status_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "ALL");
    }
    public void BindOrderStatus_ForEnter(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT_FOR_ORDER");
        dt = da.ExecuteSP("Sp_Order_Status", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Status";
        ddlName.DataValueField = "Order_Status_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindOrderTask(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("Sp_Order_Task", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Task";
        ddlName.DataValueField = "Order_Task_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindOrderTask_Report(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("Sp_Order_Task", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Task";
        ddlName.DataValueField = "Order_Task_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "ALL");
    }
    public void BindClientName(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_Client", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Client_Name";
        ddlName.DataValueField = "Client_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindClientName_Report(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_Client", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Client_Name";
        ddlName.DataValueField = "Client_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "ALL");
    }
    public void BindDistrict(DropDownList ddlName, int Id)
    {
        Hashtable htParam = new Hashtable();
        htParam.Add("@Trans", "SELECT");
        htParam.Add("@StateID", Id);
        dt = da.ExecuteSP("sp_District", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "District_Name";
        ddlName.DataValueField = "District_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindState1(DropDownList ddlName, int Id)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        htParam.Add("@countryid", Id);
        dt = da.ExecuteSP("sp_State", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "State_Name";
        ddlName.DataValueField = "State_Address_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindCountry(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();
        htParam.Add("@Trans", "BIND");
        dt = da.ExecuteSP("sp_country", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Country_Name";
        ddlName.DataValueField = "Country_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindUserName(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_User", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Employee_Name";
        ddlName.DataValueField = "User_id";
        ddlName.DataBind();
       
    }
    public void BindUserName_Report(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_User", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "User_Name";
        ddlName.DataValueField = "User_id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "ALL");

    }
    public void BindOrder_AssignType(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_Assign_Order_Type", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Type";
        ddlName.DataValueField = "Order_Type_Id";
        ddlName.DataBind();

    }
    public void Bind_Radio_button_Order_AssignType(RadioButtonList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_Assign_Order_Type", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Type";
        ddlName.DataValueField = "Order_Type_Id";
        ddlName.DataBind();

    }
    public void BindSubProcessName(DropDownList ddlName,int Clientid)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECTCLIENTWISE");
        htParam.Add("@Client_Id",Clientid);
        dt = da.ExecuteSP("Sp_Client_SubProcess", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Sub_ProcessName";
        ddlName.DataValueField = "Subprocess_Id";
        ddlName.DataBind();

        ddlName.Items.Insert(0, "SELECT");
    }
    public void BindSubProcessName_Report(DropDownList ddlName, int Clientid)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECTCLIENTWISE");
        htParam.Add("@Client_Id", Clientid);
        dt = da.ExecuteSP("Sp_Client_SubProcess", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Sub_ProcessName";
        ddlName.DataValueField = "Subprocess_Id";
        ddlName.DataBind();

        ddlName.Items.Insert(0, "ALL");
    }
   
   
    public void BindState(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT SATE");
        dt = da.ExecuteSP("Sp_Genral", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "State";
        ddlName.DataValueField = "State_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }

    public void BindCounty(DropDownList ddlName, int Id)
    {
        Hashtable htParam = new Hashtable();
        htParam.Add("@Trans", "SELECT COUNTY");
        htParam.Add("@State_ID", Id);
        dt = da.ExecuteSP("Sp_Genral", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "County";
        ddlName.DataValueField = "County_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
    }


    public void Bindrole(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_User_Role", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Role_Name";
        ddlName.DataValueField = "Role_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
        //ddlName.Items.Insert(1, "MULTIPLE ROLE");


    }

    public void BindOrder(DropDownList ddlName, int SubProcessId)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECTORDER");
        htParam.Add("@Sub_ProcessId", SubProcessId);
        dt = da.ExecuteSP("Sp_Order", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Number";
        ddlName.DataValueField = "Order_ID";
        ddlName.DataBind();
      
    }

    public void BindTreeViewParentNode(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT_MAIN");
        dt = da.ExecuteSP("Sp_Treeview_Child", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Main_Name";
        ddlName.DataValueField = "Main_Id";
        ddlName.DataBind();
        
    }



    public void BindTax_Type(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "TAX_TYPE");
        dt = da.ExecuteSP("Sp_Orders_Tax_Entry", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Type";
        ddlName.DataValueField = "Tax_Type_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }
    public void BindTax_Type_By_Order_Id(DropDownList ddlName,int Order_Id)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_Taxtype");
        htparm.Add("@Order_Id",Order_Id);
        dt = da.ExecuteSP("Sp_Orders_Tax_County_DataBase", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Type";
        ddlName.DataValueField = "Tax_Type_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }
    public void BindSampleTax_Type(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "TAX_TYPE");
        dt = da.ExecuteSP("Sp_Orders_Tax_Entry", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Type";
        ddlName.DataValueField = "Tax_Type_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }
    public void BindDeliquentTax_Type(DropDownList ddlName,int order_id)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_COUNTYDB_TAXTYPE");
        htparm.Add("@Order_Id", order_id);
        dt = da.ExecuteSP("Sp_Orders_Tax_County_DataBase", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Type";
        ddlName.DataValueField = "Tax_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }
    public void BindSourceUploadTax_Type(DropDownList ddlName, int order_id)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_Taxtype");
        htparm.Add("@Order_Id", order_id);
        dt = da.ExecuteSP("Sp_Orders_Tax_County_DataBase", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Type";
        ddlName.DataValueField = "Tax_Type_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }

    public void Bind_Agency_Type(DropDownList ddlName,int State)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_BY_ID");
        htparm.Add("@State", State);
        dt = da.ExecuteSP("Sp_County_Database", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "County";
        ddlName.DataValueField = "County_Databse_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }
    public void BindComments_Tax_Type(DropDownList ddlName, int order_id)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_COUNTYDB_TAXTYPE");
        htparm.Add("@Order_Id", order_id);
        dt = da.ExecuteSP("Sp_Orders_Tax_County_DataBase", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Type";
        ddlName.DataValueField = "Tax_Id";

        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");


    }
    public void BindTax_Status(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "TAX_STATUS");
        dt = da.ExecuteSP("Sp_Orders_Tax_Entry", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Status";
        ddlName.DataValueField = "Tax_Status_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
     


    }
    public void BindTax_Sales_Master(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_MASTER");
        dt = da.ExecuteSP("Sp_Orders_Tax_Sales_Entry", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Master_Name";
        ddlName.DataValueField = "Master_Name";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");



    }
    public void BindTax_Period(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "TAX_PERIOD");
        dt = da.ExecuteSP("Sp_Orders_Tax_Entry", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Period";
        ddlName.DataValueField = "Tax_Period_Id";
        ddlName.DataBind();

        ddlName.Items.Insert(0, "SELECT");
   


    }

    public void BindDiscountConf(DropDownList ddlName)
    {

             ddlName.Items.Insert(0, "N");
             ddlName.Items.Insert(1, "Y");

    }
    public void BindYearType(DropDownList ddlName)
    {

        ddlName.Items.Insert(0, "C");
        ddlName.Items.Insert(1, "P");

    }
    public void BindTax_Year(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "TAX_YEAR");
        dt = da.ExecuteSP("Sp_Orders_Tax_Entry", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Tax_Year";
        ddlName.DataValueField = "Tax_Year";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");
      
    }
    public void BindBranch(DropDownList ddlName, int Id)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "BIND");
        htParam.Add("@Company_Id", Id);
        dt = da.ExecuteSP("Sp_Branch", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Branch_Name";
        ddlName.DataValueField = "Branch_ID";
        ddlName.DataBind();
      
        
    }
    public void BindCompany(DropDownList ddlName)
    {
        Hashtable htparm = new Hashtable();
        htparm.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_Company", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Company_Name";
        ddlName.DataValueField = "Company_Id";
        ddlName.DataBind();
      
        
    }

    public void BindErrorCategory(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "SELECT_ERROR_CATEGORY");
        dt = da.ExecuteSP("Sp_Orders_Error", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Error_Category_Name";
        ddlName.DataValueField = "Eror_Category_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");

    }

    public void BindClientName_Rpt(DropDownList ddlName)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECT");
        dt = da.ExecuteSP("Sp_Client", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Client_Name";
        ddlName.DataValueField = "Client_Id";
        ddlName.DataBind();
      
        ddlName.Items.Insert(0, "ALL");
    }
    public void BindSubProcessName_Rpt(DropDownList ddlName, int Clientid)
    {
        Hashtable htParam = new Hashtable();

        htParam.Add("@Trans", "SELECTCLIENTWISE");
        htParam.Add("@Client_Id", Clientid);
        dt = da.ExecuteSP("Sp_Client_SubProcess", htParam);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Sub_ProcessName";
        ddlName.DataValueField = "Subprocess_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "ALL");
    }


    public void BindProduct_Type(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "GET_PRODUCT_TYPE");
        dt = da.ExecuteSP("Sp_Genral", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Product_Type";
        ddlName.DataValueField = "Product_Type_Id";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");

    }
    public void BindTax_Violation_Status(DropDownList ddlName)
    {

        Hashtable htparm = new Hashtable();
        DataTable dt = new DataTable();
        htparm.Add("@Trans", "GET_TAX_STATUS");
        dt = da.ExecuteSP("Sp_Genral", htparm);
        ddlName.DataSource = dt;
        ddlName.DataTextField = "Order_Status";
        ddlName.DataValueField = "Order_Status_ID";
        ddlName.DataBind();
        ddlName.Items.Insert(0, "SELECT");

    }
}