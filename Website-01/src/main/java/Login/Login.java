package Login;






import Serverlet.Servlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import java.applet.Applet;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import java.awt.Toolkit;
import java.awt.*;
import javax.swing.*;
import java.awt.geom.Line2D;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
  



  


public class Login implements ActionListener{

	
	
	
	public static void main(String[] args) throws Exception
	{	
	}
	
	public static String GetTestName(int TestID)
	{
	try {	
		Connection con = getConnection();
		PreparedStatement statement = con.prepareStatement("SELECT TestName FROM tests WHERE TestID = '"+TestID+"'"); 
		ResultSet Result = statement.executeQuery();
		
		String TestIDs = "";
		
		while (Result.next()) {

			TestIDs = Result.getString("TestName");
		}
		
		return TestIDs;
	}catch(Exception e) {System.out.println(e);}
	
	
	return null;
	
}
	
	
	public static void InsertStudentClass(String StudentID, String ClassIDs) throws Exception
	{
		int StudId = Integer.parseInt(StudentID);
		int ClassID = Integer.parseInt(ClassIDs);
		Connection con = getConnection();
		PreparedStatement statement = con.prepareStatement("INSERT INTO studentclass (StudentID, ClassID) VALUES ('"+StudId+"' , '"+ClassID+"')");  
		statement.executeUpdate(); 
	}
	
	
	public static String getUserID(String Username) throws Exception{
		try {
			
			System.out.println("Getting User ID");
			final String User = Username;
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT UserID FROM users WHERE Username = '"+User+"'");  
			
			ResultSet Result = statement.executeQuery();
			
			String UserID = "";
			
			while (Result.next()) {

				UserID = Result.getString("UserID");
			}
			
			return UserID;
		}catch(Exception e) {System.out.println(e);}
		
		
		return null;
		
	}
	
	public static int[] getStudentIDWithClass(String ClassIDs, int ClassSize) throws Exception{
		try {
			
			final int ClassID = Integer.parseInt(ClassIDs);
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT StudentID FROM studentclass WHERE ClassID = '"+ClassID+"'");  
			ResultSet Result = statement.executeQuery();
			int[] StudentIDS = new int[ClassSize];
			int a = 0;
			while (Result.next()) {
				
				StudentIDS[a] = (Result.getInt(1));
				a++;
			}
			
			for (int i = 0; i < StudentIDS.length;i++)
			{
				System.out.println(StudentIDS[i]);			
			}
			
			return StudentIDS;
			
		}catch(Exception e) {System.out.println(e);}
		
		int[] b = new int[0];
		return b;
		
	}
	
	
	public static String getStudentID(String StudentName) throws Exception{
		try {
			
			final String StudName = StudentName;
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT StudentID FROM students WHERE StudentName = '"+StudName+"'");  
			ResultSet Result = statement.executeQuery();
			
			String StudentId = "";
			
			while (Result.next()) {

				StudentId = Result.getString("StudentId");
			}
			
			return StudentId;
		}catch(Exception e) {System.out.println(e);}
		
		
		return null;
		
	}
	
	public static int[] GetTestIDs(int ClassID)
	{
try {
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT TestID FROM tests WHERE ClassID = "+ClassID+"");  
			ResultSet Result = statement.executeQuery();
			PreparedStatement create = con.prepareStatement("select count(*) from tests where ClassID = "+ClassID+"");
			ResultSet rs = create.executeQuery();
			rs.next();
		    int count = rs.getInt(1);
			
			int[] TestsID = new int[count];
			int a = 0;
			while (Result.next()) {
				
				TestsID[a] = (Result.getInt(1));
				a++;
			}
			
			
			return TestsID;
			
		}catch(Exception e) {System.out.println(e);}
		
		int[] b = new int[0];
		return b;
		
	}
	
	public static String getStudentName(int StudentID) throws Exception
	{
		Connection con = getConnection();
		PreparedStatement statement = con.prepareStatement("SELECT StudentName FROM Students WHERE StudentID = '"+StudentID+"'");  
		ResultSet Result = statement.executeQuery();
		
		String StudentName = "";
		
		while (Result.next()) {

			StudentName = Result.getString("StudentName");
		}
		
		return StudentName;
	

	}
	
	public static String getClassID(String ClassName) throws Exception{
		try {
			
			System.out.println("Getting ClassID");
			final String Classname = ClassName;
			Connection con = getConnection();
			System.out.println("ClassName: " + ClassName);
			PreparedStatement statement = con.prepareStatement("SELECT ClassID FROM classes WHERE ClassName = '"+Classname+"'");  
			ResultSet Result = statement.executeQuery();
			
			String ClassID = "";
			
			while (Result.next()) {

				ClassID = Result.getString("ClassID");
			}
			
			return ClassID;
		}catch(Exception e) {System.out.println(e);}
		
		
		return null;
		
	}
	
	
	public static int GetStudentNum(String ClassName) throws Exception{
		try {
			
			System.out.println("Getting StudentNum");
			final String Classname = ClassName;
			Connection con = getConnection();
			System.out.println("ClassName: " + ClassName);
			PreparedStatement statement = con.prepareStatement("SELECT StudentNum FROM classes WHERE ClassName = '"+Classname+"'");  
			ResultSet Result = statement.executeQuery();
			
			int StudentNum = 0;
			
			while (Result.next()) {

				StudentNum = Result.getInt("StudentNum");
				System.out.println("StudentNum: " + StudentNum);
			}
			
			return StudentNum;
		}catch(Exception e) {System.out.println(e);}
		
		
		return -1;
		
	}
	
	public static void InsertNewClass(String ClassName, int StudentNum, String UserIDS) 
	{
		int UserID = Integer.parseInt(UserIDS);
		System.out.println("Added: (" + ClassName + ", " + StudentNum + ", " + UserID + ") to classes");
		Connection con;
		try {
			con = getConnection();
			PreparedStatement create = con.prepareStatement("INSERT INTO classes(ClassName, StudentNum, UserID) VALUES ('"+ClassName+"', '"+StudentNum+"' , '"+UserID+"')");  
			create.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static String getPass(String Username) throws Exception{
		try {
			
			System.out.println("Connecting");
			final String User = Username;
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT Password FROM users WHERE Username = '"+User+"'");  
			
			ResultSet Result = statement.executeQuery();
			
			String PasswordCheck = "";
			
			while (Result.next()) {

				PasswordCheck = Result.getString("Password");
			}
			return PasswordCheck;
		}catch(Exception e) {System.out.println(e);}
		
		
		return null;
		
	}
	
	
	public static int CountValues(String UserID)
	{	
		try {
			int UserIDint = Integer.parseInt(UserID);
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("select count(*) from classes where UserID = '"+UserIDint+"'");
			ResultSet rs = statement.executeQuery();
			rs.next();
		    int count = rs.getInt(1);
		    return count;
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return -1;
		
		
	}

	public static void CreateTable() throws Exception{
			try {
				Connection con = getConnection();
				PreparedStatement create = con.prepareStatement("CREATE TABLE IF NOT EXISTS usersss(id int NOT NULL AUTO_INCREMENT, first varchar(255), last varchar(255), PRIMARY KEY(id))");  
				create.executeUpdate(); 
				
			}catch(Exception e) {System.out.println(e);}
			
			finally {
				System.out.println("Function complete.");
				};
		}
	
		 public static Connection getConnection() throws Exception{
		  try{
		   String driver = "com.mysql.jdbc.Driver";
		   String url = "jdbc:mysql://localhost:3306/tommasodb";
		   String username = "root";
		   String password = "Tommaso123";
		   Class.forName(driver);
		   
		   Connection conn = DriverManager.getConnection(url,username,password);
		   System.out.println("Connected");
		   System.out.println(url + ", " + username + ", " +  password);
		   return conn;
		   
		  } catch(Exception e){System.out.println(e);}
		  
		  return null;
		

		}
		 
		 
		 public static void AddStudent(String StudentName, String ClassID) throws Exception
			{
				Connection con = getConnection();

				PreparedStatement statement = con.prepareStatement("INSERT INTO students (StudentsName, ClassID) VALUES ('"+StudentName+"', '"+ClassID+"')");  
				statement.executeUpdate(); 
			}
				 
		 
		 
	public static void AddElement(String User, String Password) throws Exception
	{
		Connection con = getConnection();
		PreparedStatement statement = con.prepareStatement("INSERT INTO users (Username, Password) VALUES ('"+User+"', '"+Password+"')");  
		statement.executeUpdate(); 
	}
		 
	public static boolean PassCheck(String Username, String Password)
	{
		try {	
			
			System.out.println("Reached");
			String PasswordCheck = getPass(Username);
			
			if (PasswordCheck.equals(Password) && Password != "")
			{
				System.out.println("Inputted password: " + Password + ", Password Check: " + PasswordCheck);
				
				
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
	}
		 	
	
	@Override
	public void actionPerformed(ActionEvent e) {}


}
