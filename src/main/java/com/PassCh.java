package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PassCh
 */
public class PassCh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassCh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pass=request.getParameter("pass");
		HttpSession session=request.getSession();  
        String ad=(String)session.getAttribute("Admin");
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","root");
			PreparedStatement stmt= con.prepareStatement("update admin set password =?  where admin_id=?");
			
			stmt.setString(1, pass);
			stmt.setString(2, ad);
	
			stmt.execute();
			
			System.out.println("Data Inserted....!");
			PrintWriter out=response.getWriter();
			RequestDispatcher rd=request.getRequestDispatcher("/PassCh.html");
			rd.include(request, response);
			out.println("<h3><font color='blue'>Password updated</h1>");
			out.println("<a href='adminDash.html> Back to admin page</a>");
			
			}
			catch (Exception e) {
				System.out.println(e);
			}
	}

}
