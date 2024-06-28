package com.code.employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.DbConnection;
import com.code.conn.GlobalFunction;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
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
		
		String m_id = request.getParameter("id");
		float quantity =Float.parseFloat(request.getParameter("quantity"));
		if(quantity>0)
		{
			
			
			
			GlobalFunction gf=new GlobalFunction();
			boolean checkQuantityStatus = gf.checkQuantityStatus(m_id, quantity);
			if(!checkQuantityStatus)
			{
				response.sendRedirect("employeeSearchMedicine.jsp?ncart=add&quantity=nmatch");
			}else
			{
			
			HashMap<String, String> medicintDetails = gf.getMedicintDetails(m_id);
			
			
			
			float unitPrice=Float.parseFloat(medicintDetails.get("unitprice"));
			
			float finalprice =quantity*unitPrice;
			
			HttpSession session = request.getSession();
			String emp_id = session.getAttribute("id").toString();
			
			LocalDateTime localDateTime=LocalDateTime.now();
			String c_date = localDateTime.toString();
			System.out.println("C Date "+c_date);
			
			try 
			{
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `current_cart_medicine`(`m_id`, `quantity`, `final_amount`, `emp_id`) VALUES ('"+m_id+"','"+quantity+"','"+finalprice+"','"+emp_id+"')");
				int r = ps1.executeUpdate();
				if (r>0) 
				{
					System.out.println("medicine add in cart Successful..");
					response.sendRedirect("employeeSearchMedicine.jsp?cart=add");
				}
				else 
				{
					System.out.println("cart add process Fail");
					response.sendRedirect("employeeSearchMedicine.jsp?ncart=add");
				}
	
			} catch (Exception e) 
			{
				System.out.println("Exeception Occure:-" + e);
				response.sendRedirect("employeeSearchMedicine.jsp?exc=cart");
			}
		}
		}else{
			response.sendRedirect("employeeSearchMedicine.jsp?quantity=invalide");
		}
	}
}
