<%@ include file="adminHeader.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Received From Users</title>
<link rel="stylesheet" href="../css/msgRecvd_style.css">
</head>
<body>
    <h2 style="text-align: center;">Messages From Users</h2>
    <table>
      <tr>
         <th>ID</th>
         <th>Message</th>
      </tr>
      
         <%
         try{
             
             Connection con = ConnectionProvider.getCon();
             PreparedStatement stmnt = con.prepareStatement("select * from user_msg;");
             ResultSet rs = stmnt.executeQuery();
             
             while(rs.next()) { %>
                 <tr>
                 <td><%=rs.getString(2)%></td>
                 <td><%=rs.getString(1)%></td>
                 </tr>
            <% } 
         }catch(Exception e) {
             e.printStackTrace();
         }
         %>
    </table>  
</body>
</html>
<%@ include file="../footer.jsp" %>