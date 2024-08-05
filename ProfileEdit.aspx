<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileEdit.aspx.cs" Inherits="ProfileEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Your Profile</title>
    <link href="css/vertical-layout-light/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .card-header .profile-image {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 2px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container mt-5">
            <div class="card" style="border: 1px solid #e4ae74;">
                <div class="card-header" style="background-color: wheat">
                    <h2 class="mt-1">Edit Your Profile</h2>
                    <asp:Image ID="imgProfile" runat="server" CssClass=" profile-image rounded mt-0 " ImageUrl="~/images/Default.png" alt="Avatar" Width="6%" />
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <label for="Name">Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control border-black" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-black" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="password">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-black"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-4 form-group">
                            <label for="Mobile No.">Mobile no.</label>
                            <asp:TextBox ID="txtMobil" runat="server" CssClass="form-control border-black"></asp:TextBox>
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="Address">Address</label>
                            <asp:TextBox ID="txtadd" runat="server" CssClass="form-control border-black"></asp:TextBox>
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="profilePicture">Upload Profile Picture</label>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control mb-2 border-black" />
                            <asp:Label ID="Label1" runat="server" CssClass="text-success"></asp:Label>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-1">
                            <div class="form-group">
                                <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="btn btn-outline-warning" OnClick="btnUpdate_Click" />
                            </div>
                        </div>
                        <div class="col-1">
                            <div class="form-group">
                                <asp:Button ID="btnClear" Text="Clear" runat="server" CssClass="btn btn-outline-danger px-3" OnClick="btnClear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
