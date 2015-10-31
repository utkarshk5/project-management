package database;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class Task {
	public static ResultSet getTasks(int id, boolean comp){
		Connection connection=null;
		ResultSet rs = null;
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from tasks natural join taskAssign where user_id=? and completed=?");
			pstmt.setInt(1, id);
			pstmt.setBoolean(2, comp);
			rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting all tasks for a user");
		} finally{
			closeConnection(connection);
		}
		return rs;
	}
	
	public static ResultSet getSubtasks(int id, boolean comp){
		Connection connection=null;
		ResultSet rs = null;
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from tasks where assigned_by=? and completed=?");
			pstmt.setInt(1, id);
			pstmt.setBoolean(2, comp);
			rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting all the subtasks assigned by the user");
		} finally{
			closeConnection(connection);
		}
		return rs;
	}
			
	public static int getTeamIDforTask(int id){
		Connection connection=null;
		int teamID = -1;
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select team_id from tasks where task_id=?");
			pstmt.setInt(1, id);
			ResultSet rs= pstmt.executeQuery();
			if(!rs.next()) return teamID;
			teamID = rs.getInt(1);
			return teamID;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting teamID for a task");
		} finally{
			closeConnection(connection);
		}
		return teamID;
	}
	
	public static void createTask(ArrayList<Integer> id, String title, Date date, int assigner_id, String description, int team_id){
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into tasks (title, deadline, assigned_by, team_id, detailed_desc, completed) values (?,?,?,?,?,false)");
			pstmt.setString(1, title);
			pstmt.setDate(2, date);
			pstmt.setInt(3, assigner_id);
			pstmt.setInt(4, team_id);
			pstmt.setString(5, description);
			pstmt.executeUpdate();
			PreparedStatement pstmt1= connection.prepareStatement("select max(task_id) from tasks");
			ResultSet rs1 = pstmt1.executeQuery();
			rs1.next();
			int task_id = rs1.getInt(1);
			for(int i=0;i<id.size();++i)
			{
				PreparedStatement pstmt2= connection.prepareStatement("insert into taskAssign (task_id, user_id) values (?,?)");
				pstmt2.setInt(1, task_id);
				pstmt2.setInt(2, id.get(i));
				pstmt2.executeUpdate();
			}
		} catch(SQLException sqle){
			System.out.println("SQL exception when creating a new task");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static void createSubTask(ArrayList<Integer> id, String title, Date date, int supertask, int assigner_id, String description){
		Connection connection=null;

		try{
			//Integrity check for supertask
			connection=getConnection();
			int team_id = getTeamIDforTask(supertask);
			PreparedStatement pstmt= connection.prepareStatement("insert into tasks (title, deadline, supertask, assigned_by, team_id, detailed_desc, completed) values (?,?,?,?,?,?,false)");
			pstmt.setString(1, title);
			pstmt.setDate(2, date);
			pstmt.setInt(3, supertask);
			pstmt.setInt(4, assigner_id);
			pstmt.setInt(5, team_id);
			pstmt.setString(6, description);
			pstmt.executeUpdate();
			PreparedStatement pstmt1= connection.prepareStatement("select max(task_id) from tasks");
			ResultSet rs1 = pstmt1.executeQuery();
			rs1.next();
			int task_id = rs1.getInt(1);
			for(int i=0;i<id.size();++i)
			{
				PreparedStatement pstmt2= connection.prepareStatement("insert into taskAssign (task_id, user_id) values (?,?)");
				pstmt2.setInt(1, task_id);
				pstmt2.setInt(2, id.get(i));
				pstmt2.executeUpdate();
			}
		} catch(SQLException sqle){
			System.out.println("SQL exception when creating a new subtask");
		} finally{
			closeConnection(connection);
		}
	}

	public static void markAsDone(int id, String comment){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update tasks set completed=true, remarks=? where task_id=?");
			pstmt.setString(1, comment);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when marking task as done");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static void extendDeadline(int id, Date date){
		Connection connection=null;
		
		try{
			// Integrity check for deadline
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update tasks set deadline=? where task_id=?");
			pstmt.setDate(1, date);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when extending the deadline");
		} finally{
			closeConnection(connection);
		}
	}
	
	static Connection getConnection() {
		String dbURL = "jdbc:postgresql://10.105.1.12/cs387";
        String dbUser = "db130050022";
        String dbPass = "root";
        Connection connection=null;
        try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
        } catch(ClassNotFoundException cnfe){
        	System.out.println("JDBC Driver not found");
        } catch(SQLException sqle){
        	System.out.println("Error in getting connetcion from the database");
        }
        return connection;
	}
	
	static void closeConnection(Connection connection) {
		try{
			connection.close();
		} catch(SQLException sqle) {
			System.out.println("Error in close database connetcion");
		}
	}
}
