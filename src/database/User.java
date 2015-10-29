package database;

import java.sql.*;
import java.util.*;

public class User {	
	public static void addUser(String name, String email, String password, String phone, String address, int team_id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into users (full_name, email, password, phone, address, team_id) values (?,?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			pstmt.setString(4, phone);
			pstmt.setString(5, address);
			pstmt.setInt(6, team_id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when adding user");
		} finally{
			closeConnection(connection);
		}
	}

	public static void deleteUser(int id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("delete from users where user_id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when deleting user");
		} finally{
			closeConnection(connection);
		}
	}

	public static void assignTeam(int id, int teamID){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update users set team_id=? where user_id=?");
			pstmt.setInt(1, teamID);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when assigning team to a user");
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
			
			auth = rs.getInt("clearance");
			team_id = rs.getInt("team_id");
			return rs.getInt("user_id");
		} catch(SQLException sqle){
			System.out.println("SQL exception when trying to authenticate");
		} finally{
			closeConnection(connection);
		}
		return -1;
	}
	
	public static int getLeader(int id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select leader_id from users natural join teams where user_id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(!rs.next()) return -1;
			else return rs.getInt(1);
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting leader for the user");
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
