<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Report Form</title>
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
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h3 class="text-white mb-0">Generate Report</h3>
                </div>
                <div class="card-body p-4">

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <%
                    String reportType =
                        (String) request.getAttribute("reportType");
                    %>

                    <form action="report" method="post">
                        <input type="hidden" name="reportType"
                               value="<%= reportType %>"/>

                        <% if ("price".equals(reportType)) { %>
                            <div class="mb-3">
                                <label class="form-label fw-bold">
                                    Enter Minimum Price
                                </label>
                                <input type="number" name="priceValue"
                                       class="form-control"
                                       placeholder="Enter price"
                                       step="0.01" required/>
                            </div>

                        <% } else if ("category".equals(reportType)) { %>
                            <div class="mb-3">
                                <label class="form-label fw-bold">
                                    Select Category
                                </label>
                                <select name="categoryValue"
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

                        <% } else if ("top".equals(reportType)) { %>
                            <div class="mb-3">
                                <label class="form-label fw-bold">
                                    Enter Number of Top Products
                                </label>
                                <input type="number" name="topValue"
                                       class="form-control"
                                       placeholder="Enter N (e.g. 5)"
                                       required/>
                            </div>
                        <% } %>

                        <div class="d-flex gap-2">
                            <button type="submit"
                                    class="btn btn-primary">
                                Generate Report
                            </button>
                            <a href="reports.jsp"
                               class="btn btn-secondary">
                                Back to Reports
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