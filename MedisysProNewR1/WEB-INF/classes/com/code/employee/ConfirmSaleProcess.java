package com.code.employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
 * Servlet implementation class ConfirmSaleProcess
 */
@WebServlet("/ConfirmSaleProcess")
public class ConfirmSaleProcess extends HttpServlet {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String pname=request.getParameter("pname");
		String pmobile=request.getParameter("pmobile");
		String ref_dr_name=request.getParameter("ref_dr_name");
		String hospital_address=request.getParameter("hospital_address");
		String grand_total=request.getParameter("grand_total");
		String pay_mode=request.getParameter("pay_mode");
		System.out.println("1");
		HttpSession session=request.getSession();
		
		String emp_id = session.getAttribute("id").toString();
		System.out.println("emp id "+emp_id);
		GlobalFunction gf=new GlobalFunction();
		ArrayList<String> currentCartDetails = gf.getCurrentCartDetails(emp_id);
		
		String c_cart_details = currentCartDetails.toString();
		System.out.println("Current Cart Products "+c_cart_details);
		
		
		
		try 
		{
			String max_sale_id="0";
			PreparedStatement ps=con.prepareStatement("INSERT INTO `sale_details`(`patient_name`, `patient_mobile`, `refer_dr_name`, `refer_hospitalname`, `amount`, `emp_id`, `payment_mode`) VALUES ('"+pname+"','"+pmobile+"','"+ref_dr_name+"','"+hospital_address+"','"+grand_total+"','"+emp_id+"','"+pay_mode+"')");
			int i=ps.executeUpdate();
			if(i>0)
			{
				PreparedStatement ps1=con.prepareStatement("SELECT MAX(id) FROM `sale_details`");
				ResultSet rsl = ps1.executeQuery();
				if(rsl.next())
				{
					max_sale_id = rsl.getString("MAX(id)");
					System.out.println("Max ID "+max_sale_id);
					gf.updateCurrentCartDetails(max_sale_id, emp_id);
					
					
				}
				
				System.out.println("Sale Entry Done ");
			}
			
			response.sendRedirect("empViewCart.jsp?bill=done");
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	
	}

}
