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
<title>Payment Gateway</title>
<link rel="stylesheet" href="css/payment_style.css">
</head>
<body>
<% 
int prdctId = Integer.parseInt(request.getParameter("prdctId"));
String emailId =(String)session.getAttribute("email"); 
try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select name, quantity, price, total from user_cart where product_id=? and  email=?");
	stmnt.setInt(1, prdctId);
	stmnt.setString(2, emailId);
	ResultSet rs = stmnt.executeQuery();
	
	while(rs.next()) { %>
		
		<div class="main">
   
      <form action="checkOut.jsp" method="post">
        <input type="hidden" name="pid" value="<%= prdctId %>">
        
        <div class="content">
          <div class="top">
             <div class="left-div">
               <h3>Selected Product</h3>
               <label><%=rs.getString(1) %></label>
             </div> 
         
             <div class="right-div">
               <h3>Product Quantity</h3>
               <label><%=rs.getInt(2) %></label>
             </div> 
          </div>   
      
          <div class="bottom">
            <div class="left-div">
               <h3>Product Price</h3>
               <label><%=rs.getInt(3) %></label>
            </div>
         
            <div class="right-div">
               <h3>Total Amount Payable</h3>
               <label><%=rs.getInt(4) %></label>
            </div>
          </div>
          
          <div class="selection">
            <select id="userData" name="pymnt" style="width:262px;" required="required">
               <option>Select Payment Method</option>
               <option>Cash On Delivery</option>
               <option>UPI</option>
               <option>Net Banking</option>
               <option>Credit / Debit Card</option>
            </select>
          </div> 
           
          <div class="btn">
            <button>CheckOut</button>
          </div>
      </div>
   </form>   
   </div>
<%	}
	
}catch(Exception e) {
	e.printStackTrace();
	%><p style="text-align: center;">An Error Occured</p>
<% } %>
   
</body>
</html>
<%@ include file="../footer.jsp" %>