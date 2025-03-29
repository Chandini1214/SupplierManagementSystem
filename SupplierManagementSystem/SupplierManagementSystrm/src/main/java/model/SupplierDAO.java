package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/DB";
    private static final String USER = "root";
    private static final String PASSWORD = "Chandubindu@123";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public List<Supplier> getAllSuppliers() {
        List<Supplier> suppliers = new ArrayList<>();
        String sql = "SELECT * FROM Supplier";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                suppliers.add(new Supplier(
                    rs.getInt("supplier_id"),
                    rs.getString("name"),
                    rs.getString("contact_person"),
                    rs.getString("email"),
                    rs.getString("phone_number"),
                    rs.getString("address")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suppliers;
    }

    public boolean addSupplier(Supplier supplier) {
        String sql = "INSERT INTO Supplier (name, contact_person, email, phone_number, address) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, supplier.getName());
            pstmt.setString(2, supplier.getContactPerson());
            pstmt.setString(3, supplier.getEmail());
            pstmt.setString(4, supplier.getPhoneNumber());
            pstmt.setString(5, supplier.getAddress());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Supplier getSupplierById(int id) {
        String sql = "SELECT * FROM Supplier WHERE supplier_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Supplier(
                    rs.getInt("supplier_id"),
                    rs.getString("name"),
                    rs.getString("contact_person"),
                    rs.getString("email"),
                    rs.getString("phone_number"),
                    rs.getString("address")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateSupplier(Supplier supplier) {
        String sql = "UPDATE Supplier SET name = ?, contact_person = ?, email = ?, phone_number = ?, address = ? WHERE supplier_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, supplier.getName());
            pstmt.setString(2, supplier.getContactPerson());
            pstmt.setString(3, supplier.getEmail());
            pstmt.setString(4, supplier.getPhoneNumber());
            pstmt.setString(5, supplier.getAddress());
            pstmt.setInt(6, supplier.getSupplierId());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteSupplier(int id) {
        String sql = "DELETE FROM Supplier WHERE supplier_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}