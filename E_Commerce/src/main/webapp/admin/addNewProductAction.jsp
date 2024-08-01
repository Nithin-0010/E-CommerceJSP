<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	PreparedStatement stmnt = con.prepareStatement("insert into products values(?, ?, ?, ?, ?)");
	stmnt.setInt(1, id);
	stmnt.setString(2, name);
	stmnt.setString(3, category);
	stmnt.setInt(4, price);
	stmnt.setString(5, active);
	stmnt.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
	
}catch(Exception e) {
	response.sendRedirect("addNewProduct.jsp?msg=fail");
	
}
%>

</body>
</html>