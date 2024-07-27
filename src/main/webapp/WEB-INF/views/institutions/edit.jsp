<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edytuj Instytucję</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Edytuj Instytucję</h1>
    <form:form action="/institutions/edit/${institution.id}" method="post" modelAttribute="institution" class="needs-validation">

        <div class="form-group">
            <label for="name">Nazwa:</label>
            <form:input type="text" id="name" path="name" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="description">Opis:</label>
            <form:textarea id="description" path="description" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">Zapisz zmiany</button>
        <a href="../institutions/list" class="btn btn-secondary">Powrót do listy</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
