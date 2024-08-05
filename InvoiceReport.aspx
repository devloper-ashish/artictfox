<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvoiceReport.aspx.cs" Inherits="OrderReport" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Artict Fox | A Cool Style</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/Done.png" />
    <style>
        nav {
            width: 102.6%;
            margin-left: -15px;
            background-color: #808080;
            color: white;
            font-size: 18px;
            font-weight: 700;
        }

        .invoice-container {
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            border-radius: 5px;
            margin: 15px 0;
        }

        .invoice-header {
            margin-bottom: 20px;
        }

            .invoice-header .client-info, .invoice-header .project-info {
                margin-bottom: 20px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="background: #808080">
            <nav class="text-center">Arctic Fox Invoice</nav>
            <div class="row">
                <div class="col-md-12">
                    <div class="invoice-container">
                        <div class="text-right mt-3">
                            <asp:Button ID="btnPrint" runat="server" Text="Print Invoice" CssClass="btn btn-primary px-1 py-0" />
                        </div>
                        <div class="invoice-header">
                            <img src="images/Done.png" width="6%" style="margin-top: -20px;" />

                            <p>
                                Issued: 
                                <asp:Label ID="lblIssuedDate" runat="server" Text="July 3, 2024"></asp:Label>
                            </p>
                            <p>
                                Payment Due:
                                <asp:Label ID="lblDueDate" runat="server" Text="Oct 27, 2024"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <div class="col-md-6 client-info">
                                <h5>Name</h5>
                                <p class="mb-0">Ashish Rathor</p>
                                <p class="mb-0">ashish@gmail.com.com</p>
                                <p>6265127664</p>
                            </div>
                            <div class="col-md-6 project-info">
                                <h5>Project Description</h5>
                                <p>Proin cursus, dui non tincidunt elementum, tortor ex feugiat enim, at elementum enim quam vel purus.</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 table-active table-condensed table-striped-columns">
                                <table class="table">
                                    <thead class="text-center">
                                        <tr>
                                            <th>Product ID</th>
                                            <th>Product Name</th>
                                            <th>Product Price</th>
                                            <th>Product Qnt</th>
                                            <th>Product Image</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="GrdProDetails" runat="server">
                                            <ItemTemplate>
                                                <tr class="text-center">
                                                    <td>
                                                        <asp:Label Text='<%#Eval("ProID") %>' runat="server" ID="lblproname"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label Text='<%#Eval("ProductName") %>' runat="server" ID="Label1"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label Text='<%#Eval("ProductPrice") %>' runat="server" ID="Label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label Text='<%#Eval("Quantity") %>' runat="server" ID="Label3"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Image ImageUrl='<%# "../UploadDoc/" + Eval("ProductImage") %>' ID="ProImg" runat="server" CssClass="" Width="60px" Height="60px" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <div class="text-right">
                                </div>
                            </div>
                        </div>
                        <%--         <div class="text-center mt-4">
                            <button type="button" class="btn btn-primary"></button>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>




    </form>
</body>
</html>
