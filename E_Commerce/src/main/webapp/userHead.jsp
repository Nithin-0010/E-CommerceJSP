<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adminHeader_style.css">
<script src="https://kit.fontawesome.com/27c999a79f.js" crossorigin="anonymous"></script>
</head>
<body>
<%
String email =(String)session.getAttribute("email"); 
%>
   <div class="nav">
      <div class="nav-head">
         <h2>Online Shopping    <i class="fa-solid fa-store"></i></h2>
      </div>
      <div class="nav-items">
         <nav>
            <a href="userHome.jsp"><%= email %>    <i class="fa-solid fa-user"></i></a>
            <a href="productsAvailable.jsp">Home    <i class="fa-solid fa-house"></i></a>
            <a href="cart.jsp">My Cart    <i class="fa-solid fa-cart-shopping"></i></a>
            <a href="order.jsp">My Orders    <i class="fa-solid fa-box-open"></i></a>
            <a href="changeDetails.jsp">Change Details    <i class="fa-regular fa-rectangle-list"></i></a>
            <a href="messageTo.jsp">Message Us    <i class="fa-solid fa-message"></i></a>
            <a href="about.jsp">About   <i class="fa-solid fa-address-card"></i></a>
            <a href="logout.jsp">Logout    <i class="fa-solid fa-right-from-bracket"></i></a>          
         </nav>
      </div>
   </div>
   
</body>
</html>