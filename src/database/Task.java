package database;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class Task {
	public static ResultSet getTasks(int id){
		Connection connection=null;
		ResultSet rs = null;
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from tasks where assigned_to=?");
			pstmt.setInt(1, id);
			rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting all tasks for a user");
		} finally{
			closeConnection(connection);
		}
		return rs;
	}
	
	public static void createTask(int id, String title, Date deadline){
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into tasks (assigned_to, title, deadline) values (?,?,?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, title);
			pstmt.setDate(3, deadline);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when creating a new task");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static void createSubTask(int id, String title, Date deadline, int supertask, int assigner_id){
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into tasks (assigned_to, title, deadline, supertask, assigned_by) values (?,?,?,?,?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, title);
			pstmt.setDate(3, deadline);
			pstmt.setInt(4, supertask);
			pstmt.setInt(5, assigner_id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when creating a new task");
		} finally{
			closeConnection(connection);
		}
	}

	public static void markAsDone(int id, String comment){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update tasks set completed=1, remarks=? where task_id=?");
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
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update tasks set deadline=? where id=?");
			pstmt.setDate(1, date);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when extending the deadline");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static ResultSet getSubtasks(int id){
		Connection connection=null;
		ResultSet rs = null;
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from tasks where assigned_by=?");
			pstmt.setInt(1, id);
			rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting all the subtasks assigned by the user");
		} finally{
			closeConnection(connection);
		}
		return rs;
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
