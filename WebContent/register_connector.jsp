<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
	Connection conn = null;
	
	PreparedStatement poss =null;
	
	ResultSet result_set=null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336", "Flower12!");
		
		// These are the inputted Parameters
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		
		//check if username exists
		String user_check = "SELECT * FROM MyAccount WHERE username=?";
		
		poss = conn.prepareStatement(user_check);
		poss.setString(1, username);
		
		result_set= poss.executeQuery();
		
		if(result_set.next()){
			
			System.out.println("Username already taken!");
			response.sendRedirect("Failed_Register_TakenUser.jsp");
		}
		
		
		
		// Make sure all the fields are entered
		if(firstName != null  && !firstName.isEmpty()
				&& lastName != null && !lastName.isEmpty() 
				&& email != null && !email.isEmpty()
				&& address != null && !address.isEmpty()
				&& username != null && !username.isEmpty()
				&& password != null && !password.isEmpty()) {
			
			// Build the SQL query with placeholders for parameters
			String insert = "INSERT INTO MyAccount (username, password, email, first_name, last_name, address)" + "VALUES(?, ?, ?, ?, ?, ?)";
			poss = conn.prepareStatement(insert);
			
			// Add parameters to query
			poss.setString(1, username);
			poss.setString(2, password);
			poss.setString(3, email);
			poss.setString(4, firstName);
			poss.setString(5, lastName);
			poss.setString(6, address);
			
			
			int result = 0;
	        result = poss.executeUpdate();
	        if (result < 1) {
	        	System.out.println("Error: Registration failed.");
	        	response.sendRedirect("Failed_Registration.jsp");
	        }	
	        else {
	        	response.sendRedirect("Success_Register.jsp");
	        	return;
	        }
	        
	        
		} 
		else {
			System.out.println("Error: Registration Failed.");
			response.sendRedirect("Failed_Registration.jsp");
			return;
		}
	} 
	catch(Exception e) {
        out.print("<p>Error connecting to MYSQL server.</p>");
    } 
	
	
	finally {
        try { poss.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>