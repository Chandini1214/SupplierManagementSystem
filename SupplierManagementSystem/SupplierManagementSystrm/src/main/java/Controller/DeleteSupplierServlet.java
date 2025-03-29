package Controller;

import model.SupplierDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteSupplierServlet")
public class DeleteSupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupplierDAO supplierDAO = new SupplierDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));
        boolean success = supplierDAO.deleteSupplier(supplierId);

        if (success) {
            response.sendRedirect("viewSupplier.jsp?message=Supplier deleted successfully");
        } else {
            response.sendRedirect("deleteSupplier.jsp?error=Failed to delete supplier");
        }
    }
}