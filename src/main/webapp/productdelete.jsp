<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Product</title>
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
            background: linear-gradient(135deg, #c0392b, #e74c3c);
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
        }
        .form-control:focus {
            border-color: #c0392b;
            box-shadow: 0 0 0 0.2rem rgba(192,57,43,0.25);
        }
    </style>
    <script>
        function validateForm() {
            let id = document.getElementById("productID").value;
            if (id == "" || isNaN(id) || id <= 0) {
                alert("Please enter a valid Product ID!");
                return false;
            }
            return confirm(
                "Are you sure you want to delete product ID: " + id + "?"
            );
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h3 class="text-white mb-0">Delete Product</h3>
                </div>
                <div class="card-body p-4">

                    <% if (request.getAttribute("success") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("success") %>
                        </div>
                    <% } %>
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <div class="alert alert-warning">
                        <strong>Warning!</strong>
                        This action cannot be undone.
                    </div>

                    <form action="deleteProduct" method="post"
                          onsubmit="return validateForm()">

                        <div class="mb-3">
                            <label class="form-label fw-bold">