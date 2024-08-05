using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class AddProducts : System.Web.UI.Page
{

    string connstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Productfill();
            ClearFiled();
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
        ClearFiled();
    }

    protected void ClearFiled()
    {
        txtProname.Text = "";
        txtPrice.Text = "";
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (ProductImage.HasFile)
        {
            try
            {
                if (ProductImage.PostedFile.ContentLength >= (1024 * 2048)) // 1 MB
                {
                    lblProImg.Text = "Maximum document upload size 1 MB.";
                }
                else if (System.IO.Path.GetExtension(ProductImage.FileName).ToLower() != ".png")
                {
                    lblProImg.Text = "Only .png files are allowed.";
                }
                else
                {
                    string fName = "ProductImg_" + txtProname.Text.Replace(" ", "") + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                    fName += System.IO.Path.GetExtension(ProductImage.FileName);

                    string completePath = HttpContext.Current.Server.MapPath("~/UploadDoc/");
                    string filePath = completePath + fName;
                    ProductImage.SaveAs(filePath);

                    lblProImg.Text = "File Uploaded Successfully!";
                    string Profileimg = fName;

                    using (SqlConnection conn = new SqlConnection(connstr))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("Usp_Product_insert", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductName", txtProname.Text.Trim());
                        cmd.Parameters.AddWithValue("@ProductPrice", txtPrice.Text.Trim());
                        cmd.Parameters.AddWithValue("@ProductImage", Profileimg);
                        cmd.ExecuteNonQuery();
                    }

                    lblProImg.Text = "Product saved successfully!";
                    Productfill();
                    ClearFiled();
                }
            }
            catch (Exception ex)
            {
                lblProImg.Text = "File Not Uploaded! " + ex.Message;
            }
        }
    }

    protected void GrdProDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd;

        if (e.CommandName == "DeleteRecord")
        {
            cmd = new SqlCommand("Usp_Delete_Product", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProId", e.CommandArgument);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Productfill();
        }
        conn.Close();
    }
}



































//private const string ProductListSessionKey = "ProductList";
//private const string ImageFolder = "~/UploadedImages/";

//protected void Page_Load(object sender, EventArgs e)
//{
//    if (!IsPostBack)
//    {
//        // Initialize the product list in the session if not already done
//        if (Session[ProductListSessionKey] == null)
//        {
//            Session[ProductListSessionKey] = new List<Product>();
//        }

//        // Bind the product list to the repeater
//        BindProductList();
//    }
//}

//protected void SaveProduct_Click(object sender, EventArgs e)
//{
//    // Get product details
//    string productName = txtProname.Text;
//    string productPrice = txtPrice.Text;
//    string imageUrl = null;

//    // Save the uploaded image
//    if (ProductImage.HasFile)
//    {
//        string fileName = Path.GetFileName(ProductImage.PostedFile.FileName);
//        string filePath = Server.MapPath(ImageFolder) + fileName;
//        ProductImage.SaveAs(filePath);
//        imageUrl = ImageFolder + fileName;
//    }

//    // Retrieve the current product list from session
//    var productList = Session[ProductListSessionKey] as List<Product>;

//    // Check if productList is null before adding the product
//    if (productList == null)
//    {
//        productList = new List<Product>();
//        Session[ProductListSessionKey] = productList;
//    }

//    // Add the new product to the list
//    productList.Add(new Product
//    {
//        Name = productName,
//        Price = productPrice,
//        ImageUrl = imageUrl
//    });

//    // Save the updated product list back to session
//    Session[ProductListSessionKey] = productList;

//    // Bind the updated product list to the repeater
//    BindProductList();

//    // Clear the form
//    txtProname.Text = "";
//    txtPrice.Text = "";
//}

//private void BindProductList()
//{
//    // Retrieve the product list from session
//    var productList = Session[ProductListSessionKey] as List<Product>;

//    // Bind the product list to the repeater
//    ProductRepeater.DataSource = productList;
//    ProductRepeater.DataBind();
//}

//protected void ClearForm(object sender, EventArgs e)
//{
//    // Clear the form fields
//    txtProname.Text = "";
//    txtPrice.Text = "";
//    // Clear the file upload control
//    ProductImage.Attributes.Clear();
//}

//[Serializable]
//public class Product
//{
//    public string Name { get; set; }
//    public string Price { get; set; }
//    public string ImageUrl { get; set; }
//}