package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		System.out.println("username "+username);
		System.out.println("Password "+password);
		
		HttpSession session = request.getSession();

		try 
		{
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `admin_details` WHERE username='"+ username + "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("username", username);
				session.setAttribute("u_type", "Admin");
				System.out.println("Login Successful..");
				response.sendRedirect("adminHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login Fail");
				response.sendRedirect("adminLogin.jsp?fail=login");
			}

		} catch (Exception e) 
		{
			System.out.println("Exeception Occure:-" + e);
			response.sendRedirect("userLogin.jsp");
		}
	}
}
