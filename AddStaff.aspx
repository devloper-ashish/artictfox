<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddStaff.aspx.cs" Inherits="AddProducts" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css" />
    <!-- endinject -->
    <link rel="shortcut icon" href="images/Done.png" />
    <style>
        .itextColore {
            border: 1px solid red;
            display: inline-block;
            border-radius: 49%;
            width: 10px;
            font-weight: 900;
            background-color: red;
            color: white;
            height: 22px;
            float: right;
        }

        .content-wrapper {
            background: #F4F5F7;
            padding: 1rem 0rem 1.5rem 2rem;
            width: 100%;
            -webkit-flex-grow: 1;
            flex-grow: 1;
        }


        fieldset {
            border: 1px solid #a9720eed;
            padding: 0.35em 0.625em 0.75em;
            margin: 0;
            border-radius: 5px;
            padding-left: 20px;
        }

        legend {
            padding: 2px 8px;
            border-radius: 5px;
            width: auto;
            float: initial !important;
            border: 1px solid #a9720eed;
            font-size: 14px;
            font-weight: 500;
            /*  color: #416A59;*/
            color: #6374ec;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container-scroller">
            <!-- partial:../../partials/_navbar.html -->
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start" style="background-color: #e8bf75ed">
                    <div class="me-3">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                            <span class="icon-menu"></span>
                        </button>
                    </div>
                    <div>
                        <a class="navbar-brand brand-logo ms-4" href="Dashbord.aspx">
                            <img src="../../images/Done.png" alt="logo" />
                        </a>
                        <p class="fw-bold ms-3 mt-2">
                            🟢 Online
                            <br />
                            &nbsp;
                            <asp:Label Text="" runat="server" ID="lbluser" />
                        </p>
                    </div>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-top" style="background-color: #e8bf75ff">
                    <ul class="navbar-nav">
                        <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                            <h1 class="welcome-text"><span class="text-black fw-bold">ARCTIC FOX.</span></h1>
                            <p class="fw-bolder text-dark">User Registration <i class="mdi mdi-account-circle-outline"></i></p>

                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">


                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                                <i class="icon-mail icon-lg"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="notificationDropdown">
                                <a class="dropdown-item py-3 border-bottom">
                                    <p class="mb-0 font-weight-medium float-left">You have 4 new notifications </p>
                                    <span class="badge badge-pill badge-primary float-right">View all</span>
                                </a>
                                <a class="dropdown-item preview-item py-3">
                                    <div class="preview-thumbnail">
                                        <i class="mdi mdi-alert m-auto text-primary"></i>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject fw-normal text-dark mb-1">Application Error</h6>
                                        <p class="fw-light small-text mb-0">Just now </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item py-3">
                                    <div class="preview-thumbnail">
                                        <i class="mdi mdi-settings m-auto text-primary"></i>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject fw-normal text-dark mb-1">Settings</h6>
                                        <p class="fw-light small-text mb-0">Private message </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item py-3">
                                    <div class="preview-thumbnail">
                                        <i class="mdi mdi-airballoon m-auto text-primary"></i>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject fw-normal text-dark mb-1">New user registration</h6>
                                        <p class="fw-light small-text mb-0">2 days ago </p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="img-xs rounded-circle" src="images/faces/face8.jpg" alt="Profile image">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <div class="dropdown-header text-center">
                                    <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">
                                    <p class="mb-1 mt-3 font-weight-semibold">Allen Moreno</p>
                                    <p class="fw-light text-muted mb-0">allenmoreno@gmail.com</p>
                                </div>
                                <a class="dropdown-item" href="ProfileEdit.aspx"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i>My Profile <span class="badge badge-pill badge-danger">1</span></a>
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i>Messages</a>
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>Activity</a>
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i>FAQ</a>
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>

            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:../../partials/_settings-panel.html -->

                <div id="right-sidebar" class="settings-panel">
                    <i class="settings-close ti-close"></i>
                    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="todo-tab" data-bs-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="chats-tab" data-bs-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="setting-content">
                        <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
                            <div class="add-items d-flex px-3 mb-0">
                                <form class="form w-100">
                                    <div class="form-group d-flex">
                                        <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                                        <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                                    </div>
                                </form>
                            </div>
                            <div class="list-wrapper px-3">
                                <ul class="d-flex flex-column-reverse todo-list">
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox">
                                                Team review meeting at 3.00 PM
                                       
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox">
                                                Prepare for presentation
                                       
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox">
                                                Resolve all the low priority tickets due today
                                       
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li class="completed">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox" checked>
                                                Schedule meeting for next week
                                       
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li class="completed">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox" checked>
                                                Project review
                                       
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                </ul>
                            </div>
                            <h4 class="px-3 text-muted mt-5 fw-light mb-0">Events</h4>
                            <div class="events pt-4 px-3">
                                <div class="wrapper d-flex mb-2">
                                    <i class="ti-control-record text-primary me-2"></i>
                                    <span>Feb 11 2018</span>
                                </div>
                                <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
                                <p class="text-gray mb-0">The total number of sessions</p>
                            </div>
                            <div class="events pt-4 px-3">
                                <div class="wrapper d-flex mb-2">
                                    <i class="ti-control-record text-primary me-2"></i>
                                    <span>Feb 7 2018</span>
                                </div>
                                <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
                                <p class="text-gray mb-0 ">Call Sarah Graves</p>
                            </div>
                        </div>
                        <!-- To do section tab ends -->
                        <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
                            <div class="d-flex align-items-center justify-content-between border-bottom">
                                <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
                                <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 fw-normal">See All</small>
                            </div>
                            <ul class="chat-list">
                                <li class="list active">
                                    <div class="profile">
                                        <img src="../../images/faces/face1.jpg" alt="image"><span class="online"></span>
                                    </div>
                                    <div class="info">
                                        <p>Thomas Douglas</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">19 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile">
                                        <img src="../../images/faces/face2.jpg" alt="image"><span class="offline"></span>
                                    </div>
                                    <div class="info">
                                        <div class="wrapper d-flex">
                                            <p>Catherine</p>
                                        </div>
                                        <p>Away</p>
                                    </div>
                                    <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                                    <small class="text-muted my-auto">23 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile">
                                        <img src="../../images/faces/face3.jpg" alt="image"><span class="online"></span>
                                    </div>
                                    <div class="info">
                                        <p>Daniel Russell</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">14 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile">
                                        <img src="../../images/faces/face4.jpg" alt="image"><span class="offline"></span>
                                    </div>
                                    <div class="info">
                                        <p>James Richardson</p>
                                        <p>Away</p>
                                    </div>
                                    <small class="text-muted my-auto">2 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile">
                                        <img src="../../images/faces/face5.jpg" alt="image"><span class="online"></span>
                                    </div>
                                    <div class="info">
                                        <p>Madeline Kennedy</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">5 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile">
                                        <img src="../../images/faces/face6.jpg" alt="image"><span class="online"></span>
                                    </div>
                                    <div class="info">
                                        <p>Sarah Graves</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">47 min</small>
                                </li>
                            </ul>
                        </div>
                        <!-- chat tab ends -->
                    </div>
                </div>

                <!-- partial -->
                <!-- partial:../../partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color: #ebd3ac">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../../Dashbord.aspx">
                                <i class="mdi mdi-grid-large menu-icon"></i>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item nav-category">Production</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                                <i class="menu-icon mdi mdi-floor-plan"></i>
                                <span class="menu-title">Production</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="ui-basic">
                                <ul class="nav flex-column sub-menu">
                                    <%--<li class="nav-item"><a class="nav-link" href="AddProduct.aspx">Add Products +</a></li>--%>
                                    <li class="nav-item"><a class="nav-link" href="Addstaff.aspx">Add Staff +</a></li>

                                </ul>
                            </div>
                        </li>

                        <%--<li class="nav-item nav-category">pages</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                                <i class="menu-icon mdi mdi-account-circle-outline"></i>
                                <span class="menu-title">User Pages</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="auth">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="">Registration </a></li>
                                    <li class="nav-item"><a class="nav-link" href="UserLogin.aspx">Login</a></li>
                                </ul>
                            </div>
                        </li>--%>
                        <li class="nav-item nav-category">help</li>
                        <li class="nav-item">
                            <a class="nav-link" href="UserLogin.aspx">
                                <i class="fa-solid fa-power-off"></i>
                                <span class="menu-title">Logout</span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- partial -->

                <div class="main-panel">

                    <div class="content-wrapper">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="a" ShowMessageBox="false" ShowSummary="false" HeaderText="Errors:" />

                        <div class="alert alert-success" role="alert" id="alertmsg" runat="server" visible="false">
                            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        </div>

                        <div class="container-fluid">
                            <div class="card shadow overflow-hidden" style="border: 1px solid #808080a3">
                                <div class=" text-center card-header" style="background-color: #fae1aeff">
                                    <h3 class="mt-1">Employee Registration <i class="fa-solid fa-user-plus"></i></h3>
                                </div>
                                <div class="card-body">
                                    <fieldset style="margin-top: -1%;">
                                        <legend class="text-black">Details</legend>
                                        <div class="row">

                                            <div class="col-md-3">
                                                <asp:Label Text="Name" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <span class="fa-pull-right mt-10">
                                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter Name" Display="Dynamic" Text="<i title='Only Alphabet letters' class='fa fa-exclamation-circle'></i>"
                                                        ControlToValidate="txtname" runat="server"
                                                        ForeColor="Red" ValidationGroup="a"/>
                                                    <asp:RegularExpressionValidator ErrorMessage="Enter only english letters "
                                                        ControlToValidate="txtname" runat="server" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="a" Display="Dynamic"></asp:RegularExpressionValidator>
                                                </span>
                                                <asp:TextBox runat="server" ID="txtname" AutoComplete="off" placeholder="Enter Name" MaxLength="20" CssClass="form-control mt-2 border-black"></asp:TextBox>
                                            </div>



                                            <div class="col-md-3">

                                                <asp:Label Text="Email ID" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <span class="fa-pull-right mt-10">
                                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter Email" ControlToValidate="txtmail" runat="server" ForeColor="Red"
                                                        ValidationGroup="a" Display="Dynamic" Text="<i title='Please a vaild Email' class='fa fa-exclamation-circle'></i>" />
                                                    <asp:RegularExpressionValidator CssClass="float-right" ErrorMessage="Please a vaild Email."
                                                        ControlToValidate="txtmail" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ValidationGroup="a" />
                                                </span>
                                                <asp:TextBox runat="server" ID="txtmail" placeholder=" Enter Email ID" AutoComplete="off" CssClass="form-control mt-2 border-black"></asp:TextBox>

                                            </div>

                                            <div class="col-md-3">

                                                <asp:Label Text="Mobile No." runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <span class="fa-pull-right mt-10">
                                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter Mobile No." Text="<i title='Only Numeric letters' class='fa fa-exclamation-circle'></i>"
                                                        ControlToValidate="txtmbl" Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="a" />
                                                    <asp:RegularExpressionValidator ErrorMessage="Numeric letters "
                                                        ControlToValidate="txtmbl" runat="server" ForeColor="Red" ValidationExpression="^[0-9]+$" ValidationGroup="a"
                                                        Display="Dynamic"></asp:RegularExpressionValidator>
                                                </span>
                                                <asp:TextBox runat="server" ID="txtmbl" placeholder=" Enter Mobile No." AutoComplete="off" CssClass="form-control mt-2 border-black" MaxLength="10"></asp:TextBox>

                                            </div>






                                            <div class="col-md-3">
                                                <asp:Label Text="Password" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <span class="fa-pull-right mt-10">
                                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter Name" Display="Dynamic" Text="<i title=' ' class='fa fa-exclamation-circle'></i>"
                                                        ControlToValidate="txtpass" runat="server"
                                                        ForeColor="Red" ValidationGroup="a" />

                                                </span>
                                                <asp:TextBox runat="server" ID="txtpass" placeholder="Enter Password" TextMode="Password" MaxLength="8" CssClass="form-control mt-2 border-black"></asp:TextBox>

                                            </div>

                                            <div class="col-md-3 mt-2">
                                                <asp:Label Text="Category" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <asp:DropDownList runat="server" ID="ddlcate" CssClass="form-control mt-2 border-dark text-dark bg-body-tertiary" AutoPostBack="true">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>Gen</asp:ListItem>
                                                    <asp:ListItem>Obc</asp:ListItem>
                                                    <asp:ListItem>St</asp:ListItem>
                                                    <asp:ListItem>Sc</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-md-3 mt-2">
                                                <asp:Label Text="Role" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <asp:DropDownList runat="server" ID="ddlRole" CssClass="form-control mt-2 border-dark text-dark bg-body-tertiary" AutoPostBack="true">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>HR</asp:ListItem>
                                                    <asp:ListItem>Project Manager</asp:ListItem>
                                                    <asp:ListItem>Team Leader</asp:ListItem>
                                                    <asp:ListItem>Accountant</asp:ListItem>
                                                    <asp:ListItem>Cashier</asp:ListItem>
                                                    <asp:ListItem>SuperWiser</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="mt-3">
                                        <legend class="text-dark">Address</legend>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label Text="State" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <span class="fa-pull-right">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                        ControlToValidate="ddlstate" InitialValue="0" CssClass="fa fa-pull-right"
                                                        Text="<i class='fa fa-exclamation-circle' title='Select State Name'></i>"
                                                        ErrorMessage="Select State Name" ForeColor="Red"
                                                        ValidationGroup="a"></asp:RequiredFieldValidator>
                                                </span>
                                                <asp:DropDownList runat="server" ID="ddlstate" CssClass="form-control mt-2 border-dark text-dark bg-body-tertiary" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>

                                            <div class="col-md-3">
                                                <asp:Label Text="Division" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <asp:DropDownList runat="server" ID="ddldivision" CssClass="form-control mt-2 border-dark text-dark  bg-body-tertiary" AutoPostBack="true" OnSelectedIndexChanged="ddldivision_SelectedIndexChanged"></asp:DropDownList>
                                            </div>

                                            <div class="col-md-3">
                                                <asp:Label Text="District" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                <asp:DropDownList runat="server" ID="ddldist" OnSelectedIndexChanged="ddldist_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control mt-2 text-dark  border-dark bg-body-tertiary"></asp:DropDownList>
                                            </div>

                                            <div class="col-md-3">
                                                <asp:Label Text="Address/Landmark" runat="server" CssClass="ms-2 fw-bold"></asp:Label>
                                                <asp:TextBox runat="server" TextMode="Search" ID="txtadd" placeholder="Enter Address" CssClass="mt-2 w-100 form-control border-dark"></asp:TextBox>

                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="row justify-content-center">
                                        <div class="col-md-3">
                                            <asp:Button Text="Save" runat="server" ID="btn_save" CssClass="btn btn-outline-success shadow px-4 mt-3" 
                                                OnClick="btn_save_Click" ValidationGroup="a" />
                                            <asp:Button Text="Clear" runat="server" ID="btn_clear" CssClass="btn btn-outline-danger shadow px-4 mt-3" 
                                                OnClick="btn_clear_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card form-group ms-4 mt-4" style="width: 96%;">

                            <div class="card-header" style="background-color: #fae1aeff">
                                <span class="ms-2">User Details</span>
                            </div>
                            <div class="row mt-3 p-3 pt-0 justify-content-center ">
                                <div class="col-md-12 text-center">
                                    <div class="table-responsive">
                                        <asp:GridView runat="server" ID="grdDetails" AutoGenerateColumns="false" CssClass="table table-bordered border-dark-subtle px-4" 
                                            OnRowCommand="grdDetails_RowCommand">
                                            <HeaderStyle BackColor="Wheat" />
                                            <%-- <RowStyle CssClass='<%# Convert.ToBoolean(Eval("Isactive")) ? "btn btn-sm btn-danger" : "btn btn-sm btn-success" %>' />   --%>

                                            <Columns>
                                                <asp:TemplateField HeaderText="id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("id") %>' runat="server" ID="lblid"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("Name") %>' runat="server" ID="lblname"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Email Id">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("Email") %>' runat="server" ID="lblemail"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mobile no.">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("Mobile_no") %>' runat="server" ID="lblmbl"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("Category") %>' runat="server" ID="lblcate"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Role">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("Role") %>' runat="server" ID="lblRole"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="State">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("States") %>' runat="server" ID="lblstate"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Division">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("Division") %>' runat="server" ID="lbldiv"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="District">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%#Eval("District") %>' runat="server" ID="lbldis"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Update / Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" CommandName="UpdateRecord" OnClientClick="return confirm('Are you sure you want to Update')" 
                                                            CommandArgument='<%# Eval("id") %>' CssClass="btn btn-sm btn-outline-warning"> Edit  <i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>

                                                        &nbsp;  
                                                        <asp:LinkButton runat="server" CommandName="DeleteRecord" OnClientClick="return confirm('Are you sure you want to Delete')" 
                                                            CommandArgument='<%# Eval("id") %>' CssClass="btn btn-sm btn-outline-danger"> Delete <i class="fa-solid fa-trash"></i></asp:LinkButton>

                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnToggleStatus" runat="server" CssClass='<%# Convert.ToBoolean(Eval("Isactive")) ? "btn btn-sm btn-danger" : "btn btn-sm btn-success" %>'
                                                            Text='<%# Convert.ToBoolean(Eval("Isactive")) ? "Deactive" : "Active" %>'
                                                            CommandName="ToggleStatus" OnClientClick="return toggleRow(this);" CommandArgument='<%# Eval("id") %>' />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>

                                        </asp:GridView>
                                    </div>
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
