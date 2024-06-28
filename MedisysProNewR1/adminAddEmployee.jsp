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
<script>
	function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in First Name");
		}

		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabets in Last Name");
		}

	}
	function ageCount() {
		var date1 = new Date();
		var dob = document.ureg.dob.value;
		var date2 = new Date(dob);
		var dd = date2.getDate();
		var mm = date2.getMonth() + 1;
		var yyyy = date2.getFullYear();

		if (dob != "") {
			var y1 = date1.getFullYear(); //getting current year
			var y2 = date2.getFullYear(); //getting dob year
			var age = y1 - y2; //calculating age 
			if (age >= 18) {
				return true;
			} else {
				ureg.dob.value = "";
				ureg.dob.focus();
				alert("age should be 18+");
				return false;
			}

		} else {

			return false;
		}

	}

	function validEmail() {
		var mail = document.ureg.email.value;
		if (mail == "") {
			ureg.email.value = "";
			alert("Please insert Email Address");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else {
			ureg.email.value = "";
			alert("Email Address is Not Valid");

			return false;
		}
	}
	function ValidateUID() {
		var y = document.ureg.adharno.value;

		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.adharno.value = "";
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 12) {
			ureg.adharno.value = "";
			alert("Enter 12 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";

			ureg.adharno.value = "";
			alert("Enter only Digits");
		}

	}

	function Validate() {
		var y = document.ureg.phone.value;

		if (y.charAt(0) != "7" && y.charAt(0) != "8" && y.charAt(0) != "9") {
			ureg.phone.value = "";
			alert("Invalide Start Digit");
			return false;
		}

		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.phone.value = "";
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) {
			ureg.phone.value = "";
			alert("Enter 10 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";

			ureg.phone.value = "";
			ureg.phone.focus();
			alert("Enter only Digits");
		}

	}
	function validuaernameandpass() {
		var pass = document.ureg.password.value;
		if (pass != "") {
			if (pass.length < 6) {
				document.ureg.password = "";
				alert("Password must contain at least 6 characters!");

				return false;
			}
		} else {
			document.ureg.password = "";
			alert("Please Insert password");

			return false;

		}
	}
</script>



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
				<form action="AddEmployee" method="POST" id="contact_form">
					<div class="panel panel-default">
						<div class="panel-heading">Create New Employee Account</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>Employee Name</th>
										<td><input type="text" id="emp_name" name="emp_name"
											class="form-control" required /></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><select id="gender" name="gender" required
											class="form-control">
												<option value="male">Male</option>
												<option value="female">Female</option>
										</select></td>
									</tr>
									<tr>
										<th>Mobile</th>
										<td><input type="text" id="phone" name="phone"
											onblur="return Validate()" class="form-control"
											pattern="[0-9]{10}" required><br></td>
									</tr>
									<tr>
										<th>Address</th>
										<td><textarea id="address" name="address"
												class="form-control" required></textarea></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" class="form-control" id="email"
											name="email" onblur="return validEmail()" required></td>
									</tr>
									<tr>
										<th>Password:</th>
										<td><input type="password" placeholder="Password"
											class="form-control" name="password" required></td>
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
