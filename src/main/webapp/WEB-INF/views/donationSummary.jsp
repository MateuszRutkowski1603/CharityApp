<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Dziękujemy</title>
    <link rel="stylesheet" href="<c:url value="css/style.css"/>"/>
</head>
<body>
<header>
    <%@include file="header.jsp" %>
</header>
<div class="slogan container container--90">
    <h2>
        Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
        informacje o odbiorze.
    </h2>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
