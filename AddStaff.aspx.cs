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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ClearFiled();
            GridBind();
            StateBind();
            lbluser.Text = Convert.ToString(Session["Name"]);
            //btn_save.Enabled = false;

        }

        if (Session["id"] != null)
        {

        }
        else
        {
            Response.Redirect("UserLogin.aspx");
        }
    }

    protected void ClearFiled()
    {
        txtname.Text = "";
        txtmail.Text = "";
        txtmbl.Text = "";
        txtadd.Text = "";
        ddlcate.ClearSelection();
        ddlRole.ClearSelection();
        ddlstate.Items.Clear();
        ddldivision.Items.Clear();
        ddldist.Items.Clear();
        ddlstate.Items.Insert(0, new ListItem("Select", "0"));
        ddldivision.Items.Insert(0, new ListItem("Select", "0"));
        ddldist.Items.Insert(0, new ListItem("Select", "0"));
    }

    protected void btn_clear_Click(object sender, EventArgs e)
    {
        ClearFiled();
        GridBind();
        StateBind();
    }

    protected void GridBind()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Usp_user_GetAll", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        grdDetails.DataSource = ds;
        grdDetails.DataBind();
        conn.Close();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd;

        try
        {
            if (btn_save.Text == "Save")
            {
                cmd = new SqlCommand("Usp_user_insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile_no", txtmbl.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", ddlcate.SelectedValue);
                cmd.Parameters.AddWithValue("@Isactive", 1);
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                cmd.Parameters.AddWithValue("@Password", txtpass.Text.Trim());
                cmd.Parameters.AddWithValue("@States", ddlstate.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Division", ddldivision.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@District", ddldist.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", txtadd.Text.Trim());
                cmd.Parameters.AddWithValue("@CreatedBy", Convert.ToString(Session["id"]));
                cmd.Parameters.AddWithValue("@CreatedIp", HttpContext.Current.Request.UserHostAddress);
            }
            else if (btn_save.Text == "Update")
            {
                cmd = new SqlCommand("USp_user_Update", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ViewState["lblid"]));
                cmd.Parameters.AddWithValue("@name", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtmail.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile_no", txtmbl.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", ddlcate.Text.Trim());
                cmd.Parameters.AddWithValue("@Role", ddlRole.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpass.Text.Trim());
                btn_save.Text = "Save";
            }
            else
            {
                return;
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ClearFiled();
            GridBind();

            if (btn_save.Text == "Save")
            {
                lblmsg.Text = "Record saved successfully!";
                lblmsg.CssClass = "text-success";
            }
            else if (btn_save.Text == "Update")
            {
                lblmsg.Text = "Record updated successfully!";
                lblmsg.CssClass = "text-success";
            }

            alertmsg.Visible = true;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Error: " + ex.Message;
            lblmsg.CssClass = "text-danger";
            alertmsg.Visible = true;
        }

    }

    protected void grdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd;

        if (e.CommandName == "UpdateRecord")
        {
            Label lblname = (Label)row.FindControl("lblname");
            Label lblEmail = (Label)row.FindControl("lblemail");
            Label lblMobile_no = (Label)row.FindControl("lblmbl");
            Label lblCategory = (Label)row.FindControl("lblcate");
            Label lblRole = (Label)row.FindControl("lblRole");
            Label lblState = (Label)row.FindControl("lblstate");
            Label lblDivision = (Label)row.FindControl("lbldiv");
            Label lblDistrict = (Label)row.FindControl("lbldis");
            txtname.Text = lblname.Text;
            txtmail.Text = lblEmail.Text;
            txtmbl.Text = lblMobile_no.Text;
            ddlcate.Text = lblCategory.Text;
            ddlRole.Text = lblRole.Text;
            ViewState["lblid"] = e.CommandArgument;
            btn_save.Text = "Update";
        }
        else if (e.CommandName == "DeleteRecord")
        {
            cmd = new SqlCommand("Usp_user_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", e.CommandArgument);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridBind();
        }
        else if (e.CommandName == "ToggleStatus")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            ToggleStatus(id);
            GridBind();

        }

        conn.Close();
    }

    private void ToggleStatus(int id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("UPDATE tbl_details SET Isactive = CASE WHEN Isactive = 1 THEN 0 ELSE 1 END WHERE ID = @ID", conn);
        cmd.Parameters.AddWithValue("@ID", id);
        cmd.ExecuteNonQuery();
        conn.Close();
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

    protected void DivisionBind(string id)
    {
        DataSet ds = new DataSet();

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("usp_DivisionAllData", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_Id", id);
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

        ddldivision.Items.Insert(0, new ListItem("Select", "0"));


    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ddldivision.Items.Clear();

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("usp_FillddlDivision", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StateID", ddlstate.SelectedValue);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }

            }
        }

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

        ddldivision.Items.Insert(0, new ListItem("Select", "0"));

    }

    protected void DistrictBind(string id)
    {
        DataSet ds = new DataSet();

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("Usp_getDistrict_byId", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@divisionID", id);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }

            }
        }
        ddldist.Items.Clear();
        if (ds != null)
        {


            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddldist.DataSource = ds;
                    ddldist.DataTextField = "DistrictName";
                    ddldist.DataValueField = "DistrictID";
                    ddldist.DataBind();
                }
            }
        }

        ddldist.Items.Insert(0, new ListItem("Select", "0"));


    }

    protected void ddldivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        DistrictBind(ddldivision.SelectedValue);
    }


    protected void ddldist_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

























