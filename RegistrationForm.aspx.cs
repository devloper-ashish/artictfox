using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class RegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserRegBind();
            ClearFiled();
        }
    }

    protected void UserRegBind()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("Usp_UserRegistrauion_GetAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
        }
    }

    protected void ClearFiled()
    {
        txtUserName.Text = "";
        txtUserEmail.Text = "";
        txtUserMbl.Text = "";
        txtUserPass.Text = "";
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Usp_User_Registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@useremail", txtUserEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@usermobileno", txtUserMbl.Text.Trim());
                cmd.Parameters.AddWithValue("@userpassword", txtUserPass.Text.Trim());

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);

                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        string msg = row["Msg"].ToString();
                        string errorMsg = row["ErrorMsg"].ToString();

                        if (msg == "OK")
                        {
                            lblmsg.Text = errorMsg;
                            lblmsg.CssClass = "text-success";
                            txtUserName.Text = string.Empty;
                            alertmsg.Visible = true;
                            UserRegBind();
                            ClearFiled();
                        }
                        else if (msg == "ERROR")
                        {
                            lblmsg.Text = errorMsg;
                            lblmsg.CssClass = "text-danger";
                            alertmsg.Visible = true;
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Error: " + ex.Message;
            lblmsg.CssClass = "text-danger";
            alertmsg.Visible = true;
        }
    }

}