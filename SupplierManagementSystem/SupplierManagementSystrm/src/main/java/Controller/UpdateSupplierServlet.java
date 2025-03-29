package Controller;

import model.SupplierDAO;
import model.Supplier;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateSupplierServlet")
public class UpdateSupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupplierDAO supplierDAO = new SupplierDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));
        String name = request.getParameter("name");
        String contactPerson = request.getParameter("contactPerson");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        Supplier supplier = new Supplier(supplierId, name, contactPerson, email, phoneNumber, address);
        boolean success = supplierDAO.updateSupplier(supplier);

        if (success) {
            response.sendRedirect("viewSupplier.jsp?message=Supplier updated successfully");
        } else {
            request.setAttribute("error", "Failed to update supplier");
            request.getRequestDispatcher("updateSupplier.jsp").forward(request, response);
        }
    }
}