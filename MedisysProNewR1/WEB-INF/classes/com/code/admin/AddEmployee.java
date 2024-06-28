package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class AddEmployee
 */
@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
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
		
		String emp_name = request.getParameter("emp_name");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("email "+email);
		System.out.println("Password "+password);
		
		HttpSession session = request.getSession();
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `employee_details`(`emp_name`, `gender`, `mobile`, `address`, `email`, `password`) VALUES ('"+emp_name+"','"+gender+"','"+mobile+"','"+address+"','"+email+"','"+password+"')");
			System.out.println("ps "+ps1);
			int r = ps1.executeUpdate();
			if (r>0) 
			{
				System.out.println("Employee Account Add Successful..");
				response.sendRedirect("adminAddEmployee.jsp?nemp=add");
			}
			else 
			{
				System.out.println("Login Fail");
				response.sendRedirect("adminAddEmployee.jsp?fnemp=fail");
			}

		} catch (Exception e) 
		{
			System.out.println("Exeception Occure:-" + e);
			response.sendRedirect("adminAddEmployee.jsp?fnemp=fail");
		}
	}
}
