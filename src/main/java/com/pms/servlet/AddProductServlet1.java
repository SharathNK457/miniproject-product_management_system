package com.pms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pms.dao.DBConnection;


public class AddProductServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String productId = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        try {
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO products(product_id, product_name, category, price, quantity) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, productId);
            ps.setString(2, productName);
            ps.setString(3, category);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<h2>Product Added Successfully</h2>");
                out.println("<a href='index.jsp'>Back to Home</a>");
            } else {
                out.println("<h2>Failed to Add Product</h2>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        }
    }
}