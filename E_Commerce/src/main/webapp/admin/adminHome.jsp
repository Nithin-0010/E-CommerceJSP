<%@ include file="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>
<style> 
  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
    background-color: #FFFFFF; 
  }
  
  .content {
     flex: 1;
     display: flex;
     justify-content: center;
     align-items: center;
  }
     
   #welcom {
       text-align: center;
       font-size: 60px;
       color: #28A745; 
   }
</style>
</head>
<body>
   <div class="content">
       <h1 id="welcom">Welcome Admin!</h1>
   </div>
   <%@ include file="../footer.jsp" %>
</body>
</html>
