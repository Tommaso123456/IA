<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>Sign Up Page</title>
</head>

<style>
.center{
background-color: #808080;
  width: 500px;
  min-height: 300px;
  padding: 5px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);	
}


.Username{
	width: 50px;
	position: relative;
	left: 0;
	bottom: 30px; 
}

.Password{
	width: 50px;
	position: relative;
	left: 0;
	bottom: 20px; 
}
	
.Login{
	width: 200px;
	position: relative;
	left: 860px;
	top: 290px; 
}

.GTA{
	width: 600px;
	position: relative;
	left: 750px;
	top: 0px; 
}

.SignUp{
	width: 30px;
	position: relative;
	left: 900px;
	top: 620px; 
}
.ConfirmPassword{
	width: 50px;
	position: relative;
	left: 0;
	bottom: 10px; 
}

</style>
<body>






<div>

<form method = "post" action = "loginAction">

<table class = center>
<tr class = Username><td>Username</td><td><input type='text' name="Username"/></td></tr>
<tr class = Password><td>Password</td><td><input type='password' name="Password"/></td></tr>
<tr class = ConfirmPassword><td>ConfirmPassword</td><td><input type='password' name="ConfirmPassword"/></td></tr>
</br>

<input type="hidden" name="jspname" value="SignUp" />
<tr><td></td><td><input type = 'submit' value = "SUBMIT"/></td></tr>

</table>
<h1 class = Login>
Sign Up
</h1>

<h1 class = GTA>

<font face="Times New Roman" size="20px" color="#00008B">Grade Tracking App</font>
</h1>

 
</form>


</div>

</body>
</html>