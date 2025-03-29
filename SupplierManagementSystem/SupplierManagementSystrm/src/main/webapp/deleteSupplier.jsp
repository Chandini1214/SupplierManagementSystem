<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Supplier</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Delete Supplier</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"><%= request.getParameter("error") %></p>
        <% } %>
        <form action="DeleteSupplierServlet" method="post" class="form-container">
            <label for="supplierId">Supplier ID:</label>
            <input type="number" id="supplierId" name="supplierId" required><br>
            <input type="submit" value="Delete Supplier" class="button" onclick="return confirm('Are you sure you want to delete this supplier?');">
        </form>
        <a href="viewSupplier.jsp">Back to Supplier List</a>
    </div>
</body>
</html>