<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .card-header {
            background: linear-gradient(135deg, #0f3460, #533483);
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
        }
        .btn-menu {
            width: 100%;
            padding: 15px;
            margin: 8px 0;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s;
        }
        .btn-menu:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h2 class="text-white mb-0">Product Management System</h2>
                    <p class="text-white-50 mt-2 mb-0">Manage your product inventory</p>
                </div>
                <div class="card-body p-4">

                    <a href="productadd.jsp" class="btn btn-primary btn-menu">
                        Add New Product
                    </a>

                    <a href="productupdate.jsp" class="btn btn-warning btn-menu">
                        Update Product
                    </a>

                    <a href="productdelete.jsp" class="btn btn-danger btn-menu">
                        Delete Product
                    </a>

                    <a href="displayProducts" class="btn btn-success btn-menu">
                        Display All Products
                    </a>

                    <a href="reports.jsp" class="btn btn-info btn-menu text-white">
                        View Reports
                    </a>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>