<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged In!</title>
    <link rel="stylesheet" href="style.css">
</head>
<style >
    
body{
        background-color: powderblue;
        text-align: center;
        font-family: Georgia;
        margin: 10%;

    }
.success{
    color: green;
    font-size: 20pt;

}

</style>
<body>
    <div class="Content">
        <div class = success > <h1>You have successfully signed in!</h1> </div>
         <br>
        <a href="login.jsp">Click here to logout.</a>
    </div>
    
</body>
</html>

<%
session.invalidate();
%>