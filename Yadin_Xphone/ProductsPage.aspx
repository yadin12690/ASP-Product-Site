<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="Yadin_Xphone.ProductsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="JavaScript/ProductAJAX.js"></script>--%>

    <title>Products Page </title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upTest" runat="server">
            <ContentTemplate>
                <h1 align="center">Welcome to Xphone products page</h1>

                <asp:GridView ID="GridView1" runat="server" align="center">
                </asp:GridView>
                <br />
                <br />
                <br />


                <table class="auto-style1" align="center">
                    <tr>
                        <td>Product Name :</td>
                        <td>
                            <asp:TextBox ID="nameInput" runat="server"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>
                            <asp:TextBox ID="PriceInput" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Vendor</td>
                        <td>
                            <asp:TextBox ID="VendorInput" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="AddBTN" runat="server" Text="Add Product" autopostback="True" OnClick="AddBTN_Click" />
                      
                        </td>

                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
