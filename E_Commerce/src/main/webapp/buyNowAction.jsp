<%@page import="java.sql.*"%>
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
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");

String emailId =(String)session.getAttribute("email"); 
int prdctID = Integer.parseInt(request.getParameter("pid"));

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("update user_info set address=?, city=?, state=?, country=? where email=?");
	stmnt.setString(1, address);
	stmnt.setString(2, city);
	stmnt.setString(3, state);
	stmnt.setString(4, country);
	stmnt.setString(5, emailId);
	stmnt.executeUpdate();
	
	stmnt = con.prepareStatement("select mobileNo from user_info where email=?");
	stmnt.setString(1, emailId);
	ResultSet rs = stmnt.executeQuery();
	
	long mobno = 0;
	while(rs.next()) {
		mobno = rs.getLong(1);
	}
	
	stmnt = con.prepareStatement("update user_cart set address=?, city=?, state=?, country=?, mobile_no=? where email=?");
	stmnt.setString(1, address);
	stmnt.setString(2, city);
	stmnt.setString(3, state);
	stmnt.setString(4, country);
	stmnt.setLong(5, mobno);
	stmnt.setString(6, emailId);
	stmnt.executeUpdate();
	
	response.sendRedirect("payment.jsp?prdctId="+prdctID);
	
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("buyNow.jsp?msg=buyError");
}
%>
</body>
</html>