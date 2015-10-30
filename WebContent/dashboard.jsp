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
	int id = Integer.parseInt(request.getAttribute("id").toString()),
		auth = Integer.parseInt(request.getAttribute("auth").toString());
	ResultSet taskRS = Task.getTasks(id,false),
		subtaskRS = Task.getSubtasks(id);
	int j;
%>

		<div class="container">
			<div class="row">
				<div id="legend">
					<legend class="">Dashboard</legend>
				</div>
				<div class="col-xs-6">
					<h2> Tasks pending for you! </h2>

					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">


<%	for(int i=1; taskRS.next(); i++){
	%>
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading<%out.print(i);%>">
						  <h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(i);%>" aria-expanded="true" aria-controls="collapse<%out.print(i);%>">
						<%
							// TODO jfuzzydate
							out.print(i + "&emsp;" + taskRS.getString("title") + "&emsp;" + taskRS.getString("deadline") + "&emsp;" + taskRS.getString("task_id"));
						%>
							</a>
						  </h4>
						</div>
						<div id="collapse<%out.print(i);%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<%out.print(i);%>">
						  <div class="panel-body">
							<form> <label for="this">File upload</label>
								<input type="file" onchange="this.form.submit()">
								<input type="hidden" name="formType" value="fileUpload">
								<input type="hidden" name="task_id" value="<%out.print(taskRS.getInt("task_id"));%>">
							</form> <br/>
							<form> <label for="this">Remarks</label>
								<input type="text"> <button type="submit" class="btn btn-default">Mark as done</button>
								<input type="hidden" name="formType" value="markAsDone">
								<input type="hidden" name="task_id" value="<%out.print(taskRS.getInt("task_id"));%>">
							</form> <br/>
							<div class="dropdown">
							  <button class="dropdown-toggle" type="button" data-toggle="dropdown">Add a sub-task
							  <span class="caret"></span></button>
							  <ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form id="createSubTask">
										Select person
										<select multiple name="assignedTo" class="form-control" placeholder="Person">
										<%
										ResultSet memberRS = Team.getMembers(taskRS.getInt("team_id"));
										for(j=1; memberRS.next(); j++){
											%>
											<option value="user<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input name="title" type="text" class="form-control" placeholder="Title"><br/>
										<input name="description" type="text" class="form-control" placeholder="Description"><br/>
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
								<a role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapse<%out.print(i);%>_" aria-expanded="true" aria-controls="collapse<%out.print(i);%>_">
						<%
							out.print(i + "&emsp;" + subtaskRS.getString("title") + "&emsp;" + subtaskRS.getString("deadline") + "&emsp;" + subtaskRS.getString("task_id"));
						%>
								</a>
							  </h4>
							</div>
							<div id="collapse<%out.print(i);%>_" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<%out.print(i);%>_">
								<div class="panel-body">
									<form> <label for="this">File upload</label>
										<input type="file" class="btn" onchange="this.form.submit()"> </form>
										<input type="hidden" name="formType" value="fileUpload">
										<input type="hidden" name="task_id" value="<% out.print(subtaskRS.getInt("task_id")); %>">
									<form> <label for="this">Extend Deadine</label> <input type="date" value="10-19-2015" class="btn" onchange="this.form.submit()"> </form>
								</div>
							</div>
						</div>
	<% } %>
					</div>
				</div>

				<div class="col-xs-12">
							<div class="dropup">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Create Task
								<span class="caret"></span></button>
								<input name="title" type="text" class="form-control" placeholder="Title"><br/>
								<input name="description" type="text" class="form-control" placeholder="Description"><br/>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form id="createTask">
										Select person
										<select multiple name="assignedTo" class="form-control" placeholder="Assign To">
										<%
										ResultSet memberRS = Team.getMembers(0);
										for(j=1; memberRS.next(); j++){
											%>
											<option value="user<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input name="deadline" type="date" class="form-control"><br/>
										<button type="submit" class="btn btn-default"> Create </button>
									</form>
								</li>
								</ul>
							</div>

							<div class="dropup">
								<button class="dropdown-toggle btn btn-default" type="button" data-toggle="dropdown">Delete User
								<span class="caret"></span></button>
								<ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form id="deleteUser">
										Select person
										<select multiple name="assignedTo" class="form-control" placeholder="Assign To">
										<%
										ResultSet memberRS = Team.getMembers(0);
										for(j=1; memberRS.next(); j++){
											%>
											<option value="user<% out.print(memberRS.getInt("user_id")); %>"><%out.print(memberRS.getString("username") + "&emsp;&lt;" + memberRS.getString("email") + "&gt;"); %></option>
										<% } %>
										</select><br/>
										<input name="deadline" type="date" class="form-control"><br/>
										<button type="submit" class="btn btn-default"> Create </button>
									</form>
								</li>
								</ul>
							</div>

<!--
					<button class="btn btn-default" href="">Delete User</button>
					<button class="btn btn-default" href="">Make Team</button>
					<button class="btn btn-default" href="">Change Team Leader</button>
					<button class="btn btn-default" href="">Delete Team</button>
					<button class="btn btn-default" href="">Add Member to Team</button> -->

				</div>
			</div>
		</div>

	</body>
</html>