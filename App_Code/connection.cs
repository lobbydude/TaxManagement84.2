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

/// <summary>
/// Summary description for connection
/// </summary>
public class connection
{
    public SqlConnection con = new SqlConnection();
    SqlDataReader DataReader;
  
	public connection()
	{
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
    }

    public void CloseConnection()
    {
        if (DataReader != null && !DataReader.IsClosed) DataReader.Close();
        if (con.State != ConnectionState.Closed)
        {
            try
            { con.Close(); }
            catch { }
        }
    }

    public void OpenConnection()
    {
        if (con.State != ConnectionState.Open) con.Open();
    }

   
}
