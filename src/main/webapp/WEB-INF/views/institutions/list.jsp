<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <title>Lista instytucji</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Lista instytucji</h1>
    <a href="${pageContext.request.contextPath}/institutions/add" class="btn btn-primary mb-3">Dodaj instytucję</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Nazwa</th>
            <th>Opis</th>
            <th>Akcje</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="institution" items="${institutions}">
            <tr>
                <td>${institution.name}</td>
                <td>${institution.description}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/institutions/edit/${institution.id}" class="btn btn-warning">Edytuj</a>
                    <a href="${pageContext.request.contextPath}/institutions/delete/${institution.id}" class="btn btn-danger">Usuń</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
