<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Order Can</title>
</head>
<body style="text-align:center">
	
	
	<script type="text/javascript">

	function validation()
	{
		var can=document.getElementById("orderCanID").value;
		var regex=/^[1-9][0-9]*$/;
		if(regex.test(can))
		{
		document.getElementById("canOrderError").innerHTML="";
		
		}
	else
		{
		document.getElementById("canOrderError").innerHTML="Invalid Input";
		
		}
		}
	
function canOrder()
{
	 event.preventDefault();
var orderCan = document.getElementById("orderCanID").value;
var userId = localStorage.getItem("USER_ID");
var formData = "can=" + orderCan+"&userId="+userId;

var url = "http://localhost:8080/maven-api/OrderCanServlet?" + formData;
var formData = {};
$.get(url, function(response) {
	    console.log(response);   
	    var data=JSON.parse(response);
       if(data.errorMessage!= null) {
    	
    	   alert(data.errorMessage);
    }
    else
    	{
    	alert("Ordered Succesfully");
    	window.location.href= "?pageName=userView.jsp";
    	    	
    	}
});
}
</script>
<br><br><h1>Can Order</h1>
<div class="box_model">
	<form onsubmit="canOrder()">
	
		<br><br><label>Enter number of water-cans</label> <input type="text" id="orderCanID" onkeyup="validation()"
			name="orderCanName"><br><span id="canOrderError" style="color:red"></span><br> 
			<input
			type="submit" value="Submit" class="successBtn">
			<input type="button"
			value="Cancel" class="cancelBtn"
			onclick="window.location.href ='?pageName=userView.jsp'"> 
	</form>
	</div>
</body>
</html>