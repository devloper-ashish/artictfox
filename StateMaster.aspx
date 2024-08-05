<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StateMaster.aspx.cs" Inherits="StateMaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css" />
</head>
<body>
    <form id="form1" runat="server">
       <div class="container mt-4">
             <div class="card">
                 <div class="alert alert-success" role="alert" runat="server" id="alertmsg" visible="false">
        <asp:Label runat="server" ID="lblmsg"></asp:Label></div>
     <div class="card-header bg-dark-subtle">
         Details
     </div>
     <div class="card-body">
         <div class="row form-group">
             <div class="col-md-3">
                 <label> State Name</label>
                 <asp:TextBox runat="server" ID="txtstate"></asp:TextBox>
             </div>

         </div>
         <div class="row">
             <div class="col-md-2">
                 <asp:Button Text="Submit" runat="server" ID="btnsubmit" OnClick="btnsubmit_Click"/>
             </div>
         </div>
     </div>
 </div></div>
        
    </form>
</body>
</html>
