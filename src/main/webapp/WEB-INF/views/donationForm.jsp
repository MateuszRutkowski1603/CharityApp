<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="header.jsp" %>

<h2>Dodaj Dar</h2>

<form:form id="donationForm" modelAttribute="donation" method="post">
    <div class="form-group">
        <form:label path="quantity">Liczba worków:</form:label>
        <form:input path="quantity" name="quantity"/>
    </div>
    <div class="form-group">
        <form:label path="categories">Kategoria:</form:label>
        <form:checkboxes path="categories" items="${categories}" itemValue="id" itemLabel="name" name="categories"/>
    </div>
    <div class="form-group">
        <form:label path="institution">Instytucja:</form:label>
        <form:select path="institution.id" items="${institutions}" itemValue="id" itemLabel="name" name="institution.id"/>
    </div>
    <div class="form-group">
        <form:label path="street">Ulica:</form:label>
        <form:input path="street" name="street"/>
    </div>
    <div class="form-group">
        <form:label path="city">Miasto:</form:label>
        <form:input path="city" name="city"/>
    </div>
    <div class="form-group">
        <form:label path="zipCode">Kod pocztowy:</form:label>
        <form:input path="zipCode" name="zipCode"/>
    </div>
    <div class="form-group">
        <form:label path="pickUpDate">Data odbioru:</form:label>
        <form:input path="pickUpDate" type="date" name="pickUpDate"/>
    </div>
    <div class="form-group">
        <form:label path="pickUpTime">Czas odbioru:</form:label>
        <form:input path="pickUpTime" type="time" name="pickUpTime"/>
    </div>
    <div class="form-group">
        <form:label path="pickUpComment">Komentarz do odbioru:</form:label>
        <form:textarea path="pickUpComment" name="pickUpComment"/>
    </div>
    <div class="form-group">
        <input type="submit" value="Dodaj Dar" />
    </div>
</form:form>

<%@ include file="footer.jsp" %>


