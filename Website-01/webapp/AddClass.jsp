<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.AddClass{
	position: absolute;
	width: 200px;
	height: 50px;
	left: 600px;
	bottom: 600px;

}

.Table{
	
	position: absolute;
	width: 200px;
	height: 50px;
	left: 600px;
	top: 250px;
	text-align: center;
}



.Button{
position: absolute;
	width: 200px;
	height: 50px;
	left: 900px;
	top: 150px;
	text-align: center;

}

.StudentText{
	position: absolute;
	width: 200px;
	height: 50px;
	left: 600px;
	top: 145px;
	text-align: center;

}

.StudentPicker{
	position: absolute;
	width: 200px;
	height: 50px;
	left: 600px;
	top: 150px;

}
.DoneButton{

	background-color: lightblue;
	position: absolute;
	width: 200px;
	height: 50px;
	left: 900px;
	top: 350px;


}



</style>

<% String userID = (String)request.getAttribute("UserID"); 
String ClassName = request.getParameter("ClassName");



String url = "jdbc:mysql://localhost:3306/tommasodb";
String username = "root";
String password = "Tommaso123";
 Connection connection = DriverManager.getConnection(url,username,password);
Statement statement = connection.createStatement() ;
ResultSet resultset = statement.executeQuery("Select StudentName from students;") ;


%>

<title>Add class</title>
</head>

<script type="text/javascript">
var br = document.createElement("br");
function Add(){

	
	var form = document.getElementById("StudentForm");
	
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "StudentName");
	input.setAttribute("value", document.getElementsByName("StudentName")[0].value);
    form.appendChild(input);
    form.appendChild(br.cloneNode());
    
	var table = document.getElementById("AddStudentsTable").getElementsByTagName('tbody')[0];
	var row = table.insertRow(1);
	var cell1 = row.insertCell(0);
	cell1.innerHTML = document.getElementsByName("StudentName")[0].value;
    
	 var SelectRef = document.getElementById("StudentPicker");
	 SelectRef.remove(SelectRef.selectedIndex);
	
    <% System.out.println("Add function terminated");%>
}

</script>

<body>

<select class = StudentPicker name="StudentName" id="StudentPicker">
	<% 
      while(resultset.next()){ 
      %>
	
    <option value=<%= resultset.getString(1) %>><%= resultset.getString(1) %></option>
    
      <% 
      } %>
</select>


<button class = Button onclick= "javascript:Add()"  id = "button">Add Student</button>

<form id = "StudentForm" method = "post" action = "loginAction">

<input type = hidden name = CurrentUser value = <%=userID%>>
 <table border = 1 class = Table id = "AddStudentsTable">
 <tr bgcolor="lightblue">
<TH>Students Preview </TH>
</tr>
   <tbody>
   
   </tbody>
</table>


<input type = hidden name = ClassName value = <%=ClassName %>>
<input type = hidden name = jspname value = "NewClass"/>
<input class = "DoneButton" type = submit value = "Done"/>

 </form>
</body>
</html>