<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
	<title>Auction Generator</title>
</head>
<body>
	<% if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
        } else { %>
	
	<div class="content">
		<form action="auction_connector.jsp" method="POST">
			<label for="category">Category</label> <select name="category" id="category" required>
				<option value="" disabled selected hidden="true">Select category</option>
				<option value="Consoles">Consoles</option>
				<option value="Portable Consoles">Portable Consoles</option>
				<option value="Controllers"> Controllers </option>
				<option value="Accessories">Accessories</option>
				<option value="Gaming PCs"> Gaming PCs </option>
				

			</select> <br>
			<label for="brand">Brand</label>
			<select name="brand" id="brand" required>
				<option value="" disabled selected hidden="true">Select brand</option>
				<option value="Microsoft">Microsoft</option>
				<option value="Google">Google</option>
				<option value="Playstation(Sony)">Playstation(Sony)</option>
				<option value="Nintendo">Nintendo</option>
				<option value="Alienware"> Alienware</option>
				<option value="Dell"> Dell </option>
				<option value="Other"> Other </option>
			</select> <br> 
		
		
			</select> <br>
			<label for="capacity">Capacity</label>
			<select name="capacity" id="capacity" required>
				<option value="" disabled selected hidden="true">Select capacity</option>
				<option value="64 GB">64 GB</option>
				<option value="128 GB">128 GB</option>
				<option value="256 GB">256 GB</option>
				<option value="500 GB">500 GB</option>
				<option value="1 TB"> 1 TB</option>
				<option value= "2 TB"> 2 TB</option>
				<option value= "N/A"> N/A </option>	
				<option value= "Other"> Other </option>
			</select> <br> 
		
			
			<label for="model">Model</label>
			<input type="text" name="model" id="model" placeholder="Enter model name" required> <br>
			<label for="color">Color</label>
			<input type="text" name="color" id="color" placeholder="Enter color(s)" required> <br>
			
			
			
			<label for="end_datetime">End Date and Time</label>
			<input type="datetime-local" name="end_datetime" id="end_datetime" placeholder="yyyy-mm-dd --:--:--" required> <br>
			<label for="min_price">Minimum Bid Price (hidden from bidders)</label>
			<input type="number" step="0.01" name="min_price" placeholder="0.00" min="0.00" required> <br>	
			<label for="starting_price">Starting Bid Price</label>
			<input type="number" step="0.01" name="starting_price" placeholder="0.00" min="0.00" required> <br>	
			<input type="submit" value="Submit">
		</form>
	</div>
	<% } %>
</body>
</html>