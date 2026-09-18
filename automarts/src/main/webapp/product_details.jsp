<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="database.ProductDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation | AUTOMART</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    margin:0;
    padding:0;
    background:url("https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1920&q=80") no-repeat center center fixed;
    background-size:cover;
    font-family:Arial,Helvetica,sans-serif;
}

.overlay{
    min-height:100vh;
    background:rgba(0,0,0,0.75);
    display:flex;
    justify-content:center;
    align-items:center;
}

.card-box{
    width:700px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:35px;
    box-shadow:0 0 20px rgba(255,0,0,0.5);
}

.logo{
    color:red;
    font-size:38px;
    font-weight:bold;
    text-align:center;
}

.success{
    font-size:70px;
    text-align:center;
}

.title{
    text-align:center;
    color:white;
    font-size:35px;
    font-weight:bold;
}

.subtitle{
    text-align:center;
    color:#ddd;
    margin-bottom:25px;
}

.table{
    color:white;
}

.table th{
    background:red;
    color:white;
    text-align:center;
}

.table td{
    background:rgba(255,255,255,0.08);
    color:white;
    text-align:center;
}

.btn-home{
    background:red;
    color:white;
    font-weight:bold;
    width:100%;
    border:none;
    padding:12px;
    border-radius:30px;
    transition:.3s;
}

.btn-home:hover{
    background:#b30000;
    color:white;
}

</style>

</head>
<body>

<div class="overlay">

<div class="card-box">

<div class="logo">
🚗 AUTOMART
</div>

<div class="success">
✅
</div>

<div class="title">
Order Confirmed!
</div>

<div class="subtitle">
Thank you for shopping with <b>AUTOMART</b>.<br>
Your order has been placed successfully.
</div>

<%
int id=Integer.parseInt(request.getParameter("id"));
ProductDAO dao=new ProductDAO();
Product product=dao.getProductWithId(id);
%>

<table class="table table-bordered">

<tr>
<th>Product</th>
<th>Description</th>
<th>Price</th>
</tr>

<tr>
<td><%=product.getName()%></td>
<td><%=product.getDescription()%></td>
<td><%=product.getPrice()%></td>
</tr>

</table>

<br>

<a href="view_products.jsp" class="btn btn-home">
Continue Shopping
</a>

</div>

</div>

</body>
</html>