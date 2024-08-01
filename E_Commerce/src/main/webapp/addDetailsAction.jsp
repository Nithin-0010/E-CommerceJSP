<%@page import="java.sql.ResultSet"%>
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
String emailId =(String)session.getAttribute("email"); 
int prdctID = Integer.parseInt(request.getParameter("prdctId"));

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select address, city, state, country from user_info where email=?");
	stmnt.setString(1, emailId);
	ResultSet rs = stmnt.executeQuery();
	
	if(rs.next()) {
		
		String dbAddress = rs.getString(1);
		String dbCity = rs.getString(2);
		String dbState = rs.getString(3);
		String dbCountry = rs.getString(4);
		
        if(dbAddress.isEmpty() || dbCity.isEmpty() || dbState.isEmpty() || dbCountry.isEmpty()) {
			
			response.sendRedirect("buyNow.jsp?prdctId="+prdctID);
		}else {
    		
    		response.sendRedirect("payment.jsp?prdctId="+prdctID);
    	}

	}
		
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("cart.jsp?msg=buyError");
}
%>
</body>
</html>