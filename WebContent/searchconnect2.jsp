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
	<%if (session.getAttribute("user") == null){
		response.sendRedirect("login.jps");
		
	}else{ %>
	<%@ include file ="navigation.jsp" %>
	<div class = "content"> 
	
	<%
	String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
	Connection conn = null ;
	Statement stmt = null ;
	ResultSet rs= null ;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336", "Flower12!");
		stmt= conn.createStatement();
		
		
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String capacity = request.getParameter("capacity");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		
		String searchquery = "";
		/*if (category.equals("All") == true)  {
			searchquery = "SELECT * FROM Product p";
		}else {
			searchquery = "SELECT * FROM Product p WHERE (p.category = '" +category+ "') AND (p.brand ='" +brand+ "')"
					+ " AND (p.capacity ='" +capacity+ "') AND (p.model= '"+model+"') AND (p.color ='" +color+ "')";               
		}*/
		
		 if ((category.equals("All") == true )){
			if ((( ((brand.equals("Microsoft")) || (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) || (brand.equals("Ninetendo")) || (brand.equals("Alienware")) || (brand.equals("Dell")))))){
				searchquery = "SELECT * FROM Product p WHERE p.brand= '"+brand+"'";
			} else {
				searchquery = "SELECT * FROM Product p";
			}
		}else if ((category.equals("Consoles") == true)) {
			if ((( ((brand.equals("Microsoft")) || (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) || (brand.equals("Ninetendo")) || (brand.equals("Alienware")) || (brand.equals("Dell")))))){
				searchquery = "SELECT * FROM Product p WHERE p.brand= '"+brand+"' AND p.category= '"+category+"'";
			} else {
				//searchquery = "SELECT * FROM Product p WHERE p.category= '"+category+"'";
			 }
		}
		else if ((category.equals("Controllers") == true)) {
			if ((( ((brand.equals("Microsoft")) || (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) || (brand.equals("Ninetendo")) || (brand.equals("Alienware")) || (brand.equals("Dell")))))){
				searchquery = "SELECT * FROM Product p WHERE p.brand= '"+brand+"' AND p.category= '"+category+"'";
			} else {
				searchquery = "SELECT * FROM Product p WHERE p.category= '"+category+"'";
			}
		}
		else if ((category.equals("Accessories") == true)) {
			if ((( ((brand.equals("Microsoft")) || (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) || (brand.equals("Ninetendo")) || (brand.equals("Alienware")) || (brand.equals("Dell")))))){
				searchquery = "SELECT * FROM Product p WHERE p.brand= '"+brand+"' AND p.category= '"+category+"'";
			} else {
				searchquery = "SELECT * FROM Product p WHERE p.category= '"+category+"'";
			}
		}
		else if ((category.equals("Gaming PCs") == true)) {
			if ((( ((brand.equals("Microsoft")) || (brand.equals("Google"))  || (brand.equals("Playstation(Sony)")) || (brand.equals("Ninetendo")) || (brand.equals("Alienware")) || (brand.equals("Dell")))))){
				
				searchquery = "SELECT * FROM Product p WHERE p.brand= '"+brand+"' AND p.category= '"+category+"'";
			} 
			
			else {
				searchquery = "SELECT * FROM Product p WHERE p.category= '"+category+"'";
			}
		} else {
			searchquery = "SELECT * FROM Product p WHERE (p.category = '" +category+ "') AND (p.brand ='" +brand+ "')"
					+ " AND (p.capacity ='" +capacity+ "') AND (p.model= '"+model+"') AND (p.color ='" +color+ "')";               
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
			
		
		System.out.println(searchquery); 
		rs = stmt.executeQuery(searchquery);
		if (rs.next()) { 
			
			%> 
			<div class = "output" align = "center">
				<h1> Your Search Results: </h1>
				
				
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

	} catch (Exception e){
		
	}%>
	
	
	</div>
		
	<%} %>
	

	
</body>
</html>