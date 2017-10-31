<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="JavaScript/AJAX.js"></script>

    <title>Welcome - Please Login</title>

</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <h1 style="text-decoration: underline">Login Xphone:</h1>
            <br />
            <br />
            <asp:TextBox runat="server" ID="UserNameINPUT" placeholder="Enter User Name:"></asp:TextBox>
            <br />

            <input id="PasswordInput" placeholder="Enter a Password:" type="password" runat="server" />
            <br />

            <%--<asp:Button ID="SubmitBTN" Text="Enter" runat="server" OnClientClick="CheckSignIn()" />--%>
            <input type="button" runat="server" value="Sign In" onclick="CheckSignIn()"/>

        </div>
    </form>
</body>
</html>
