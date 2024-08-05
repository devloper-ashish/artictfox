using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddToCart : System.Web.UI.Page
{
    string connstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RefreshCart();
        }
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

        GrdProDetails.DataSource = ds.Tables[0];
        GrdProDetails.DataBind();

        List<CartItem> cartItems = new List<CartItem>();
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            cartItems.Add(new CartItem
            {
                ProID = Convert.ToInt32(row["ProID"]),
                Productname = row["Productname"].ToString(),
                Quantity = Convert.ToInt32(row["Quantity"]),
                ProductPrice = Convert.ToDecimal(row["ProductPrice"])
            });
        }
        Session["CartItems"] = cartItems;
    }

    protected void IncreaseQuantity_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int proId = Convert.ToInt32(btn.CommandArgument);

        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_UpdateCartQuantity", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProID", proId);
            cmd.Parameters.AddWithValue("@Change", 1);
            cmd.ExecuteNonQuery();

        }
        //Productfill();
        RefreshCart();

    }

    protected void DecreaseQuantity_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int proId = Convert.ToInt32(btn.CommandArgument);

        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_UpdateCartQuantity", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProID", proId);
            cmd.Parameters.AddWithValue("@Change", -1);
            cmd.ExecuteNonQuery();
        }
        //Productfill();
        RefreshCart();

    }

    protected void btnremove_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int proId = Convert.ToInt32(btn.CommandArgument);

        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_RemoveFromCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProID", proId);
            cmd.ExecuteNonQuery();

        }
        RefreshCart();
    }

    protected void UpdateCartCount()
    {
        int cartCount = 0;
        using (SqlConnection conn = new SqlConnection(connstr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_GetCartItemCount", conn);
             cartCount = (int)cmd.ExecuteScalar();
        }
        CartItemCountLabel.Text = "Cart (" + cartCount.ToString() + ")";
        Session["CartItemCount"] = cartCount;

    }

    //protected void DisplayCartCount()
    //{
    //    if (Session["CartItemCount"] != null)
    //    {
    //        CartItemCountLabel.Text = "Cart (" + Session["CartItemCount"].ToString() + ")";
    //    }
    //   ;
    //}

    public class CartItem
    {
        public int ProID { get; set; }
        public string Productname { get; set; }
        public int Quantity { get; set; }
        public decimal ProductPrice { get; set; }
    }

    protected decimal CalculateCartTotal(List<CartItem> cartItems)
    {
        decimal total = 0;

        foreach (var item in cartItems)
        {
            total += item.Quantity * item.ProductPrice;
        }

        return total;
    }

    protected decimal CalculateDiscount(List<CartItem> cartItems)
    {
        decimal totalAmount = CalculateCartTotal(cartItems);
        decimal discount = 0;

        if (totalAmount > 1000)
        {
            discount = totalAmount * 0.10m;
        }

        return discount;

    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
    
        Response.Redirect("InvoiceReport.aspx");

    }




    protected void RefreshCart()
    {
        Productfill(); // Bind Repeater
        UpdateCartCount();// Cart Header Count  Refresh



        List<CartItem> cartItems = Session["CartItems"] as List<CartItem>;

        if (cartItems != null && cartItems.Count > 0)
        {
            int totalItems = cartItems.Sum(item => item.Quantity);
            decimal totalAmount = CalculateCartTotal(cartItems);
            decimal discount = CalculateDiscount(cartItems);
            decimal finalAmount = totalAmount - discount;
            decimal savings = discount;

            TotalItemsLabel.Text = totalItems.ToString("C");
            TotalPriceLabel.Text = totalAmount.ToString("C");
            DiscountLabel.Text = discount.ToString("C");
            FinalPriceLabel.Text = finalAmount.ToString("C");
            SavingsLabel.Text = savings.ToString("C");
        }
    }


}

