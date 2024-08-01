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
String usrMsg = request.getParameter("usrMs");
String emailId =(String)session.getAttribute("email"); 

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("insert into user_msg(messaeToAdmin, usrID)values(?, ?)");
	stmnt.setString(1, usrMsg);
	stmnt.setString(2, emailId);	
	stmnt.executeUpdate();
	
	response.sendRedirect("messageTo.jsp?msg=submit");
	
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("messageTo.jsp?msg=invalid");
}
%>
</body>
</html>