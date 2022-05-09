package Serverlet;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Login;

@WebServlet("/loginAction")
public class Servlet extends HttpServlet {
	
	Login login = new Login();
	
	
	
	
	private static final long serialVersionUID = 1L;

    public Servlet() {
    	
        super();
    }

    
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("Username");
		String pass = request.getParameter("Password");
		String passCheck = request.getParameter("ConfirmPassword");
		String jspname = request.getParameter("jspname");
		
		if (jspname.equals("ShowStudentGraph"))
		{
			String StudentName = request.getParameter("StudentName");
			System.out.println("Student name: " + StudentName);
			response.sendRedirect("ShowStudent.jsp");
		}
		
		
		
		
		
		if (jspname.equals("Back"))
		{
			String UserID = request.getParameter("UserID");
			request.setAttribute("UserID", UserID);
			request.getRequestDispatcher("ClassPicker.jsp").forward(request, response);
			response.sendRedirect("ClassPicker.jsp");
			
		}
		
		
		
		if (jspname.equals("OpenClass"))
		{
			
			
			System.out.println("Reached");
			String ButtonVal = request.getParameter("ClassButton");
			String UserID = request.getParameter("userID");
			String ClassID = null;
			try {
				ClassID = Login.getClassID(ButtonVal);
				int[] StudentIDs = Login.getStudentIDWithClass(ClassID , Login.GetStudentNum(ButtonVal));
				String[] StudentNames = new String[StudentIDs.length];
				for (int i = 0; i < StudentIDs.length; i++)
				{
					StudentNames[i] = Login.getStudentName(StudentIDs[i]);
				}
				
				int[] TestIDs = Login.GetTestIDs(Integer.parseInt(ClassID));
				String[] TestNames = new String[TestIDs.length];
				for (int i = 0; i < TestIDs.length; i++)
				{
					TestNames[i] = Login.GetTestName(TestIDs[i]);
				}
				request.setAttribute("UserID", UserID);
				request.setAttribute("ClassName", ButtonVal);
				request.setAttribute("TestIDs", TestIDs);
				request.setAttribute("StudentIDs", StudentIDs);
				request.setAttribute("TestNames", TestNames);
				request.setAttribute("StudentNames", StudentNames);
				request.getRequestDispatcher("ShowClass.jsp").forward(request, response);
			} catch (Exception e) {e.printStackTrace();}			
			
			
		}
		
		
		if (jspname.equals("NewClass"))
		{
			String ClassName = request.getParameter("ClassName");
			String UserID = request.getParameter("CurrentUser");
			String[] Table = request.getParameterValues("StudentName");
			try {
				Login.InsertNewClass(ClassName, Table.length, UserID);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				String ClassID = Login.getClassID(ClassName);
				for (int i = 0; i < Table.length; i++)
				{
					String StudentID = Login.getStudentID(Table[i]);
					Login.InsertStudentClass(StudentID, ClassID);
				}
				
				request.setAttribute("UserID", UserID);
				request.getRequestDispatcher("ClassPicker.jsp").forward(request, response);
				response.sendRedirect("ClassPicker.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}

		
		if (jspname.equals("AddClass"))
		{
			String ClassName = request.getParameter("ClassName");
			String userID = request.getParameter("CurrentUser");
			request.setAttribute("ClassName", ClassName);
			request.setAttribute("UserID", userID);
			request.getRequestDispatcher("AddClass.jsp").forward(request, response);
			response.sendRedirect("AddClass.jsp");
		}	
		
		if (jspname.equals("logOut"))
		{	
			response.sendRedirect("LoginPage.jsp");
		}
		
		
		if (jspname.equals("Login"))
		{
			try {
				
				if (Login.PassCheck(user, pass))
				{
					request.setAttribute("UserID", Login.getUserID(user));
					request.getRequestDispatcher("ClassPicker.jsp").forward(request, response);
					response.sendRedirect("ClassPicker.jsp");
				}
				else {
					response.sendRedirect("error.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (jspname.equals("SignUp")) {
			if (pass.equals(passCheck)) {
				
				try {
					response.sendRedirect("LoginPage.jsp");
					Login.AddElement(user, pass);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
	
	}

}
