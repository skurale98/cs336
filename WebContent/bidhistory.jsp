<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bid History</title>
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

		String username = request.getParameter("auction id"); 
		
		String query = "Select * from bidHistory " ; 
		rs = stmt.executeQuery(query);
		System.out.println(query);
			
		if (rs.next()) {
			%> 
					<div class = "output" align = "center">
						<h2> Your Search Results for Bid#  <%= rs.getString("bidid") %> </h2> <!-- should be Auction id and getstring(auctionID) -->
						
						<table border = "1"> 
							<tr> 
								<th> Auction ID </th>
								<th> Bidder </th>
								<th> Bid Amount </th>
								<th> End Date/Time </th>
									
						</tr>
				<%  do { %> 
					 	<tr> 		
					 		<td><%= rs.getString("bidID") %> </td>
					 		<td><%= rs.getString("buyer") %> </td>
					    		<td><%= rs.getString("bid") %> </td>
					    		<td> <%= rs.getString("date") %> </td>
					    		
					    		
					    	
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