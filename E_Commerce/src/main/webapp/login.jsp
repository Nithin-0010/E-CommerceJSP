<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="css/login_style.css">
</head>
<body>
    <div class="main">
       <div class="login">

         <form action="loginAction.jsp" method="post">
            <div class="labels">
              <label style="color: #28A745; margin-bottom: 10px;">LOGIN</label>  
            </div>
            
            <input id="mail" type="email" name="email" placeholder="Enter Email" required="required"><br>
            <input id="pass" type="password" name="password" placeholder="Password" required="required"><br>

            <input id="log_btn" type="submit" name="btn" value="Login">
            <h3><a href="signup.jsp">Signup ?</a></h3>
            <p style="text-align: center;"><a href="forgotPassword.jsp">Forgot Password ?</a></p>
            
         </form>
         
       </div>
       
       <div class="site-info">
          <div class="info-header">
             <%
             String msg = request.getParameter("msg");
             
             if("notFound".equals(msg)) { %>
              
             <h3 id="notFound">Incorrect Username or Password</h3>
            	 
             <% } 
             
             if("invalid".equals(msg)) { %>
             
             <h3 id="notFound">Something went wrong ! Try Again..!!</h3>
             
             <% } %>
               
             <h3>Online Shopping</h3>
          </div>
          
          <div class="info-text">
             <p>Online shopping is a form of electronic commerce which allows consumers to directly 
             buy goods or services from a seller over the Internet using a web browser or a mobile app</p>
          </div>
       </div>
    </div>
   
    
</body>
</html>
