package com.code.conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class GlobalFunction {

static Connection con=DbConnection.getConnection();
		
	public ArrayList<String> getDistinctMnfg()
	{
		ArrayList<String> mnfg_details=new ArrayList<String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT DISTINCT(manufacturer) FROM `stock_details` where status='Available'");
			ResultSet rs1=ps.executeQuery();
			while(rs1.next())
			{
				mnfg_details.add(rs1.getString("manufacturer"));
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return mnfg_details;
	}
	
	public boolean checkQuantityStatus(String m_id, float sel_quantity)
	{
		boolean status=true;
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `stock_details` where id='"+m_id+"'");
			ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				float c_quantity=Float.parseFloat(rs1.getString("quantity"));
				if(sel_quantity>c_quantity)
				{
					status=false;
				}
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return status;
	}
	
	
	public ArrayList<String> getDistinctCategory()
	{
		ArrayList<String> category_details=new ArrayList<String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT DISTINCT(category) FROM `stock_details` where status='Available'");
			ResultSet rs1=ps.executeQuery();
			while(rs1.next())
			{
				category_details.add(rs1.getString("category"));
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return category_details;
	}
	public ArrayList<String> getDistinctDosageForm()
	{
		ArrayList<String> dosage_form_details=new ArrayList<String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT DISTINCT(dosage_form) FROM `stock_details` where status='Available'");
			ResultSet rs1=ps.executeQuery();
			while(rs1.next())
			{
				dosage_form_details.add(rs1.getString("dosage_form"));
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return dosage_form_details;
	}
	
	public ArrayList<String> getCurrentCartDetails(String emp_id)
	{
		ArrayList<String> cart_m_id=new ArrayList<String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `current_cart_medicine` where emp_id='"+emp_id+"'");
			ResultSet rs1=ps.executeQuery();
			while(rs1.next())
			{
				cart_m_id.add(rs1.getString("m_id"));
				
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return cart_m_id;
	}
	
	
	public void updateCurrentCartDetails(String max_sale_id,String emp_id)
	{
		try 
		{
			
			PreparedStatement ps=con.prepareStatement("UPDATE `current_cart_medicine` SET `status`='"+max_sale_id+"' WHERE emp_id='"+emp_id+"' AND status='cart'");
			int executeUpdate = ps.executeUpdate();
			if(executeUpdate>0)
			{
				PreparedStatement ps1=con.prepareStatement("SELECT * FROM `current_cart_medicine` where emp_id='"+emp_id+"' AND status='"+max_sale_id+"'");
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					float cart_q=Float.parseFloat(rs1.getString("quantity"));
					String m_id=rs1.getString("m_id");
					PreparedStatement ps2=con.prepareStatement("UPDATE `stock_details` SET `quantity`=quantity-'"+cart_q+"' WHERE id='"+m_id+"'");
					System.out.println("--------------------------"+ps2);
					int decQuantity = ps2.executeUpdate();
					if(decQuantity>0)
					{
						System.out.println("Quantity Update ");
					}
					
				}
				
				System.out.println("Update current cart");
				
				
				
			}
			else
			{
				System.out.println("Current CART Not UPDATE");
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
	
	




	public HashMap<String, String> getMedicintDetails(String id)
	{
		HashMap<String, String> product_details=new HashMap<String, String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `stock_details` where id='"+id+"'");
				ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				
				product_details.put("id", rs1.getString("id"));
				product_details.put("name", rs1.getString("name"));
				product_details.put("manufacturer", rs1.getString("manufacturer"));
				product_details.put("dosage_form", rs1.getString("dosage_form"));
				product_details.put("category", rs1.getString("category"));
				product_details.put("quantity", rs1.getString("quantity"));
				product_details.put("unitprice", rs1.getString("unitprice"));
				product_details.put("mfg_date", rs1.getString("mfg_date"));
				product_details.put("expiry", rs1.getString("expiry"));
				product_details.put("entry_by", rs1.getString("entry_by"));				
				product_details.put("entry_date", rs1.getString("entry_date"));
				
				
			}
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return product_details;
	}
	
	public HashMap<String, String> getEmployeeDetails(String emp_id)
	{
		HashMap<String, String> product_details=new HashMap<String, String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `employee_details` where id='"+emp_id+"'");
			ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				product_details.put("emp_name", rs1.getString("emp_name"));
				product_details.put("mobile", rs1.getString("mobile"));
				product_details.put("email", rs1.getString("email"));
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return product_details;
	}
	
	public HashMap<String, String> getPatientDetails(String b_id)
	{
		HashMap<String, String> patient_details=new HashMap<String, String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `sale_details` where id='"+b_id+"'");
			ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				patient_details.put("patient_name", rs1.getString("patient_name"));
				patient_details.put("patient_mobile", rs1.getString("patient_mobile"));
				patient_details.put("refer_dr_name", rs1.getString("refer_dr_name"));
				patient_details.put("refer_hospitalname", rs1.getString("refer_hospitalname"));
				patient_details.put("payment_mode", rs1.getString("payment_mode"));
				patient_details.put("emp_id", rs1.getString("emp_id"));
				patient_details.put("sale_date", rs1.getString("sale_date"));
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return patient_details;
	}
	
	
	public HashMap<String, String> getSellerDetails(String u_id)
	{
		HashMap<String, String> seller_details=new HashMap<String, String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `seller_details` where id='"+u_id+"'");
			System.out.println("ps "+ps);
			ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				seller_details.put("fname", rs1.getString("full_name"));
				seller_details.put("mobile", rs1.getString("mobile"));
				seller_details.put("email", rs1.getString("email"));
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return seller_details;
	}
	
	
	
	public String productBuy(ArrayList<String> prd) 
	{
		String output = "";
		for(String p:prd)
		{
			output=p+","+output;
		}
		return output;
	}
	
	

	
}	
