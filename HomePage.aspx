<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Artict Fox | A Cool Style</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="css/vertical-layout-light/bootstrap.min.css" rel="stylesheet" />
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="shortcut icon" href="images/Done.png" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #000000ff;
            width: 100%;
            padding: 0 20px;
            position:-webkit-sticky;
            /*position: sticky;*/
            top: 0;
            color: white;
            padding-left: 10px;
            padding-top: 1px;
        }

        .logo {
            font-size: 20px;
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

            nav ul li {
                margin-right: 30px;
            }

                nav ul li a {
                    color: white;
                    text-decoration: none;
                }

        .cart a {
            color: white;
            text-decoration: none;
        }

        .user a {
            color: white;
            text-decoration: none;
        }

        .Admin a {
            color: white;
            text-decoration: none;
        }

        .hero {
            background-image: url(https://arcticfox.com/cdn/shop/articles/laptop-bag-banner-for-blog.jpg?v=1638774648);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            text-align: center;
            padding: 260px 70px;
            margin: 20px;
            /*padding-top: -20%;*/
        }



        .About {
            background-image: url(https://arcticfoxaustralia.com.au/cdn/shop/files/Arctic_banner_new_size_3_1400x.webp?v=1710317035);
            background-size: cover;
            background-position: bottom;
            background-repeat: no-repeat;
            color: white;
            text-align: center;
            padding: 100px 25px 250px 20px;
            margin: 25px;
            /*padding-top: -20%;*/
        }

        .Cntct {
            background-image: url(images/Arctic_Fox_suport.PNG);
            background-size: cover;
            background-position: bottom;
            background-repeat: no-repeat;
            color: white;
            text-align: center;
            padding: 100px 25px 250px 20px;
            margin: 25px;
            /*padding-top: -20%;*/
        }

            .Cntct p {
                color: black;
                margin-left: 80%;
                margin-top: -20px;
            }

        .hero h1 {
            font-size: 48px;
        }

        .hero p {
            font-size: 24px;
        }

        .btn {
            background-color: #ff0000;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 40px;
            display: inline-block;
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
                margin-left: 13px;
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
            gap: 9px; /* Optional: Space between cards */
        }


        #myBtn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #171717;
            color: white;
            cursor: pointer;
            padding: 16px;
            border-radius: 3px;
        }

            #myBtn:hover {
                background-color: #727266c1;
            }


        .Direction {
            text-align: center;
            background-color: #bad5ea48;
            font-size: 45px;
            padding-top: 10px;
            font-weight: 600;
            margin-left: -10%;
        }

        .marq {
            white-space: nowrap;
            animation: marquee 15s linear infinite;
            font-weight: bold;
            font-size: 42px;
            color: #808080;
            -webkit-text-stroke: 0px #808080;
            cursor: grab;
            user-select: none;
        }

        footer {
            background-color: #f7f7f7;
            padding: 20px;
            border-top: 1px solid #ddd;
        }

        .footer-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .subscribe-section {
            flex: 1;
            min-width: 250px;
            margin: 20px;
        }

        hr {
            color: black;
        }

        .subscribe-section h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .subscribe-section p {
            margin: 5px 0 15px;
        }



        .subscribe-section input[type="email"] {
            padding: 10px;
            border: 1px solid #000000ff;
            border-radius: 5px 5px 5px;
            flex: 1;
        }


        .footer-links {
            display: flex;
            flex: 2;
            justify-content: space-between;
            flex-wrap: wrap;
            margin: 20px;
        }

            .footer-links > div {
                flex: 1;
                min-width: 200px;
                margin: 10px;
            }

            .footer-links h3 {
                font-size: 10px;
                margin-bottom: 10px;
            }

            .footer-links ul {
                list-style: none;
                padding: 0;
            }

                .footer-links ul li {
                    margin: 5px 0;
                }

                    .footer-links ul li a {
                        color: #333;
                        text-decoration: none;
                        font-size: 15px;
                        line-height: 2;
                    }

                        .footer-links ul li a:hover {
                            text-decoration: underline;
                        }

        .social-section {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .social-icons {
            display: flex;
            list-style: none;
            padding: 0;
        }

            .social-icons li {
                margin: 5px;
            }

                .social-icons li a i {
                    width: 50px;
                    height: 50px;
                    font-size: 25px
                }

        .dropbtn {
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
        }

            .dropbtn a {
                text-decoration: none;
                color: white;
            }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

                .dropdown-content a:hover {
                    background-color: #ddd;
                    border-radius: 5px;
                }

        .dropdown:hover .dropdown-content {
            display: block;
            border-radius: 5px;
            width: 245px;
        }

        .dropdown:hover .dropbtn {
            background-color: transparent;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa-solid fa-angle-up"></i></button>
        <div class="Container">

            <header>
                <div class="logo">
                    &nbsp;&nbsp;  
                    <img src="https://www.pngkey.com/png/full/764-7647464_arctic-fox-bags-logo.png" class="ms-5" alt="Alternate Text" width="10%" /><br />
                    <h5 class="ms-5">Arctic Fox</h5>
                </div>
                <nav>
                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#products">Products</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </nav>

                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="UserLogin.aspx" class="fs-6">&nbsp; &nbsp;<i class="fa-solid fa-user-tie"></i>
                            &nbsp; Login</a></button>
                    <div class="dropdown-content">

                        <a href="RegistrationForm.aspx">New Customer ? &nbsp; &nbsp; &nbsp; &nbsp; Sign Up</a>
                        <hr class="mb-0 mt-0" />
                        <a href="#"><i class="fa-regular fa-user"></i>&nbsp; &nbsp; My Profile </a>
                        <a href="InvoiceReport.aspx"><i class="fa-solid fa-cube"></i>&nbsp; &nbsp; Order</a>
                    </div>
                </div>


                <div class="cart">
                    <a href="Cart.aspx" class="fs-6 me-5">&nbsp; &nbsp; <i class="fa-solid fa-cart-shopping fs-5"></i>

                        <asp:Label ID="CartItemCountLabel" runat="server" Text=""></asp:Label></a>
                    <asp:Label Text="" runat="server" />

                </div>
            </header>

            <section id="home">
                <div class="hero">
                </div>
            </section>

            <section id="products" class="p-4">

                <h2 class="text-center">BEST SELLERS</h2>
                <hr class="bg-dark py-1" />


                <div class="card form-group overflow-hidden mt-3 p-0" style="width: 100%">

                    <div class="row mt-3 p-3 pt-0 justify-content-center ">
                        <div class="col-md-12 text-center">
                            <div class="table-responsive">
                                <asp:Repeater ID="GrdProDetails" runat="server">
                                    <HeaderTemplate>
                                        <div class="card-container">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="product_card">
                                            <div class="image">
                                                <asp:Image ImageUrl='<%# "../UploadDoc/" + Eval("ProductImage") %>' ID="ProImg" runat="server" Width="70%" />
                                            </div>
                                            <div class="product_info">
                                                <asp:Label Text='<%#Eval("ProductName") %>' runat="server" ID="lblproname"></asp:Label>
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
                                                        <asp:Button ID="btnadd" runat="server" Text="Add To Cart" CommandArgument='<%#Eval("ProID") %>' OnClick="btnadd_Click" />

                                                        </span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </div>
   
                                    </FooterTemplate>
                                </asp:Repeater>


                            </div>
                        </div>
                    </div>
                </div>


            </section>


            <section id="about">
                <h2 class="text-center mt-3">About Us</h2>
                <p class="text-center mt-3">We are a leading e-commerce platform providing the best products at the best prices.</p>
                <div class="About">
                </div>

                <div class="Direction">
                    <marquee class="marq"
                        direction="left"
                        loop=""
                        scrollamount="15">
                        <div class="mar1">
                            FEATURED PRODUCTS ▪  FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪
                            FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪ FEATURED PRODUCTS ▪
                        </div>
                    </marquee>
                </div>

                <div class="Direction">
                    <marquee class="marq"
                        direction="right"
                        loop=""
                        scrollamount="15">
                        <div class="mar1">
                            NEW ARRIVALS&nbsp; NEW ARRIVALS &nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp;
                            NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp; NEW ARRIVALS  NEW ARRIVALS&nbsp; NEW ARRIVALS&nbsp;
                        </div>
                    </marquee>
                </div>

            </section>
            <hr />


            <section id="contact">

                <div class="Cntct">
                    <p>Email: support@arcticfox.com</p>
                    <p>Phone: +91 6265127664 </p>
                </div>
            </section>

            <footer>
                <div class="footer-container">
                    <div class="subscribe-section text-dark">
                        <h2>SUBSCRIBE!</h2>
                        <p>Sign up for our newsletter</p>
                        <input type="email" placeholder="Enter your Email" class="px-3" />
                        <butto
                            n type="submit">
                            <i class="fa-solid fa-arrow-right px-2 py-2"></i>
                        </butto>
                    </div>
                    <div class="footer-links">
                        <div class="policy-section text-lg-start">
                            <h3>PRIVACY POLICY</h3>
                            <ul>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Terms & Conditions</a></li>
                                <li><a href="#">Payment Policy</a></li>
                                <li><a href="#">Warranty Policy</a></li>
                                <li><a href="#">Cancel & Return Policy</a></li>
                                <li><a href="#">Shipping Policy</a></li>
                            </ul>
                        </div>
                        <div class="warranty-section text-lg-start">
                            <h3>PRODUCT WARRANTY</h3>
                            <ul>
                                <li><a href="#">Warranty Registration</a></li>
                                <li><a href="#">Warranty Claim</a></li>
                                <li><a href="#">Warranty Policy</a></li>
                                <li><a href="#">Cancel & Return Policy</a></li>
                                <li><a href="#">Track Your Order</a></li>
                                <li><a href="#">Join Us!</a></li>
                            </ul>
                        </div>
                        <div class="social-section">
                            <h3 class="text-dark ms-3">WE ARE ON</h3>
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-x-twitter"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-whatsapp"></i></a></li>

                            </ul>
                        </div>
                    </div>

                </div>
                <hr />
                <p class="text-dark mt-4">&copy; 2024 Arctic Fox. All rights reserved.</p>


            </footer>



        </div>
        <script>
            let mybutton = document.getElementById("myBtn");
            window.onscroll = function () { scrollFunction() };
            function scrollFunction() {
                if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>

    </form>
</body>
</html>
