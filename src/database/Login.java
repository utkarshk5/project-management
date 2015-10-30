package database;

import java.io.IOException;
import java.sql.Date;

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
		String formType = null;
		if(request.getParameterMap().containsKey("formType")){
			formType=request.getParameter("formType");
		}
		else {
			request.setAttribute("error", "Welcome!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		System.out.println(formType);
		switch(formType){
		case "login":
				String email = request.getParameter("email"); 
				String password = request.getParameter("password");
				int auth=0; int id = User.auth(email, password, auth); 
				if(id==-1) {
					request.setAttribute("error", "*Incorrect Username or Password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else {
					request.setAttribute("id", id);
					request.setAttribute("auth", auth);
					request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				}
			break;
		
		case "addUser":
				User.addUser(
						request.getParameter("name"), request.getParameter("email"),
						request.getParameter("password"), request.getParameter("phone"),
						request.getParameter("address"), Integer.parseInt(request.getParameter("team_id")));
						request.setAttribute("error", "Registered successfully! Please login");
						request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		
		
		case "createSubtask":
//			Task.createSubTask(request.getParameter("assignedTo"),
//				request.getParameter("title"),
//				request.getParameter("deadline"),
//				Integer.parseInt(request.getParameter("supertask")),
//				Integer.parseInt(request.getParameter("assigner_id")));
			System.out.println(request.getParameter("assignedTo"));
			break;
		
		
		case "extendDeadline":
			Task.extendDeadline(
					Integer.parseInt(request.getParameter("id")),
					Date.valueOf(request.getParameter("date")) );
			break;
		
		case "createTask":
			
			break;

		case "deleteUser":
			break;
			
		case "makeTeam": 
			break;
		
		case "changeTeamLeader": 
			break;
		
		case "deleteTeam": 
			User.deleteUser(Integer.parseInt(request.getParameter("id")));
			break;
		
		case "addMemberToTeam": 
			break;	
			
		default:

			String email1 = request.getParameter("email"); 
			String password1 = request.getParameter("password");
			int auth1=0; int id1 = User.auth(email1, password1, auth1); 
			if(id1==-1) {
				request.setAttribute("error", "*Incorrect Username or Password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else {
				request.setAttribute("id", id1);
				request.setAttribute("auth", auth1);
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
			}
		break;
		
		
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
