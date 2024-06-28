package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class AddMedicine
 */
@WebServlet("/AddMedicine")
public class AddMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static Connection con = null;

	public void init(ServletConfig config) throws ServletException {
		try 
		{
			con = DbConnection.getConnection();
		} 
		catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String name = request.getParameter("name");
		String manufacturer = request.getParameter("manufacturer");
		String dosage_form = request.getParameter("dosage_form");	
		String category = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String unitprice = request.getParameter("unitprice");
		String mfg_date = request.getParameter("mfg_date");
		
		
		String expiry = request.getParameter("expiry");
		
		HttpSession session = request.getSession();
		String emp_id = session.getAttribute("id").toString();
		
		LocalDateTime localDateTime=LocalDateTime.now();
		String c_date = localDateTime.toString();
		System.out.println("C Date "+c_date);
		
		
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `stock_details`(`name`, `manufacturer`, `dosage_form`, `category`, `quantity`, `unitprice`, `mfg_date`, `expiry`, `entry_by`) VALUES ('"+name+"','"+manufacturer+"','"+dosage_form+"','"+category+"','"+quantity+"','"+unitprice+"','"+mfg_date+"','"+expiry+"','"+emp_id+"')");
			int r = ps1.executeUpdate();
			if (r>0) 
			{
				System.out.println("Employee Account Add Successful..");
				response.sendRedirect("addEmployee.jsp?nemp=add");
			}
			else 
			{
				System.out.println("Login Fail");
				response.sendRedirect("addEmployee.jsp?fnemp=fail");
			}

		} catch (Exception e) 
		{
			System.out.println("Exeception Occure:-" + e);
			response.sendRedirect("addEmployee.jsp?fnemp=fail");
		}
	}
}
