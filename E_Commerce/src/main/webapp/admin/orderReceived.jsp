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
td a {
    color: #28A745; 
    text-decoration: none;
    transition: color 0.3s ease;
}

td a:hover {
    color: #218838; 
}
.warning {
    color: red;
    font-size: 10px;
}
.btn {
    width: 70%;
    margin-left: 15%;
    margin-right: 15%;
    margin-top: 40px;
    margin-bottom:20px;
    display: flex;
    justify-content: center;
}

.btn button {
    width: 80%;
    height: 30px;
    border-radius: 10px;
    background: #28A745; 
    color: #FFFFFF;
    transition: background-color 0.3s ease;
    border: none;
}

.btn button:hover {
    background-color: #218838; 
    color: #FFFFFF; 
}

</style>

</head>
<body>
  <%
   String msg = request.getParameter("msg");
   if("procced".equals(msg)) { %>
       <h3 style="color: #28A745; text-align: center;">Orders updated successfully</h3>
   <% } 
   if("invalid".equals(msg)) { %>
       <h3 style="color: red; text-align: center;">Something Went Wrong Try Again..!!</h3>
   <% } %>  
    <form action="orderUpdateAction.jsp" method="post">
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
	PreparedStatement stmnt = con.prepareStatement("select * from user_orders where delivery_date is null");
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
        <td><%= rs.getString(9) %></td>
        <td><p class="warning">Enter Date Format<br>
	         yy-mm-dd</p><input type="text" name="date[]"></td>
        <td><select name="active[]">
                  <option value="yes">Yes</option>
                  <option value="no">No</option>
               </select></td>  
               <input type="hidden" name="pid[]" value="<%= rs.getInt(2) %>">              
     </tr>
<%     }
    
    if(!rs.next()) { %>
    	<h3 style="color: #28A745; text-align: center;">No Data Available..!!</h3>
<%     } 
    
}catch(Exception e) {
	e.printStackTrace();
} %>

    </table>    
       <div class="btn">
            <button>Save</button>
       </div>
   </form> 
</body>
</html>
<%@ include file="../footer.jsp" %>