<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Search Results</title>
	<link rel="stylesheet" href="style.css?v=1.0"/>

</head>
<body>
	<% if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp"); 
	} else { %>
		 <%@ include file = "navigation.jsp" %>  
		<form method = "get" action = "searchconnect.jsp">
			<h3> Please select atleast a Category and Sort Filter*</h3>
			
			<div class = "search"> 
				<label for="category">Category*</label> 
					<select name="category" id="category" required >
						<option value="" disabled selected hidden="true">Select category</option>
						<option value = "All" > All </option>
						<option value="Consoles">Consoles</option>
						<%-- <option value="Portable Consoles">Portable Consoles</option> --%>
						<option value="Controllers"> Controllers </option>
						<option value="Accessories">Accessories</option>
						<option value="Gaming PCs"> Gaming PCs </option>
					</select> <br>
				<label for="brand">Brand</label>
					<select name="brand" id="brand" >
						<option value="" disabled selected hidden="true">Select brand</option>
						<option value = "All" > All </option>
						<option value="Microsoft">Microsoft</option>
						<option value="Google">Google</option>
						<option value="Playstation(Sony)">Playstation(Sony)</option>
						<option value="Nintendo">Nintendo</option>
						<option value="Alienware"> Alienware</option>
						<option value="Dell"> Dell </option>
				</select> <br> 
		
				<label for="capacity">Capacity</label>
					<select name="capacity" id="capacity" >
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
					<input type="text" name="model" id="model" placeholder="Enter model name" > <br>
				
				<label for="color">Color</label>
					<input type="text" name="color" id="color" placeholder="Enter color(s)" > <br>
		
			
				<label for="sort">Sort By*: </label>
					<select name ="sort" id ="sort" required >
						<option value="" disabled selected hidden="true">Sort By</option>
						<option value = "EndTime" > EndTime </option>
						<option value="$">$</option>
						<option value="$$">$$</option>
						<option value="SellerA">Seller A-Z</option>
						<option value="SellerZ">Seller Z-A</option>
						<option value="BrandA"> Brand A-Z</option>
						<option value="BrandZ"> Brand Z-A </option>
					</select>
				<input type = "submit" value = "Search" > 
			</div>
		
	</form>
	<br>
	<br>
		<h3> Bid History</h3>
		<form method="post" action="bidhistory.jsp">
			<div class = "history">
				<table>
					<tr>    
						<td>Auction ID</td><td><input type="text" name="auctionid"></td>
					</tr>
				</table>
				<input type="submit" value="View History">
			</div>
		</form>
	
	<br>
		<h3>View User Auction Participation Below!</h3>
		<form method="post" action="userhistory.jsp">
			<div class = "allAuction">
				<table>
					<tr>    
						<td>Username</td><td><input type="text" name="username"></td>
					</tr>
				</table>
				<input type="submit" value="View History">
			</div>
		</form>	
	<br>
		<h3>View Similar Auction from Last Month!</h3>
		<form method="post" action="similarAuctions.jsp">
			<div class = "similarAuctions">
				<label for="category">Category*</label> 
					<select name="category" id="category" required >
						<option value="" disabled selected hidden="true">Select category</option>
						<option value = "All" > All </option>
						<option value="Consoles">Consoles</option>
						<%-- <option value="Portable Consoles">Portable Consoles</option> --%>
						<option value="Controllers"> Controllers </option>
						<option value="Accessories">Accessories</option>
						<option value="Gaming PCs"> Gaming PCs </option>
					</select> <br>
				<label for="brand">Brand</label>
					<select name="brand" id="brand" >
						<option value="" disabled selected hidden="true">Select brand</option>
						<option value = "All" > All </option>
						<option value="Microsoft">Microsoft</option>
						<option value="Google">Google</option>
						<option value="Playstation(Sony)">Playstation(Sony)</option>
						<option value="Nintendo">Nintendo</option>
						<option value="Alienware"> Alienware</option>
						<option value="Dell"> Dell </option>
				</select> <br> 
				<label for="sort">Sort By*: </label>
					<select name ="sort" id ="sort" required >
						<option value="" disabled selected hidden="true">Sort By</option>
						<option value = "EndTime" > EndTime </option>
						<option value="$">$</option>
						<option value="$$">$$</option>
						<option value="SellerA">Seller A-Z</option>
						<option value="SellerZ">Seller Z-A</option>
						<option value="BrandA"> Brand A-Z</option>
						<option value="BrandZ"> Brand Z-A </option>
					</select>
				
				<input type="submit" value="View History">
			</div>
		</form>	
		
	
	
<% } %>


</body>
</html>