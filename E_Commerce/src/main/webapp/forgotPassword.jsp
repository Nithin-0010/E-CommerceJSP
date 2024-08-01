<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" href="css/forgotPassword_style.css">
</head>
<body>
    <div class="main">
       <div class="signup">

         <form action="forgotPassAction.jsp" method="post">
            
            <input id="userData" type="email" name="email" placeholder="Enter Email" required="required"><br>
            <input id="userData" type="number" name="mobno" placeholder="Enter Mobile Number" required="required"><br>
            <select id="userData" name="qustn" style="width:262px; ">
               <option>What was your first car ?</option>
               <option>What is the name of your pet ?</option>
               <option>What is your favorite food ?</option>
            </select>
            <input id="userData" type="text" name="answr" placeholder="Enter Your Answer" required="required"><br>
            <input id="userData" type="password" name="password" placeholder="Enter Your New Password" required="required"><br>
            <input id="sign_btn" type="submit" name="btn" value="Save">
            <h3 id="log"><a href="login.jsp">Login ?</a></h3>
         </form>
         
       </div>
       
       <div class="site-info">
    
          <div class="info-header">
             <%
             String msg=request.getParameter("msg");
             if("changed".equals(msg)) { %>
             <h3 id="changed">Password Changed Successfully..</h3>
             <% } 
             if("notChanged".equals(msg)) { %>
             <h3 id="notChanged">Something Went Wrong..Try Again..!!</h3>
             <% } %>
            
             <h3 class="info-header-head">Online Shopping</h3>
          </div>
          
          <div class="info-text">
             <p>Online shopping is a form of electronic commerce which allows consumers to directly 
             buy goods or services from a seller over the Internet using a web browser or a mobile app</p>
          </div>
       </div>
    </div>

</body>
</html>