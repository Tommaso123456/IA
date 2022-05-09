package Serverlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Login;


@WebServlet("/loginAction")
public class Serverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Serverlet() {
        super();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("Username");
		String pass = request.getParameter("Password");
		try {
			System.out.println("Lib");
			Login.Check();
			
			if (Login.PassCheck(user, pass))
			{
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

}
