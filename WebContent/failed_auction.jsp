<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Auction Failure</title>
</head>
<body>
	<% if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
       } 
		else { %>
       	<%@ include file="navigation.jsp" %>
	    <div class="content">
	    	<h2>We could not process your auction! Try Again!</h2>
	    	<p>
	    		We have very strict guidelines on how to fill out the auction! <br>
	    		Each Field Must Have An Entry.
	    		The Minimum Bid Price cannot be 0! <br>
	    		The Start Date has to be Later than the End Date! <br>
	    	</p>	    	
	    	<a href="createAuction.jsp">Click here to try again.</a>        
	    </div>
	    
	<% } %>
</body>
</html>