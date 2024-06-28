<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title><jsp:include page="projectTitle.jsp" /></title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<%
	session.setAttribute("u_type", "Geust");
%>

<body>
	<section class="menu-section navbar-fixed-top">
	<div class="container">
		<div class="row ">
			<div class="col-md-4" align="left">
				<img alt="" src="img/logo2.png" style="width: 100%; height: 100%;">
			</div>
			<div class="col-md-8">
				<div class="navbar-collapse collapse ">
					<jsp:include page="header/menuHeader.jsp" />
				</div>
			</div>

		</div>
	</div>
	</section>
	<div style="margin-right: 5%; margin-left: 5%; margin-top: 5%;">
		<div class="row ">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line" align="center">Welcome- CR Election
						Application</h4>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-right: 5%; margin-left: 5%;">
		<div class="row">
			<div class="col-md-6">
				<img alt="" src="img/ms1.jpg" style="width: 100%; height: 80%">
			</div>
			<div class="col-md-6">
				<form action="AdminLogin" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">Admin Login</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>Username</th>
										<td><input type="text" class="form-control"
											placeholder="Your Username" required name="username"></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" class="form-control"
											placeholder="**********" required name="password"></td>
									</tr>
									<tr>
										<td></td>
										<td><button type="submit"
												class="btn btn-primary btn-block">Login</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				&copy; &copy; 2024 |<a href="#" target="_blank"> Designed by :
					------</a>
			</div>

		</div>
	</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>

</body>
</html>
