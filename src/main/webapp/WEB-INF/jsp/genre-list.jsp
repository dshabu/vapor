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
    <title>Genre Listing &mdash; Vapor</title>
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
    <h3 class="title is-3">Genre Listing</h3>

    <table class="table is-striped is-fullwidth">
        <thead>
        <tr>
            <th style="width: 75%">Genre</th>
            <th>Number of Games</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${genreList}" var="gL">
            <tr>
                <td>${gL.getGenreName()}</td>
                <td><a href="/genre/list/${gL.getGenreId()}">${gL.getGameCount()}</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>