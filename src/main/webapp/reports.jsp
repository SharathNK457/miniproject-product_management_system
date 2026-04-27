<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
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
            background: linear-gradient(135deg, #0f3460, #533483);
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
        }
        .report-card {
            border-radius: 12px;
            transition: all 0.3s;
            cursor: pointer;
        }
        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .input-section {
            display: none;
            margin-top: 15px;
        }
    </style>
    <script>
        function showInput(type) {
            document.getElementById("priceSection").style.display    = "none";
            document.getElementById("categorySection").style.display = "none";
            document.getElementById("topSection").style.display      = "none";
            document.getElementById("submitBtn").style.display       = "block";
            document.getElementById("reportType").value              = type;

            if (type == "price") {
                document.getElementById("priceSection").style.display = "block";
            } else if (type == "category") {
                document.getElementById("categorySection").style.display = "block";
            } else if (type == "top") {
                document.getElementById("topSection").style.display = "block";
            }
        }

        function validateReport() {
            let type = document.getElementById("reportType").value;
            if (type == "price") {
                let price = document.getElementById("priceValue").value;
                if (price == "" || isNaN(price) || price < 0) {
                    alert("Please enter a valid price!");
                    return false;
                }
            } else if (type == "category") {
                let cat = document.getElementById("categoryValue").value;
                if (cat == "") {
                    alert("Please select a category!");
                    return false;
                }
            } else if (type == "top") {
                let top = document.getElementById("topValue").value;
                if (top == "" || isNaN(top) || top <= 0) {
                    alert("Please enter a valid number!");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">
                    <h3 class="text-white mb-0">Product Reports</h3>
                </div>
                <div class="card-body p-4">

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <p class="text-muted mb-4">
                        Select a report type below:
                    </p>

                    <div class="row mb-4">
                        <div class="col-md-4 mb-3">
                            <div class="card report-card bg-primary text-white p-3"
                                 onclick="showInput('price')">
                                <h5>Price Report</h5>
                                <p class="mb-0 small">
                                    Products above a price
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card report-card bg-success text-white p-3"
                                 onclick="showInput('category')">
                                <h5>Category Report</h5>
                                <p class="mb-0 small">
                                    Products by category
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card report-card bg-warning text-dark p-3"
                                 onclick="showInput('top')">
                                <h5>Top Products</h5>
                                <p class="mb-0 small">
                                    Top N products by quantity
                                </p>
                            </div>
                        </div>
                    </div>

                    <form action="reportCriteria" method="post"
                          onsubmit="return validateReport()">

                        <input type="hidden" id="reportType"
                               name="reportType" value=""/>

                        <!-- Price Section -->
                        <div id="priceSection" class="input-section">
                            <div class="mb-3">
                                <label class="form-label fw-bold">
                                    Enter Minimum Price
                                </label>
                                <input type="number" id="priceValue"
                                       name="priceValue"
                                       class="form-control"
                                       placeholder="Enter price value"
                                       step="0.01"/>
                            </div>
                        </div>

                        <!-- Category Section -->
                        <div id="categorySection" class="input-section">
                            <div class="mb-3">
                                <label class="form-label fw-bold">
                                    Select Category
                                </label>
                                <select id="categoryValue"
                                        name="categoryValue"
                                        class="form-control">
                                    <option value="">Select Category</option>
                                    <option value="Electronics">Electronics</option>
                                    <option value="Furniture">Furniture</option>
                                    <option value="Stationery">Stationery</option>
                                    <option value="Clothing">Clothing</option>
                                    <option value="Food">Food</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>

                        <!-- Top N Section -->
                        <div id="topSection" class="input-section">
                            <div class="mb-3">
                                <label class="form-label fw-bold">
                                    Enter Number of Top Products
                                </label>
                                <input type="number" id="topValue"
                                       name="topValue"
                                       class="form-control"
                                       placeholder="Enter N (e.g. 5)"/>
                            </div>
                        </div>

                        <div id="submitBtn" style="display:none">
                            <button type="submit"
                                    class="btn btn-primary">
                                Generate Report
                            </button>
                        </div>

                    </form>

                    <div class="mt-3">
                        <a href="index.jsp" class="btn btn-secondary">
                            Back to Home
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>