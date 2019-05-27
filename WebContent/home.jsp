<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>

<html>
<head>
    <title>Buy'N Sell</title>
</head>
<body>

    <% if (session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } 
       else { %>
    	
    	<%@ include file="navigation.jsp" %>
    	
    	<div class="content">
    		<h1>Welcome <%=session.getAttribute("user")%>!</h1>
    		<%
	    		String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
	    		Connection conn = null;
	    		PreparedStatement ps = null;
	    		PreparedStatement accountPs = null;
	    		PreparedStatement alertPs = null;
	    		ResultSet rs = null;
	    		ResultSet accountRs = null;
	    		ResultSet alertRs = null;
	    		
	    		try {
					Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(url, "cs336", "Flower12!");
				
	    		
		    		Locale locale = new Locale("en", "US");
					NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
					String user = (session.getAttribute("user")).toString();
					
					
		    		String auctionQuery = "SELECT * FROM Product WHERE seller=?";
		    		String accountQuery = "SELECT * FROM User_Info WHERE username=?";
		    		
		    		
		    		
		    		
		    		accountPs = conn.prepareStatement(accountQuery);
		    		accountPs.setString(1, user);
		    		accountRs = accountPs.executeQuery();
		    		accountRs.next();
		    		
		    	
		    		
		    		ps = conn.prepareStatement(auctionQuery);
		    		ps.setString(1, user);
		    		rs = ps.executeQuery();
		    		
		   		
		   		%>
		    			<h2>Your created auctions:</h2>
		    			<table>
		    				<tr>
		    					<th>Item</th>
		    					<th>Current Bid</th>
								<th>End Date/Time</th>
		    				</tr>
		   			<%	do { %>
		   					<tr>
								<td>
									<a href="auction.jsp?productId=<%= rs.getInt("productId") %>">
										<%= rs.getString("brand") + " " + rs.getString("model") + " " + rs.getString("capacity") +  " " + rs.getFloat("color") %>
									</a>
								</td>
								<td><%= currency.format(rs.getDouble("price")) %></td>
								<td><%= rs.getString("endDate") %></td>
							</tr> 			
		   			<%	} while (rs.next()); %>
		   				</table>
		   	
    		<% } catch (SQLException e) {
				out.print("<p>Error connecting to MYSQL server.</p>");
			    e.printStackTrace();
			} finally {
				try { rs.close(); } catch (Exception e) {} 
				try { accountRs.close(); } catch (Exception e) {} 
				try { accountPs.close(); } catch (Exception e) {} 
				try { ps.close(); } catch (Exception e) {} 
				try { conn.close(); } catch (Exception e) {}			
			}	
			%>
    	</div>
	<%} %>
</body>
</html>