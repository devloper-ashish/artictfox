<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationForm.aspx.cs" Inherits="RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Artict Fox | A Cool Style</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="css/vertical-layout-light/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: linear-gradient(to left, #b97909d2,#ede1c197);
        }

        .registration-form {
            display: flex;
            background-color: #ffffff;
            padding: 7px;
            border-radius: 10px;
            max-width: 800px;
            margin: auto;
            margin-top: 60px;
           
        }

        .form-section {
            flex: 1;
            padding: 15px;
        }

            .form-section h2 {
                text-align: center;
                margin-bottom: 1px;
            }

        .left-section {
            background-color: #f7f9fc;
        }

        .right-section {
            background-color: #e9be7a;
            color: white;
        }

        .left-section p {
            margin-left: 25%;
        }

        .form-group label {
            color: inherit;
        }

        .form-group input, .form-group select {
            background-color: inherit;
            color: inherit;
        }

        .btn-custom {
            background-color: white;
            color: #3b3fe4;
        }


        .reg-button {
            width: 100%;
            padding: 5px;
            background-color: #eeac35ed;
            border: 2px solid #e8bf75ed;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 1%;
            font-size: 20px;
            transition: .5s ease-in-out;
        }

            .reg-button:hover {
                transform: scale(.98);
                background-color: #d19d47da;
            }

        .image-container {
            margin-top: -15px;
        }

            .image-container img {
                width: 100%;
                margin-left: -2%;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="r" ShowMessageBox="false" ShowSummary="false" HeaderText="Errors:" />
        <div class="alert alert-success" role="alert" id="alertmsg" runat="server" visible="false">
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </div>
        <div class="registration-form">
            <div class="form-section right-section">
                <div class="image-container">
                    <img src="images/reg_man_done.jpg" alt="Seamless work experience" />
                </div>
            </div>
            <div class="form-section left-section">
                <h2>General Information</h2>
                <hr style="color: #965f00ff;" />

                <div class="row">
                    <div class=" col-md-6 form-group">
                        <label for="txtUserName" class="ms-2">Name</label>
                        <span class="fa-pull-right mt-10">
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter Name" Display="Dynamic"
                                Text="<i title='Only Alphabet letters' class='fa fa-exclamation-circle'></i>"
                                ControlToValidate="txtUserName" runat="server"
                                ForeColor="Red" ValidationGroup="r" />
                            <asp:RegularExpressionValidator ErrorMessage="Enter only english letters "
                                ControlToValidate="txtUserName" runat="server" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$"
                                ValidationGroup="r" Display="Dynamic"></asp:RegularExpressionValidator>
                        </span>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter name"></asp:TextBox>
                    </div>


                    <div class=" col-md-6 form-group">
                        <label for="txtUserEmail" class="ms-2 mt-1">Email ID</label>
                        <span class="fa-pull-right mt-10">
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter Email" ControlToValidate="txtUserEmail" runat="server" ForeColor="Red"
                                ValidationGroup="r" Display="Dynamic" Text="<i title='Please a vaild Email' class='fa fa-exclamation-circle'></i>" />
                            <asp:RegularExpressionValidator CssClass="float-right" ErrorMessage="Please a vaild Email."
                                ControlToValidate="txtUserEmail" runat="server" Display="Dynamic" ForeColor="Red"
                                ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ValidationGroup="r" />
                        </span>
                        <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" placeholder="Email ID"></asp:TextBox>
                    </div>

                    <div class=" col-md-6  form-group">
                        <label for="txtUserMbl" class="ms-2 mt-1">Mobile No.</label>
                        <span class="fa-pull-right mt-10">
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter Mobile No." Text="<i title='Only Numeric letters' class='fa fa-exclamation-circle'></i>"
                                ControlToValidate="txtUserMbl" Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="r" />
                            <asp:RegularExpressionValidator ErrorMessage="Numeric letters "
                                ControlToValidate="txtUserMbl" runat="server" ForeColor="Red" ValidationExpression="^[0-9]+$" ValidationGroup="r"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </span>
                        <asp:TextBox ID="txtUserMbl" runat="server" CssClass="form-control" MaxLength="10" placeholder="Mobile no."></asp:TextBox>
                    </div>
                    <div class=" col-md-6  form-group">
                        <label for="txtUserPass" class="ms-2 mt-1">Password</label>
                        <span class="fa-pull-right mt-10">
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter Name" Display="Dynamic" Text="<i title=' ' class='fa fa-exclamation-circle'></i>"
                                ControlToValidate="txtUserPass" runat="server"
                                ForeColor="Red" ValidationGroup="r" />

                        </span>
                        <asp:TextBox ID="txtUserPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                    </div>
                </div>


                <p class="mt-2">Have an Account ? &nbsp; <a href="#">Sign In</a></p>

                <div class="form-group" style="margin-top: -1%;">
                    <asp:Button ID="btnRegister" runat="server" CssClass="reg-button" Text="Register" OnClick="btnRegister_Click" ValidationGroup="r" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
