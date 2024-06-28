<%@page import="java.util.List"%>
<%@page import="com.code.admin.Medicine"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.code.conn.GlobalFunction"%>
<%@page import="com.code.conn.DbConnection"%>
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
						Welcome- Admin</h4>
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
									<td><a href="adminAddEmployee.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">Add
											New Employee</a></td>
								</tr>
								<tr>
									<td><a href="adminViewEmployee.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">View
											Employee</a></td>
								</tr>
								<tr>
									<td><a href="addNewMedicine.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">Add
											Medicine</a></td>
								</tr>
								<tr>
									<td><a href="adminViewMedicine.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">View
											Medicine</a></td>
								</tr>
								<tr>
									<td><a href="adminSearchMedicine.jsp"
										class="btn btn-primary btn-sm" style="width: 100%;">Search
											Medicine</a></td>
								</tr>
								<tr>
									<td><a href="adminViewSale.jsp" class="btn btn-success btn-sm" style="width: 100%;">Sales Details</a></td>
								</tr>
								<tr>
									<td><a href="viewNotification.jsp"
										class="btn btn-danger btn-sm" style="width: 100%;">Notification</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="row">
					<%
						GlobalFunction gf=new GlobalFunction();
							
							ArrayList<String> dosage_form=gf.getDistinctDosageForm();
							ArrayList<String> category=gf.getDistinctCategory();
							ArrayList<String> mnfg=gf.getDistinctMnfg();
					%>

					<div class="panel panel-default">
						<div class="panel-heading">Admin Search Medicine</div>
						<div class="panel-body">
							<div class="table-responsive">
								<form action="MedicineSearch" method="POST">
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
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<%
if(request.getParameter("search")!=null)
{
%>
				
				
				<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">Admin View Search Medicine</div>
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
                        <th>Manufacture</th>
                        <th>Expiry</th>
                        <th>Status</th>
                        <!-- Add more columns as needed -->
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
                        		%><td style="color: green;">Valid<p style="color: red;">(Expired within <%=daysDifference %>)</p></td>
                        		<%
                        	}else
                        	{
                        		%><td style="color: green;">Valid</td>
                        		<%
                        	}
                        	
                        }else
                        {
                        	%>
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
<%} %>
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
