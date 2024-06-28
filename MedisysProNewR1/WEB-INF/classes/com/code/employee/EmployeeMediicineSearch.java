package com.code.employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.admin.Medicine;
import com.code.conn.DbConnection;

/**
 * Servlet implementation class EmployeeMediicineSearch
 */
@WebServlet("/EmployeeMediicineSearch")
public class EmployeeMediicineSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("1111");
        String name = request.getParameter("name");
        String category = request.getParameter("cat");
        String manufacturer = request.getParameter("mnfg_name");
        String dosef = request.getParameter("dosef");
        
        HttpSession session=request.getSession();

        if (name != null || category != null || manufacturer != null || dosef != null) {
            List<Medicine> searchResults = searchMedicine(name, category, manufacturer,dosef);

            
            // Set the search results in the request attribute
            session.setAttribute("searchResults", searchResults);

            // Forward the request to a JSP page to display the search results
           response.sendRedirect("employeeSearchMedicine.jsp?search=done");
            //request.getRequestDispatcher("adminSearchMedicine.jsp?search=done").forward(request, response);
            
        } else {
            // If no search term or filter criteria are provided, redirect back to the search page
            response.sendRedirect("search.jsp");
        }
    }

    private List<Medicine> searchMedicine(String searchTerm, String category, String manufacturer,String doesf) {
        List<Medicine> searchResults = new ArrayList<>();

        try (Connection connection = DbConnection.getConnection()) 
        {
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM stock_details WHERE 1=1 AND status='Available'");

            if (searchTerm != null && !searchTerm.isEmpty()) 
            {
                queryBuilder.append(" AND (name LIKE ? )");
            }

            if (category != null && !category.isEmpty()) {
                queryBuilder.append(" AND category LIKE ?");
            }

            if (manufacturer != null && !manufacturer.isEmpty()) {
                queryBuilder.append(" AND manufacturer LIKE ?");
            }
            
            if (doesf != null && !doesf.isEmpty()) {
                queryBuilder.append(" AND dosage_form LIKE ?");
            }

            try (PreparedStatement preparedStatement = connection.prepareStatement(queryBuilder.toString())) {
                int parameterIndex = 1;

                if (searchTerm != null && !searchTerm.isEmpty()) {
                    preparedStatement.setString(parameterIndex++, "%" + searchTerm + "%");
                    //preparedStatement.setString(parameterIndex++, "%" + searchTerm + "%");
                }

                if (category != null && !category.isEmpty()) {
                    preparedStatement.setString(parameterIndex++, "%" + category + "%");
                }

                if (manufacturer != null && !manufacturer.isEmpty()) {
                    preparedStatement.setString(parameterIndex++, "%" + manufacturer + "%");
                }

                
                if (doesf != null && !doesf.isEmpty()) {
                    preparedStatement.setString(parameterIndex++, "%" + doesf + "%");
                }
                
                System.out.println("Ps "+preparedStatement);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) 
                    {
                        Medicine medicine = new Medicine();
                        
                        medicine.setId(resultSet.getString("id"));
                        medicine.setName(resultSet.getString("name"));
                        medicine.setManufacturer(resultSet.getString("manufacturer"));
                        medicine.setDosage_form(resultSet.getString("dosage_form"));
                        medicine.setCategory(resultSet.getString("category"));
                        
                        searchResults.add(medicine);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return searchResults;
    }
}