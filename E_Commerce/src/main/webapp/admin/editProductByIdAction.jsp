<%@page import="java.sql.*"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
<%
String prdct_id = request.getParameter("id");
int id =Integer.parseInt(prdct_id);

String name = request.getParameter("name");
String category = request.getParameter("category");

String prdct_price = request.getParameter("price");
int price = Integer.parseInt(prdct_price);

String active = request.getParameter("active");

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("update products set name ='"+name+"', category ='"+category+"', price ="+price+", active ='"+active+"' where id ="+id+";");
	stmnt.executeUpdate();
	
	response.sendRedirect("allProductsAndEdit.jsp?msg=done");
	
}catch(Exception e){
	
	response.sendRedirect("allProductsAndEdit.jsp?msg=fail");
}
%>
</body>
</html>