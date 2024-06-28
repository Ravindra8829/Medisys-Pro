<%@page import="java.util.List"%>
<%@page import="com.code.admin.Medicine"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.ArrayList"%>
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
					<%
						String pname=request.getParameter("pname");
									String pmobile=request.getParameter("pmobile");
									String drname=request.getParameter("drname");
									String hospital_address=request.getParameter("hospital_address");
									
									session.setAttribute("pname", pname);
									session.setAttribute("pmobile", pmobile);
									session.setAttribute("drname", drname);
									session.setAttribute("hospital_address", hospital_address);
									
									GlobalFunction gf=new GlobalFunction();
									
									ArrayList<String> dosage_form=gf.getDistinctDosageForm();
									ArrayList<String> category=gf.getDistinctCategory();
									ArrayList<String> mnfg=gf.getDistinctMnfg();
					%>

					<form action="EmployeeMediicineSearch" method="POST">
						<div class="panel panel-default">
							<div class="panel-heading">Search Medicine</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<tr>
											<td></td>
											<td><input type="text" class="form-control" name="name"></td>
											<td><select class="form-control" name="mnfg_name">
													<option value="">--None--</option>
													<%
														for(String mnfg_name:mnfg)
																												{
													%>
													<option value="<%=mnfg_name%>"><%=mnfg_name%></option>
													<%
														}
													%>
											</select></td>

											<td><select name="cat" class="form-control">
													<option value="">--None--</option>
													<%
														for(String cat:category)
																												{
													%>
													<option value="<%=cat%>"><%=cat%></option>
													<%
														}
													%>
											</select></td>

											<td><select class="form-control" name="dosef">
													<option value="">--None--</option>
													<%
														for(String dosef:dosage_form)
																												{
													%>
													<option value="<%=dosef%>"><%=dosef%></option>
													<%
														}
													%>
											</select></td>

											<td>
												<button class="btn btn-primary" type="submit">Search</button>
											</td>

										</tr>

									</table>

								</div>
							</div>
						</div>

					</form>
				</div>
				<%
if(request.getParameter("search")!=null)
{
%>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">Search Result</div>
						<div class="panel-body">
							<div class="table-responsive">
								<%
        List<Medicine> searchResults = (List<Medicine>) session.getAttribute("searchResults");
        if (searchResults != null && !searchResults.isEmpty()) {
    %>
								<table class="table">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Name</th>
											<th>Manufacturer</th>
											<th>Dosage Form</th>
											<th>Category</th>
											<th>MFG-DATE</th>
											<th>EXP-DATE</th>

											<th>Available</th>
											<th>UnitPrice</th>
											<th>Quantity</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<%int i=0;
                    //GlobalFunction gf=new GlobalFunction();
                        for (Medicine medicine : searchResults) {
                        	++i;
                        	
                        	HashMap<String, String> medicine_details =gf.getMedicintDetails(medicine.getId());
                        	
                    %>
										<tr>
											<td><%= i%></td>
											<td><%= medicine.getName()%></td>
											<td><%= medicine.getManufacturer() %></td>
											<td><%= medicine.getDosage_form() %></td>
											<td><%= medicine.getCategory() %></td>

											<td><%=medicine_details.get("mfg_date") %></td>
											<td><%=medicine_details.get("expiry") %></td>

											<td><%=medicine_details.get("quantity") %></td>
											<td><%=medicine_details.get("unitprice") %></td>


											<%
                                String expiry=medicine_details.get("expiry");
                        LocalDate cdate=LocalDate.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate expiry_date = LocalDate.parse(expiry, formatter);
                        boolean rsl=expiry_date.isAfter(cdate);
                        
                       System.out.println(expiry_date+" ========= "+cdate);
                        long daysDifference = ChronoUnit.DAYS.between(cdate,expiry_date);
                        
                        System.out.println("Day Diff "+daysDifference);
                        if(rsl)
                        {

                        	if(daysDifference<10)
                        	{
                        		%>
											<td><input type="number" style="width: 60px;" id="tab"
												name="tab" class="form-control" required /></td>
											<td style="color: green;">Valid
												<p style="color: red;">
													(Expired within
													<%=daysDifference %>)
												</p>
											</td>
											<%
                        	}else
                        	{
                        		%>
											<form action="AddCart" method="post">
												<td><input type="hidden" name="id"
													value="<%=medicine_details.get("id")%>"> <input
													type="number" style="width: 60px;" id="quantity"
													name="quantity" class="form-control" required /></td>
												<td style="color: green;">Valid &nbsp; &nbsp; <a><button
															type="submit" class="btn btn-primary">Add
															to Cart</button></a>
												</td>
											</form>
											<%
                        	}
                        	
                        }else
                        {
                        	%><td></td>
											<td style="color: red;">Medicine Expired</td>
											<%
                        }
						%>

											<!-- Add more columns as needed -->
										</tr>
										<%
                        }
                    %>
									</tbody>
								</table>
								<%
        } else {
    %>
								<p>No results found for the specified criteria.</p>
								<%
        }
    %>

							</div>
						</div>
					</div>
				</div>
			</div>
			<%} %>
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
