 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
 	<%@ include file="navigation.jsp" %>
<%
	String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336", "Flower12!");

		
		//System.out.println("worked");
		
		// Get the parameters from the createAuction request
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");	
		String capacity = request.getParameter("capacity");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String seller = (session.getAttribute("user")).toString();
		float minPrice = Float.parseFloat(request.getParameter("min_price"));
		float startingPrice = Float.parseFloat(request.getParameter("starting_price"));
		String endTime = request.getParameter("end_datetime");
		
		
	
		//System.out.println("Worked");
		
		// Make sure all the fields are entered

			
		// Build the SQL query with placeholders for parameters
			String insert = "INSERT INTO Product (category, brand, capacity, model, color, seller, min_price, price, sold, startTime, endTime)"
					+ "VALUES(?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(insert);
		
			if(java.sql.Timestamp.from(java.time.Instant.now()).after(java.sql.Timestamp.valueOf(endTime))){
				response.sendRedirect("failed_auction.jsp"); 
				return;
			}
		
			ps.setString(1, category);
			ps.setString(2, brand);
			ps.setString(3, capacity);
			ps.setString(4, model);
			ps.setString(5, color);
			ps.setString(6, seller);
			ps.setFloat(7, minPrice);
			ps.setFloat(8, startingPrice);			
			ps.setBoolean(9, false);
			ps.setTimestamp(10, java.sql.Timestamp.from(java.time.Instant.now()));
			ps.setTimestamp(11, java.sql.Timestamp.valueOf(endTime));
			
			//System.out.println("Worked");

			int result = 0;
	        result = ps.executeUpdate();
	        
	        conn.close(); 
	        if (result < 1) {
	        	out.println("Error: Auction creation failed.");
	        } 
	        else {
	        	out.print("Item successfully listed!");
	        //	response.sendRedirect("home.jsp"); //success
	        	return;
	        }
		
	} catch(Exception e) {
        response.sendRedirect("failed_auction.jsp"); 
        e.printStackTrace();
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }

%>