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
    <title>Search &mdash; Vapor</title>
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
    <h3 class="title is-3">Search</h3>
    <form:form method="POST" modelAttribute="searchCriteria" class="field is-horizontal">
        <spring:bind path="sc_gameName">
            <div class="field is-expanded">
                <label class="label" for="sc_gameName">Game Name</label>
                <p class="control is-expanded">
                    <form:input cssClass="input" path="sc_gameName" required="true"></form:input>
                </p>
            </div>
        </spring:bind>
        &nbsp;
        <spring:bind path="sc_developerId">
            <div class="field">
                <label class="label" for="sc_developerId">Developer</label>
                <p class="control">
                <span class="select">
                    <form:select path="sc_developerId">
                        <form:option value="">Any</form:option>
                        <form:options items="${developerList}" itemValue="developerId"
                                      itemLabel="developerName"></form:options>
                    </form:select>
                </span>
                </p>
            </div>
        </spring:bind>
        &nbsp;
        <spring:bind path="sc_genreId">
            <div class="field">
                <label class="label" for="sc_genreId">Genre</label>
                <p class="control">
                <span class="select">
                    <form:select path="sc_genreId">
                        <form:option value="">Any</form:option>
                        <form:options items="${genreList}" itemValue="genreId" itemLabel="genreName"></form:options>
                    </form:select>
                </span>
                </p>
            </div>
        </spring:bind>
        &nbsp;
        <div class="field">
            <label class="label" for="sc_gamePrice">Price</label>
            <div class="field has-addons">
                <spring:bind path="sc_priceOperator">
                    <p class="control">
                        <span class="select">
                            <form:select path="sc_priceOperator">
                                <form:option value="le">&le;</form:option>
                                <form:option value="ge">&ge;</form:option>
                            </form:select>
                        </span>
                    </p>
                </spring:bind>
                <spring:bind path="sc_gamePrice">
                    <p class="control">
                        <form:input cssClass="input" path="sc_gamePrice" min="0.00" step="0.01"></form:input>
                    </p>
                </spring:bind>
            </div>
        </div>
        &nbsp;
        <div class="field">
            <label class="label">&nbsp;</label>
            <p class="control">
                <button class="button is-primary">Submit</button>
            </p>
        </div>
    </form:form>
</div>
<br>
<div class="container">
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
            <c:when test="${not empty emptyGameList}">
                <tr>
                    <td colspan="6" style="text-align: center;">No games found with current criteria.</td>
                </tr>
            </c:when>
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
                    <td colspan="6" style="text-align: center;">Results will appear here&hellip;</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>
</body>
</html>