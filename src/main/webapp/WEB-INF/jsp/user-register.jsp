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
    <title>Register &mdash; Vapor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container" style="width: 500px">
    <h3 class="title is-3">Register</h3>
    <form:form method="POST" modelAttribute="userForm">
        <c:if test="${status == 'userExists'}">
            <div class="notification is-danger is-small">
                <p>Sorry, that username already exists!</p>
            </div>
        </c:if>

        <spring:bind path="userRealname">
            <div class="field">
                <label class="label" for="userRealname">Full Name</label>
                <div class="control">
                    <form:input required="true" path="userRealname" type="text" class="input"></form:input>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="userUsername">
            <div class="field">
                <label class="label" for="userUsername">Username</label>
                <div class="control">
                    <form:input required="true" path="userUsername" class="input"></form:input>

                </div>
            </div>
        </spring:bind>

        <spring:bind path="userPassword">
            <div class="field">
                <label class="label" for="userPassword">Password</label>
                <div class="control">
                    <form:input required="true" path="userPassword" type="password" class="input"></form:input>
                </div>
            </div>
        </spring:bind>

        <div class="field">
            <p class="control">
                <button class="button is-primary" type="submit">Register</button>
            </p>
        </div>

        <div class="field">
            <a href="/user/login">Already have an account? Login here!</a>
        </div>
    </form:form>
</div>
</body>
</html>