
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class AddProducts : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbluser.Text = Convert.ToString(Session["Name"]);
            DivisionBind();
            DistrictDataBind();
            StateBind();
        }
        if (Session["id"] != null)
        {

        }
        else
        {
            Response.Redirect("UserLogin.aspx");
        }
    }

    protected void DivisionBind()
    {
        DataSet ds = new DataSet();

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("Usp_getDivision_byId", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StateId", ddlstate.SelectedValue);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
        }
        ddldivision.Items.Clear();
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddldivision.DataSource = ds;
                    ddldivision.DataTextField = "Division_Name";
                    ddldivision.DataValueField = "Division_ID";
                    ddldivision.DataBind();
                }
            }
        }
        ddldivision.Items.Insert(0, new ListItem("select", "0"));
    }

    protected void StateBind()
    {
        DataSet ds = new DataSet();

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("Usp_StateAll", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
        }
        ddlstate.Items.Clear();
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlstate.DataSource = ds;
                    ddlstate.DataTextField = "State_Name";
                    ddlstate.DataValueField = "State_id";
                    ddlstate.DataBind();
                }
            }
        }
        ddlstate.Items.Insert(0, new ListItem("Select", "0"));


    }

    protected void DistrictDataBind()
    {
        DataSet ds = new DataSet();
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("uspgetAllDistrictData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();

            District_grdDetails.DataSource = null;
            District_grdDetails.DataBind();
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    District_grdDetails.DataSource = ds;
                    District_grdDetails.DataBind();
                }
            }

        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("usp_District_insert", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DivisionID ", ddldivision.SelectedValue);
                cmd.Parameters.AddWithValue("@DistrictName ", ddldistrict.Text.Trim());
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
        }
        DistrictDataBind();
    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        DivisionBind();
    }

    protected void ddldivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        DistrictDataBind();
    }
}


