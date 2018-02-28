﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

/// <summary>
/// Summary description for Commonclass
/// </summary>
public class Commonclass
{
	public Commonclass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ToString());
    public float age;
    public float mission;
    public int DoTransaction(string sql)
    {
        int count = 0;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
            count = 1;
        }
        catch
        {
            count = 0;
            con.Close();
        }
        return count;
    }
    public DataTable DoNontransaction(string sql)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        da.Fill(dt);
        return dt;
    }
    public object DoScalarTransaction(string sql)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        object value = cmd.ExecuteScalar();
        con.Close();
        return value;
    }
}