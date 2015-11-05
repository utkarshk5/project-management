package database;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println("entered login servlet");
		request.setAttribute("error", "");
		String formType = null;
		if(request.getParameterMap().containsKey("formType") && (request.getParameter("formType").equals("login") || request.getParameter("formType").equals("logout"))){
			formType=request.getParameter("formType");
			System.out.println(formType);
			switch(formType){
				case "login":
					String email = request.getParameter("email"); 
					String password = request.getParameter("password");
					int auth=0; int id = User.auth(email, password, auth); 
					if(id==-1) {
						request.setAttribute("error", "*Incorrect Username or Password");
						request.getRequestDispatcher("login.jsp").forward(request, response);
						return;
					}
					else {
						HttpSession session = request.getSession();
						session.setAttribute("user", id);
						request.getRequestDispatcher("dashboard.jsp").forward(request, response);
						return;
					}
				
				case "logout":
					request.getSession().invalidate();
					request.getRequestDispatcher("login.jsp").forward(request,  response);
					return;
			}
		} else {
			HttpSession session=request.getSession(false);
			if(session!=null && session.getAttribute("user")!=null){
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				return;
			}
			else{
				request.setAttribute("error", "Please login to continue");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
