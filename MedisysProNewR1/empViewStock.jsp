<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
										class="btn btn-primary btn-sm" style="width: 100%;">Search Medicine</a></td>
								</tr>
								<tr>
									<td><a href="empViewCart.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">View
											Cart</a></td>
								</tr>
								<tr>
									<td><a href="empViewSale.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">Sale History</a></td>
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
						<div class="panel-heading">Employee View Stock </div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
								<tr>
								<th>Sr.No</th>
								<th>Name</th>
								<th>Manufacturer</th>
								<th>Dosage Form</th>
								<th>Category</th>

								<th>Quantity</th>
								<th>UnitPrice</th>
								<th>MFG-DATE</th>
								<th>EXP-DATE</th>

								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%

                	Connection con = DbConnection.getConnection();
                	PreparedStatement ps = con.prepareStatement("SELECT * FROM `stock_details` where status='Available'");
                	ResultSet resultSet = ps.executeQuery();
                	int i = 0;
                	while (resultSet.next()) 
                	{
                		 String expiry=resultSet.getString("expiry");
                         LocalDate cdate=LocalDate.now();
                         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                         LocalDate expiry_date = LocalDate.parse(expiry, formatter);
                         
                         boolean rsl=expiry_date.isAfter(cdate);
                         
                       // System.out.println(expiry_date+" ========= "+cdate);
                         long daysDifference = ChronoUnit.DAYS.between(cdate,expiry_date);
                         
                         System.out.println(expiry+"----"+cdate+" Day Diff "+daysDifference);
                         
                         if(rsl)
                         {
                        	
                    %>
							<tr>
								<td><%= ++i%></td>
								<td><%=resultSet.getString("name")%></td>
								<td><%=resultSet.getString("manufacturer")%></td>
								<td><%=resultSet.getString("dosage_form")%></td>
								<td><%=resultSet.getString("category")%></td>

								<td><%=resultSet.getString("quantity")%></td>
								<td><%=resultSet.getString("unitprice")%></td>

								<td><%=resultSet.getString("mfg_date")%></td>
								<td><%=resultSet.getString("expiry")%></td>
								<%
							
								if(daysDifference<30)
	                         	{
									
			                         			
								%>
									<td style="color: green;">Valid<p style="color: red;">(Expired within<%=daysDifference %>)</p></td>
								<%
								}
								else
								{
								%>
									<td style="color: red;">Medicine Expired</td>
								<%
                        		}
								%>
							</tr>
								<%
                         	}                        	
                        }
						%>
						</tbody>
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
