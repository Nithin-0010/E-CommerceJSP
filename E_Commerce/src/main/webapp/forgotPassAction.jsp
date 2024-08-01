<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%
String email = request.getParameter("email");
String mobno = request.getParameter("mobno");
String qustn = request.getParameter("qustn");
String answr = request.getParameter("answr");
String password = request.getParameter("password");

try {
	
	int status = 0;
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select * from user_info where email='"+email+"' and mobileNo='"+mobno+"' and securityQusetion='"+qustn+"' and answer='"+answr+"'");
	ResultSet rs = stmnt.executeQuery();
	
	while(rs.next()) {
		
		status = 1;
		
		stmnt.executeUpdate("update user_info set password='"+password+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=changed");
	}
	
	if(status == 0) {
		response.sendRedirect("forgotPassword.jsp?msg=notChanged");
	}

}catch(Exception e) {
	StringWriter sw = new StringWriter();
	PrintWriter pw = new PrintWriter(sw);
	e.printStackTrace(pw);
	out.print(sw.toString());
}
%>

</body>
</html>