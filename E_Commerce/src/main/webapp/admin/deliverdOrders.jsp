<%@ page import="java.sql.*" %>
<%@page import="com.connection.ConnectionProvider"%>
<%@ include file="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

 table {
    border-radius: 10px;
    border: 1px solid #28A745; 
    text-align: center;
    width: 80%;
    margin: 20px auto;
    margin-bottom:235px;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #28A745;
    padding: 10px;
}

th {
    height: 40px;
    background-color: #28A745; 
    color: #FFFFFF; 
}

td {
    height: 30px;
    background-color: #E8F5E9; 
    color: #000000; 
}

</style>


</head>
<body>
   <form>
     <table>
       <tr>
         <th>Product Name</th>
         <th>Product ID</th>
         <th>Email ID</th>
         <th>Quantity</th>
         <th>Price</th>
         <th>Total</th>
         <th>Order Date</th>
         <th>Mode Of Payment</th>
         <th>Delivery Date</th>
         <th>Status</th>
       </tr>
<%

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select * from user_orders where delivery_date is not null");
    ResultSet rs = stmnt.executeQuery();
    
    while(rs.next()) { %>
    	
    	<tr>
          <td><%= rs.getString(1) %></td>
          <td><%= rs.getInt(2) %></td>
          <td><%= rs.getString(3) %></td>
          <td><%= rs.getInt(4) %></td>
          <td><%= rs.getInt(5) %></td>
          <td><%= rs.getInt(6) %></td>
          <td><%= rs.getTimestamp(7) %></td>
          <td><%= rs.getString(8) %></td>
          <td><%= rs.getString(9) %></td>
          <td><%= rs.getString(10) %></td>
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