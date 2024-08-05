<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="images/Done.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css" />
    <title>Artict Fox | A Cool Style</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to left, #b97909d2,#ede1c197);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card w-75" style="margin-left: 15%;">
                <div class="row">
                    <div class="col-lg-6" style="padding-top: 8%;">
                        <h3 class="ms-5">Welcome Back</h3>

                        <div class="row mt-4">
                            <p class="ms-5">Please enter your details</p>
                            <div class="col-md-12 ms-5">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control w-75 py-3 border-dark" Placeholder="Email Address"></asp:TextBox>
                            </div>
                            <div class="col-md-12 ms-5 text-center mt-4">
                                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control w-75 py-3 border-dark " Placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="col-md-12 mt-3">
                                <asp:CheckBox ID="chkRememberMe" CssClass="ms-5 px-1 border-dark" runat="server" Text="&nbsp;Remember me" />
                            </div>
                            <div class="col-md-12 mt-3 text-center">
                                <asp:LinkButton ID="lnkForgotPassword" runat="server" CssClass="text-white">Forgot Password ?</asp:LinkButton>
                            </div>
                            <div class="col-md-12 mt-4 text-center">
                                <asp:Button ID="btnUserLogin" runat="server" Text="Login" OnClick="btnUserLogin_Click" CssClass="btn btn-outline-dark form-control w-75 fs-5 py-0 border-dark"/>
                            </div>
                            <div class="col-md-12 mt-4 text-center mb-5">
                                <p class="signup-link">Don't have an account? <a href="RegistrationForm.aspx">Sign Up</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 bg-dark">
                        <div class="right">

                        </div>
                    </div>
                </div>
            </div>
        </div>




    </form>
</body>
</html>
