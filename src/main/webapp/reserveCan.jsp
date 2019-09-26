<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Reserve Can</title>
</head>
<body style="text-align:center">

<script type="text/javascript">
function validation()
{
	var can=document.getElementById("reserveCanID").value;
	var regex=/^[0-9]*$/;
	if(regex.test(can))
	{
	document.getElementById("canReserveError").innerHTML="";
	//document.getElementById("btnAddStockId").disabled="false";
	}
else
	{
	document.getElementById("canReserveError").innerHTML="Invalid Input";
	//document.getElementById("btnAddStockId").disabled="true";
	
	}
	}

function canReserve()
{

	 event.preventDefault();
	 var reserveCan = document.getElementById("reserveCanID").value;
	 var userId = localStorage.getItem("USER_ID");
	 var formData = "can=" + reserveCan+"&userId="+userId;

	 var url = "http://localhost:8080/maven-api/ReserveCanServlet?" + formData;
	 var formData = {};
	 $.get(url, function(response) {
	 	    console.log(response);   
	     var data= response;
	        if(data.errorMessage == null) {
	     	alert("Reserved Succesfully");
	     	window.location.href= "?pageName=userView.jsp";
	     	
	     }
	     else
	     	{
	     	    	alert(data.errorMessage);
	     	}
	 });
}
</script>
<br><br><h1>Can Reservation</h1>
<div class="box_model">
<form onsubmit="canReserve()">
<br><br><label>Enter no of Can</label>
<input type="text" id="reserveCanID" name="reserveCanName" maxlength="3"  onkeyup="validation()"><span id="canReserveError" style="color:red"></span><br>
<input type="submit" value="Submit"  class="successBtn">
<input type="button" value="Cancel" class="cancelBtn" onclick="window.location.href ='?pageName=userView.jsp';">
</form>
</div>
</body>
</html>