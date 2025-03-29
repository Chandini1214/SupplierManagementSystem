<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Supplier</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Add Supplier</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="AddSupplierServlet" method="post" class="form-container">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="contactPerson">Contact Person:</label>
            <input type="text" id="contactPerson" name="contactPerson"><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"><br>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber"><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address"><br>
            <input type="submit" value="Add Supplier" class="button">
        </form>
    </div>
</body>
</html>