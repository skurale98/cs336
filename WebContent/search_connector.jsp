<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Search Results!</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <% if(session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } else { %>
       	<%@ include file="navigation.jsp" %>
       <div class="content">
       
		<%	
			
			
			Locale locale = new Locale("en", "US");
			NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
			
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
				String capacity = request.getParameter("capacity");
				String model = request.getParameter("model");
				String color = request.getParameter("color");
				
				
				String searchQuery="";
				// (brand.equals("Microsoft")) || (brand.equals("Microsoft")) || (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) || (brand.equals("Ninetendo")) || (brand.equals("Alienware")) || (brand.equals("Dell")))
				if (category.equals("All") == true)  {
					searchQuery = "SELECT * FROM Product p";
				}else {
					searchQuery = "SELECT * FROM Product p WHERE (p.category = '" +category+ "') AND (p.brand ='" +brand+ "')"
							+ " AND (p.capacity ='" +capacity+ "') AND (p.model= '"+model+"') AND (p.color ='" +color+ "')";               
				}
				
		
				System.out.println(searchQuery);
				rs= stmt.executeQuery(searchQuery);
				if (rs.next()) {
		%> 
				<div class = "output" align = "center">
					<h1> Your Search Results for :</h1>
					<table>
						<tr> 
							<td> Category: <%= rs.getString("Category")  %> -></td> 
							<td> Capacity: <%= rs.getString("Capacity")  %> -> </td>
							<td> Model: <%= rs.getString("Model")  %>-> </td> 
							<td> Color: <%= rs.getString("Color")  %>-></td>
						</tr>
					
					</table>
					
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
	
		} catch (Exception e){ %>
			<jsp:include page="search.jsp" flush="true"/>
			<div class="content center">
				<h1>Error: You must enter at least one search parameter.</h1>
			</div>
			<% e.printStackTrace();
			} finally {
				try { rs.close(); } catch (Exception e) {}
			    try { rs.close(); } catch (Exception e) {}
			    try { conn.close(); } catch (Exception e) {}
			}
		%>
	</div>
	<% } %>
</body>
</html>