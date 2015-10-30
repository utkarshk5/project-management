package database;

import java.sql.*;
import java.util.*;

public class User {	
	public static void addUser(String name, String email, String password, String phone, String address, int team_id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into users (username, email, password, phone, address, clearance) values (?,?,?,?,?,1)");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			pstmt.setString(4, phone);
			pstmt.setString(5, address);
			pstmt.executeUpdate();System.out.println("adding user");
			PreparedStatement pstmt1= connection.prepareStatement("select max(user_id) from users");
			ResultSet rs = pstmt1.executeQuery();
			rs.next();
			int user_id = rs.getInt(1);
			PreparedStatement pstmt2= connection.prepareStatement("insert into teamAssign (user_id, team_id) values (?,?)");
			pstmt2.setInt(1, user_id);
			pstmt2.setInt(2, team_id);
			pstmt2.executeUpdate();
			
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
	
	public static int auth(String email, String pass, int auth){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select user_id, clearance from users where email=? and password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			ResultSet rs= pstmt.executeQuery();
			if(!rs.next())	return -1;
			auth = rs.getInt(2);
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
