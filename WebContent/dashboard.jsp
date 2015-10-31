<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.Task" %>
<%@ page import="database.User" %>
<%@ page import="database.Team" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="../../favicon.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Dashboard</title>

		<!-- Bootstrap core CSS -->
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
		<script src="bootstrap/js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>

	</head>
	<body>

<%
	int id = Integer.parseInt(request.getSession().getAttribute("user").toString());
	int auth = User.getClearance(id);
	ResultSet taskRS = Task.getTasks(id,false),
		subtaskRS = Task.getSubtasks(id,false);
	int j;
%>

		<div class="container">
			<div class="row">
				<div id="legend">
					<legend class="">Dashboard</legend>
					<form role="form" action="Login" method="POST">
						<button type="submit" class="btn btn-primary" style="float:right">Logout</button>
						<input type="hidden" name="formType" value="logout">
					</form>
				</div>

<% if(auth==0){ %>
				<div class="col-xs-12">
 					<ul class="list-inline">
 						<li>
 							<div class="dropdown">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Create Task
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
									<input name="title" type="text" class="form-control" placeholder="Title"><br/>
									<input name="description" type="text" class="form-control" placeholder="Description"><br/>
										Select person
										<select multiple name="assignedTo" class="form-control">
										<%
										ResultSet memberRS = Team.getMembers(0);
										for(j=1; memberRS.next(); j++){
											%>
											<option value="<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input name="deadline" type="date" class="form-control"><br/>
										<input type="hidden" name="formType" value="createTask">
										<button type="submit" class="btn btn-default"> Create </button>
									</form>
								</li>
								</ul>
							</div>
						</li>

						<li>
							<div class="dropdown">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Delete User
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
										Select person
										<select multiple name="assignedTo" class="form-control">
										<%
										memberRS = User.getallUsers();
										for(j=1; memberRS.next(); j++){
											%>
											<option value="<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input type="hidden" name="formType" value="deleteUser">
										<button type="submit" class="btn btn-default"> Delete </button>
									</form>
								</li>
								</ul>
							</div>
						</li>

						<li>
							<div class="dropdown">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Make Team
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
										<input type="text" name="team_name" class="form-control" placeholder="Team name">
										Select person
										<select name="leader_id" class="form-control">
										<%
										memberRS = User.getallUsers();
										for(j=1; memberRS.next(); j++){
											%>
											<option value="<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input type="hidden" name="formType" value="makeTeam">
										<button type="submit" class="btn btn-default"> Make </button>
									</form>
								</li>
								</ul>
							</div>
						</li>

						<li>
							<div class="dropdown">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Delete Team
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
										Select team
										<select multiple name="team_id" class="form-control">
										<%
										ResultSet teamRS = Team.getallTeams();
										for(j=1; teamRS.next(); j++){
											%>
											<option value="<% out.print(teamRS.getInt("team_id")); %>"><%out.print(teamRS.getString("team_name")); %></option>
										<% } %>
										</select><br/>
										<input type="hidden" name="formType" value="deleteTeam">
										<button type="submit" class="btn btn-default"> Delete </button>
									</form>
								</li>
								</ul>
							</div>
						</li>

						<li>
							<div class="dropdown">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Change Team Leader
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
										Select team
										<select name="team_id" class="form-control">
										<%
										teamRS = Team.getallTeams();
										for(j=1; teamRS.next(); j++){
											%>
											<option value="<% out.print(teamRS.getInt("team_id")); %>"><%out.print(teamRS.getString("team_name"));%></option>
										<% } %>
										</select><br/>

										Select leader
										<select multiple name="leader_id" class="form-control">
										<%
										memberRS = User.getallUsers();
										for(j=1; memberRS.next(); j++){
											%>
											<option value="user<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input type="hidden" name="formType" value="changeTeamLeader">
										<button type="submit" class="btn btn-default"> Delete </button>
									</form>
								</li>
								</ul>
							</div>
						</li>

						<li>
							<div class="dropdown">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Add to Team
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
										Select team
										<select name="team_id" class="form-control">
										<%
										teamRS = Team.getallTeams();
										for(j=1; teamRS.next(); j++){
											%>
											<option value="<% out.print(teamRS.getInt("team_id")); %>"><%out.print(teamRS.getString("team_name"));%></option>
										<% } %>
										</select><br/>

										Select user
										<select multiple name="user_id" class="form-control">
										<%
										memberRS = User.getallUsers();
										for(j=1; memberRS.next(); j++){
											%>
											<option value="user<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input type="hidden" name="formType" value="changeTeamLeader">
										<button type="submit" class="btn btn-default"> Delete </button>
									</form>
								</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
<br/><br/>
<% } %>
				<div class="col-xs-6">
					<h2> Tasks pending for you! </h2>

					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">


<%	for(int i=1; taskRS.next(); i++){
	%>
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading<%out.print(i);%>">
						  <h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(i);%>" aria-expanded="true" aria-controls="collapse<%out.print(i);%>">
						<%
							// TODO jfuzzydate
							out.print(i + "&emsp;" + taskRS.getString("title") + "&emsp;" + taskRS.getString("deadline") + "&emsp;" + taskRS.getString("task_id"));
						%>
							</a>
						  </h4>
						</div>
						<div id="collapse<%out.print(i);%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<%out.print(i);%>">
						  <div class="panel-body">
							<form action="Submit" method="POST">
								<label for="this">File upload</label>
								<input type="file" onchange="this.form.submit()">
								<input type="hidden" name="formType" value="fileUpload">
								<input type="hidden" name="task_id" value="<%out.print(taskRS.getInt("task_id"));%>">
							</form> <br/>
							<form action="Submit" method="POST">
								<label for="this">Remarks</label>
								<input name="remarks" type="text"> <button type="submit" class="btn btn-default">Mark as done</button>
								<input type="hidden" name="formType" value="markAsDone">
								<input type="hidden" name="task_id" value="<%out.print(taskRS.getInt("task_id"));%>">
							</form> <br/>
							<div class="dropdown">
							  <button class="dropdown-toggle" type="button" data-toggle="dropdown">Add a subtask
							  <span class="caret"></span></button>
							  <ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form action="Submit" method="POST">
										Select person
										<select multiple name="assignedTo" class="form-control">
										<%
										ResultSet memberRS = Team.getMembers(taskRS.getInt("team_id"));
										for(j=1; memberRS.next(); j++){
											%>
											<option value="<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input name="title" type="text" class="form-control" placeholder="Title"><br/>
										<input name="description" type="text" class="form-control" placeholder="Description"><br/>
										Set Deadline
										<input name="deadline" type="date" class="form-control"><br/>
										<input type="hidden" name="formType" value="createSubtask">
										<input type="hidden" name="task_id" value="<% out.print(taskRS.getInt("task_id")); %>">
										<button type="submit" class="btn btn-default"> Create sub-task</button>
									</form>
								</li>
							  </ul>
							</div>
						  </div>
						</div>
					  </div>
<%} %>
					</div>
				</div>
<br/><br/>

				<div class="col-xs-6">
					<h2> Tasks pending assigned by you! </h2>

					<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
	<% for(int i=1; subtaskRS.next(); i++){ %>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="heading<%out.print(i);%>_">
								<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapse<%out.print(i);%>_" aria-expanded="false" aria-controls="collapse<%out.print(i);%>_">
						<%
							out.print(i + "&emsp;" + subtaskRS.getString("title") + "&emsp;" + subtaskRS.getString("deadline") + "&emsp;" + subtaskRS.getString("task_id"));
						%>
								</a>
							  </h4>
							</div>
							<div id="collapse<%out.print(i);%>_" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<%out.print(i);%>_">
								<div class="panel-body">
									<form action="Submit" method="POST">
										<label for="this">File upload</label>
										<input type="file" class="btn" onchange="this.form.submit()"> </form>
										<input type="hidden" name="formType" value="fileUpload">
										<input type="hidden" name="task_id" value="<% out.print(subtaskRS.getInt("task_id")); %>">
									<form action="Submit" method="POST"> 
										<label for="this">Extend Deadline</label> 
										<input name="deadline" type="date" class="btn"> 
										<input type="hidden" name="formType" value="extendDeadline"> 
										<input type="hidden" name="task_id" value="<% out.print(subtaskRS.getInt("task_id")); %>"> 
										<button type="submit" class="btn btn-default"> Extend</button>
									</form>
								</div>
							</div>
						</div>
	<% } %>
					</div>
				</div>
				
			</div>
		</div>

	</body>
</html>