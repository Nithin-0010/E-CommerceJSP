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
String newName = request.getParameter("name");
String newMail = request.getParameter("email");
String newMob = request.getParameter("mobno");
String newPwd = request.getParameter("pwd");
String newAddress = request.getParameter("address");
String newCity = request.getParameter("city");
String newState = request.getParameter("state");
String newCountry = request.getParameter("country");

String emailId =(String)session.getAttribute("email"); 

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("update user_info set name=?, email=?, mobileNo=?, password=?, address=?, city=?, state=?, country=? where email=?");
	stmnt.setString(1, newName);
	stmnt.setString(2, newMail);
	stmnt.setString(3, newMob);
	stmnt.setString(4, newPwd);
	stmnt.setString(5, newAddress);
	stmnt.setString(6, newCity);
	stmnt.setString(7, newState);
	stmnt.setString(8, newCountry);
	stmnt.setString(9, emailId);
	stmnt.executeUpdate();
	
	response.sendRedirect("changeDetails.jsp?msg=changed");
	
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("changeDetails.jsp?msg=failed");
}

%>
</body>
</html>