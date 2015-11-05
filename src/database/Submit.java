package database;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Submit
 */
@WebServlet("/Submit")
@MultipartConfig
public class Submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int BUFFER_SIZE = 4096;    
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
				String[] temp4 = request.getParameterValues("assignedTo");
				ArrayList<Integer> userList4 = new ArrayList<Integer>();
				for(int i=0;i<temp4.length;++i)
				{
					userList4.add(Integer.parseInt(temp4[i]));
				}
				Task.createTask(userList4,
					request.getParameter("title"),
					Date.valueOf(request.getParameter("deadline")),
					Integer.parseInt(session.getAttribute("user").toString()),
					request.getParameter("description"),
					Integer.parseInt(request.getParameter("team_id")));
				request.getRequestDispatcher("Login").forward(request, response);
				return;
	
			case "deleteUser":
				String[] temp1 = request.getParameterValues("userID");
				for(int i=0;i<temp1.length;++i)
				{
					User.deleteUser(Integer.parseInt(temp1[i]));
				}
				request.getRequestDispatcher("Login").forward(request, response);
				return;
				
			case "makeTeam":
				Team.makeTeam(request.getParameter("team_name"), Integer.parseInt(request.getParameter("leader_id")));
				request.getRequestDispatcher("Login").forward(request, response);
				return;
			
			case "changeTeamLeader": 
				break;
			
			case "deleteTeam": 
				String[] temp2 = request.getParameterValues("team_id");
				for(int i=0;i<temp2.length;++i)
				{
					Team.deleteTeam(Integer.parseInt(temp2[i]));
				}
				request.getRequestDispatcher("Login").forward(request, response);
				return;
			
			case "addMemberToTeam": 
				String[] temp3 = request.getParameterValues("user_id");
				for(int i=0;i<temp3.length;++i)
				{
					Team.addMember(Integer.parseInt(temp3[i]), Integer.parseInt(request.getParameter("team_id")));
				}
				request.getRequestDispatcher("Login").forward(request, response);
				return;
				
			case "fileUpload":
				//System.out.println("file upload");
				//System.out.println(request.getParameter("file").toString());
				Part filePart = request.getPart("file");
				//System.out.println("got the part");
				String fileName = getSubmittedFileName(filePart);
				//System.out.println(fileName);
				InputStream fileContent = filePart.getInputStream();
				int resource_id = Resource.addResource(fileName, fileContent, Integer.parseInt(request.getParameter("task_id")));

//				String sRootPath = new File("").getAbsolutePath() + "/" + fileName;
//				FileOutputStream os = new FileOutputStream(System.getProperty("user.dir")+"/"+1);
//				System.out.println(sRootPath);
//				int b = 0;
//				while ((b = fileContent.read()) != -1)
//				{
//				    os.write(b); 
//				}
				fileContent.close();

				request.getRequestDispatcher("Login").forward(request, response);
				return;
				
			case "manageFiles":
				switch(request.getParameter("resourceSubmit")){
					case "download":
						if(request.getParameter("resource_id") == null){
							break;
						}
						InputStream is = Resource.getResource(Integer.parseInt(request.getParameter("resource_id") ) );
						String fileName1 = Resource.getResourceName(Integer.parseInt(request.getParameter("resource_id") ));
						System.out.println("filename1 "+fileName1);
						int fileLength = is.available();
						
			           // System.out.println(is.available());
			           // System.out.println(resource_id);

			            ServletContext context = getServletContext();

			            // sets MIME type for the file download
			            String mimeType = context.getMimeType(fileName1);
			            if (mimeType == null) {        
			                mimeType = "application/octet-stream";
			            }              
			             
			            // set content properties and header attributes for the response
			            response.setContentType(mimeType);
			            response.setContentLength(fileLength);
			            String headerKey = "Content-Disposition";
			            String headerValue = String.format("attachment; filename=\"%s\"", fileName1);
			            response.setHeader(headerKey, headerValue);

			            // writes the file to the client
			            OutputStream outStream = response.getOutputStream();
			             
			            byte[] buffer = new byte[BUFFER_SIZE];
			            int bytesRead = -1;
			             
			            while ((bytesRead = is.read(buffer)) != -1) {
			                outStream.write(buffer, 0, bytesRead);
			                //System.out.println(buffer+"buffer");
			            }
			             
			           // inputStream.close();
			            //is.close();
			            outStream.close(); 
						
						is.close();
						request.getRequestDispatcher("Login").forward(request, response);
						return;		
					
					case "share":
						if(request.getParameter("share_task_id") == null){
							break;
						}
					return;		
					
				};
			
					
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
	
    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

}
