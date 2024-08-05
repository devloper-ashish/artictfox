using System;
using System.Web;
using System.Web.UI;

public partial class ProfileEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtEmail.Text = "";
        txtPassword.Text = "";
        txtMobil.Text = "";
        txtadd.Text = "";
        imgProfile.ImageUrl = "~/images/Default.png";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                if (FileUpload1.PostedFile.ContentLength >= (1024 * 66)) // 66 KB limit
                {
                    Label1.Text = "Maximum document upload size is 66 KB.";
                }
                else if (System.IO.Path.GetExtension(FileUpload1.FileName).ToLower() != ".jfif")
                {
                    Label1.Text = "Only .png files are allowed.";
                }
                else
                {
                    string fName = "UserImg_" + txtName.Text.Replace(" ", "") + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                    fName += System.IO.Path.GetExtension(FileUpload1.FileName);
                    string uploadDir = "~/UploadDoc/";
                    string completePath = Server.MapPath(uploadDir) + fName;
                    FileUpload1.SaveAs(completePath);
                    Label1.Text = "File Uploaded Successfully!! " + fName + " " + FileUpload1.PostedFile.ContentLength / 1024 + " KB";
                    imgProfile.ImageUrl = uploadDir + fName;
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "File Not Uploaded!! " + ex.Message;
            }
        }
        else
        {
            Label1.Text = "Please select a file and upload again.";
            Label1.CssClass = "text-danger";
        }
    }
}
