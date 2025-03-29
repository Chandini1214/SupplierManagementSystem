<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Supplier" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Suppliers</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Supplier List</h2>
    <% 
        String message = request.getParameter("message");
        if (message != null) {
    %>
        <p style="color:green;"><%= message %></p>
    <% } %>
    <table class="table" border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact Person</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        <%
            List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
            if (suppliers != null && !suppliers.isEmpty()) {
                for (Supplier supplier : suppliers) {
        %>
        <tr>
            <td><%= supplier.getSupplierId() %></td>
            <td><%= supplier.getName() %></td>
            <td><%= supplier.getContactPerson() != null ? supplier.getContactPerson() : "" %></td>
            <td><%= supplier.getEmail() != null ? supplier.getEmail() : "" %></td>
            <td><%= supplier.getPhoneNumber() != null ? supplier.getPhoneNumber() : "" %></td>
            <td><%= supplier.getAddress() != null ? supplier.getAddress() : "" %></td>
            <td>
                <a href="updateSupplier.jsp?id=<%= supplier.getSupplierId() %>" class="button edit-btn">Edit</a>
                <form action="DeleteSupplierServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this supplier?');">
                    <input type="hidden" name="supplierId" value="<%= supplier.getSupplierId() %>">
                    <input type="submit" value="Delete" class="button delete-btn">
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7" style="text-align:center;">No suppliers found. Add a supplier to get started.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>