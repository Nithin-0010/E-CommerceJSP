<%@ include file="userHead.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
  .main {
    height: 73vh;
    margin: 0;
    background-color: #FFFFFF;
  }
</style>

</head>
<body>
   <div class="main"></div>
<%
String emailId =(String)session.getAttribute("email"); 
int prdct_id = Integer.parseInt(request.getParameter("id"));
String prdct_name = request.getParameter("name");
int quantity = 1;
int prdct_price = 0;
int prdct_total = 0;
int cart_total = 0;

int z = 0;

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select * from products where id = ?");
	stmnt.setInt(1, prdct_id);
	ResultSet rs = stmnt.executeQuery();
	
	while(rs.next()) {
		
		prdct_price = rs.getInt(4);
		prdct_total = prdct_price;
	}
	
	stmnt = con.prepareStatement("select * from user_cart where email= ? and product_id = ? and address is null");
	stmnt.setString(1, emailId);
	stmnt.setInt(2, prdct_id);
	ResultSet rs1 = stmnt.executeQuery();
	
	while(rs1.next()) {
		cart_total = rs1.getInt(6);
		cart_total = cart_total + prdct_total;
		quantity = rs1.getInt(4);
		quantity = quantity + 1;
		
		z = 1;
	}
	
	if(z == 1) {
		stmnt = con.prepareStatement("update user_cart set quantity = ?, total = ? where email = ? and product_id = ? and address is null");
		stmnt.setInt(1, quantity);
		stmnt.setInt(2, cart_total);
		stmnt.setString(3, emailId);
		stmnt.setInt(4, prdct_id);
		stmnt.executeUpdate();
		
		response.sendRedirect("productsAvailable.jsp?msg=updated");
	}
	
	if(z == 0) {
		stmnt = con.prepareStatement("insert into user_cart(email, name, product_id, quantity, price, total)values(?, ?, ?, ?, ?, ?)");
		stmnt.setString(1, emailId);
		stmnt.setString(2, prdct_name);
		stmnt.setInt(3, prdct_id);
		stmnt.setInt(4, quantity);
		stmnt.setInt(5, prdct_price);
		stmnt.setInt(6, prdct_total);
		stmnt.executeUpdate();
		
		response.sendRedirect("productsAvailable.jsp?msg=added");
	}
	
}catch(Exception e) {
	e.printStackTrace();
	out.println(e);
	response.sendRedirect("productsAvailable.jsp?msg=invalid");
}

%>
<%@ include file="../footer.jsp" %>
</body>
</html>