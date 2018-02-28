using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Data.OleDb;
using System.Xml;
using System.Web;
using System.IO;
/// <summary>
/// Summary description for DataAccess
/// </summary>
public class DataAccess
{

    static string con = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ToString();
    SqlConnection connectionstring = new SqlConnection(con);
	public DataAccess()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region ExecuteCommandSql

    public bool ExecuteCommandSql(string sql)
    {
        connectionstring.Open();
        using (SqlCommand cmd = new SqlCommand(sql, connectionstring))
        {
            cmd.ExecuteNonQuery();
        }
        connectionstring.Close();
        return true;
    }
    #endregion


    #region GetDataTable

    public DataTable GetDataTable(string sql)
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(sql, connectionstring))
        {
            da.Fill(dt);
        }
        return dt;
    }
    #endregion


    #region GetDataSet

    public DataSet GetDataSet(string sql)
    {
        DataSet ds = new DataSet();
        using (SqlDataAdapter da = new SqlDataAdapter(sql, connectionstring))
        {
            da.Fill(ds);
        }
        return ds;
    }
    #endregion


    #region FillDropDown

    public static void FillDropDown(System.Web.UI.WebControls.DropDownList dropDownName, string squery, string TextField, string ValueField)
    {
        try
        {
            dropDownName.Items.Clear();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(squery, con))
            {
                da.Fill(dt);
            }
            dropDownName.DataSource = dt;
            dropDownName.DataTextField = dt.Columns[TextField].Caption;
            dropDownName.DataValueField = dt.Columns[ValueField].Caption;
            dropDownName.DataBind();
        }
        catch (Exception ex)
        {
            throw;
        }
    }
    #endregion

    #region GetScalarValue

    public object GetScalarValue(string sql)
    {
        connectionstring.Open();
        SqlCommand cmd = new SqlCommand(sql, connectionstring);
        object value = cmd.ExecuteScalar();
        connectionstring.Close();
        return value;
    }

    #endregion

    #region ExecuteSP

    public DataTable ExecuteSP(string Procedure_Name, System.Collections.Hashtable htforSP)
     {
        DataTable dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand(Procedure_Name, connectionstring))
        {
            cmd.Connection = connectionstring;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry parameterEntry in htforSP)
            {
                cmd.Parameters.AddWithValue((string)parameterEntry.Key, parameterEntry.Value);
            }
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }
        }
        return dt;
    }

    #endregion

    #region ExecuteSPForCRUD

    public int ExecuteSPForCRUD(string Procedure_Name, System.Collections.Hashtable htforSP)
    {
        int count = 0;
        connectionstring.Open();
        try
        {
            SqlCommand cmd = new SqlCommand(Procedure_Name, connectionstring);
            cmd.Connection = connectionstring;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry parameterEntry in htforSP)
            {
                cmd.Parameters.AddWithValue((string)parameterEntry.Key, parameterEntry.Value);
            }
            cmd.ExecuteNonQuery();
            connectionstring.Close();
            count = 1;
        }
        catch
        {
            count = 0;
            connectionstring.Close();
        }
        return count;
    }

    #endregion

    #region ExecuteSPForScalar

    public object ExecuteSPForScalar(string Procedure_Name, System.Collections.Hashtable htforSP)
    {
        connectionstring.Open();
        SqlCommand cmd = new SqlCommand(Procedure_Name, connectionstring);
        cmd.Connection = connectionstring;
        cmd.CommandType = CommandType.StoredProcedure;
        foreach (DictionaryEntry parameterEntry in htforSP)
        {
            cmd.Parameters.AddWithValue((string)parameterEntry.Key, parameterEntry.Value);
        }
        object value = cmd.ExecuteScalar();
        connectionstring.Close();
        return value;
    }

    #endregion

    #region Exltodatatable


    public DataSet ImportExcel(HttpPostedFile file, bool hasHeaders)
    {
        string fileName = Path.GetTempFileName();
        file.SaveAs(fileName);

        return ImportExcelXLS(fileName, hasHeaders);
    }
    private DataSet ImportExcelXLS(string FileName, bool hasHeaders)
    {
        string HDR = hasHeaders ? "Yes" : "No";
        string strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + FileName + ";Extended Properties=\"Excel 8.0;HDR=" + HDR + ";IMEX=1\"";

        DataSet output = new DataSet();

        using (OleDbConnection conn = new OleDbConnection(strConn))
        {
            conn.Open();

            DataTable dt = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });

            foreach (DataRow row in dt.Rows)
            {
                string sheet = row["TABLE_NAME"].ToString();

                OleDbCommand cmd = new OleDbCommand("SELECT * FROM [" + sheet + "]", conn);
                cmd.CommandType = CommandType.Text;

                DataTable outputTable = new DataTable(sheet);
                output.Tables.Add(outputTable);
                new OleDbDataAdapter(cmd).Fill(outputTable);
            }
        }
        return output;
    }

    #endregion
}