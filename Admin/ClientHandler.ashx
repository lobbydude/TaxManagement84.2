<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

public class ImageHandler : IHttpHandler 
{

    string strcon = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString.ToString();
    public void ProcessRequest(HttpContext context)
    {
        string imageid = context.Request.QueryString["Client_Id"];
        SqlConnection connection = new SqlConnection(strcon);
        connection.Open();
        SqlCommand command = new SqlCommand("select Client_Photo from Tbl_Clients where Client_Id=" + imageid, connection);
        SqlDataReader dr = command.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((Byte[])dr[0]);
        connection.Close();
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