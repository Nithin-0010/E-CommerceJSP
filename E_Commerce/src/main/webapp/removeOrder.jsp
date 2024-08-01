<%@ page import="java.sql.*" %>
<%@page import="com.connection.ConnectionProvider"%>
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
	int prdct_id = Integer.parseInt(request.getParameter("id"));
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("delete from user_orders where prodct_id =?");
	stmnt.setInt(1, prdct_id);
	stmnt.executeUpdate();
	
	response.sendRedirect("order.jsp?msg=removed");
	
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("order.jsp?msg=invalid");
}
%>
</body>
</html>