

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
	Connection conn = null;
	PreparedStatement poss = null;
	ResultSet result = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336", "Flower12!");
	
		// Get the parameters from the login request
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		
		if (username != null && password != null) {
			String check = "SELECT * FROM User_Info WHERE username=?";
			
			poss = conn.prepareStatement(check);
			poss.setString(1, username);
			
			result = poss.executeQuery();
			
			if (result.next()) {
				String actual_password = result.getString("password");
				
				if (password.equals(actual_password)) {
					//for current session
					session.setAttribute("user", username);
		
					response.sendRedirect("home.jsp");
		        	return;
		        	
				} else {
					response.sendRedirect("login_error.jsp");
		        	return;
				}
			} else {
				response.sendRedirect("login_error.jsp");
				return;
			}
		} else {
			response.sendRedirect("login_error.jsp");
			return;
		}
	
	} catch (Exception e) {
        System.out.print("<p>Error connecting to MYSQL server.</p>");
    
    } 
	finally {
    	try { result.close(); } catch (Exception e) {}
        try { poss.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>