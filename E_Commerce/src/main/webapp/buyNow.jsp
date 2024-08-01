<%@ include file="userHead.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Products</title>
<script src="https://kit.fontawesome.com/27c999a79f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/buyNow_style.css">
</head>
<body>
   <h2 style="text-align: center;">Enter the following details</h2>
   <%String msg = request.getParameter("msg");
   if("invalid".equals(msg)) { %>
	   <h2 style="text-align: center;">Something Went Wrong..! Try Again..!!</h2>
   <% }
   if("buyError".equals(msg)) { %>
   <h2 style="text-align: center;">Cant't Buy..Something Went Wrong..! Try Again..!!</h2>
   <% } %>
   <div class="main">
      <div class="signup">

         <form action="buyNowAction.jsp" method="post"> 
            <input type="hidden" name="pid" value="<%= request.getParameter("prdctId") %>">           
            <input id="userData" type="text" name="address" placeholder="Enter Address" required="required" style="height: 50px;"><br>
            <input id="userData" type="text" name="city" placeholder="Enter City" required="required"><br>
            <input id="userData" type="text" name="state" placeholder="Enter State" required="required"><br>
            <input id="userData" type="text" name="country" placeholder="Enter Country" required="required"><br>
            <button id="sign_btn" type="submit" name="btn">Payment    <i class="fa-solid fa-right-to-bracket" style="color: black;"></i></button> 
         </form>
         
       </div>
   </div>
   <%@ include file="../footer.jsp" %>
</body>
</html>