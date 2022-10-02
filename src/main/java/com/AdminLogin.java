package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		String admin=request.getParameter("Adminid");
		String password=request.getParameter("Pass");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();  
        session.setAttribute("Admin",  admin);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/flyaway";
			String user = "root";
			String pass = "root";
			Connection con = DriverManager.getConnection(url,user,pass);
			PreparedStatement st = con
			.prepareStatement("select admin_id,password from admin where admin_id=? and password=?");
			st.setString(1, admin);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				if(admin.equalsIgnoreCase(rs.getString(1)) && password.equalsIgnoreCase(rs.getString(2)) )
				response.sendRedirect("adminDash.html");
			} else {
				RequestDispatcher rd=request.getRequestDispatcher("adminLogin.html");
				rd.include(request, response);
				out.println("<h4><font color='red'><div style=\"text-align:center; width:100%\">Sorry... Invalid User Name or Password, Please Try Once Again</div></font></h4>");
			
			}
		}catch(Exception e) {
			out.println(e);
		}
	}
}
