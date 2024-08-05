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



public partial class AddProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            statefillGrid();

        }
    }

    protected void ClearFiled()
    {
        txtStname.Text = "";

    }

    protected void statefillGrid()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Usp_StateAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            state_grdDetails.DataSource = ds;
            state_grdDetails.DataBind();
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string storedProcedureName = btn_submit.Text == "Submit" ? "usp_Stateinsert_location" : "Usp_State_Update";
        string successMessage = btn_submit.Text == "Submit" ? "State added successfully." : "State updated successfully.";
        string stateId = btn_submit.Text == "Submit" ? string.Empty : ViewState["State_id"].ToString();

        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(storedProcedureName, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (!string.IsNullOrEmpty(stateId))
                {
                    cmd.Parameters.AddWithValue("@State_id", stateId);
                }

                cmd.Parameters.AddWithValue("@State_Name", txtStname.Text.Trim());
                cmd.Parameters.AddWithValue("@Isactive", 1);

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
                            lblmsg.Text = successMessage;
                            lblmsg.CssClass = "text-success";
                            txtStname.Text = string.Empty;
                            alertmsg.Visible = true;
                            statefillGrid();
                            btn_submit.Text = "Submit";
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

    protected void state_grdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd;

            if (e.CommandName == "UpdateRecord")
            {
                Label lblstname = (Label)row.FindControl("lblstname");
                txtStname.Text = lblstname.Text;
                ViewState["State_id"] = e.CommandArgument;
                btn_submit.Text = "Update";
            }
            else if (e.CommandName == "DeleteRecord")
            {
                cmd = new SqlCommand("Usp_State_Delete", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                statefillGrid();
            }
            else if (e.CommandName == "StateStatus")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                StateStatus(id);
                statefillGrid();
            }
        }
    }

    private void StateStatus(int id)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE tbl_State SET Isactive = CASE WHEN Isactive = 1 THEN 0 ELSE 1 END WHERE State_id = @State_id", conn);
            cmd.Parameters.AddWithValue("@State_id", id);
            cmd.ExecuteNonQuery();
        }
    }
}






























                //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                //conn.Open();
                //SqlCommand cmd;
                //if (btn_submit.Text == "Submit")
                //{
                //    cmd = new SqlCommand("usp_Stateinsert_location", conn);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.AddWithValue("@State_Name ", txtStname.Text.Trim());
                //    cmd.Parameters.AddWithValue("@Isactive", 1);
                //}
                //else if (btn_submit.Text == "Update")
                //{
                //    cmd = new SqlCommand("Usp_State_Update", conn);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.AddWithValue("@State_Name", txtStname.Text.Trim());
                //    cmd.Parameters.AddWithValue("@State_id", ViewState["State_id"].ToString());
                //    btn_submit.Text = "Submit";
                //}
                //else
                //{
                //    return;
                //}
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //DataSet ds = new DataSet();
                //da.Fill(ds);
                //conn.Close();
                //ClearFiled();
                //statefillGrid();