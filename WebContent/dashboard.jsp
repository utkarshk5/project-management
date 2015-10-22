<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.Task" %>
<%@ page import="database.User" %>
<%@ page import="database.Team" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>
</head>
<body>

<%

// 	String id = request.getParameter("id");
	String id = "1";
	
	ResultSet taskRS = Task.getTasks(id);
	
	while(taskRS.next()){
		out.print(taskRS.getString("title") + "\t" + taskRS.getString("deadline") + "\t" + taskRS.getString("task_id"));
	}
	
	
// 	String option = request.getParameter("option");
	
// 	if(id==null || id.equalsIgnoreCase("") ||
// 			option==null || option.equalsIgnoreCase("") ){
// 		out.print("Invalid input");
// 	} else if(option.equalsIgnoreCase("getCourses")){
// 		List<String> courseList=StudentInfo.getCourseList(id);
// 		for(String course:courseList) {
// 			out.print(course+"<br/>");
// 		}
%>
</body>
</html>