<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error</title>
    <link rel="stylesheet" href="style.css">
</head>



<style>
    body{
        background-color: powderblue;
        text-align: center;
        font-family: Georgia;
        margin: 5%;
       
    }
    .title{
        
        font-size: 40pt;
        
    }
    .error { 
        color: red; 
        
        font-size: 20pt;

    }
    .msg{
        font-style: italic; 
        font-size: 10pt;
    }
</style>


<body>
    <div class="content">
        <div class = "title" > <h2> Buy n' Sell LLC.  </div>
        <div class = "error" > <h2>Error: Login failed. </h2> </div>
        <div class = "msg" >
        <h3>Username or Password may be incorrect.</h3> 
    </div>
        <form action="login_connector.jsp" method="POST">
            USERNAME
            <input type="text" name="user" placeholder="Username"> <br>
            PASSWORD
            <input type="password" name="password" placeholder="Password"> <br>
            <input type="submit" value="Login">
        </form>
        <a href="registration.jsp">Don't have an account? Register here.</a>
    </div>
</body>
</html>