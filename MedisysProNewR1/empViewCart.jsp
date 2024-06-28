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
						Welcome-
						<%=session.getAttribute("emp_name").toString()%>
						&nbsp;&nbsp;[Employee]
					</h4>
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
				<div class="row">

					<div class="panel panel-default">
						<div class="panel-heading">Patient Details</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<td><input type="text" name="pname" class="form-control"
											required placeholder="Patient Name" /><br /> <input
											type="text" name="pmobile" placeholder="Patient Mobile"
											class="form-control" pattern="[0-9]{10}" required></td>
										<td><input type="text" name="ref_dr_name"
											placeholder="Refere Dr Name" class="form-control" required />
											<br /> <textarea id="hospital_address"
												name="hospital_address"
												placeholder="Hospital Name and Address" class="form-control"
												required></textarea></td>
										<td><select name="pay_mode" class="form-control">
												<option value="CASH PAYMENT">CASH PAYMENT</option>
												<option value="CARD PAYMENT">CARD PAYMENT</option>
												<option value="UPI PAYMENT">UPI PAYMENT</option>

										</select></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">Medicine Bill Details</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>Sr.No</th>
										<th>Name</th>
										<th>Dosage Form</th>
										<th>Category</th>
										<th>Expiry</th>
										<th>Quantity</th>
										<th>Unit Price</th>
										<th>Total</th>
										<th></th>


									</tr>
									<%
										String emp_id=session.getAttribute("id").toString();
													
										Connection con = DbConnection.getConnection();
										PreparedStatement ps = con.prepareStatement("SELECT * FROM `current_cart_medicine` where emp_id='"+emp_id+"' AND status='cart'");
										ResultSet resultSet = ps.executeQuery();
										int i = 0;
										GlobalFunction gf=new GlobalFunction();
										float grandTotal=0;
										while (resultSet.next()) 
										{
											String id=resultSet.getString("id");
											String m_id=resultSet.getString("m_id");
											float final_amount =Float.parseFloat(resultSet.getString("final_amount"));
											grandTotal=grandTotal+final_amount;
											HashMap<String, String> medicine_details=gf.getMedicintDetails(m_id);
									%>
									<tr>
										<td><%=++i%></td>
										<td><%=medicine_details.get("name")%></td>
										<td><%=medicine_details.get("dosage_form")%></td>
										<td><%=medicine_details.get("category")%></td>
										<td><%=medicine_details.get("expiry")%></td>
										<td><%=resultSet.getString("quantity")%></td>
										<td><%=medicine_details.get("unitprice")%></td>
										<td><%=resultSet.getString("final_amount")%></td>
										<td><a href="DeleteFromCart?id=<%=id%>"><i
												class='fa fa-trash' style='color: red'></i>Remove</a></td>
									</tr>
									<%
										}
									%>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><input type="hidden" name="grand_total"
											value="<%=grandTotal%>"></td>
										<th>Total</th>
										<th><%=grandTotal%></th>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button class="btn btn-success" type="submit">Complete
												Payment</button></td>
												<td></td>
									</tr>

								</table>
							</div>
						</div>
					</div>
				</div>
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
