<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, com.pms.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            min-height: 100vh;
            padding: 30px 0;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .card-header {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
        }
        .table thead tr th {
            background-color: #0f3460;
            color: white;
        }
        .table tbody tr:hover {
            background-color: rgba(83,52,131,0.1);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header text-center">
                    <h3 class="text-white mb-0">All Products</h3>
                </div>
                <div class="card-body p-4">

                    <% if (request.getAttribute("message") != null) { %>
                        <div class="alert alert-info">
                            <%= request.getAttribute("message") %>
                        </div>
                    <% } %>

                    <%
                    List<Product> products =
                        (List<Product>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                    %>
                    <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Price (Rs.)</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (Product p : products) { %>
                            <tr>
                                <td><%= p.getProductID() %></td>
                                <td><%= p.getProductName() %></td>
                                <td>
                                <% String cat = p.getCategory(); %>
                                <% if(cat.equals("Electronics")){ %>
                                    <span class="badge bg-primary"><%= cat %></span>
                                <% } else if(cat.equals("Furniture")){ %>
                                    <span class="badge bg-warning text-dark"><%= cat %></span>
                                <% } else if(cat.equals("Stationery")){ %>
                                    <span class="badge bg-success"><%= cat %></span>
                                <% } else { %>
                                    <span class="badge bg-secondary"><%= cat %></span>
                                <% } %>
                                </td>
                                <td>Rs. <%= String.format("%.2f", p.getPrice()) %></td>
                                <td>
                                <% if(p.getQuantity() < 10){ %>
                                    <span class="text-danger fw-bold">
                                        <%= p.getQuantity() %> (Low Stock)
                                    </span>
                                <% } else { %>
                                    <%= p.getQuantity() %>
                                <% } %>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                    </div>
                    <p class="text-muted">
                        Total Products:
                        <strong><%= products.size() %></strong>
                    </p>
                    <% } %>

                    <a href="index.jsp" class="btn btn-secondary mt-2">
                        Back to Home
                    </a>
                    <a href="displayProducts">View Products</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>