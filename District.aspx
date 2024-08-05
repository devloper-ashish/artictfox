<%@ Page Language="C#" AutoEventWireup="true" CodeFile="District.aspx.cs" Inherits="AddProducts" %>

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
            border: 1px solid #808080b3;
            padding: 0.35em 0.625em 0.75em;
            margin-left: -2%;
            border-radius: 5px;
            padding-left: 20px;
            width: 100%;
        }

        legend {
            padding: 2px 8px;
            border-radius: 5px;
            width: auto;
            float: initial !important;
            border: 1px solid #808080c0;
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
                        <p class="fw-bold ms-3 mt-2">🟢 Online
                            <br />
                            &nbsp;
                            <asp:Label Text="" runat="server" ID="lbluser" /></p>
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

                        <!-- <li class="nav-item d-none d-lg-block">
                  <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
                    <span class="input-group-addon input-group-prepend border-right">
                      <span class="icon-calendar input-group-text calendar-icon"></span>
                    </span>
                    <input type="text" class="form-control">
                  </div>
                </li> -->

                        <!--<li class="nav-item">

                        <i class="icon-search"></i>
                        <input type="search" class="form-control" placeholder="Search Here" title="Search here"/>

                    </li>-->
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
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i>My Profile <span class="badge badge-pill badge-danger">1</span></a>
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

                                <div class="form-group d-flex">
                                    <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                                    <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                                </div>

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


                        <li class="nav-item nav-category">Location Master</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#location" aria-expanded="false" aria-controls="location">
                                <i class="menu-icon mdi mdi-floor-plan"></i>
                                <span class="menu-title">Masters</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="location">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="State.aspx">State</a></li>
                                    <li class="nav-item"><a class="nav-link" href="Division.aspx">Divison</a></li>
                                    <li class="nav-item"><a class="nav-link" href="District.aspx">District</a></li>

                                </ul>
                            </div>
                        </li>

                        <li class="nav-item nav-category">pages</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                                <i class="menu-icon mdi mdi-account-circle-outline"></i>
                                <span class="menu-title">User Pages</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="auth">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="UserRegistration.aspx">Registration </a></li>
                                    <li class="nav-item"><a class="nav-link" href="UserLogin.aspx">Login</a></li>
                                </ul>
                            </div>
                        </li>
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
                        <div class="container" style="margin-left: -1%">
                            <div class=" card form-group">
                                <div class=" card-header" style="background-color: #fae1aeff">
                                    <h3 class="mt-2">District Master </h3>
                                </div>
                                <div class="card-body">
                                    <div class="row ms-5">
                                        <div class="col-md-12">
                                            <fieldset>
                                                <legend class="text-dark fw-bold">Add District</legend>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="State Name" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                        <asp:DropDownList runat="server" ID="ddlstate" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged"
                                                            CssClass="form-control border-dark mt-2 text-dark bg-body-tertiary " AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Division Name" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                        <asp:DropDownList runat="server" ID="ddldivision" OnSelectedIndexChanged="ddldivision_SelectedIndexChanged" CssClass="form-control border-dark text-dark bg-body-tertiary mt-2"></asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:Label Text="District Name" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                                                        <asp:TextBox runat="server" ID="ddldistrict" CssClass="form-control mt-2"></asp:TextBox>
                                                    </div>

                                                    <div class="row justify-content-center">
                                                        <div class="col-md-3 ms-1">

                                                            <asp:Button Text="Submit" runat="server" ID="btn_submit" CssClass="btn btn-outline-success shadow px-4 mt-4" OnClick="btn_submit_Click" />

                                                            <a href="District.aspx">
                                                                <asp:Button Text="Clear" runat="server" ID="btn_clear" CssClass="btn btn-outline-danger shadow px-4 mt-4" OnClick="btn_submit_Click" /></a>
                                                        </div>
                                                    </div>

                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>


                                    <div class="card-footer mt-4 bg-white">
                                        <div class="row  ms-4 p-3 pt-0 justify-content-center ">
                                            <div class="col-md-12 text-center">
                                                <fieldset>
                                                    <legend style="margin-left: -43%" class="fw-bold text-dark">District Details</legend>
                                                    <div class="table-responsive">
                                                        <asp:GridView runat="server" ID="District_grdDetails" AutoGenerateColumns="false" CssClass="table table-bordered border-dark-subtle table-hover table-striped">
                                                            <HeaderStyle BackColor="Wheat" />
                                                            <Columns>

                                                                <asp:TemplateField HeaderText="Sr.No.">
                                                                    <ItemTemplate>
                                                                        <%#Container.DataItemIndex+1%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="State Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%#Eval("State_id")%>' Visible="false" runat="server" ID="lblstid"></asp:Label>
                                                                        <asp:Label Text='<%#Eval("State_Name")%>' runat="server" ID="lblstname"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Division Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%#Eval("DivisionID")%>' Visible="false" runat="server" ID="lbldivname"></asp:Label>
                                                                        <asp:Label Text='<%#Eval("Division_Name")%>' runat="server" ID="lblstname"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="District Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%#Eval("DistrictName")%>' runat="server" ID="lbldisname"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton Text="Update" runat="server" CommandName="UpdateRecord" OnClientClick="return confirm('Are you sure Want to Update')"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </fieldset>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
