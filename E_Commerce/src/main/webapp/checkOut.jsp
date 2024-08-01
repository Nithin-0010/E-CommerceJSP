<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date" %>
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
.btn button {
    width: 20%;
    margin-left: 40%;
    margin-top: 2%;
    margin-bottom: 10%;
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
  
  <form action="order.jsp" method="post">
   <table>
       <tr>
         <th>Product Name</th>
         <th>Quantity</th>
         <th>Price</th>
         <th>Total</th>
      </tr>
   
<%
String emailId =(String)session.getAttribute("email");
int prdctID = Integer.parseInt(request.getParameter("pid"));

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select name, quantity, price, total from user_cart where email=? and product_id=?");
	stmnt.setString(1, emailId);
	stmnt.setInt(2, prdctID);
    ResultSet rs = stmnt.executeQuery();
	
	while(rs.next()) { %>
		<tr>
           <td><%= rs.getString(1) %></td>
           <td><%= rs.getInt(2) %></td>
           <td><%= rs.getInt(3) %></td>
           <td><%= rs.getInt(4) %></td>
        </tr>
                
<%  
    Date currentDate = new Date();
    Timestamp currentTime = new Timestamp(currentDate.getTime());
    String pymnt_mode = request.getParameter("pymnt");

    stmnt = con.prepareStatement("insert into user_orders(prodct_name, prodct_id, email, quantity, price, total, order_date, payment_method)values(?,?,?,?,?,?,?,?)");
    stmnt.setString(1, (rs.getString(1)));
    stmnt.setInt(2, prdctID);
    stmnt.setString(3, emailId);
    stmnt.setInt(4, (rs.getInt(2)));
    stmnt.setInt(5, (rs.getInt(3)));
    stmnt.setInt(6, (rs.getInt(4)));
    stmnt.setTimestamp(7, currentTime);
    stmnt.setString(8, pymnt_mode);
    stmnt.executeUpdate();
	}
	
}catch(Exception e) {
	e.printStackTrace();
}

%>
   </table>
   
   <div class="btn">
        <button type="submit">Confirm</button>
   </div>
  </form>
</body>
</html>