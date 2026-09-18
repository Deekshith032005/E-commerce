package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import database.UserDAO;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		//read
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//user object of model class
		User user = new User();
		//set the properties of object
		user.setName(name);
		user.setMail(email);
		user.setMobile(mobile);
		user.setUsername(username);
		user.setPassword(password);
		
		UserDAO dao = new UserDAO();
		int rowsAffected = dao.registerUser(user);
		
		if(rowsAffected > 0) {
			response.sendRedirect("login.html");
			
		
		
			System.out.println("Registration is successsfull");
		}
		else
		{
			System.out.println("Registration failed");
		}
		
		
		
	}

}
