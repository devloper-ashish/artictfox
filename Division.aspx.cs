using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;



public partial class AddProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbluser.Text = Convert.ToString(Session["Name"]);
            StateBind();
            DivisionBind();
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
        txtdivname.Text = "";


    }

    protected void DivisionBind()

    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("[usp_DivisionAllData]", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@state_id ", ddlstate.SelectedValue);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        Division_grdDetails.DataSource = ds;
        Division_grdDetails.DataBind();
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

    protected void btn_submit_Click(object sender, EventArgs e)
    {

        if (btn_submit.Text == "Submit")
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("usp_Divisioninsert_location", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@State_Name", ddlstate.SelectedItem.Text.Trim());
                    cmd.Parameters.AddWithValue("@State_ID", ddlstate.SelectedValue);
                    cmd.Parameters.AddWithValue("@Division_Name", txtdivname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Isactive", 1);


                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);



                        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            DataRow row = ds.Tables[0].Rows[0];
                            string msg = row["Msg"].ToString();
                            string errorMsg = row["ErrorMsg"].ToString();

                            if (msg == "OK")
                            {
                                lblmsg.Text = errorMsg;
                                lblmsg.CssClass = "text-success";
                                txtdivname.Text = string.Empty;
                                alertmsg.Visible = true;
                                DivisionBind();
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
                    conn.Close();
                }
            }


            catch (Exception ex)
            {
                lblmsg.Text = "Error: " + ex.Message;
                lblmsg.CssClass = "text-danger";
                alertmsg.Visible = true;
            }
        }


        else if (btn_submit.Text == "Update")
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("Usp_Division_Update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@State_Name", ddlstate.SelectedValue);
                    cmd.Parameters.AddWithValue("@Division_Name ", txtdivname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Division_ID", ViewState["Division_ID"].ToString());

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);


                        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            DataRow row = ds.Tables[0].Rows[0];
                            string msg = row["Msg"].ToString();
                            string errorMsg = row["ErrorMsg"].ToString();

                            if (msg == "OK")
                            {
                                lblmsg.Text = errorMsg;
                                lblmsg.CssClass = "text-success";
                                txtdivname.Text = string.Empty;
                                alertmsg.Visible = true;
                                DivisionBind();
                                ClearFiled();
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
                    conn.Close();
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

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Division_grdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            SqlCommand cmd;




            if (e.CommandName == "UpdateRecord")
            {
                Label lblstname = (Label)row.FindControl("lblstname");
                Label lbldivname = (Label)row.FindControl("lbldivname");
                ddlstate.SelectedValue = lblstname.Text;
                txtdivname.Text = lbldivname.Text;
                ViewState["Division_ID"] = e.CommandArgument;
                btn_submit.Text = "Update";
            }


            //else if (e.CommandName == "DeleteRecord")
            //{
            //    cmd = new SqlCommand("Usp_Division_Delete", conn);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@Division_ID", e.CommandArgument);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    DataSet ds = new DataSet();
            //    da.Fill(ds);
            //    DivisionBind();
            //}
            else if (e.CommandName == "DivisionStatus")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DivisionStatus(id);
                DivisionBind();

            }
            else if (e.CommandName == "StateStatus")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DivisionStatus(id);
                DivisionBind();

            }

        }
    }

    private void DivisionStatus(int id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("UPDATE tbl_Division SET Isactive = CASE WHEN Isactive = 1 THEN 0 ELSE 1 END WHERE Division_ID = @Division_ID", conn);
        cmd.Parameters.AddWithValue("@Division_ID", id);
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}



















