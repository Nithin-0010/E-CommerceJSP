<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<link rel="stylesheet" href="../css/addNewProduct_style.css">
</head>
<body>
<%
int id = 1;

try{
    Connection con = ConnectionProvider.getCon();
    PreparedStatement stmnt = con.prepareStatement("select max(id) from products;");
    ResultSet rs = stmnt.executeQuery();
    
    while(rs.next()) {
        id = rs.getInt(1);
        id = id + 1;
    }
    
}catch(Exception e) {
    e.printStackTrace();
}
%>
   <h3 style="color: #28A745; text-align: center;">Product ID : <% out.print(id); %></h3>
   <%
   String msg = request.getParameter("msg");
   if("done".equals(msg)) { %>
       <h3 style="color: #28A745; text-align: center;">Product Added Successfully</h3>
   <% } 
   if("fail".equals(msg)) { %>
       <h3 style="color: #28A745; text-align: center;">Something Went Wrong Try Again..!!</h3>
   <% } %>    
   
   <form action="addNewProductAction.jsp" method="post">
      <input type="hidden" name="id" value="<% out.print(id); %>">
      
      <div class="content">
         <div class="top">
            <div class="left-div">
              <h3>Enter Name</h3>
              <input type="text" name="name" placeholder="Enter Product Name">
            </div> 
         
            <div class="right-div">
              <h3>Enter Category</h3>
              <input type="text" name="category" placeholder="Enter Product Category">
            </div> 
         </div>   
      
         <div class="bottom">
            <div class="left-div">
               <h3>Enter Price</h3>
               <input type="text" name="price" placeholder="Enter Product Price">
            </div>
         
            <div class="right-div">
               <h3>Active</h3>
               <select name="active">
                  <option value="yes">Yes</option>
                  <option value="no">No</option>
               </select>
            </div>
         </div>
          
         <div class="btn">
            <button>Save</button>
         </div>
      </div>
   </form>   
<%@ include file="../footer.jsp" %>
</body>
</html>
