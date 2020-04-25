<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Account Details &mdash; Vapor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <div class="container">
        <h3 class="title is-3">Account Details</h3>
        <table class="table is-bordered">
            <tbody>
            <tr>
                <td>Full Name</td>
                <td>${user.getUserRealname()}</td>
            </tr>
            <tr>
                <td>Username</td>
                <td>${user.getUserUsername()}</td>
            </tr>
            <%--            <tr>--%>
            <%--                <td>Sum of Purchases</td>--%>
            <%--                <td>$${user.getPurchaseTotal()}</td>--%>
            <%--            </tr>--%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>