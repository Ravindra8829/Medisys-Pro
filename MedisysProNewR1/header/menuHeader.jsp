<%
String u_type=session.getAttribute("u_type").toString();
if(u_type.equals("Geust"))
{
%>

<ul id="menu-top" class="nav navbar-nav navbar-right">
	<li><a href="index.jsp" class="menu-top-active">Home</a></li>
	<li><a href="adminLogin.jsp">Admin</a></li>
	<li><a href="employeeLogin.jsp">Employee</a></li>
	<li><a href="#">Contact US</a></li>
</ul>
<%
}
if(u_type.equals("Admin"))
{
%>
<ul id="menu-top" class="nav navbar-nav navbar-right">
	<li><a href="adminHome.jsp" class="menu-top-active">Home</a></li>
	
	<li><a href="#" class="dropdown-toggle" id="ddlmenuItem"
		data-toggle="dropdown">Employee<i class="fa fa-angle-down"></i></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="adminAddEmployee.jsp">Creat Account</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="adminViewEmployee.jsp">View Employee</a></li>
		</ul></li>
	
	<li><a href="#" class="dropdown-toggle" id="ddlmenuItem"
		data-toggle="dropdown">Stock<i class="fa fa-angle-down"></i></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="addNewMedicine.jsp">Add Medicine</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="adminViewMedicine.jsp">View Medicine</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="adminSearchMedicine.jsp">Search Medicine</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="viewNotification.jsp">Notification</a></li>
		</ul></li>
	
	<li><a href="adminViewSale.jsp">Sales Report</a></li>
	<li><a href="Logout">Logout</a></li>
</ul>
<%
}
if(u_type.equals("Employee"))
{
%>
<ul id="menu-top" class="nav navbar-nav navbar-right">
	<li><a href="employeeHome.jsp">Home</a></li>
	<li><a href="employeeSearchMedicine.jsp">Search Medicine </a></li>										
	<li><a href="empViewCart.jsp">View Cart</a></li>
	<li><a href="empViewSale.jsp">Sale History</a></li>
	<li><a href="empViewStock.jsp">View Stock </a></li>
	<li><a href="Logout">Logout</a></li>
	
</ul>
<%
}
%>