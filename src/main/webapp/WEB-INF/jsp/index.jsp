<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Index &mdash; Vapor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
</head>
<body>
<div class="container">
    <jsp:include page="navbar.jsp"/>
    <section class="hero is-link">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Random Index Page.
                </h1>
                <h2 class="subtitle">
                    The navbar has the actual content.
                </h2>
            </div>
        </div>
    </section>
</div>
</body>
</html>