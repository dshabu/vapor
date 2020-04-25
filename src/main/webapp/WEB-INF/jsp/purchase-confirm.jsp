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
    <title>Purchase Confirmation &mdash; Vapor</title>
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
    <h3 class="title is-3">Buy Confirmation</h3>
    <h6 class="subtitle is-6">Buying as: ${pageContext.request.userPrincipal.name}</h6>

    <table class="table is-bordered is-fullwidth">
        <tbody>
        <tr>
            <td style="width: 150px;">
                <figure class="image"><img src="${game.getGameImgLink()}" alt=""></figure>
            </td>
            <td>${game.getGameName()}</td>
            <td>${game.getDeveloper().getDeveloperName()}</td>
            <td>${game.getGenre().getGenreName()}</td>
            <td><strong>$${game.getGamePrice()}</strong></td>
        </tr>
        </tbody>
    </table>

    <form action="/purchase/confirm" method="POST">
        <nav class="level">
            <div class="level-left">&nbsp;</div>
            <div class="level-right">
                <div class="level-item">
                    <div class="field">
                        <input type="hidden" name="gameId" readonly required value="${game.getGameId()}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <a href="/game/list" class="button">Cancel</a>
                        <button class="button is-primary" type="submit">Buy</button>
                    </div>
                </div>
            </div>
        </nav>
    </form>
</div>
</body>
</html>