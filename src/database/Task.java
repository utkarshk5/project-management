package database;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class Task {
	public static ResultSet getTasks(int id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from tasks where id=?");
			pstmt.setInt(1, id);
			ResultSet rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting all tasks for a user");
		} finally{
			closeConnection(connection);
		}
		return null;
	}
	
	public static void createTask(int id, String title, Date deadline){
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into tasks (team_id, title, deadline) values (?,?,?)");
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

	public static void markAsDone(int id, String comment){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update task set done=1, comment=? where task_id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course list");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static void extendDeadline(int id, Date date){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update task set deadline=? where id=?");
			pstmt.setDate(1, date);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course list");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static ResultSet getSubtasks(int id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from user where id=?");
			pstmt.setInt(1, id);
			ResultSet rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course list");
		} finally{
			closeConnection(connection);
		}
		return null;
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
