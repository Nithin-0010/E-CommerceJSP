<%@ include file="userHead.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Products</title>
<script src="https://kit.fontawesome.com/27c999a79f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/productsAvailable_style.css">
</head>
<body>

   <div class="top">
      <div class="top-head">
         <h2 style="text-align: center;">Home   <i class="fa-solid fa-house"></i></h2>
      </div>
     
      <div class="top-search">
         <form action="searchResults.jsp" method="get">
            <input type="text" name="search" placeholder="Search products..." class="search-input">
            <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
         </form>
      </div>
   </div> 
   <%String msg = request.getParameter("msg");
   if("added".equals(msg)) { %>
	   <h2 style="text-align: center;">Product Added To Cart</h2>
   <% }
   if("updated".equals(msg)) { %>
	   <h2 style="text-align: center;">Product Already Exists..! Quantity Increased..</h2>
   <% }
   if("invalid".equals(msg)) { %>
	   <h2 style="text-align: center;">Something Went Wrong..! Try Again..!!</h2>
   <% } %>
   
   <table>
       <tr>
         <th>ID</th>
         <th>NAME</th>
         <th>CATEGORY</th>
         <th>PRICE   <i class="fa-solid fa-indian-rupee-sign"></i></th>
         <th>ADD TO CART   <i class="fa-solid fa-cart-shopping"></i></th>
      </tr>
      
      <%
         try{
             
             Connection con = ConnectionProvider.getCon();
             PreparedStatement stmnt = con.prepareStatement("select * from products where active ='yes';");
             ResultSet rs = stmnt.executeQuery();
             
             while(rs.next()) { %>
                 <tr>
                 <td><%= rs.getInt(1) %></td>
                 <td><%= rs.getString(2) %></td>
                 <td><%= rs.getString(3) %></td>
                 <td><%= rs.getInt(4) %></td>
                 <td><a href="adToCartAction.jsp?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>">Add to cart</a>  <i class="fa-solid fa-cart-shopping"></i></td>
                 </tr>
            <% } 
         }catch(Exception e) {
        	 e.printStackTrace();
         } %>
         
   </table>
   
    <%@ include file="../footer.jsp" %>
</body>
</html>