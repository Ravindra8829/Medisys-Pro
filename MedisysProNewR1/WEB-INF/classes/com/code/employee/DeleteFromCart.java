package com.code.employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class DeleteFromCart
 */
@WebServlet("/DeleteFromCart")
public class DeleteFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=DbConnection.getConnection();
		
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		int cartid = Integer.parseInt(request.getParameter("id"));
		try 
		{
			PreparedStatement ps=con.prepareStatement("DELETE FROM `current_cart_medicine` WHERE id='"+cartid+"'");
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Delete Product ID "+cartid);
			}
			
			response.sendRedirect("empViewCart.jsp?delete=done");
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	
	}

}
