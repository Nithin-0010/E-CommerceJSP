<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
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
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNo = request.getParameter("mobno");
String securityQusetion = request.getParameter("qustn");
String answer = request.getParameter("answr");
String password = request.getParameter("password");
String address ="";
String city ="";
String state ="";
String country ="";

try {
Connection con =ConnectionProvider.getCon();
PreparedStatement stmnt = con.prepareStatement("insert into user_info values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
stmnt.setString(1, name);
stmnt.setString(2, email);
stmnt.setString(3, mobileNo);
stmnt.setString(4, securityQusetion);
stmnt.setString(5, answer);
stmnt.setString(6, password);
stmnt.setString(7, address);
stmnt.setString(8, city);
stmnt.setString(9, state);
stmnt.setString(10, country);
stmnt.executeUpdate();
response.sendRedirect("signup.jsp?msg=valid");

} catch(Exception e) {
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 e.printStackTrace(pw);
	 out.print(sw.toString());
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>
</body>
</html>