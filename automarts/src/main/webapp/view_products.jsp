<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="model.Product"%>
<%@page import="database.ProductDAO"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>View Products | AUTOMART</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
</script>

<style>

/* ================= GENERAL ================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{

    background:linear-gradient(
        135deg,
        #ffffff,
        #f8f8f8,
        #eeeeee
    );

    min-height:100vh;

    color:#333;

}


/* ================= NAVBAR ================= */

.navbar{

    background:#ffffff;

    box-shadow:
    0 3px 15px
    rgba(0,0,0,0.15);

}

.navbar-brand{

    color:#d60000 !important;

    font-size:26px;

    font-weight:bold;

}

.navbar-brand img{

    margin-right:8px;

}

.navbar-nav .nav-link{

    color:#333 !important;

    font-weight:bold;

    margin-left:15px;

    transition:0.3s;

}

.navbar-nav .nav-link:hover{

    color:#d60000 !important;

}


/* ================= PRODUCT BOX ================= */

.product-box{

    width:90%;

    margin:50px auto;

    background:#ffffff;

    padding:35px;

    border-radius:20px;

    box-shadow:
    0 10px 30px
    rgba(0,0,0,0.15);

}


/* ================= HEADING ================= */

.product-box h1{

    text-align:center;

    color:#d60000;

    font-weight:bold;

    margin-bottom:10px;

}

.product-subtitle{

    text-align:center;

    color:#777;

    margin-bottom:30px;

}


/* ================= TABLE ================= */

.table{

    margin-bottom:0;

    border-radius:12px;

    overflow:hidden;

}

.table thead{

    background:#d60000;

}

.table thead th{

    color:white;

    text-align:center;

    padding:15px;

    border-color:#d60000;

}

.table tbody td,
.table tbody th{

    text-align:center;

    vertical-align:middle;

    padding:15px;

    color:#333;

}

.table tbody tr{

    transition:0.3s;

}

.table tbody tr:hover{

    background:#fff0f0;

    transform:scale(1.01);

}


/* ================= PRICE ================= */

.price{

    color:#d60000;

    font-weight:bold;

}


/* ================= NO PRODUCTS ================= */

.no-products{

    text-align:center;

    padding:40px;

    color:#777;

}


/* ================= FOOTER ================= */

.footer{

    background:#111;

    color:white;

    text-align:center;

    padding:20px;

    margin-top:60px;

}

.footer h6{

    color:#d60000;

    font-weight:bold;

}

.footer p{

    color:#cccccc;

    margin:5px;

}


/* ================= RESPONSIVE ================= */

@media(max-width:768px){

    .product-box{

        width:95%;

        padding:20px;

    }

    .navbar-brand{

        font-size:22px;

    }

    .table{

        font-size:14px;

    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-sm py-3">

<div class="container-fluid fw-bolder fs-5">


<a class="navbar-brand" href="#">

<img src="logo image.png"
     alt="Logo"
     width="40"
     height="40"
     class="rounded-circle">

</a>


<a class="navbar-brand" href="#">

AUTOMART

</a>


<ul class="navbar-nav ms-auto">


<li class="nav-item">

<a class="nav-link" href="admin_home.jsp">

View Users

</a>

</li>


<li class="nav-item">

<a class="nav-link" href="view_products.jsp">

View Products

</a>

</li>


<li class="nav-item">

<a class="nav-link" href="addproduct.html">

Add Products

</a>

</li>


<li class="nav-item">

<a class="nav-link" href="about.html">

About

</a>

</li>


<li class="nav-item">

<a class="nav-link" href="login.html">

Logout

</a>

</li>


</ul>

</div>

</nav>



<!-- ================= PRODUCT LIST ================= -->

<div class="product-box">


<h1>🚗 Product List</h1>

<p class="product-subtitle">

Explore all products available in AUTOMART

</p>


<%

ProductDAO dao = new ProductDAO();

ArrayList<Product> productList =
(ArrayList<Product>) dao.getProducts();


if(productList.size() != 0){

int count = 0;

%>


<table class="table table-bordered table-hover">


<thead>

<tr>

<th>Sl.No</th>

<th>Product Name</th>

<th>Description</th>

<th>Price (₹)</th>

</tr>

</thead>


<tbody>


<%

for(Product product : productList){

count++;

%>


<tr>


<th>

<%=count%>

</th>


<td>

<strong>

<%=product.getName()%>

</strong>

</td>


<td>

<%=product.getDescription()%>

</td>


<td>

<span class="price">

₹ <%=product.getPrice()%>

</span>

</td>


</tr>


<%

}

%>


</tbody>

</table>


<%

}else{

%>


<div class="no-products">

<h4>🚗 No Products Available</h4>

<p>

Admin has not added any products yet.

</p>

</div>


<%

}

%>


</div>



<!-- ================= FOOTER ================= -->

<div class="footer">

<h6>

AUTOMART

</h6>

<p>

🚗 Premium Cars &nbsp; • &nbsp;
🏍 Premium Bikes &nbsp; • &nbsp;
🛠 Accessories

</p>

<p>

© 2026 AUTOMART. All Rights Reserved.

</p>

</div>


</body>

</html>