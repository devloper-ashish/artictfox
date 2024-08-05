<%@ Page Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="State.aspx.cs" Inherits="AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="s" ShowMessageBox="true" ShowSummary="false" />
    <div class="alert alert-success" role="alert" id="alertmsg" runat="server" visible="false">
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>

    <div class="card form-group">
        <div class="card-header" style="background-color: #fae1aeff">
            <span class="ms-2">State Master</span>
        </div>
        <div class="row mt-3 p-3 pt-0 justify-content-center ">
            <div class="col-md-4">
                <fieldset style="margin-top: -1%;">
                    <legend class="text-dark">Add State </legend>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Label Text="State Name" runat="server" CssClass="ms-2 fw-bold"></asp:Label><span style="color: red;">*</span>
                            <asp:TextBox runat="server" ID="txtStname" placeholder=" Enter State Name" CssClass="form-control mt-2 border-black p-2"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Plese Enter state name" ControlToValidate="txtStname" runat="server" ForeColor="Red" ValidationGroup="s" />
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-9 text-center">
                                <asp:Button Text="Submit" runat="server" ID="btn_submit" CssClass="btn btn-outline-success shadow px-3 mt-3" OnClick="btn_submit_Click" ValidationGroup="s" />

                                <asp:Button Text="Clear" runat="server" ID="btn_clear" CssClass="btn btn-outline-danger shadow px-3 mt-3" />
                            </div>
                        </div>
                        <%-- <asp:FileUpload runat="server"/>  search karna hai backend ka code folder me kesek save karate hai --%>
                    </div>
                </fieldset>
            </div>



            <div class="col-md-8 text-center">
                <fieldset style="margin-top: -1%;">
                    <legend style="margin-left: -40%" class="text-dark">State Details </legend>
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="state_grdDetails" AutoGenerateColumns="false" CssClass="table table-bordered border-dark-subtle" OnRowCommand="state_grdDetails_RowCommand">
                            <HeaderStyle BackColor="Wheat" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No.">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" State ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("State_id") %>' runat="server" ID="lblstid"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="State Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("State_Name") %>' runat="server" ID="lblstname"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnStateStatus" runat="server" CssClass='<%#  Eval ("Isactive").ToString()== "False" ? "btn btn-sm btn-danger" : "btn btn-sm btn-success" %>'
                                            Text='<%# Eval ("Isactive").ToString()=="False" ? "Deactive" : "Active" %>'
                                            CommandName="StateStatus" OnClientClick="return toggleRow(this);" CommandArgument='<%# Eval("State_id").ToString() %>'></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Update / Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="UpdateRecord" OnClientClick="return confirm('Are you sure you want to Update')"
                                            CommandArgument='<%# Eval("State_id") %>' CssClass="btn btn-sm btn-outline-warning"> <i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>

                                        &nbsp;  
                                       <asp:LinkButton runat="server" CommandName="DeleteRecord" OnClientClick="return confirm('Are you sure you want to Delete')"
                                           CommandArgument='<%# Eval("State_id") %>' CssClass="btn btn-sm btn-outline-danger">   <i class="fa-solid fa-trash"></i></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>






