<%@ WebHandler Language="C#" Class="FileCS" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
public class FileCS : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int id = int.Parse(context.Request.QueryString["Id"]);
        byte[] bytes;
        string contentType;
        string strConnString = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
        string name;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Name, Data, ContentType from Tbl_Orders_Tax_Source_Upload where Tax_Type_Source_upload_id=@Tax_Type_Source_upload_id";
                cmd.Parameters.AddWithValue("@Tax_Type_Source_upload_id", id);
                cmd.Connection = con;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                bytes = (byte[])sdr["Data"];
                contentType = sdr["ContentType"].ToString();
                name = sdr["Name"].ToString();
                con.Close();
            }
        }
        context.Response.Clear();
        context.Response.Buffer = true;
        context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + name);
        context.Response.ContentType = contentType;
        context.Response.BinaryWrite(bytes);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}