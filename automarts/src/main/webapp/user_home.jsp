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

<title>Products | AUTOMART</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<style>

/* ================= GENERAL ================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Arial, Helvetica, sans-serif;

    background:
    linear-gradient(rgba(255,255,255,0.90),
                    rgba(245,245,245,0.95)),
    url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1920&q=80');

    background-size:cover;
    background-position:center;
    background-attachment:fixed;

    color:#222;

    min-height:100vh;

}


/* ================= NAVBAR ================= */

.navbar{

    background:rgba(255,255,255,0.97);

    box-shadow:0 4px 18px rgba(0,0,0,0.15);

    padding:12px 20px;

}

.navbar-brand{

    color:#d60000 !important;

    font-weight:bold;

    font-size:25px;

}

.navbar-brand img{

    width:42px;

    height:42px;

    object-fit:cover;

    margin-right:8px;

}

.navbar-nav .nav-link{

    color:#222 !important;

    font-weight:bold;

    margin-left:15px;

    transition:0.3s;

}

.navbar-nav .nav-link:hover{

    color:#d60000 !important;

    transform:translateY(-2px);

}


/* ================= PRODUCT CONTAINER ================= */

.product-container{

    width:90%;

    max-width:1200px;

    margin:55px auto;

    background:rgba(255,255,255,0.96);

    padding:35px;

    border-radius:20px;

    box-shadow:
    0 10px 35px rgba(0,0,0,0.18);

}


/* ================= HEADING ================= */

.product-title{

    text-align:center;

    color:#d60000;

    font-weight:bold;

    font-size:32px;

    margin-bottom:30px;

}

.product-title span{

    color:#222;

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

    border:none;

}

.table tbody td{

    text-align:center;

    vertical-align:middle;

    padding:15px;

    color:#222;

    background:#fff;

}

.table tbody tr{

    transition:0.3s;

}

.table tbody tr:hover{

    background:#fff0f0;

    transform:scale(1.005);

}


/* ================= PRODUCT IMAGE ================= */

.product-image{

    width:100px;

    height:100px;

    object-fit:cover;

    border-radius:12px;

    border:2px solid #eee;

    box-shadow:0 4px 10px rgba(0,0,0,0.15);

    transition:0.3s;

}

.product-image:hover{

    transform:scale(1.08);

    border-color:#d60000;

}


/* ================= BUY BUTTON ================= */

.buy-btn{

    background:#d60000;

    color:white;

    border:none;

    padding:9px 25px;

    border-radius:8px;

    font-weight:bold;

    transition:0.3s;

}

.buy-btn:hover{

    background:#a80000;

    color:white;

    transform:translateY(-2px);

    box-shadow:0 5px 12px rgba(214,0,0,0.3);

}


/* ================= PRICE ================= */

.price{

    color:#d60000;

    font-weight:bold;

    font-size:17px;

}


/* ================= EMPTY MESSAGE ================= */

.empty-message{

    text-align:center;

    color:#666;

    font-size:18px;

    padding:30px;

}


/* ================= FOOTER ================= */

.footer{

    background:#111;

    color:white;

    text-align:center;

    padding:20px;

    margin-top:60px;

}

.footer span{

    color:#ff3333;

    font-weight:bold;

}


/* ================= MOBILE ================= */

@media(max-width:768px){

    .product-container{

        width:95%;

        padding:20px;

        overflow-x:auto;

    }

    .navbar-nav{

        margin-top:10px;

    }

    .product-title{

        font-size:26px;

    }

    .table{

        min-width:800px;

    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-sm">

<div class="container-fluid">

<a class="navbar-brand" href="#">

<img src="logo image.png"
     alt="AutoMart Logo"
     class="rounded-circle">

AUTOMART

</a>


<ul class="navbar-nav ms-auto">

<li class="nav-item">

<a class="nav-link" href="view_products.jsp">
🛒 View Products
</a>

</li>


<li class="nav-item">

<a class="nav-link" href="profile.jsp">
👤 My Profile
</a>

</li>


<li class="nav-item">

<a class="nav-link" href="login.html">
🚪 Logout
</a>

</li>

</ul>

</div>

</nav>



<!-- ================= PRODUCT SECTION ================= -->

<div class="product-container">


<h1 class="product-title">

🚗 <span>AutoMart</span> Product Collection 🏍️

</h1>


<%

ProductDAO dao = new ProductDAO();

ArrayList<Product> productList =
    (ArrayList<Product>) dao.getProducts();


if(productList.size() != 0){

%>


<table class="table table-bordered table-hover">


<thead>

<tr>

<th>ID</th>

<th>Product Name</th>

<th>Description</th>

<th>Price</th>

<th>Image</th>

<th>Action</th>

</tr>

</thead>


<tbody>


<%

for(Product product : productList){

%>


<form method="post" action="product_details.jsp">

<tr>


<td>

<input
type="text"
name="id"
value="<%= product.getId() %>"
readonly
class="form-control text-center"
style="width:80px;margin:auto;border:none;background:transparent;font-weight:bold;"
>

</td>


<td>

<strong>

<%= product.getName() %>

</strong>

</td>


<td>

<%= product.getDescription() %>

</td>


<td>

<span class="price">

₹ <%= product.getPrice() %>

</span>

</td>


<td>

<img

src="<%=request.getContextPath() + "/" + product.getImagePath() %>"

alt="Product Image"

class="product-image"

>

</td>


<td>

<input

type="submit"

value="🛒 Buy Now"

class="buy-btn"

>

</td>


</tr>

</form>


<%

}

%>


</tbody>

</table>


<%

}else{

%>


<div class="empty-message">

🛍️ <strong>Admin has not added any products yet.</strong>

<br>

Please check again later.

</div>


<%

}

%>


</div>



<!-- ================= FOOTER ================= -->

<div class="footer">

<p>

© 2026 <span>AUTOMART</span> |

Premium Cars • Bikes • Accessories

</p>

</div>


</body>

</html>