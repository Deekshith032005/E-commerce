<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model.User"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Profile | AUTOMART</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<style>

body{
background:linear-gradient(135deg,#ffffff,#f5f5f5,#ececec);
font-family:Arial,Helvetica,sans-serif;
}

/* Navbar */

.navbar{
background:#ffffff;
box-shadow:0 3px 15px rgba(0,0,0,.15);
}

.navbar-brand{
color:#d60000!important;
font-size:28px;
font-weight:bold;
}

.nav-link{
color:#333!important;
font-weight:bold;
}

.nav-link:hover{
color:#d60000!important;
}

/* Profile Card */

.profile-card{

margin-top:60px;
background:white;
border-radius:20px;
box-shadow:0 10px 25px rgba(0,0,0,.15);
padding:40px;

}

.profile-title{

text-align:center;
color:#d60000;
font-weight:bold;
margin-bottom:30px;

}

.profile-image{

width:120px;
height:120px;
border-radius:50%;
border:5px solid #d60000;
display:block;
margin:auto;
margin-bottom:20px;

}

.table th{

background:#d60000;
color:white;
width:35%;

}

.table td{

background:#fff;

}

.footer{

background:#111;
color:white;
padding:18px;
text-align:center;
margin-top:60px;

}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-sm py-3">

<div class="container">

<a class="navbar-brand" href="#">

<img src="logo image.png" width="40" class="rounded-circle">

AUTOMART

</a>

<ul class="navbar-nav ms-auto">


<li class="nav-item">
<a class="nav-link" href="profile.jsp">Profile</a>
</li>

<li class="nav-item">
<a class="nav-link" href="login.html">Logout</a>
</li>

</ul>

</div>

</nav>

<%
User user=(User)session.getAttribute("user");
%>

<div class="container">

<div class="col-lg-7 mx-auto">

<div class="profile-card">

<img src="https://api.dicebear.com/9.x/notionists/svg?seed=AnimeHero"
class="profile-image">

<h2 class="profile-title">My Profile</h2>

<table class="table table-bordered">

<tr>

<th>User ID</th>

<td><%=user.getId()%></td>

</tr>

<tr>

<th>Full Name</th>

<td><%=user.getName()%></td>

</tr>

<tr>

<th>Email</th>

<td><%=user.getMail()%></td>

</tr>

<tr>

<th>Mobile</th>

<td><%=user.getMobile()%></td>

</tr>

</table>

<div class="text-center mt-4">


<a href="login.html" class="btn btn-dark">
Logout
</a>

</div>

</div>

</div>

</div>

<div class="footer">

© 2026 AUTOMART | Premium Cars • Bikes • Accessories

</div>

</body>
</html>