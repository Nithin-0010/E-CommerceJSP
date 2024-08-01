<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="userHead.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/order_style.css">
</head>
<body>
<%String msg = request.getParameter("msg");
   if("removed".equals(msg)) { %>
	   <h2 style="text-align: center;">Order Cancelled</h2>
   <% } 
   if("invalid".equals(msg)) { %>
   <h2 style="text-align: center;">Something Went Wrong..! Try Again..!!</h2>
   <% } %>
   <form action="#" method="post">
     <table>
       <tr>
         <th>Product Name</th>
         <th>Product ID</th>
         <th>Quantity</th>
         <th>Price</th>
         <th>Total</th>
         <th>Order Date</th>
         <th>Mode Of Payment</th>
         <th>Remove</th>
       </tr>
<%
String emailId =(String)session.getAttribute("email");

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select prodct_name, prodct_id, quantity, price, total, order_date, payment_method from user_orders where email=?");
	stmnt.setString(1, emailId);
    ResultSet rs = stmnt.executeQuery();
    

	while(rs.next()) { %>
		<tr>
           <td><%= rs.getString(1) %></td>
           <td><%= rs.getInt(2) %></td>
           <td><%= rs.getInt(3) %></td>
           <td><%= rs.getInt(4) %></td>
           <td><%= rs.getInt(5) %></td>
           <td><%= rs.getTimestamp(6) %></td>
           <td><%= rs.getString(7) %></td>
           <td><a href="removeOrder.jsp?id=<%= rs.getInt(2) %>">Cancel Order</a></td>
        </tr>
<%  }
}catch(Exception e) {
	e.printStackTrace();
} %>    
     </table>
   </form>   
</body>
</html>
<%@ include file="../footer.jsp" %>