package database;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Submit
 */
@WebServlet("/Submit")
public class Submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Submit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("entered submit servlet");
		HttpSession session = request.getSession(false);
		if(session==null){
			request.setAttribute("error", "Please login to continue");
			request.getRequestDispatcher("Login").forward(request, response);
			return;
		}
		String formType = null;
		if(request.getParameterMap().containsKey("formType")){
			System.out.println("formtype was set");
			formType=request.getParameter("formType");
		}
		else {
			request.getRequestDispatcher("Login").forward(request, response);
			return;
		}

		System.out.println(formType);
		switch(formType){
			case "addUser":
				User.addUser(
					request.getParameter("name"), request.getParameter("email"),
					request.getParameter("password"), request.getParameter("phone"),
					request.getParameter("address"), Integer.parseInt(request.getParameter("team_id")));
				request.setAttribute("error", "Registered successfully! Please login");
				request.getRequestDispatcher("Login").forward(request, response);
				return;

			case "createSubtask":
				String[] temp = request.getParameterValues("assignedTo");
				ArrayList<Integer> userList = new ArrayList<Integer>();
				for(int i=0;i<temp.length;++i)
				{
					userList.add(Integer.parseInt(temp[i]));
				}
				Task.createSubTask(userList,
					request.getParameter("title"),
					Date.valueOf(request.getParameter("deadline")),
					Integer.parseInt(request.getParameter("task_id")),
					Integer.parseInt(session.getAttribute("user").toString()),
					request.getParameter("description"));
				request.getRequestDispatcher("Login").forward(request, response);
			return;
			
			
			case "extendDeadline":
				Task.extendDeadline(
						Integer.parseInt(request.getParameter("task_id")),
						Date.valueOf(request.getParameter("deadline")) );
				request.getRequestDispatcher("Login").forward(request, response);
				return;
			
			case "markAsDone":
				Task.markAsDone(Integer.parseInt(request.getParameter("task_id")),
						request.getParameter("remarks"));
				request.getRequestDispatcher("Login").forward(request, response);
				return;
			
			case "createTask":
				
				break;
	
			case "deleteUser":
				break;
				
			case "makeTeam":
				Team.makeTeam(request.getParameter("team_name"), Integer.parseInt(request.getParameter("leader_id")));
				break;
			
			case "changeTeamLeader": 
				break;
			
			case "deleteTeam": 
				User.deleteUser(Integer.parseInt(request.getParameter("id")));
				break;
			
			case "addMemberToTeam": 
				break;
					
		}
		System.out.println("reached the end, to be forwarded to login servlet!");
		request.getRequestDispatcher("Login").forward(request, response);
		return;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
