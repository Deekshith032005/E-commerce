package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import database.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//
		//admin login check
		//
		if (username.equals("admin") && password.equals("admin"))
		{
			System.out.println("Admin login is Succesfull");
			RequestDispatcher rd = request.getRequestDispatcher("admin_home.jsp");
			rd.forward(request,response);
			//response.sendRedirect("admin_home.jsp");
			return;
		}
		else
		{
			//
			// user login
			//
			UserDAO dao = new UserDAO();
			User user = dao.verifyUser(username,password);
			if (user !=null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				System.out.println("user login is successfull");
				RequestDispatcher rd = request.getRequestDispatcher("user_home.jsp");
				rd.forward(request, response);
				
				
				//redirect buyer to home page
			//	response.sendRedirect("user_home.jsp");
			}
			else {
				request.setAttribute("error","invalid username or password.");
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				rd.forward(request, response);
				System.out.println("user login failed");
			}
		}
	}

}
