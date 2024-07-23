<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="header.jsp" %>

<section class="registration-page">
  <h2>Załóż konto</h2>
  <form:form method="post" modelAttribute="user">
    <div class="form-group">
      <form:input type="text" path="name" placeholder="Name" class="form-control" />
    </div>
    <div class="form-group">
      <form:input type="email" path="email" placeholder="Email" class="form-control" />
    </div>
    <div class="form-group">
      <form:input type="password" path="password" placeholder="Password" class="form-control" />
    </div>
    <div class="form-group">
      <form:input type="password" path="repassword" placeholder="Repeat Password" class="form-control" />
    </div>
    <div class="form-group form-group--buttons">
      <button class="btn" type="submit">Załóż konto</button>
    </div>
  </form:form>
  <c:if test="${not empty error}">
    <div class="error">${error}</div>
  </c:if>
  <c:if test="${param.success != null}">
    <div class="success">Registration successful. You can now <a href="/login">login</a>.</div>
  </c:if>
</section>

<%@ include file="footer.jsp" %>
