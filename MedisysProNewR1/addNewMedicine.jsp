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
					<h4 class="header-line" align="right" style="color: red;"> Welcome- Admin</h4>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-right: 5%; margin-left: 5%;">
		<div class="row">
		<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading" align="center">Shortcut Menu</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<tr>
									<td><a href="adminAddEmployee.jsp" class="btn btn-primary btn-sm" style="width: 100%;">Add New Employee</a></td>
								</tr>
								<tr>
									<td><a href="adminViewEmployee.jsp" class="btn btn-primary btn-sm" style="width: 100%;">View Employee</a></td>
								</tr>
								<tr>
									<td><a href="addNewMedicine.jsp" class="btn btn-primary btn-sm" style="width: 100%;">Add Medicine</a></td>
								</tr>
								<tr>
									<td><a href="adminViewMedicine.jsp" class="btn btn-primary btn-sm" style="width: 100%;">View Medicine</a></td>
								</tr>
								<tr>
									<td><a href="adminSearchMedicine.jsp" class="btn btn-primary btn-sm" style="width: 100%;">Search Medicine</a></td>
								</tr>
								<tr>
									<td><a href="adminViewSale.jsp" class="btn btn-success btn-sm" style="width: 100%;">Sales Details</a></td>
								</tr>
								<tr>
									<td><a href="viewNotification.jsp" class="btn btn-danger btn-sm" style="width: 100%;">Notification</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-7">
				<form action="AdminLogin" method="POST" id="contact_form" name="ureg">
					<div class="panel panel-default">
						<div class="panel-heading">Admin Add New Medicine</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
							<th><label for="name">Medicine Name:</label></th>
							<td><input type="text" id="name" class="form-control" name="name" required></td>
						</tr>
						<tr>
							<th><label for="manufacturer">Manufacturer:</label></th>
							<td><input type="text" id="manufacturer" class="form-control" name="manufacturer"
								required></td>
						</tr>
						<tr>
							<th><label for="dosage_form">Dosage Form:</label></th>
							<td><select class="form-control" name="dosage_form">
									<option value="Tablet">Tablet</option>
									<option value="Capsule">Capsule</option>
									<option value="Liquid">Liquid</option>
							</select>
						</tr>
						<tr>
							<th><label for="category">Category:</label></th>
							<td>
							<select name="category" class="form-control">
									<option value="Painkiller">Painkiller</option>
									<option value="Antibiotic">Antibiotic</option>
									<option value="Allergy Relief">Allergy Relief</option>
							</select>
							</td>
						</tr>
						<tr>
							<th><label for="quantity">Quantity:</label></th>
							<td><input type="number" id="quantity" name="quantity" class="form-control"
								required></td>
						</tr>
						<tr>
							<th><label for="unitprice">Unit Price:</label></th>
							<td><input type="number" id="unitprice" name="unitprice" cl ass="form-control"
								required></td>
						</tr>
						<tr>
							<th><label for="mfg_date">Manufacturing Date:</label></th>
							<td><input type="date" id="mfg_date" class="form-control" name="mfg_date"
								placeholder="YYYY-MM-DD" required></td>
						</tr>
						<tr>
							<th><label for="expiry">Expiry Date:</label></th>
							<td><input type="date" class="form-control" id="expiry" name="expiry"
								placeholder="YYYY-MM-DD" required></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<button class="btn btn-primary" type="submit">Create
									New Account</button>
							</td>
						</tr>

					</table>

							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="col-md-1"></div>	
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
