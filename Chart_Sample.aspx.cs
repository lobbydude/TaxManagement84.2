using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

public partial class Chart_Sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            GetChart();

        }
    }


    [WebMethod]
    public static string GetChart()
    {

        string constr = ConfigurationManager.ConnectionStrings["TaxManagementConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //string query = string.Format("select * from (select NEW_ORDERS,SEARCH_ORDES,SEARCH_QC_ORDERS,TYPING_ORDERS,TYPING_QC_ORDERS from View_External_Client_DashBoard as N_Orders where Clinet_Id=1) as S unpivot ( value for No_Of_Orders in (NEW_ORDERS,SEARCH_ORDES,SEARCH_QC_ORDERS,TYPING_ORDERS,TYPING_QC_ORDERS)) as unpvt");
            //  string query = string.Format("truncate table Tbl_External_Dashboard INSERT INTO Tbl_External_Dashboard select * from (select NEW_ORDERS,SEARCH_ORDES,SEARCH_QC_ORDERS,TYPING_ORDERS,TYPING_QC_ORDERS,FINAL_REVIEW_ORDERS,TAX_ORDERS,COMPLETED_ORDERS from FN_EXTERNAL_CLIENT_DASH as N_Orders where @client_Id=" + C_Id + ") as S unpivot ( value for No_Of_Orders in (NEW_ORDERS,SEARCH_ORDES,SEARCH_QC_ORDERS,TYPING_ORDERS,TYPING_QC_ORDERS,FINAL_REVIEW_ORDERS,TAX_ORDERS,COMPLETED_ORDERS)) as unpvt select No_Of_Orders,Value from Tbl_External_Dashboard");

            string query1 = string.Format("SELECT UPPER(dbo.Tbl_Order_Type.Order_Type) AS Order_Type, count( dbo.Tbl_Orders.Order_ID) as No_Of_Orders FROM   Tbl_Orders INNER JOIN Tbl_Order_Type ON Tbl_Orders.Order_Type = Tbl_Order_Type.Order_Type_ID where Tbl_Orders.Status='True' and Tbl_Orders.Product_Type=1 group by Tbl_Order_Type.Order_Type");
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query1;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();

                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    StringBuilder sb = new StringBuilder();
                    int count = 0;
                    sb.Append("[");
                    string[] col = { "#F7464A", "#46BFBD", "#FDB45C", "#5DA5DA", "#4D5360", "#ffd700", "#ffa500", "#F17CB0", "#adff2f", "#ff5700", "#B276B2" };


                    while (sdr.Read())
                    {


                        sb.Append("{");
                        System.Threading.Thread.Sleep(50);

                        //string color = String.Format("#{0:X6}", new Random().Next(0x1000000));



                        sb.Append(string.Format("text :'{0}', value:{1}, color: '{2}'", sdr[0], sdr[1], col[count]));
                        sb.Append("},");
                        count++;
                    }
                    sb = sb.Remove(sb.Length - 1, 1);
                    sb.Append("]");


                    con.Close();
                    return sb.ToString();
                }
            }
        }
    }

}