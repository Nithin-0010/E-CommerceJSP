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
String prdct_id[] = request.getParameterValues("pid[]");
String dlvry_date[] = request.getParameterValues("date[]");
String status[] = request.getParameterValues("active[]");

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("update user_orders set delivery_date=?, status=? where prodct_id=?");
	
	for(int i = 0; i < prdct_id.length; i++) {
		stmnt.setString(1, dlvry_date[i]);
		stmnt.setString(2, status[i]);
		stmnt.setInt(3, Integer.parseInt(prdct_id[i]));
		stmnt.addBatch();
	}
	
	int[] updateCounts = stmnt.executeBatch();
	
	response.sendRedirect("orderReceived.jsp?msg=procced");

} catch (Exception e) {
	response.sendRedirect("orderReceived.jsp?msg=invalid");
	e.printStackTrace();
}
%>
</body>
</html>