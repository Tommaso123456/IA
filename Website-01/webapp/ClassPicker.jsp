<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>


<HTML>

		<Style>
		.table{
		line-height: 25px;
		background: lightblue;
		width: 600px;
		position: absolute;
		left: 600px;
		top: 250px; 
		text-align: center;
		}
		
		.title{
		color: orange;
		width: 600px;
		position: absolute;
		left: 750px;
		bottom: 750px; 
		}
		
		.logOut{
		
		background: gray;
		
		width: 75px;
		height: 25px;
		position: absolute;
		left: 1800px;
		bottom: 800px; 
		
		}
		
		.AddClass{
		
		background: gray;
		color: orange;
		
		width: 75px;
		height: 25px;
		position: absolute;
		left: 1450px;
		bottom: 380px; 
		
		}
		
		.ClassNameText{
		font-size: 25px;
		width: 250px;
		height: 75px;
		position: absolute;
		left: 1350px;
		bottom: 370px; 
		}
		
		.classNameInput{
		width: 250px;
		height: 75px;
		position: absolute;
		left: 1500px;
		bottom: 410px;  
		
		}
		
		.AddClass{
		color: black;
		position: absolute;
		left: 1625px;
		bottom: 330px; 
		
		}
		.Text1{
		font-size: 35px;
		color: black;
		
		width: 450px;
		height: 100px;
		position: absolute;
		left: 1350px;
		bottom: 450px; 
		}
		
		.ClickBtnText{
		font-size: 15px;
		color: black;
		
		width: 450px;
		height: 100px;
		position: absolute;
		left: 1350px;
		bottom:250px; 
		
		}
		
		
	   </Style>
	   
	    <%
       String userID = (String)request.getAttribute("UserID");
       String url = "jdbc:mysql://localhost:3306/tommasodb";
	   String username = "root";
	   String password = "Tommaso123";
 	   Connection connection = DriverManager.getConnection(url,username,password);
       Statement statement = connection.createStatement() ;
       ResultSet resultset = statement.executeQuery("Select ClassName, StudentNum from classes WHERE UserID = '"+userID+"';") ;
       %>
       
       <HEAD>
       <TITLE > Classes </TITLE>
       </HEAD>
       <BODY BGCOLOR="#7DF9FF">
       
       <h1 class = Text1> Want to add a new class? </h1>
       <h1 class = ClassNameText>Class Name: </h1>
       <form method = "post" action = "loginAction">
       <input type="hidden" name="jspname" value= "AddClass" />
       <input class = classNameInput type='text' name="ClassName" placeholder = "Enter your class name here"/>
       <input type = hidden name = "CurrentUser" value = <%=userID %> />
       <input class = AddClass type = 'submit' value = "Add class"/>
       </form>
       
       
       
       <H1 class = title>YOUR CLASSES: </H1>
       <div class = ClickBtnText>Write the class name then click this button!</div>

       
       
       <form method = "post" action = "loginAction">
       <input type="hidden" name="jspname" value="logOut" />
       <input class = logOut type = 'submit' value = "Log out"/>
       </form>
       
       
       
       
      <form action = "loginAction" method = post>
      <input type = "hidden" name = "jspname" value = "OpenClass"/>
      <input type = "hidden" name = "userID" value = <%=userID %> >
      <TABLE border = 1 class = table style="overflow-x:auto">
      <TR>
      <TH>Class Name</TH>
      <TH>Number of students</TH>
      </TR>
      <% 
      int RowNum = 1;
      while(resultset.next()){ 
      %>

      <TR>
      <TD>
      
      <input type = "submit" name = "ClassButton" value = <%= resultset.getString(1) %>>
       <TD> <%= resultset.getString(2)%></td>                                  
      </TR>
      <% 
      RowNum++;	
      } %>
     </TABLE>
     </form>

     
     </BODY>
</HTML>