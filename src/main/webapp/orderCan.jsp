<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="text-align:center">
	
	
	<script type="text/javascript">

	function validation()
	{
		var can=document.getElementById("orderCanID").value;
		var regex=/^[0-9]*$/;
		if(regex.test(can))
		{
		document.getElementById("canOrderError").innerHTML="";
		document.getElementById("btnAddStockId").disabled="false";
		}
	else
		{
		document.getElementById("canOrderError").innerHTML="Invalid Input";
		document.getElementById("btnAddStockId").disabled="true";
		
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
    var data= response;
       if(data.errorMessage == null) {
    	alert("Ordered Succesfully");
    	window.location.href= "?pageName=userView.jsp";
    	
    }
    else
    	{
    	    	alert(data.errorMessage);
    	}
});
}
</script>
<br><br><h1>Can Order</h1>
<div class="box_model">
	<form onsubmit="canOrder()">
	
		<br><br><label>Enter no of Can</label> <input type="text" id="orderCanID" maxlength="3" onkeyup="validation()"
			name="orderCanName"><span id="canOrderError" style="color:red"></span><br> 
			<input
			type="submit" value="Submit" class="successBtn">
			<input type="button"
			value="Cancel" class="cancelBtn"
			onclick="window.location.href ='?pageName=userView.jsp'"> 
	</form>
	</div>
</body>
</html>