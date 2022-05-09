<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<html>
<head>
<title>Show Class</title>
</head>

<style>
.Table{
	line-height: 25px;
		background: lightblue;
		width: 600px;
		position: absolute;
		left: 600px;
		top: 250px; 
		text-align: center;

}

.logOut{

background: gray;

width: 75px;
height: 25px;
position: absolute;
left: 1800px;
bottom: 800px; 

}

.Title{
	font-size: 55px;
	width: 600px;
	position: absolute;
	left: 600px;
	top: 50px; 
	text-align: center;

}

.Back{
background: gray;

width: 100px;
height: 50px;
position: absolute;
left: 1300px;
bottom: 500px; 

}

</style>
<body>

 <%
 
	 String driver = "com.mysql.jdbc.Driver";
	 String url = "jdbc:mysql://localhost:3306/tommasodb";
	 String username = "root";
	 String password = "Tommaso123";
	 Class.forName(driver);
	 String userID = (String) request.getAttribute("UserID");
	 Connection conn = DriverManager.getConnection(url,username,password);
	 String ClassName = (String)request.getAttribute("ClassName");
 	String[] StudentNames = (String[])request.getAttribute("StudentNames");     
 	String[] TestNames = (String[])request.getAttribute("TestNames");
 	int[] StudentIDs = (int[])request.getAttribute("StudentIDs");
 	int[] TestIDs = (int[]) request.getAttribute("TestIDs");
 	int total = 0;
 	int num = 0;
       %>

       <form method = "post" action = "loginAction">
       <input type="hidden" name="jspname" value="logOut" />
       <input class = logOut type = 'submit' value = "Log out"/>
       </form>
       
       <form method = "post" action = "loginAction">
       <input type="hidden" name="jspname" value="Back" />
       <input type = hidden name = "UserID" value = <%=userID %>>
       <input class = Back type = 'submit' value = "Back"/>
       </form>


       
<Label class = Title>
<%=ClassName %>
</Label>
<form action = "loginAction" method = post>
<input type = "hidden" name = "jspname" value = "ShowStudentGraph"/>

<TABLE border = 1 class = table style="overflow-x:auto">
      <TR>
     
    	  
    	  
      <TH>Student name</TH>
      
       <% for (int i = 0; i < TestNames.length; i ++)
    	  {%>
    	  <th> <%=TestNames[i] %> </th>
    	  <%} %>
    	<TH> Average </TH>
      </TR>
      <% 
      for (int i = 0; i < StudentNames.length; i++)
		{ 
      %>
		
      <TR>
       <TD> <input type = "submit" name = "StudentName" value = <%= StudentNames[i]%>></td>
		<% 
		int StudentID = StudentIDs[i];
		for (int j = 0; j < TestIDs.length; j++)
			{
			PreparedStatement statement = conn.prepareStatement("SELECT TestScore FROM StudentTest WHERE StudentID = "+StudentID+" and TestID = "+TestIDs[j]+"");  
			ResultSet TestScore = statement.executeQuery();
			%>
			
		<% while (TestScore.next())
			{
			System.out.println(TestScore.getString(1));
			%>
       <td> <%=TestScore.getString(1)%> </td>
       <%
       total+= TestScore.getInt(1);
		num++;	
			} 
			
	

      }
		int average = total/num;
		System.out.println("Student average: " + average);
		%>
      <td> <%= average %> </td>
		
		<%
		total = 0;
		num = 0;
		} %>
		
		
      </TR>
     </TABLE>
     </form>
</body>
</html>