<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.SupplierDAO, model.Supplier" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Supplier</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Update Supplier</h2>
        <% 
            String idParam = request.getParameter("id");
            Supplier supplier = null;
            if (idParam != null) {
                SupplierDAO dao = new SupplierDAO();
                supplier = dao.getSupplierById(Integer.parseInt(idParam));
            }
            if (supplier != null) {
        %>
        <form action="UpdateSupplierServlet" method="post" class="form-container">
            <input type="hidden" name="supplierId" value="<%= supplier.getSupplierId() %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= supplier.getName() %>" required><br>
            <label for="contactPerson">Contact Person:</label>
            <input type="text" id="contactPerson" name="contactPerson" value="<%= supplier.getContactPerson() != null ? supplier.getContactPerson() : "" %>"><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= supplier.getEmail() != null ? supplier.getEmail() : "" %>"><br>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="<%= supplier.getPhoneNumber() != null ? supplier.getPhoneNumber() : "" %>"><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= supplier.getAddress() != null ? supplier.getAddress() : "" %>"><br>
            <input type="submit" value="Update Supplier" class="button">
        </form>
        <% } else { %>
            <p style="color:red;">Supplier not found. Please select a valid supplier to update.</p>
            <a href="viewSupplier.jsp">Back to Supplier List</a>
        <% } %>
    </div>
</body>
</html>