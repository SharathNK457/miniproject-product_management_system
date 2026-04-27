package com.pms.dao;

import com.pms.model.Product;
import java.sql.*;
import java.util.*;

public class ProductDAO {

    public boolean addProduct(Product p) {
        String sql = "INSERT INTO Products VALUES (?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, p.getProductID());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getCategory());
            ps.setDouble(4, p.getPrice());
            ps.setInt(5, p.getQuantity());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Category"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM Products WHERE ProductID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}