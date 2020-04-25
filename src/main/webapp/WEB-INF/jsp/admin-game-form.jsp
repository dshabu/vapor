<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:choose>
        <c:when test="${game.getGameId() == null}">
            <title>New Game &mdash; Vapor</title>
        </c:when>
        <c:otherwise>
            <title>Editing Game &mdash; Vapor</title>
        </c:otherwise>
    </c:choose>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.2/css/bulma.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container" style="width: 800px">
    <c:choose>
        <c:when test="${game.getGameId() == null}">
            <h3 class="title is-3">New Game</h3>
        </c:when>
        <c:otherwise>
            <h3 class="title is-3">Editing Game</h3>
        </c:otherwise>
    </c:choose>

    <form:form method="POST" modelAttribute="game" class="field" action="/admin/game-mod">
        <spring:bind path="gameId">
            <div class="field is-horizontal is-hidden">
                <div class="field-label">
                    <label class="label" for="gameIdField">&nbsp;</label>
                </div>
                <div class="field-body">
                    <div class="field">
                        <p class="control">
                            <form:input path="gameId" cssClass="input" id="gameIdField" name="gameIdField"
                                         readonly="true" hidden="true"></form:input>
                        </p>
                    </div>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="gameName">
            <div class="field is-horizontal">
                <div class="field-label">
                    <label class="label" for="gameNameField">Name</label>
                </div>
                <div class="field-body">
                    <div class="field">
                        <p class="control">
                            <form:input path="gameName" cssClass="input" id="gameNameField"
                                        name="gameNameField"></form:input>
                        </p>
                    </div>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="developer">
            <div class="field is-horizontal">
                <div class="field-label">
                    <label class="label" for="developerSelect">Developer</label>
                </div>
                <div class="field-body">
                    <div class="field has-addons">

                        <p class="control">
                            <span class="select">
                                <form:select path="developer" required="true">
                                    <form:option value="" disabled="true" selected="true">Select</form:option>
                                    <form:option value="new">New</form:option>
                                    <form:options items="${developerList}" itemValue="developerId"
                                                  itemLabel="developerName"></form:options>
                                </form:select>
                            </span>
                        </p>

                        <p class="control is-expanded">
                            <form:input path="newDeveloper" cssClass="input" required="true"
                                        disabled="true"></form:input>
                        </p>
                    </div>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="genre">
            <div class="field is-horizontal">
                <div class="field-label">
                    <label class="label" for="genreSelect">Genre</label>
                </div>
                <div class="field-body">
                    <div class="field has-addons">

                        <p class="control">
                            <span class="select">
                                <form:select path="genre" required="true">
                                    <form:option value="" disabled="true" selected="true">Select</form:option>
                                    <form:option value="new">New</form:option>
                                    <form:options items="${genreList}" itemValue="genreId"
                                                  itemLabel="genreName"></form:options>
                                </form:select>
                            </span>
                        </p>

                        <p class="control is-expanded">
                            <form:input path="newGenre" cssClass="input" required="true" disabled="true"></form:input>
                        </p>
                    </div>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="gamePrice">
            <div class="field is-horizontal">
                <div class="field-label">
                    <label class="label" for="gamePriceField">Price</label>
                </div>
                <div class="field-body">
                    <div class="field has-addons">
                        <p class="control">
                            <a class="button is-static">$</a>
                        </p>
                        <p class="control is-expanded">
                            <form:input path="gamePrice" class="input" type="number" min="0.00" step="0.01"
                                        id="gamePriceField" required="true"></form:input>
                        </p>
                    </div>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="gameImgLink">
            <div class="field is-horizontal">
                <div class="field-label">
                    <label class="label" for="gameImgLinkField">Image URL</label>
                </div>
                <div class="field-body">
                    <div class="field">
                        <p class="control">
                            <form:input path="gameImgLink" class="input" type="url" id="gameImgLinkField"
                                        required="true"/>
                        </p>
                    </div>
                </div>
            </div>
        </spring:bind>

        <div class="field is-horizontal">
            <div class="field-label">&nbsp;</div>
            <div class="field-body">
                <div class="field">
                    <p class="control">
                        <button class="button is-primary">Submit</button>
                    </p>
                </div>
            </div>
        </div>
    </form:form>
</div>

<script type="application/javascript">
    document.getElementById("developer").addEventListener("change", function () {
        // console.log(this.value);
        document.getElementById("newDeveloper").disabled = this.value !== "new";
    }, false);

    document.getElementById("genre").addEventListener("change", function () {
        // console.log(this.value);
        document.getElementById("newGenre").disabled = this.value !== "new";
    }, false);
</script>
</body>
</html>