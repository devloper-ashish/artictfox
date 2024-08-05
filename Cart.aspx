<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="AddToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Artict Fox | A Cool Style</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="css/vertical-layout-light/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="shortcut icon" href="images/Done.png" />
    <style>
        .product_card {
            width: auto;
            height: 230px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 8px rgb(0, 0, 0, 0.39);
            overflow: hidden;
            transition: 0.3s;
            border: 1px solid rgb(52, 50, 50, 0.32);
            position: relative;
            margin-top: 8px;
        }

        .image {
            width: 100%;
            height: 185px;
            object-fit: cover;
            border-radius: 16px 16px 0 0;
            margin-top: 11px;
            margin-left: 40px;
        }





        .product_card .product_info {
            padding: 10px;
            font: 14px 'Poppins', sans-serif;
            margin-left: 35px;
            margin-top: 15px;
        }

        .cart-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-top: 2%;
        }

            .quantity-controls button {
                width: 30px;
                height: 30px;
            }

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
            padding: 10px 15px;
            position: -webkit-sticky;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Select Delivery Address</h1>

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6>Log in to view saved addresses</h6>

                        <label style="font-size: 14px;">Use Pincode to check Delivery Info </label>
                        <asp:TextBox runat="server" placeholder="Enter Pincode" CssClass="px-1 rounded-1" />
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <header>
            <div class="logo">
                &nbsp;&nbsp;  
         <img src="https://www.pngkey.com/png/full/764-7647464_arctic-fox-bags-logo.png" alt="Alternate Text" width="10%" /><br />
                <h5>Arctic Fox</h5>
            </div>
            <nav>
                <ul>
                    <li><a href="HomePage.aspx">Home</a></li>
                    <li><a href="HomePage.aspx">Products</a></li>
                    <li><a href="HomePage.aspx">About</a></li>
                    <li><a href="HomePage.aspx">Contact</a></li>
                </ul>
            </nav>


            <div class="cart">
                <a href="Cart.aspx" class="fs-6">&nbsp; &nbsp; <i class="fa-solid fa-cart-shopping fs-5"></i>
                    <br />
                    <asp:Label ID="CartItemCountLabel" runat="server" Text="Cart (0)"></asp:Label></a>
                <asp:Label Text="" runat="server" />

            </div>
        </header>

        <div class="container">
            <div class="card mt-3" style="border: 1px solid">
                <div class="card-header">
                    &nbsp; &nbsp;    From Saved Addresses
            <button type="button" class="btn btn-outline-dark float-end" data-bs-toggle="modal" data-bs-target="#exampleModal" style="font-size: 11px;">
                Enter Delivery Pincode
            </button>
                </div>

                <div class="card-body ">
                    <div class="row">
                        <div class="col-md-8 ">
                            <div class="card-container px-2">
                                <asp:Repeater ID="GrdProDetails" runat="server" >
                                    <ItemTemplate>
                                        <div class="product_card float-sm-start">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="image">
                                                        <asp:Image ImageUrl='<%# "../UploadDoc/" + Eval("ProductImage") %>' ID="ProImg" runat="server" CssClass="img-fluid" />
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="product_info">
                                                        <asp:Label Text='<%# Eval("Productname") %>' CssClass="fw-bold" runat="server" ID="lblproname"></asp:Label>

                                                        <span style="font-size: 13px; margin-left: 50px; color: rgb(39, 38, 38, 0.64)">Delivery by Thu Jul 4 | Free</span>

                                                        <div class="bottom mt-3">
                                                            <div class="price">

                                                                <asp:Label Text='<%# Eval("ProductPrice") %>' CssClass="fw-bold fs-4" runat="server" ID="lblProprice"></asp:Label>
                                                                ₹  
                                                                <span style="font-size: 13px; margin-left: 10px; color: rgb(13, 91, 12, 0.82); font-weight: 500;">10% Off To Offer Applied</span>
                                                            </div>
                                                        </div>
                                                        <div class="quantity-controls mt-3">
                                                            <asp:Button Text="-" CommandArgument='<%# Eval("ProID") %>' OnClick="DecreaseQuantity_Click" CssClass="btn btn-outline-secondary btn-sm px-3" runat="server" />
                                                            <asp:Label Text='<%# Eval("Quantity") %>' runat="server" ID="CartProductQuantity" CssClass="px-3 py-1 form-control d-inline w-auto mx-2  text-center"></asp:Label>
                                                            <asp:Button Text="+" CommandArgument='<%# Eval("ProID") %>' OnClick="IncreaseQuantity_Click" CssClass="btn btn-outline-secondary btn-sm px-3" runat="server" />
                                                        </div>
                                                        <div class="mt-3" style="margin-left: -20px; font-size: 5px;">
                                                            <%--<asp:LinkButton Text="" CommandArgument='<%# Eval("ProID") %>' OnClick="SaveForLater_Click" runat="server" CssClass="ms-3 px-3 py-1 text-decoration-none fw-bold btn btn-outline-dark"><i class="fa-solid fa-bookmark"></i> Save for Later</asp:LinkButton>--%>
                                                            <asp:LinkButton Text="" CommandArgument='<%# Eval("ProID") %>' OnClick="btnremove_Click" runat="server" CssClass="ms-3 px-3 py-1 text-decoration-none fw-bold  btn btn-outline-dark "><i class="fa-regular fa-square-minus"></i> Remove</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    PRICE DETAILS
                                </div>
                                <div class="card-body">
                                    <p class="mb-1">
                                        Price (<asp:Label ID="TotalItemsLabel" runat="server" Text="0" />
                                        items):
                                        <asp:Label ID="TotalPriceLabel" runat="server" Text="0" CssClass="float-end"></asp:Label>
                                    </p>
                                    <p class="mb-0">
                                        Discount: -
                                        <asp:Label ID="DiscountLabel" runat="server" Text="0" CssClass="float-end" />
                                    </p>
                                    <p>Delivery Charges: Free</p>
                                    <hr class="mb-0" />
                                    <p class="mb-0">
                                        Total Amount: 
                                        <asp:Label ID="FinalPriceLabel" runat="server" Text="0" CssClass="float-end" />
                                    </p>
                                    <p class="text-success mb-0">
                                        You will save
                                        <asp:Label ID="SavingsLabel" runat="server" Text="0" />
                                        on this order
                                    </p>
                                </div>
                            </div>
                            <div class="mt-1">
                                <asp:Button ID="btnPlaceOrder" runat="server" Text="PLACE ORDER" CssClass="btn btn-warning form-control" OnClientClick="return placeOrder();" OnClick="btnPlaceOrder_Click" />

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function showSuccessPopup() {
                Swal.fire({
                    title: "Order Placed!",
                    text: "Your order has been placed successfully!",
                    icon: "success"
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'OrderPage.aspx'; // Redirect to OrderPage.aspx
                    }
                });
            }
        </script>

    </form>
</body>
</html>





