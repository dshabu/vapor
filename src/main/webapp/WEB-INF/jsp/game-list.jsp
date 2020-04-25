<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Game Listing &mdash; Vapor</title>
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
    <h3 class="title is-3">Games Listing</h3>

    <table class="table is-striped is-fullwidth">
        <thead>
        <tr>
            <th style="width: 75px;">&nbsp;</th>
            <th>Game</th>
            <th>Developer</th>
            <th>Genre</th>
            <th>Price</th>
            <th>&nbsp;</th>
        </tr>
        </thead>

        <tbody>
        <c:choose>
            <c:when test="${not empty gameList}">
                <c:forEach items="${gameList}" var="gL">
                    <tr>
                        <td>
                            <figure class="image"><img src="${gL.getGameImgLink()}" alt=""></figure>
                        </td>
                        <td>${gL.getGameName()}</td>
                        <td>${gL.getDeveloper().getDeveloperName()}</td>
                        <td>${gL.getGenre().getGenreName()}</td>
                        <td>$${gL.getGamePrice()}</td>
                        <td>
                            <a href="/purchase/confirm/${gL.getGameId()}" class="button is-small is-primary">Buy</a>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <a href="/admin/edit-game/${gL.getGameId()}" class="button is-small is-info">Edit</a>
                                <a href="/admin/delete/${gL.getGameId()}" class="button is-small is-danger">Delete</a>
                            </sec:authorize>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" style="text-align: center;"><h6 class="subtitle is-6">No Games Found!</h6></td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>
</body>
</html>