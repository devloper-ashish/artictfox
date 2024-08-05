<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#FF66CC" Font-Size="Medium" Height="38px" Width="301px" />  
            <asp:TextBox runat="server" ID="tstUsrName"></asp:TextBox>
        <p>  
            <asp:Button ID="Button1" runat="server" BackColor="Aqua" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Height="48px" OnClick="Button1_Click" Text="Upload" Width="226px" />  
            <asp:Label ID="Label1" runat="server" BackColor="Lime" Font-Size="Medium" Text="Label"></asp:Label>  
            <a href="UploadDoc/update_Gwalior_casediposetpye.xlsx">Download</a>
          <%--  <asp:Image runat="server" ImageUrl="~/UploadDoc/Screenshot (1).png" />--%>
        </p>  
        </div>
    </form>
</body>
</html>

