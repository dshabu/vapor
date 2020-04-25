<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container">
    <nav class="navbar">

        <div class="navbar-brand">
            <a href="/" class="navbar-item"><strong>vapor</strong></a>
            <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false"
               data-target="vapor-navbar">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div class="navbar-menu" id="vapor-navbar">

            <div class="navbar-start">
                <a href="/user/purchases" class="navbar-item">Purchases</a>
                <a href="/user/details" class="navbar-item">Account Details</a>
                <a href="/search" class="navbar-item">Search</a>

                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">Listing</a>

                    <div class="navbar-dropdown">
                        <a href="/game/list" class="navbar-item">Games</a>
                        <a href="/genre/list" class="navbar-item">Genres</a>
                        <a href="/developer/list" class="navbar-item">Developers</a>
                    </div>
                </div>

                <a href="/credits" class="navbar-item">Credits</a>

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">Admin Panel</a>

                        <div class="navbar-dropdown">
                            <a href="/admin/new-game" class="navbar-item">New Game</a>
                        </div>
                    </div>
                </sec:authorize>
            </div>

            <div class="navbar-end">
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <div class="navbar-item">
                            <p>User: ${pageContext.request.userPrincipal.name}</p>
                        </div>

                        <div class="navbar-item">
                            <div class="buttons">
                                <form method="POST" action="${pageContext.request.contextPath}/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button class="button" type="submit">Logout</button>
                                </form>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="navbar-item">
                            <div class="buttons">
                                <a href="/user/register" class="button is-primary">Register</a>
                                <a href="/user/login" class="button is-primary">Login</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</div>