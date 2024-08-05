using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class template_Dashbord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             lbluser.Text = Convert.ToString(Session["Name"]);
        }
        
        if (Session["id"] != null)
        {

        }
        else
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}