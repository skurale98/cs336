<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	if(session.getAttribute("user") == null) { 
		response.sendRedirect("login.jsp");
	} else {
		String url = "jdbc:mysql://database.cbnp4e0cmroq.us-east-2.rds.amazonaws.com:3306/cs336";
		Connection conn = null;			
		PreparedStatement ps1 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, "cs336", "Flower12!");

			int productId = Integer.parseInt(request.getParameter("productId"));
			String seller = request.getParameter("seller");
			
			String delete = "DELETE FROM Product WHERE productId=? AND seller=?";
			ps1 = conn.prepareStatement(delete);
			ps1.setInt(1, productId);
			ps1.setString(2, seller);
			
			int insertResult = 0;
			insertResult = ps1.executeUpdate();
			if (insertResult < 1) {
				response.sendRedirect("error.jsp"); // This should never happen	
			} else {
				// Auction was successfully deleted %>
				<jsp:include page="createAuction.jsp" flush="true"/>
				<div class="content center">
					<h1>Auction was successfully deleted.</h1>
				</div>
		<%	}
		} catch(Exception e) {
			out.print("<p>Error connecting to MYSQL server.</p>");
		    e.printStackTrace();
		} finally {
			try { ps1.close(); } catch (Exception e) {}
	        try { conn.close(); } catch (Exception e) {}
		}
	}
%>