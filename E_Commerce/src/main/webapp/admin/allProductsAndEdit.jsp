<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Products And Edit Products</title>
<link rel="stylesheet" href="../css/viewAllAndEdit_style.css">
</head>
<body>
   <h3 class="hd">All Products And Edit Products</h3>
   <%
   String msg = request.getParameter("msg");
   if("done".equals(msg)) { %>
       <h3 class="hd">Product Edited Successfully</h3>
   <% } 
   
   if("fail".equals(msg)) { %>
       <h3 class="hd">Something Went Wrong..Try Again..!!</h3>
   <% } %>
   <table>
      <tr>
         <th>ID</th>
         <th>NAME</th>
         <th>CATEGORY</th>
         <th>PRICE</th>
         <th>STATUS</th>
         <th>EDIT</th>
      </tr>
      
         <%
         try{
             
             Connection con = ConnectionProvider.getCon();
             PreparedStatement stmnt = con.prepareStatement("select * from products;");
             ResultSet rs = stmnt.executeQuery();
             
             while(rs.next()) { %>
                 <tr>
                 <td><%= rs.getInt(1) %></td>
                 <td><%= rs.getString(2) %></td>
                 <td><%= rs.getString(3) %></td>
                 <td><%= rs.getInt(4) %></td>
                 <td><%= rs.getString(5) %></td>
                 <td><a href="editProductById.jsp?id=<%= rs.getInt(1) %>">Edit</a></td>
                 </tr>
            <% } 
         }catch(Exception e) {
             e.printStackTrace();
         }
         %>
      
   </table>
   <%@ include file="../footer.jsp" %>
</body>
</html>
