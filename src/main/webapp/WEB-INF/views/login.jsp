<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<section class="login-page">
    <h2>Zaloguj się</h2>
    <form method="post" action="../login">
        <div class="form-group">
            <input type="email" name="username" placeholder="Email"/>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="../registration" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
    </form>
</section>
<%@ include file="footer.jsp" %>
