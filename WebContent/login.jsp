<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="icon" href="../../favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

  </head>

  <body>
	<div class="container">
	    <div class="row">
			<div id="legend">
				<legend class="">Login</legend>
			</div>
			<div class="span12">
				<form class="form-horizontal" action='Login' method="POST">
				  <fieldset>
				      <!-- Username -->
				      <label class="control-label" for="email">Email</label>
				      <div class="controls">
				        <input type="text" id="email" name="email" placeholder="">
				      </div><br/>
				      <!-- Password-->
				      <label class="control-label" for="password">Password</label>
				      <div class="controls">
				        <input type="password" id="password" name="password" placeholder="">
				      </div><br/>
				      <span class="error" style="color:red">${error}</span><br>
				      <!-- Button -->
				      <div class="controls">
				        <button class="btn btn-success">Login</button>
				      </div>
				  </fieldset>
				</form><br/>
			<a href="signup.jsp"> First time here? Register </a><br/><br/>
			<a> Forgot password? </a>
			</div>
		</div>
	</div>
  </body>
</html>
