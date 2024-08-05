using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
public partial class AddProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Session.Abandon();
    
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        {
            string errorMsg = "";
            if (txtEmail.Text.Trim() == "")
            {
                errorMsg += "Email";
            }
            if (txtPassword.Text.Trim() == "")
            {
                if (errorMsg != "")
                {
                    errorMsg += " or ";
                }
                errorMsg += "Password.";
            }
            if (errorMsg == "")
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                conn.Open();
                SqlCommand cmd;
                cmd = new SqlCommand("USp_user_Authenticate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    if (txtPassword.Text.Trim() == ds.Tables[0].Rows[0]["Password"].ToString())
                    {
                        Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
                        Session["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                        Session["UserType"] = "Admin";
                        Response.Redirect("Dashbord.aspx");
                    }

                    else
                    {
                        Response.Write("<script>alert('Invalid email or password');</script>");
                    }
                }

                conn.Close();
            }

        }
    }


}