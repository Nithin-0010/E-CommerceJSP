<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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
try{
	String prdct_name = request.getParameter("name");
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("delete from user_cart where name =?");
	stmnt.setString(1, prdct_name);
	stmnt.executeUpdate();
	
	response.sendRedirect("cart.jsp?msg=removed");
	
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("cart.jsp?msg=invalid");
}
%>
</body>
</html>