<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp"); 
		} else {%> 
		<%@ include file = navigation.jsp %>
		
		<div class = "content">
			<% 
			String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
			Connection conn = null;
			PreparedStatement ps = null; 
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;
			
			try{ 
				
			}
			%>
		</div>
		
	<%} %>
   
</body>
</html>