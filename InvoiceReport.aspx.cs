using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class OrderReport : System.Web.UI.Page
{

    string connstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Productfill();
    }

    protected void Productfill()
    {
        DataSet ds = new DataSet();
        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_GetCartItems", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
        }
        GrdProDetails.DataSource = null;
        GrdProDetails.DataBind();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            GrdProDetails.DataSource = ds.Tables[0];
            GrdProDetails.DataBind();
        }

    }

}


