using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Hostel
/// </summary>
public class Genral
{

    private SqlCommand cmd = new SqlCommand();
    private SqlDataReader DataReader;
    connection connect = new connection();
    public Genral()
	{
        cmd = new SqlCommand("");
        cmd.Connection = connect.con;
	}
    public int InsertHostel(string  HostelNo, string HostelName,string Username,string Date)
    {
        string QueryString = "Insert into Mst_Hostel(Hostel_No,HostelName,EnteredBy,EnteredDate) values('" + HostelNo + "','" + HostelName + "','" +Username+ "',convert(datetime,'"+Date+"',103))";
        cmd.CommandText = QueryString;
        connect.OpenConnection();
        int check = cmd.ExecuteNonQuery();
        connect.CloseConnection();
        return check;

    }
   

    public DataTable Getmax()
    {
        string qry = "select case when  max(Tbl_Auto.Id) is null then 0 else  max(Tbl_Auto.Id) end Id from dbo.Tbl_Auto ";
        connect.OpenConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        ada = new SqlDataAdapter(qry, connect.con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        connect.CloseConnection();
        return dt;
    }
    

    public DataTable GetData()
    {
        string qry = "SELECT [Auto_Id],[Id],[File_Path],File_Name FROM [Tbl_Auto] order by Id";
        connect.OpenConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        ada = new SqlDataAdapter(qry, connect.con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        connect.CloseConnection();
        return dt;
    }

    public DataTable FillParentTable()
    {
        string qry = "  select * from dbo.Tbl_Treeview_Main_Name";
        connect.OpenConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        ada = new SqlDataAdapter(qry, connect.con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        connect.CloseConnection();
        return dt;
    }

    public DataTable FillChildTable()
    {
        string qry = " SELECT Tbl_Treeview_Child_Name.User_id,upper(left(Tbl_Treeview_Child_Name.User_Name,1)) + lower(substring(Tbl_Treeview_Child_Name.User_Name,2,len(Tbl_Treeview_Child_Name.User_Name))) + ' --> ' +CAST(Tbl_Treeview_Child_Name.No_OF_Orders AS VARCHAR(10)) as User_Name,Tbl_Treeview_Child_Name.Main_id  from Tbl_Treeview_Child_Name ";
        connect.OpenConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        ada = new SqlDataAdapter(qry, connect.con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        connect.CloseConnection();
        return dt;
    }
    public DataTable Get_File(int id)
    {
        string qry = "select Tbl_Attachments.Name,Tbl_Attachments.contents,Tbl_Attachments.contentSize from Tbl_Attachments where Tbl_Attachments.pindex='"+id+"'";
        connect.OpenConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        ada = new SqlDataAdapter(qry, connect.con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        connect.CloseConnection();
        return dt;
    }
  
    public int Truncate_MailAndAttachemnt()
    {
        string QueryString = "truncate table Tbl_Mail truncate table dbo.Tbl_Attachments";
        cmd.CommandText = QueryString;
        connect.OpenConnection();
        int check = cmd.ExecuteNonQuery();
        connect.CloseConnection();
        return check;

    }
    //public DataTable Get_User_Order_Status_Data()
    //{
    //    string qry = " select * from dbo.Tbl_Treeview_Child_Name where Order_Id='" + orderid + "' and status='True' order by Order_Index ";
    //    connect.OpenConnection();
    //    SqlDataAdapter ada = new SqlDataAdapter();
    //    ada = new SqlDataAdapter(qry, connect.con);
    //    DataTable dt = new DataTable();
    //    ada.Fill(dt);
    //    connect.CloseConnection();
    //    return dt;
    //}  
   
    public DataTable GetGls_Client_Tax_Order_Report_Date(int subprocessid)
    {
        string qry = "DECLARE  @SQL     NVARCHAR(MAX),"+ 
  " @Loop    INT, "+
  " @MaxRows INT  "+
  " SET @Sql = '' "+
 "    SELECT @MaxRows = MAX(MaxRow)   FROM   (SELECT   COUNT(* ) AS MaxRow,    "+
  "   Order_ID,Sub_ProcessId,Order_Number,Last_Name,Borrower_Name,Address,City, "+
  "   Abbreviation,Zip,County,Parecel_Id,Total_Taxes,GoodThroughdate,Tax_Sold_Date,Taxes_Sold,Next_Critical_Date,Next_Critical_Action,Sold_Tax_Amount,Redemption_Good_Through_Date,Last_Redemption "+ 
   "    FROM     View_Client_Gls_Tax_Report_Final  where View_Client_Gls_Tax_Report_Final.Sub_ProcessId='4' "+
  "      GROUP BY Order_ID,Sub_ProcessId,Order_Number,Last_Name,Borrower_Name,Address,City,Abbreviation,Zip,County,Parecel_Id,Total_Taxes,GoodThroughdate,Tax_Sold_Date,Taxes_Sold,Next_Critical_Date,Next_Critical_Action,Sold_Tax_Amount,Redemption_Good_Through_Date,Last_Redemption ) X  "+
   "       SET @Loop = 1 "+
      "    WHILE @Loop <= @MaxRows  "+
      "    BEGIN  SELECT @SQL = @SQL + ', max(CASE WHEN Row = ' + CAST(@Loop AS VARCHAR(100)) + ' THEN ' + QUOTENAME(Column_Name) + ' END) AS [' + COLUMN_NAME + CAST(@Loop AS VARCHAR(100)) + ']'   FROM   INFORMATION_SCHEMA.COLUMNS   "+
        "   WHERE  TABLE_Name = 'View_Client_Gls_Tax_Report_Final'  "+       
        "     AND COLUMN_NAME  IN ('Tax_Paid_Amount','Amount_Last_Paid','NEXT_DUE_DATE','PRIOER_DELIQUENT_AMOUNT','MUNCIPLE_LIEN_AMOUNT','TOTAl_DUE_AMOUNT','Note')    "+
        "     SET @Loop = @Loop + 1   "+
       "       END  "+
      "        SET @SQL = 'SELECT Order_ID,Sub_ProcessId,Order_Number,Last_Name,Borrower_Name,Address,City,Abbreviation,Zip,County,Parecel_Id,Total_Taxes,GoodThroughdate,Tax_Sold_Date,Taxes_Sold,Next_Critical_Date,Next_Critical_Action,Sold_Tax_Amount,Redemption_Good_Through_Date,Last_Redemption ' + @SQL + ' FROM (select *,row_number() over (partition by Order_ID ORDER BY Order_ID) as Row         FROM View_Client_Gls_Tax_Report_Final where View_Client_Gls_Tax_Report_Final.Sub_ProcessId=''4'') X  "+
       "       GROUP BY Order_ID,Sub_ProcessId,Order_Number,Last_Name,Borrower_Name,Address,City,Abbreviation,Zip,County,Parecel_Id,Total_Taxes,GoodThroughdate,Tax_Sold_Date,Taxes_Sold,Next_Critical_Date,Next_Critical_Action,Sold_Tax_Amount,Redemption_Good_Through_Date,Last_Redemption' "+
              
              
         "       EXECUTE( @SQL)";
        connect.OpenConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        ada = new SqlDataAdapter(qry, connect.con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        connect.CloseConnection();
        return dt;
    }
    
    
}