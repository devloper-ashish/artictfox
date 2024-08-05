using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)  //fileupload control contains a file  
        
            try
            {
                if (Convert.ToInt64(FileUpload1.PostedFile.ContentLength) >= (1024 * 67)) //  (1024 * kb =  byte) for KB  // (1024 * 1024 * mb =  byte) for Mb 
                {
                    Label1.Text = "Maximum docoment upload size 66 kb.";
                }
                else if (System.IO.Path.GetExtension(FileUpload1.FileName) != ".png")
                {
                    Label1.Text = "Only .png Allow";
                }
                else
                {
                    string fName = "UserImg_" + tstUsrName.Text.Replace(" ", "") + DateTime.Now.ToString().Replace(":", "").Replace(" ", "").Replace("/", "").Replace("-", "").Replace(".", "");
                    fName += System.IO.Path.GetExtension(FileUpload1.FileName);

                    string completePath = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath).Replace("/", "\\");
                    string rootPath = completePath + "\\UploadDoc\\";
                    FileUpload1.SaveAs(rootPath + fName);          // file path where you want to upload  
                    Label1.Text = "File Uploaded Sucessfully !! " + fName + " " + FileUpload1.PostedFile.ContentLength + "mb";     // get the size of the uploaded file  
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "File Not Uploaded!!" + ex.Message.ToString();
            }
        else
            {
                Label1.Text = "Please Select File and Upload Again";
                string a = "UserImg_AkashPatidar_1406202406490199.png";
                string v = "UserImg_AkashPatidar_1406202406490199.png";
            }
        }
}