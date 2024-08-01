<%@ include file="userHead.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message</title>
<link rel="stylesheet" href="css/messageTo_style.css">
</head>
<body>

   <% String msg = request.getParameter("msg");
   if("submit".equals(msg)) { %>
       <h2 style="text-align: center;">Message Send Successfully..</h2>
   <% } 
   
   if("invalid".equals(msg)) { %>
       <h2 style="text-align: center;">Something Went Wrong..Try Again..!!</h2>
   <% } %>
   
   <form action="messageToAction.jsp">
      <div class="main">
        <h2>Write Something</h2>
        <input type="text" name="usrMs" placeholder="Ask Anything..!">
      </div>
      <div class="btn">
        <button type="submit">Submit</button>
      </div>
   </form>
</body>
</html>
<%@ include file="../footer.jsp" %>