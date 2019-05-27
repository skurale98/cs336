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

		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		
		
		String searchquery = "Select * from Product p WHERE YEAR(endTime) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) "; 
		
		if (category != null){
			if (category.equals("All")){
				searchquery = "SELECT * FROM Product p";
			} else {
			searchquery += "p.category = '"+category+"' ";
			} 
		}
		
		if (brand != null){
			if (category.equals("All") && ((brand.equals("Microsoft")) 
					|| (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) 
					|| (brand.equals("Nintendo")) || (brand.equals("Alienware")) 
					|| (brand.equals("Dell")))){
				searchquery = "SELECT * FROM Product p WHERE p.brand= '"+brand+"'";
			} 
			else {
				searchquery += " AND p.brand = '"+brand+"'";
			}
		} 
		
		

		String sort = request.getParameter("sort");
		
		 if (sort.equals("$")){
				searchquery += " ORDER BY p.price";
			} else if(sort.equals("$$")){
				searchquery += " ORDER BY p.price DESC";
			}else if(sort.equals("EndTime")){
				searchquery += " ORDER BY p.endTime ";
			}else if(sort.equals("SellerA")){
				searchquery += " ORDER BY p.seller ";
			}else if(sort.equals("SellerZ")){
				searchquery += " ORDER BY p.seller DESC ";
			}
			else if(sort.equals("BrandA")){
				searchquery += " ORDER BY p.brand ";
			}else if(sort.equals("BrandZ")){
				searchquery += " ORDER BY p.brand DESC ";
			}
		rs = stmt.executeQuery(searchquery);
		System.out.println(searchquery);
			
		if (rs.next()) {
			%> 
					<div class = "output" align = "center">
						<h2> Your Search Results for Similar Auctions </h2>
						
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