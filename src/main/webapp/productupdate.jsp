<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
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
            background: linear-gradient(135deg, #e65c00, #f9d423);
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
        }
        .form-control:focus {
            border-color: #e65c00;
            box-shadow: 0 0 0 0.2rem rgba(230,92,0,0.25);
        }
    </style>
    <script>
        function validateForm() {
            let id       = document.getElementById("productID").value;
            let name     = document.getElementById("productName").value;
            let category = document.getElementById("category").value;
            let price    = document.getElementById("price").value;
            let quantity = document.getElementById("quantity").value;

            if (id == "" || name == "" || category == "" ||
                price == "" || quantity == "") {
                alert("All fields are required!");
                return false;
            }
            if (isNaN(id) || id <= 0) {
                alert("Product ID must be a positive number!");
                return false;
            }
            if (isNaN(price) || price <= 0) {
                alert("Price must be a positive number!");
                return false;
            }
            if (isNaN(quantity) || quantity < 0) {
                alert("Quantity cannot be negative!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h3 class="text-white mb-0">Update Product</h3>
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

                    <form action="updateProduct" method="post"
                          onsubmit="return validateForm()">

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                Product ID
                            </label>
                            <input type="number" id="productID"
                                   name="productID"
                                   class="form-control"
                                   placeholder="Enter Product ID to update"
                                   required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                New Product Name
                            </label>
                            <input type="text" id="productName"
                                   name="productName"
                                   class="form-control"
                                   placeholder="Enter New Product Name"
                                   required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                New Category
                            </label>
                            <select id="category" name="category"
                                    class="form-control" required>
                                <option value="">Select Category</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Furniture">Furniture</option>
                                <option value="Stationery">Stationery</option>
                                <option value="Clothing">Clothing</option>
                                <option value="Food">Food</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                New Price
                            </label>
                            <input type="number" id="price"
                                   name="price"
                                   class="form-control"
                                   placeholder="Enter New Price"
                                   step="0.01" required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                New Quantity
                            </label>
                            <input type="number" id="quantity"
                                   name="quantity"
                                   class="form-control"
                                   placeholder="Enter New Quantity"
                                   required/>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit"
                                    class="btn btn-warning">
                                Update Product
                            </button>
                            <a href="index.jsp"
                               class="btn btn-secondary">
                                Back to Home
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>