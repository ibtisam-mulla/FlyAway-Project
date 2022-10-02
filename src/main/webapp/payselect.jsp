<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

label{  
    color: white;  
    font-size: 20px;  
}  
#pro{  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
}  
#log{  
    width: 145px;  
    height: 30px;  
    border: none;  
    border-radius: 17px;  
    padding-left: 7px;  
    color: blue;
    font-size: 17px;    
  
}  
    </style> 
</head>
<body bgcolor="dodgerblue">
<font size="30" color="white"> Flight Details</font><br><br>
<label>
Flight No :<%=session.getAttribute("fno") %><br>
Date of departure :<%=session.getAttribute("date") %><br>
From :<%=session.getAttribute("src") %><br>
To :<%=session.getAttribute("dest") %><br>
Passenger Name :<%=request.getParameter("Passenger") %><br>
Passport No : <%=request.getParameter("Passno") %><br>
Phone No :<%=request.getParameter("P_no") %><br>
No of Persons :<%=session.getAttribute("p") %><br></label>
<font size="20" color="white"> Payment Details</font><br><br>
<label>
total amount :${pay*p} Rs</label><br>
<form action="pay.jsp">
<label>
Debit Card No :
<input type="text" name="depit" style="height:20px; width:200px"><br>
Expiry Date :
<input type="text" name="expiry" style="height:20px; width:220px"><br>
CVV No :
<input type="text" name="cvv" style="height:20px; width:245px"><br></label><br>
<input type="submit" id="log"  value="pay">
</form>
</body>
</html>