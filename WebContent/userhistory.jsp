<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User History</title>
</head>
<body>
<%@ include file="navigation.jsp" %>
	<%
	

	String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
		
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336", "Flower12!");
		stmt= conn.createStatement();

		String username = request.getParameter("username"); 
		
		String query = "Select * from Product p where p.seller = '"+username+"'" ; 
		rs = stmt.executeQuery(query);
		System.out.println(query);
			
		if (rs.next()) {
			%> 
					<div class = "output" align = "center">
						<h2> Your Search Results for: <%= rs.getString("seller") %> </h2>
						
						<table border = "1"> 
							<tr> 
								<th> Product ID </th>
								<th>Seller</th>
								<th> Category </th>
								<th> Brand </th>
								<th> Capacity </th>
								<th> Model </th>
								<th> Color </th>
								<th> Price </th>
								<th> Sold </th>
								<th> End Time </th>
								
								
								
						</tr>
				<%  do { %> 
					 	<tr> 		
					 		<td><%= rs.getString("ProductID") %>
					 		<td><%= rs.getString("Seller") %>
					 		<td><%=rs.getString("Category") %></td>
					   		<td><%=rs.getString("Brand") %></td>
					    		<td><%=rs.getString("Capacity") %></td>
					    		<td><%=rs.getString("Model") %></td>
					    		<td><%=rs.getString("Color") %></td>
					    		<td><%= rs.getString("Price") %>
					    		<td><%= rs.getString("Sold") %>
					    		<td><%= rs.getString("EndTime") %>
					    	
					</tr>
				
				 <% } while(rs.next()); %>
				
				  </table>
				   
				<%  }else{ %>
					<h2> No resulting Products Match Your Search!</h2>
					</div>
				<% }
	}catch (Exception e){
	} %>

</body>
</html>