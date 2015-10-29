<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="icon" href="../../favicon.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Signin Template for Bootstrap</title>
		<!-- Bootstrap core CSS -->
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet">
		<script src="bootstrap/js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>
		<script src="bootstrap/js/bootstrap-datetimepicker.js"></script>
	</head>
	<body>

		<div class="container">
			<div class="row">
				<div id="legend">
					<legend class="">Dashboard</legend>
				</div>
				<div class="col-xs-6">
					<h2> Tasks pending for you! </h2>

					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
						  <h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  1. &emsp; Task #1 &emsp; Today, 19th Oct 2015
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
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
						  <h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							  2. &emsp; Task #2 &emsp; Tomorrow, 20th Oct 2015
							</a>
						  </h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
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
					  <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
						  <h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							  3. &emsp; Task #3 &emsp; Tomorrow, 20th Oct 2015
							</a>
						  </h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
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
					</div>
				</div>
<br/><br/>
				<div class="col-xs-6">
					<h2> Tasks pending assigned by you! </h2>

						<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOn">
							  <h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseOn" aria-expanded="true" aria-controls="collapseOn">
								  1. &emsp; Task #4 &emsp; Today, 19th Oct 2015
								</a>
							  </h4>
							</div>
							<div id="collapseOn" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOn">
							  <div class="panel-body">
								<form> <label for="this">File upload</label> <input type="file" class="btn" onchange="this.form.submit()"> </form>
							  	<form> <label for="this">Extend Deadine</label> <input type="date" value="10-19-2015" class="btn" onchange="this.form.submit()"> </form>
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTw">
							  <h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseTw" aria-expanded="false" aria-controls="collapseTw">
								  2. &emsp; Task #5 &emsp; Today, 19th Oct 2015
								</a>
							  </h4>
							</div>
							<div id="collapseTw" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTw">
							  <div class="panel-body">
								<form> <label for="this">File upload</label> <input type="file" onchange="this.form.submit()"> </form> <br/>
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThre">
							  <h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseThre" aria-expanded="false" aria-controls="collapseThre">
								  3. &emsp; Task #6 &emsp; Tomorrow, 20th Oct 2015
								</a>
							  </h4>
							</div>
							<div id="collapseThre" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThre">
							  <div class="panel-body">
								<form> <label for="this">File upload</label> <input type="file" onchange="this.form.submit()"> </form> <br/>
							  </div>
							</div>
						  </div>
						</div>


					</div>
				</div>
<br/><br/><br/><br/><br/><br/><br/>
				<ul class="pagination">
					<button> Modify users </button>
					<button> Modify teams </button>
					<button> Create Task </button>
				</ul>

			</div>
		</div>
	</body>
</html>