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
<title>My Cart</title>
<link rel="stylesheet" href="css/cart_style.css">
<script src="https://kit.fontawesome.com/27c999a79f.js" crossorigin="anonymous"></script>
</head>
<body>
   <div class="main">
   <%String msg = request.getParameter("msg");
   if("removed".equals(msg)) { %>
	   <h2 style="text-align: center;">Product Removed From Cart</h2>
   <% } 
   if("invalid".equals(msg)) { %>
   <h2 style="text-align: center;">Something Went Wrong..! Try Again..!!</h2>
   <% }
   if("buyError".equals(msg)) { %>
   <h2 style="text-align: center;">Cant't Buy..Something Went Wrong..! Try Again..!!</h2>
   <% } %>
       <table>
         <tr>
            <th>PRODUCT ID</th>
            <th>NAME</th>
            <th>Quantity</th>
            <th>Price   <i class="fa-solid fa-indian-rupee-sign"></i></th>
            <th>Total Price    <i class="fa-solid fa-indian-rupee-sign"></i></th>
            <th>Buy Now</th>
            <th>Remove</th>
         </tr>
         
         <%
         try{
        	 String emailId =(String)session.getAttribute("email"); 
        	 
             Connection con = ConnectionProvider.getCon();
             PreparedStatement stmnt = con.prepareStatement("select name, product_id, quantity, price, total from user_cart where email= ?");
             stmnt.setString(1, emailId);
             ResultSet rs = stmnt.executeQuery();
             
             while(rs.next()) { %>
                 <tr>
                 <td><%= rs.getString(2)%></td>
                 <td><%= rs.getString(1) %></td>
                 <td><%= rs.getInt(3) %></td>
                 <td><%= rs.getInt(4) %></td>
                 <td><%= rs.getInt(5) %></td>
                 <td><a href="addDetailsAction.jsp?prdctId=<%= rs.getString(2)%>">Buy Now</a></td>
                 <td><a href="removeFromCartAction.jsp?name=<%=rs.getString(1)%>">Remove Product</a></td>
                 </tr>
            <% } 
         }catch(Exception e) {
        	 e.printStackTrace();
         } %>
         
       </table>  
   </div>
   <%@ include file="../footer.jsp" %>
</body>
</html>