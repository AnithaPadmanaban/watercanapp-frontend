<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Order Reserved Can</title>
</head>
<body style="text-align:center">
	
	
	<script type="text/javascript">

	function validation()
	{
		var id=document.getElementById("reservedId").value;
		var regex=/^[1-9][0-9]*$/;
		if(regex.test(id))
		{
		document.getElementById("reservedIdError").innerHTML="";
		
		}
	else
		{
		document.getElementById("reservedIdError").innerHTML="Invalid Input";
		
		}
		}
	
function canOrder()
{
	 event.preventDefault();
var reserveId = document.getElementById("reservedId").value;
var userId = localStorage.getItem("USER_ID");
var formData = "reserveId=" + reserveId+"&userId="+userId;

var url = "http://localhost:8080/maven-api/OrderReservedCanServlet?" + formData;
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
<h1>Can Order</h1>
<div class="box_model">
	<form onsubmit="canOrder()">
	
		<label>Enter your reserved id</label> <input type="text" id="reservedId" onkeyup="validation()"
			name="reservedName"><br><span id="reservedIdError" style="color:red"></span><br> 
			<p>To conform order press submit button</p>
			<input
			type="submit" value="Submit" class="successBtn">
			<p>To modify reserved Order press modify button</p>
			<input type="button" value="Modify" class="resetBtn" 	onclick="window.location.href ='?pageName=modifyOrder.jsp'">
			<input type="button"
			value="Cancel" class="cancelBtn"
			onclick="window.location.href ='?pageName=userView.jsp'"> 
	</form>
	</div>
</body>
</html>