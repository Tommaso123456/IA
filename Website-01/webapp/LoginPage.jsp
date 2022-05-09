
<html>
<title>
Grade Tracking App
</title>
<script>

</script>

<head>

<link rel = "stylesheet" href = "Position.css">
</link>
</head>
<style>
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white;
  color: black;
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.center{
  width: 300px;
  min-height: 300px;
  position: absolute;
  left: 610px;
  top: 270px; 
}

.Username{
	font-size: 35px;
	width: 100px;
	position: relative;
	left: 0;
	bottom: 30px; 
}

.Password{
	font-size: 35px;
	width: 50px;
	position: relative;
	left: 0;
	bottom: 20px; 
}
	
.Login{
	font-size: 25px;
	width: 50px;
	position: absolute;
	left: 910px;
	top: 270px; 
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

.Text1{
	width: 2050px;
	position: absolute;
	left: 610px;
	top: 170px; 
}

.UserNameInput{
	height: 50px;
	width: 300px;
	position: absolute;
	left: 160px;
	top: 45px;
}
.PasswordInput{
	height: 50px;
	width: 300px;
	position: absolute;
	left: 160px;
	top: 45px;
}
.SubmitButton{
	color:lightblue;
	background-color: blue;
	height: 50px;
	width: 150px;
	position: absolute;
	left: 360px;
	top: 300px;

}

</style>

<body style="background-color:powderblue;">

<a class = "SignUp" href="http://localhost:8080/Website-01/SignUpPage.jsp">Don't have an account? Sign up here!</a>



<div>

<form method = "post" action = "loginAction">

<table class = center>
<tr class = Username><td>Username: </td><td><input class = UserNameInput type='text' name="Username" placeholder = "Enter your username here"/></td></tr>
<tr class = Password><td>Password: </td><td><input class = PasswordInput type='password' name="Password" placeholder = "Enter your password here"/></td></tr>
</br>

<input type="hidden" name="jspname" value="Login" />
<tr><td></td><td><input class = SubmitButton type = 'submit' value = "Let's go!"/></td></tr>

</table>

<h1 class = Text1>
Please let us know who you are

</h1>

<h1 class = GTA>

<font face="Times New Roman" size="20px" color="#00008B">Grade Tracking App</font>
</h1>

 
</form>


</div>

</body>
</html>