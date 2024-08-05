using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class StateMaster : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (btnsubmit.Text == "Submit")
        {
            try
            {

                SqlCommand cmd = new SqlCommand("usp_insert_location", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtstate.Text.Trim());
                cmd.Parameters.AddWithValue("@table", "State");
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(ds);
                }

                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["Msg"].ToString() == "ok")
                            {
                                lblmsg.Text = ds.Tables[0].Rows[0]["ErrorMsg"].ToString();
                                lblmsg.CssClass = "text-success";
                                txtstate.Text = string.Empty;
                                alertmsg.Visible = true;

                            }
                            else
                            {
                                lblmsg.Text = ds.Tables[0].Rows[0]["ErrorMsg"].ToString();
                                lblmsg.CssClass = "text-danger";
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}



