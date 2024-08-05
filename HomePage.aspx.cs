using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Xml.Linq;

public partial class HomePage : System.Web.UI.Page
{

    string connstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCart();
            Productfill();
            UpdateCartCount();
            DisplayCartCount();
        }
    }
    protected void Productfill()
    {
        DataSet ds = new DataSet();
        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_Get_Products", conn);
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

    protected void FillCart()
    {
        DataSet ds = new DataSet();
        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_GetCartItems", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
        }

        GrdProDetails.DataSource = ds.Tables[0];
        GrdProDetails.DataBind();
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int proId = Convert.ToInt32(btn.CommandArgument);

        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_AddToCart", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProID", proId);
            cmd.ExecuteNonQuery();

        }

        //Response.Write("<script>alert('Product added to cart successfully.');</script>");
        //Response.Redirect("Cart.aspx");
        UpdateCartCount();
        DisplayCartCount();
    }


    protected void UpdateCartCount()
    {
        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_GetCartItemCount", conn);
            int cartCount = (int)cmd.ExecuteScalar();
            Session["CartItemCount"] = cartCount;
        }
        CartItemCountLabel.Text = "Cart (" + Session["CartItemCount"] + ")";
    }

    protected void DisplayCartCount()
    {
        if (Session["CartItemCount"] != null)
        {
            CartItemCountLabel.Text = "(" + Session["CartItemCount"].ToString() + ")";
        }
    }

   
}









