<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>




<!DOCTYPE html>
<html> 

<head>
	<title> Welcome! </title> 
</head>
<style>

	body{
		background-color: powderblue;
		text-align: center;
		font-family: Georgia;

	}
	.title{
		
		font-size: 40pt;
		
	}
	table{
		margin: 0 auto;
		font-size: 20pt;
	}
	

	

</style>
<body> 
	<form action="login_connector.jsp" method="POST">
	
	<div class = "title" > <h2> Buy n' Sell LLC.  </div>
	 Login Below or Create an Account now! 
	<br> </br>
	<div class = "container"> 
	<table>
		<tr> 
			<div class = "uname" >
			<td> USERNAME </td> 
		    <td> <input type = "text" placeholder = "Username" name = "user" > </td> 
		</div>
		</tr> 
		
		<tr> 
			<td> PASSWORD </td> 
		    <td> <input type = "password" placeholder = "Password" name = "password" > </td> 
		</tr> 
	</table>
		<br>
		    <button type  = "submit"> LOGIN </button> 
		    <button type  = "submit">  <a href = "registration.jsp" >  CREATE NEW USER </a></button> 
		</br>
		
	
	
	</div>
	</form>
</body>
</html>

