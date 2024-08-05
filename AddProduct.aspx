<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProducts" %>

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


        .product_card {
            width: 245px;
            height: 310px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: 0.3s;
            border: 1px solid rgba(37, 37, 37, 0.505);
            position: relative;
        }

            .product_card img {
                width: 97%;
                height: 185px;
                object-fit: cover;
                border-radius: 16px 16px 0 0;
                margin-top: 11px;
            }

            .product_card .product_info {
                padding: 10px;
                font: 14px 'Poppins', sans-serif;
            }

        .colors {
            display: flex;
            gap: 5px;
            margin: 10px 10px 5px 15px;
            align-items: center;
        }

            .colors .color {
                width: 15px;
                height: 15px;
                border-radius: 10px;
            }

                .colors .color:nth-child(1) {
                    border: 2px solid rgb(252, 252, 252);
                    box-shadow: 0 0 0 1px rgba(37, 37, 37, 0.505);
                }

        .bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 7px;
            /*margin-left:2px;*/
        }

            .bottom .price {
                font-size: 18px;
                font-weight: 600;
            }

            .bottom .add_to_cart {
                padding: 8px 15px;
                border-radius: 20px;
                border: none;
                background: #fff;
                color: #111111;
                font-size: 14px;
                cursor: pointer;
                border: 3px solid rgba(0, 0, 0, 0.17);
                transition: 0.3s ease;
            }

        .add_to_cart:hover {
            background: #111111b8;
            color: #fff;
        }

        .add_to_wishlist {
            position: absolute;
            padding: 5px;
            border-radius: 20px;
            width: 20px;
            height: 20px;
            background: #ffffff9b;
            color: #111111;
            border: none;
            right: 5px;
            top: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product_name {
            font-size: 20px;
            font-weight: 700;
            margin: 0;
        }

        .product_description {
            font-size: 14px;
            color: #292828;
            margin-top: 5px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px; /* Optional: Space between cards */
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
                            Artict Fox
                            <br />
                            🟢 Online
                        </p>

                    </div>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-top" style="background-color: #e8bf75ff">
                    <ul class="navbar-nav">
                        <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                            <h1 class="welcome-text"><span class="text-black fw-bold">ARCTIC FOX.</span></h1>
                            <p class="fw-bolder">Add Products</p>
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
                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="icon-bell"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="countDropdown">
                                <a class="dropdown-item py-3">
                                    <p class="mb-0 font-weight-medium float-left">You have 7 unread mails </p>
                                    <span class="badge badge-pill badge-primary float-right">View all</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <img src="images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
                                    </div>
                                    <div class="preview-item-content flex-grow py-2">
                                        <p class="preview-subject ellipsis font-weight-medium text-dark">Marian Garner </p>
                                        <p class="fw-light small-text mb-0">The meeting is cancelled </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <img src="images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
                                    </div>
                                    <div class="preview-item-content flex-grow py-2">
                                        <p class="preview-subject ellipsis font-weight-medium text-dark">David Grey </p>
                                        <p class="fw-light small-text mb-0">The meeting is cancelled </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <img src="images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
                                    </div>
                                    <div class="preview-item-content flex-grow py-2">
                                        <p class="preview-subject ellipsis font-weight-medium text-dark">Travis Jenkins </p>
                                        <p class="fw-light small-text mb-0">The meeting is cancelled </p>
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
                                        <img src="../../images/faces/face5.jpg" alt="image"/><span class="online"></span>
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
                <nav class="sidebar sidebar-offcanvas " id="sidebar" style="background-color: #ebd3ac">
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
                                    <li class="nav-item"><a class="nav-link" href="AddProduct.aspx">Add Products +</a></li>
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
                                    <li class="nav-item"><a class="nav-link" href="RegistrationForm.aspx">Registration </a></li>
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
                <div class="container mt-3">
                    <div class="card overflow-hidden" style="border: 1px solid">
                        <div class="card-header text-center" style="background-color: #fae1aeff">
                            <h3 class="fw-bold">Add Products</h3>
                        </div>
                        <div class="card-body">
                            <fieldset>
                                <legend class="text-dark fw-bold">Product Details</legend>
                                <div class="row">
                                    <div class="col-md-4">
                                        <asp:Label Text="Product Name" runat="server" CssClass="fw-bold"></asp:Label><span style="color: red;">*</span>
                                        <asp:TextBox runat="server" ID="txtProname" AutoComplete="off" placeholder="Product Name" MaxLength="60" CssClass="form-control border-black"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtProname" runat="server" ErrorMessage="Enter Product Name" ForeColor="Red" ValidationGroup="a" Display="Dynamic" />

                                        <asp:RegularExpressionValidator ControlToValidate="txtProname" runat="server" ErrorMessage="Enter only english letters" ValidationExpression="^[A-Za-z ]+$"
                                            ForeColor="Red" ValidationGroup="a" Display="Dynamic" />
                                    </div>

                                    <div class="col-md-4">
                                        <asp:Label Text="Product Price" runat="server" CssClass="fw-bold"></asp:Label><span style="color: red;">*</span>
                                        <asp:TextBox runat="server" ID="txtPrice" AutoComplete="off" placeholder="Enter Price" MaxLength="10" CssClass="form-control border-black"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtPrice" runat="server" ErrorMessage="Enter Product Price" ForeColor="Red" ValidationGroup="a" Display="Dynamic" />
                                        <br />
                                        <asp:RegularExpressionValidator ControlToValidate="txtPrice" runat="server" ErrorMessage="Enter only numeric values" ValidationExpression="^[0-9]+$"
                                            ForeColor="Red" ValidationGroup="a" Display="Dynamic" />
                                    </div>

                                    <div class="col-md-4">
                                       <asp:Label Text="Product Image" runat="server" ID="lblProImg" CssClass="fw-bold"></asp:Label><span style="color: red;">*</span>
                                        <asp:FileUpload ID="ProductImage" runat="server" CssClass="form-control border-dark-subtle" />
                                        <asp:RequiredFieldValidator ControlToValidate="ProductImage" runat="server" ErrorMessage="Please upload an image" ForeColor="Red" ValidationGroup="a" Display="Dynamic" />
                                    </div>
                                </div>

                            </fieldset>
                            <div class="row justify-content-center">
                                <div class="col-md-3">
                                    <asp:Button Text="Save" runat="server" ID="btn_save" CssClass="btn btn-outline-success shadow px-4 mt-2" ValidationGroup="a" OnClick="btn_save_Click" />
                                    <asp:Button Text="Clear" runat="server" ID="btn_clear" CssClass="btn btn-outline-danger shadow px-4 mt-2" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card form-group overflow-hidden  mt-4 p-4" style="width: 100%; border: 1px solid">
                        <div class="card-header " style="background-color:#fae1aeff">
                            <span class="ms-2">Product Details</span>
                        </div>
                        <div class="row mt-3 p-3 pt-0 justify-content-center ">
                            <div class="col-md-12 text-center">
                                <div class="table-responsive">
                                    <%--<asp:Repeater ID="GrdProDetails" runat="server">
                                        <HeaderTemplate>
                                            <div class="card-container">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="product_card">
                                                <div class="image">
                                                    <asp:Image ImageUrl='<%# "../UploadDoc/" + Eval("ProductImage") %>' ID="ProImg" runat="server" Width="70%" />
                                                </div>
                                                <div class="product_info">
                                                    <asp:Label Text='<%#Eval("Productname") %>' runat="server" ID="lblproname"></asp:Label>
                                                   
                                                    <div class="colors">
                                                        <div class="color" style="background-color: gray;"></div>
                                                        <div class="color" style="background-color: black;"></div>
                                                        <div class="color" style="background-color: blue;"></div>
                                                    </div>

                                                    <div class="bottom">
                                                        <div class="price">
                                                            Rs.<asp:Label Text='<%#Eval("ProductPrice") %>' runat="server" ID="lblProprice"></asp:Label>
                                                        </div>
                                                        <div class="buttons">
                                                            <asp:Button Text=" Add to Cart" runat="server" CssClass="add_to_cart" />

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>--%>

                                      <asp:GridView runat="server" ID="GrdProDetails" AutoGenerateColumns="false" CssClass="table table-bordered border-dark-subtle px-4" OnRowCommand="GrdProDetails_RowCommand">
                                        <HeaderStyle BackColor="Wheat" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr.No.">
                                                <ItemStyle Font-Size="Medium" HorizontalAlign="Center" Width="10" />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%#Eval("ProId") %>' runat="server" ID="lblProid"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemStyle Font-Size="Medium" />
                                                <ItemTemplate>
                                                    <asp:Label Text='<%#Eval("Productname") %>' runat="server" ID="lblproname"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Product Price">
                                                <ItemStyle Font-Size="Medium" />
                                                <ItemTemplate>
                                                    <asp:Label Text='<%#Eval("ProductPrice") %>' runat="server" ID="lblProprice"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText=" Product Image">
                                                <ItemTemplate>
                                                    <asp:Image ImageUrl='<%# "../UploadDoc/" + Eval("ProductImage") %>' ID="ProImg" runat="server" Width="60px" Height="60px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Product Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CommandName="DeleteRecord" OnClientClick="return confirm('Are you sure you want to Delete')" CommandArgument='<%# Eval("ProId") %>' CssClass="btn btn-sm btn-outline-danger">Delete &nbsp;<i class="fa-solid fa-trash"></i>

                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
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
