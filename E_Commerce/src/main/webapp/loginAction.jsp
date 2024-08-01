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
<title>Insert title here</title>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@gmail.com".equals(email) && "admin123".equals(password)) {
	
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}else {
	
	int status = 0;
	
	try {
		
		Connection con = ConnectionProvider.getCon();
		PreparedStatement stmnt = con.prepareStatement("select * from user_info where email='"+email+"' && password = '"+password+"'");
		ResultSet rs = stmnt.executeQuery();
		
		while(rs.next()) {
			status = 1;
			
			session.setAttribute("email", email);
			response.sendRedirect("userHome.jsp");
			
		}
		
		if(status == 0) {
			response.sendRedirect("login.jsp?msg=notFound");
		}
		
	}catch(Exception e) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		e.printStackTrace(pw);
		out.print(sw.toString());
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>
</body>
</html>