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
	String id = request.getAttribute("id").toString();
	ResultSet taskRS = Task.getTasks(id);
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
						<div class="panel-heading" role="tab" id="headingOne">
						  <h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							<%
							out.print(i + "&emsp;" + taskRS.getString("title") + "&emsp;" + taskRS.getString("deadline") + "&emsp;" + taskRS.getString("task_id"));
							%>
							</a>
						  </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						  <div class="panel-body">
							<form> <label for="this">File upload</label> <input type="file" onchange="this.form.submit()"> </form> <br/>
							<form> <label for="this">Remarks</label> <input type="text"> <button type="submit" class="btn btn-default">Mark as done</button> </form> <br/>
							<div class="dropdown">
							  <button class="dropdown-toggle" type="button" data-toggle="dropdown">Add a sub-task
							  <span class="caret"></span></button>
							  <ul class="dropdown-menu" style="padding:10px 20px">
								<li>
									<form>
										Select person
										<select name="person" class="form-control" placeholder="Person">
											<option>Mr A</option>
											<option>Mr B</option>
											<option>Mr C</option>
											<option>Mr D</option>
										</select><br/>
										<input name="description" type="text" class="form-control" placeholder="Description"><br/>
										<button type="submit" class="btn btn-default"> Create sub-task</button>
									</form>
								</li>
							  </ul>
							</div>
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