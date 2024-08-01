<%@page import="com.connection.ConnectionProvider"%>
<%@ include file="userHead.jsp" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searched Products</title>
<script src="https://kit.fontawesome.com/27c999a79f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/searchResult_style.css">
</head>
<body>
   <div class="main">
      <div class="top">
         <div class="top-head">
            <h2 style="text-align: center;">Search Result</h2>
         </div>
      </div>
   
   <table>
       <tr>
         <th>ID</th>
         <th>NAME</th>
         <th>CATEGORY</th>
         <th>PRICE   <i class="fa-solid fa-indian-rupee-sign"></i></th>
         <th>ADD TO CART   <i class="fa-solid fa-cart-shopping"></i></th>
      </tr>
      
      <%
      int status = 0;
      
      try{
    	  
    	  String search = request.getParameter("search");
    	  Connection con = ConnectionProvider.getCon();
    	  PreparedStatement stmnt = con.prepareStatement("select * from products where name like '%"+search+"%' or category like '%"+search+"%' and active='yes';");
    	  ResultSet rs = stmnt.executeQuery();
    	  
    	  while(rs.next()) { 
    	  status = 1; %>
          <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getInt(4) %></td>
            <td><a href="adToCartAction.jsp?id=<%=rs.getInt(1)%>">Add to cart</a>  <i class="fa-solid fa-cart-shopping"></i></td>
          </tr>
     <% } 
    	  	  
      }catch(Exception e) {
    	  
      }
      %>
   </table>     
   
    <% if(status == 0) { %>
    		 <h2 style="text-align: center;">Nothing to Show..!!</h2>
    	 <% } %> 
   </div>
<%@ include file="../footer.jsp" %>    	 
</body>
</html>