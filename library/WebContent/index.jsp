<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<a class="align-middle top-bar-content pull-right" href="signUp.jsp">Cadastrar</a>
			</form>
				<a class="top-bar-content pull-right" href="#" style="margin-right: 10px;">Login</a>
				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="container">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#about">Home</a></li>
						<li><a href="registerBook.jsp">Mock Cadastrar Livro</a></li>
						<li><a href="#portfolio">Item 2</a></li>
						<li><a href="#pricing">Item 3</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="col-md-12" style="margin-top: 130px">
			<div class="modal-dialog" style="margin-bottom:0">
				<div class="modal-content">
					<div class="panel-heading">
						<h3 class="panel-title">Sign In</h3>
					</div>
					<div class="panel-body">
						<form method=post action=control>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-envelope"></i>
										</span>
										<input class="form-control" placeholder="email@email.com" name="email" type="email" autofocus="">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-lock"></i>
										</span>
										<input class="form-control" placeholder="Password" name="password" type="password" value="">
									</div>
								</div>
								<div class="checkbox">
									<label>
										<input name="remember" type="checkbox" value="Remember Me">Remember Me
									</label>
								</div>
								<input id="Login" name="Login" class="btn btn-success" type="Submit" value="Login">
								<input type=hidden name=command value=Login>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>