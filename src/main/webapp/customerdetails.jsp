<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login{  
        width: 300px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 3 3 350px;  
        padding: 30px;  
       
        border-radius: 5px ; 
        
          
}  

label{  
    color: white;  
    font-size: 17px;  
}  
#pro{  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
}  

#log{  
 	float: center;
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
<form action="payselect.jsp"><center>
<font size="30" color="white">Enter your details</font></center>
<div class="login"> 
<label><b>
Enter Passenger name:</b></label>
<input type="text" id="pro" name="Passenger"><br><br>
<label><b>
Enter Passport no:</b></label>
<input type="text" id="pro" name="Passno"><br><br>
<label><b>
Enter Phone-no:</b></label>
<input type="text" id="pro" name="P_no"><br><br>
<label><b>
Enter age:</b></label>
<input type="text" id="pro" name="age"><br><br><br>
</div>
<center>
<input type="submit" id="log" value="submit">
</center>

</form>
</body>
</html>