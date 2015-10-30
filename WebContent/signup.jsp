<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.Task" %>
<%@ page import="database.User" %>
<%@ page import="database.Team" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="../../favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Signup</title>

	<!-- Bootstrap core CSS -->
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="bootstrap/js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<%
	ResultSet teamsRS=Team.getallTeams(); 
%>

	<div class="container">
		<div class="row">
			<div id="legend">
				<legend class="">Signup</legend>
			</div>
			<form role="form" action="Login" method="POST">
				<div class="col-lg-6">
					<div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span> Required Field</strong></div>
						<div class="form-group">
							<label for="name">Enter Name</label>
							<div class="input-group">
								<input type="text" class="form-control" name="name" id="name" placeholder="Enter Name" required>
								<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
							</div>
						</div>
					<div class="form-group">
						<label for="email">Enter Email</label>
						<div class="input-group">
							<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label for="phone">Enter Mobile Number</label>
						<div class="input-group">
							<input type="phone" class="form-control" id="phone" name="phone" placeholder="Enter Mobile Number" required>
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label for="password">Enter Password</label>
						<div class="input-group">
							<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label for="password2">Confirm Password</label>
						<div class="input-group">
							<input type="password" class="form-control" id="password2" name="password2" placeholder="Confirm Password" required>
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label for="team">Enter Team</label>
						<div class="input-group">
							<select name="team" class="form-control" id="team">
								<option disabled selected> Choose Team </option>
	<% for(int i=1; teamsRS.next(); i++){ %>
								<option value="<%out.print(teamsRS.getInt("team_id"));%>"><%out.print(teamsRS.getString("team_name")); %></option>
	<% } %>
							</select><br/>
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label for="InputAddress">Enter Address</label>
						<div class="input-group">
							<textarea name="InputAddress" id="InputAddress" class="form-control" rows="5"></textarea>
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
						</div>
					</div>
					<input type="hidden" name="formType" value="addUser">
					<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
				</div>
			</form>
			<div class="col-lg-5 col-md-push-1">
				<div class="col-md-12">
<!-- 					<div class="alert alert-success">
						<strong><span class="glyphicon glyphicon-ok"></span> Success! Message sent.</strong>
					</div> -->
	<% //check for error being set %>
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-remove"></span><strong> Error! Please check all page inputs.</strong>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>