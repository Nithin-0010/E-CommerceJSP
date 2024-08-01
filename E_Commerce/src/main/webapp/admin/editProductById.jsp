<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" href="../css/editProductById_style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
   <h2><a href="allProductsAndEdit.jsp" style="text-decoration: none;"><span class="material-symbols-outlined">arrow_back</span><span id="back">Back</span></a></h2>
<%
String prdct_id = request.getParameter("id");
int id =Integer.parseInt(prdct_id);

try {
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement stmnt = con.prepareStatement("select * from products where id ="+id+";");
	ResultSet rs = stmnt.executeQuery();
	
	while(rs.next()) { %>
		
		<form action="editProductByIdAction.jsp" method="post">
      <input type="hidden" name="id" value="<% out.print(id); %>">
      
      <div class="content">
         <div class="top">
            <div class="left-div">
              <h3>Enter Name</h3>
              <input type="text" name="name" value="<%= rs.getString(2) %>">
            </div> 
         
            <div class="right-div">
              <h3>Enter Category</h3>
              <input type="text" name="category" value="<%= rs.getString(3) %>">
            </div> 
         </div>   
      
         <div class="bottom">
            <div class="left-div">
               <h3>Enter Price</h3>
               <input type="text" name="price" value="<%= rs.getInt(4) %>">
            </div>
         
            <div class="right-div">
               <h3>Active</h3>
               <select name="active">
                  <option value="yes" <%= "yes".equals(rs.getString(5)) ? "selected" : "" %>>Yes</option>
                  <option value="no" <%= "no".equals(rs.getString(5)) ? "selected" : "" %>>No</option>
               </select>
            </div>
         </div>
          
         <div class="btn">
            <button>Save</button>
         </div>
      </div>
   </form>   
   
  <% }
	
}catch(Exception e) {
	e.printStackTrace();
}
%>

  <%@ include file="../footer.jsp" %>
</body>
</html>