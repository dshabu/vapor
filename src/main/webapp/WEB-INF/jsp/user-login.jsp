<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login &mdash; Vapor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container" style="width: 500px">
    <h3 class="title is-3">Login</h3>
    <c:if test="${not empty invalidLogin}">
        <div class="notification is-danger">
            <p>Username or password is invalid.</p>
        </div>
    </c:if>
    <c:if test="${not empty registerSuccess}">
        <div class="notification is-success">
            <p>Congrats, you registered successfully! Please login to purchase games.</p>
        </div>
    </c:if>
    <form action="${pageContext.request.contextPath}/user/login" method="POST">
        <div class="field">
            <label class="label" for="username">Username</label>
            <div class="control">
                <input type="text" class="input" name="username"
                       id="username" autofocus>
            </div>
        </div>
        <div class="field">
            <label class="label" for="password">Password</label>
            <div class="control">
                <input class="input" type="password" required="true" name="password" id="password">
            </div>
        </div>

        <div class="field">
            <p class="control">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button class="button is-primary" type="submit">Login</button>
            </p>
        </div>

        <div class="field">
            <p class="control">
                <a href="/user/register">Don't have an account? Register here!</a>
            </p>
        </div>
    </form>
</div>
</body>
</html>