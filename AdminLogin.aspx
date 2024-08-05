<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AddProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Artict Fox | A Cool Style</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/typicons/typicons.css">
    <link rel="stylesheet" href="../../vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link href="css/vertical-layout-light/bootstrap.min.css" rel="stylesheet" />
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/Done.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to left, #b97909d2,#ede1c197);
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 84.5vh;
            margin-left: 22%;
            margin-top: -5%
        }

        .login-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 380px;
            margin-right: 50px;
            padding-top: 60px;
            padding-bottom: 55px;
            border: 1px solid #e8bf75ed;
        }

        .promo-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #e8bf75ff;
            padding: 30px;
            border-radius: 8px;
            color: #000;
            width: 380px;
            border: 1px solid #00000073;
            margin-right: -1%;
            height: 84.5%;
        }

        .input {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #e8bf75ed;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            margin-top: 7%;
        }

            .login-button:hover {
                background-color: #d19d47;
            }

        .forgot-password, .signup-link, .terms a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #673ab7;
            text-decoration: none;
        }

            .forgot-password:hover, .signup-link a:hover, .terms a:hover {
                text-decoration: underline;
            }

        .image-container {
            margin-top: 18px;
        }

            .image-container img {
                width: 100%;
                padding: 15px;
            }

        .promo-box h3 {
            margin-left: -23%;
            line-height: 25px;
            margin-top: 23%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
            <!-- partial:../../partials/_navbar.html -->

            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:../../partials/_settings-panel.html -->


                <!-- partial:../../partials/_sidebar.html -->

                <!-- partial -->
                <div class="main-panel">


                    <div class="login-container">


                        <div class="login-box shadow">
                            <h2 class="mb-4">Welcome Back!</h2>
                            <p>Please enter your details</p>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" Placeholder="Email Address"></asp:TextBox>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" Placeholder="Password"></asp:TextBox>
                            <asp:CheckBox ID="chkRememberMe" CssClass="ms-1 px-1" runat="server" Text="&nbsp;Remember me" />
                            <asp:LinkButton ID="lnkForgotPassword" runat="server" CssClass="forgot-password mt-3">Forgot Password?</asp:LinkButton>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="login-button" />
                            <p class="signup-link">Don't have an account? <a href="RegistrationForm.aspx">Sign Up</a></p>

                        </div>
                        <div class="promo-box shadow ms-4">
                            <h3>Better work experience
                                <br />
                                To Login </h3>
                            <p class="text-white">Everything you need in an easily customizable dashboard</p>
                            <div class="image-container">
                                <img src="https://cdn3d.iconscout.com/3d/premium/thumb/man-seating-on-beanbag-and-work-on-laptop-5648601-4708253.png" alt="Seamless work experience" />
                            </div>
                        </div>
                    </div>




                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.html -->

                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="../../vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="../../vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="../../js/off-canvas.js"></script>
        <script src="../../js/hoverable-collapse.js"></script>
        <script src="../../js/template.js"></script>
        <script src="../../js/settings.js"></script>
        <script src="../../js/todolist.js"></script>



    </form>
</body>
</html>
