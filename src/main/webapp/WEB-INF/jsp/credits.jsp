<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Credits &mdash; Vapor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <h3 class="title is-3">Data Credits</h3>
    <ul>
        <li>Video Game Source: <a href="https://www.kaggle.com/ashaheedq/video-games-sales-2019">https://www.kaggle.com/ashaheedq/video-games-sales-2019</a>
            by Abdulshaheed Alqunber
        </li>
        <li>Spring Security Tutorial: <a
                href="https://github.com/hellokoding/hellokoding-courses/tree/master/springboot-examples/springboot-registration-login">https://hellokoding.com/registration-and-login-example-with-spring-security-spring-boot-spring-data-jpa-hsql-jsp</a>
            by Giau Ngo
        </li>
        <li>CSS Framework: <a href="https://bulma.io/">Bulma</a> by Jeremy Thomas</li>
    </ul>
</div>
</body>
</html>