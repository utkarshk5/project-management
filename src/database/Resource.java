package database;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Resource {
	
	public static Integer addResource(String fileName, InputStream is, Integer task_id) throws IOException{
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into resources (filename, file) values (?,?)");
			pstmt.setString(1, fileName);
			pstmt.setBinaryStream(2, is, is.available() );
			pstmt.executeUpdate();
			PreparedStatement pstmt1= connection.prepareStatement("select max(resource_id) from resources");
			ResultSet rs = pstmt1.executeQuery();
			rs.next();
			int resource_id = rs.getInt(1);
			PreparedStatement pstmt2= connection.prepareStatement("insert into resourceAssign (task_id, resource_id) values (?,?)");
			pstmt2.setInt(1, task_id);
			pstmt2.setInt(2, resource_id);
			pstmt2.executeUpdate();
			
			return resource_id;
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when adding resource");
		} finally{
			closeConnection(connection);
		}		

		return null;
	}

	
	public static InputStream  getResource(Integer resource_id) throws IOException{
		Connection connection=null;
		
		try{byte[] fileData;
			connection=getConnection();//System.out.println(resource_id);
			PreparedStatement pstmt= connection.prepareStatement("select file from resources where resource_id=?");
			pstmt.setInt(1, resource_id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			fileData = rs.getBytes(1);
			InputStream is = new ByteArrayInputStream(fileData);
			return is;
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when fetching resource from db");
		} finally{
			closeConnection(connection);
		}		
	return null;	
	}

public static ResultSet getResoursesForTask(int task_id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from resourceassign natural join resources where task_id=?");
			pstmt.setInt(1, task_id);
			return pstmt.executeQuery();
		} catch(SQLException sqle){
			System.out.println("SQL exception when fetching resources for tasks");
		} finally{
			closeConnection(connection);
		}
		return null;
	}


public static String getResourceName(int resource_id){
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select filename from resources where resource_id=?");
			pstmt.setInt(1, resource_id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when fetching filename");
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
