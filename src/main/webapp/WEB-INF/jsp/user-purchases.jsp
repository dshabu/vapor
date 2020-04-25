<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Purchases &mdash; Vapor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
    <style>
        .container table tbody td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <h3 class="title is-3">Purchases by ${pageContext.request.userPrincipal.name}</h3>
    <table class="table is-striped is-fullwidth">
        <thead>
        <tr>
            <th style="width: 75px;">&nbsp;</th>
            <th>Name</th>
            <th>Developer</th>
            <th>Genre</th>
            <th>Price</th>
            <th>Purchase Date</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty purchaseList}">
                <c:forEach items="${purchaseList}" var="pL">
                    <tr>
                        <td>
                            <figure class="image"><img src="${pL.getGame().getGameImgLink()}" alt=""></figure>
                        </td>
                        <td>${pL.getGame().getGameName()}</td>
                        <td>${pL.getGame().getDeveloper().getDeveloperName()}</td>
                        <td>${pL.getGame().getGenre().getGenreName()}</td>
                        <td>$${pL.getGame().getGamePrice()}</td>
                        <td>${pL.getPurchaseDate()}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="6" style="text-align: center;">No purchases by ${pageContext.request.userPrincipal.name}&hellip;</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>
</body>
</html>