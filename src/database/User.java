package database;

import java.sql.*;
import java.util.*;

public class User {	
	public static void addUser(String name){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into user (<attributes>) values (<values>)");
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course list");
		} finally{
			closeConnection(connection);
		}
	}

	public static void deleteUser(int id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("delete from user where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course list");
		} finally{
			closeConnection(connection);
		}
	}

	public static void assignTeam(int id, int teamID){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update user set team_id=? where id=?");
			pstmt.setInt(1, teamID);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course list");
		} finally{
			closeConnection(connection);
		}

	}
	
	public static int auth(String email, String pass, int auth, int team_id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select user_id, clearance, team_id from users where email=? and password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			ResultSet rs= pstmt.executeQuery();
			if(!rs.next())	return -1;
			
			auth = rs.getInt(2);
			team_id = rs.getInt(3);
			System.out.println(auth);
			System.out.println(rs.getInt(1));
			return rs.getInt(1);
		} catch(SQLException sqle){
			System.out.println("SQL exception when trying to authenticate");
		} finally{
			closeConnection(connection);
		}
		return -1;
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
