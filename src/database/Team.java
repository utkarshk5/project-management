package database;

import java.sql.*;
import java.util.*;

public class Team {
	public static ResultSet getTeams(int id){
		Connection connection=null;
		ResultSet rs = null;
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from teams natural join teamAssign where user_id=?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting teams of the user");
		} finally{
			closeConnection(connection);
		}
		return rs;
	}
	
	public static void makeTeam(String name, int leader_id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into teams (team_name, leader_id) values (?, ?)");
			pstmt.setString(1, name);
			pstmt.setInt(2, leader_id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception creating team");
		} finally{
			closeConnection(connection);
		}
	}

	public static ResultSet getallTeams(){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select team_id, team_name from teams");
			return  pstmt.executeQuery();
		} catch(SQLException sqle){
			System.out.println("SQL exception getting all teams");
		} finally{
			closeConnection(connection);
		}
		return null;
	}

	public static void ChangeLeader(int teamID, int leader){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update teams set leader_id=? where team_id=?");
			pstmt.setInt(1, leader);
			pstmt.setInt(2, teamID);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception changing team leader");
		} finally{
			closeConnection(connection);
		}
	}

	public static void deleteTeam(int teamID){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("delete from teams where team_id=?");
			pstmt.setInt(1, teamID);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception deleting team");
		} finally{
			closeConnection(connection);
		}
	}

	public static ResultSet getMembers(int teamID){
		Connection connection=null;
		ResultSet rs = null;
		try{
			connection=getConnection();
			if(teamID == -1)
			{
				rs = User.getallUsers();
				return rs;
			}
			PreparedStatement pstmt= connection.prepareStatement("select * from users natural join teamAssign where team_id=?");
			pstmt.setInt(1, teamID);
			rs= pstmt.executeQuery();
			return rs;
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting team members");
		} finally{
			closeConnection(connection);
		}
		return rs;
	}
	
	public static void addMember(int id, int teamID){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into teamAssign (team_id, user_id) values (?,?)");
			pstmt.setInt(1, teamID);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when adding user to the team");
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
