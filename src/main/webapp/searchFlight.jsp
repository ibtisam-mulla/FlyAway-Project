<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="skyblue" style="text-align: value;"><h1>Book your Tickets</h1>
<%
String src = request.getParameter("Source");
String dest = request.getParameter("Destination");
String date=request.getParameter("Date");
String p=request.getParameter("Person");
session.setAttribute("src",src);
session.setAttribute("dest",dest);
session.setAttribute("date",date);
session.setAttribute("p",p);

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/flyaway";
String user = "root";
String pass = "root";
Connection con = DriverManager.getConnection(url, user, pass);
PreparedStatement st = con.prepareStatement("select * from flights where src= ? and dest=?");
st.setString(1,src );
st.setString(2,dest);
ResultSet rs = st.executeQuery();

%>

<table border="1">
	<tr>
		<th>F_id</th>
		<th>airline</th>
		<th>source</th>
		<th>destination</th>
		<th>price</th>
	</tr>
	<%
	while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getInt(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		
	</tr>
	<%
	session.setAttribute("fno",rs.getInt(1));
	session.setAttribute("pay",rs.getString(5));
	}
	%>
</table>
<br>
<form action="customerdetails.jsp" method="post">
	<br> <input type="submit" value="Book Ticket">

</form>


</body>
</html>