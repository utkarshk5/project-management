package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email"); 
		String password = request.getParameter("password");
		int auth=0; int id = User.auth(email, password, auth); 
		if(id==-1) {
			out.println("Username or Password incorrect");
			request.setAttribute("error", "*Incorrect Username or Password");
			RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
	        rs.forward(request, response);
		}
		else {
			request.setAttribute("id", id);
			request.setAttribute("auth", auth);
			RequestDispatcher rs = request.getRequestDispatcher("dashboard.jsp");
			rs.forward(request, response);
		}
	}

}
