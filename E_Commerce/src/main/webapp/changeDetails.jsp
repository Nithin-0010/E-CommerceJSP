<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="userHead.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Details</title>
<link rel="stylesheet" href="css/changeDetails_style.css">
</head>
<body>
   <h2 style="text-align: center;">Edit User Information</h2>
    <%
   String msg = request.getParameter("msg");
   if("changed".equals(msg)) { %>
       <h2 style="text-align: center;">User Data Edited Successfully..</h2>
   <% } 
   
   if("failed".equals(msg)) { %>
       <h2 style="text-align: center;">Something Went Wrong..Try Again..!!</h2>
   <% } %>
<%
String emailId =(String)session.getAttribute("email"); 

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select name, email, mobileNo, password, address, city, state, country from user_info where email=?");
	stmnt.setString(1, emailId);
	ResultSet rs = stmnt.executeQuery();
	
	while(rs.next()) { %>
		
	    <div class="main">
	      <form action="changeDetailsAction.jsp" method="post">
	      
	      <div class="content">
	         <div class="top">
	            <div class="left-div">
	              <h3>Enter Name</h3>
	              <input type="text" name="name" value="<%=rs.getString(1)%>">
	              <h3>Enter Email</h3>
	              <p class="warning">If you Change email, you are recommended to<br>
	              logout and login with new email</p>
	              <input type="email" name="email" value="<%=rs.getString(2)%>">
	            </div> 
	         
	            <div class="right-div">
	               <h3>Enter Mobile Number</h3>
	               <input type="number" name="mobno" value="<%=rs.getString(3)%>">
	               <h3>Enter Password</h3>
	               <input type="password" name="pwd" value="<%=rs.getString(4)%>">
	            </div> 
	         </div>   
	      
	         <div class="bottom">
	            <div class="left-div">
	               <h3>Enter Address</h3>
	               <input type="text" name="address" value="<%=rs.getString(5)%>" style="height: 50px;">
	               <h3>Enter City</h3>
	              <input type="text" name="city" value="<%=rs.getString(6)%>">
	            </div>
	         
	            <div class="right-div">
	               <h3>Enter State</h3>
	              <input type="text" name="state" value="<%=rs.getString(7)%>">
	              <h3>Enter Country</h3>
	              <input type="text" name="country" value="<%=rs.getString(8)%>">
	            </div>
	         </div>
	          
	         <div class="btn">
	            <button>Save</button>
	         </div>
	      </div>
	   </form>   
	   </div>
<% 	}
	
}catch(Exception e) {
	e.printStackTrace();
}
%>
    
</body>
</html>
<%@ include file="../footer.jsp" %>