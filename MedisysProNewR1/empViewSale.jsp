<%@page import="java.util.HashMap"%>
<%@page import="com.code.conn.DbConnection"%>
<%@page import="com.code.conn.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
					<h4 class="header-line" align="right" style="color: red;">
						Welcome- <%=session.getAttribute("emp_name").toString() %> &nbsp;&nbsp;[Employee]</h4>
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
									<td><a href="employeeSearchMedicine.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">Search
											Medicine</a></td>
								</tr>
								<tr>
									<td><a href="empViewCart.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">View
											Cart</a></td>
								</tr>
								<tr>
									<td><a href="empViewSale.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">Sale
											History</a></td>
								</tr>
								<tr>
									<td><a href="empViewStock.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">View
											Stock</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<form action="AdminLogin" method="POST" id="contact_form"
					name="ureg">
					<div class="panel panel-default">
						<div class="panel-heading">View Sale Report</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>Sr.No</th>
										<th>Patient Name</th>
										<th>Mobile</th>
										<th>Refer Dr. Name</th>
										<th>Hospital Name</th>
										<th>Amount</th>
										<th>Sale Date</th>
										<th>Payment Mode</th>
									</tr>
									<%
										String emp_id = session.getAttribute("id").toString();

										Connection con = DbConnection.getConnection();
										PreparedStatement ps = con
												.prepareStatement("SELECT * FROM `sale_details` where emp_id='"
														+ emp_id + "' ORDER BY id DESC");
										ResultSet resultSet = ps.executeQuery();
										int i = 0;
										GlobalFunction gf = new GlobalFunction();
										float grandTotal = 0;
										while (resultSet.next()) {
											String id = resultSet.getString("id");
									%>
									<tr>
										<td><%=++i%></td>
										<td><%=resultSet.getString("patient_name")%></td>
										<td><%=resultSet.getString("patient_mobile")%></td>
										<td><%=resultSet.getString("refer_dr_name")%></td>
										<td><%=resultSet.getString("refer_hospitalname")%></td>
										<td><%=resultSet.getString("amount")%></td>
										<td><%=resultSet.getString("sale_date")%></td>
										<td><%=resultSet.getString("payment_mode")%></td>
										<td><a href="empViewBill.jsp?id=<%=id%>"
											style="color: blue;">View_Details</a></td>
									</tr>
									<%
										}
									%>
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
