<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>

<style>
    

body{
        background-color: powderblue;
        
        font-family: Georgia;
    }

.title{
        
        font-size: 40pt;
        text-align: center;
        font-weight: 100000pt;
    }
.labels{
        margin: 0 auto;
        margin-left: 40%;
        font-size: 20pt;
        margin-right: 30pt;
    }

.submit{
    font-size: 30pt;
}



</style>



<body>
    <div class="Content">
        <form action="register_connector.jsp" method="POST">
            <div class = "title" > <h2> Register Now! </h2> </div>
        <div class = "labels" >

            <label for="first_name">First Name</label>
            <input type="text" name="first_name" id="first_name" placeholder="First Name"> <br>
            
    
            <label>Last Name</label>
            <input type="text" name="last_name" placeholder="Last Name"> <br>
    
            <label>Email</label>
            <input type="text" name="email" placeholder="Email"> <br>
    
            <label for="Address">Address</label>
            <input type="text" name="address" placeholder="Address"> <br>
            
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="Username"> <br>
    
            <label>Password</label>
            <input type="password" name="password" placeholder="Password"> <br>
    
            <label>Confirm Password</label>
            <input type="password" name="confirm_password" placeholder="Confirm Password"> <br>
            
            <input type="submit" value="Register">
        </div> 
        </form>
    </div>
    
</body>
</html>