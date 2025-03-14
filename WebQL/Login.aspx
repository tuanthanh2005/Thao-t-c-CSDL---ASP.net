<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="Content/pagination.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <h2>Login form</h2>
                <div class="form-group">
                    <label for="email">Username:</label>
                  <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                </div>
                <asp:Button ID="btLogin" runat="server" Text="Login" CssClass="btn btn-default" OnClick="btLogin_Click" />
                <br />
               <asp:Label ID="lblthongbao" runat="server" Text="" CssClass="text-danger"></asp:Label>


            </div>
        </div>
    </form>
</body>
</html>
