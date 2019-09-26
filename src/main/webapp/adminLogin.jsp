<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>


<script>
function adminLogin()
{

	  event.preventDefault();
	    var emailId = document.getElementById("adminEmailId").value;
	    var passwordId = document.getElementById("adminPasswordId").value;
	    var formData = "email=" + emailId + "&password=" + passwordId;
	    console.log(formData);
	    
	    var url = "http://localhost:8080/maven-api/AdminLoginServlet?" + formData;
	    console.log(url);
	    var formData = {};
	    $.get(url, function(response) {
	        console.log(response);
	  	        var data= JSON.parse(response);
	       if(data.errorMessage ==null) {

	    	   alert("Login Succesfully");
	        	window.location.href= "?pageName=adminView.jsp";
	    	  
	    	   
	        	
	        }
	        else
	        	{
	        	  
	        	alert(data.errorMessage);
	        	window.location.href= "?pageName=adminLogin.jsp";
		    	
	        	}
	    });
	}

</script>

</head>
<body style="text-align:center">
<br><br><h1>Admin Page</h1>
<div class="login">
<form onsubmit="adminLogin()">
<br><br><label>Email</label>
<input type="email" id="adminEmailId" name="adminEmailName"><br>
<label>Password</label>
<input type="password" id="adminPasswordId" name="adminPasswordName"><br>
<input type="submit" value="Submit" class="successBtn">
<input type="button" value="Cancel" class="cancelBtn"  onclick="window.location.href='?pageName=home.jsp';">
</form>
</div>
</body>
</html>