<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>
function validation()
{
	var can=document.getElementById("adminCanId").value;
	var regex=/^[0-9]*$/;
	if(regex.test(can))
	{
	document.getElementById("canUpdateError").innerHTML="";

	}
else
	{
	document.getElementById("canUpdateError").innerHTML="Invalid Input";
	
	
	}
	}

function updateCan()
{
	 event.preventDefault();
var canUpdate=document.getElementById("adminCanId").value;
var formData="canUpdate="+canUpdate;
var url="http://localhost:8080/maven-api/UpdateStockServlet?" +formData;
$.get(url, function(response){
    console.log(response);
    var data= response;
    
    if ( data.errorMessage != null) {
    	alert(data.errorMessage);
    }
    else
    	{
    
    	alert("successfully Updated");
    	window.location.href= "?pageName=adminView.jsp";
    	}
       
    });

	}
</script>

</head>
<body style="text-align:center">
<br><br><h1>Enter Number of can to be added in Database</h1>
<div class="box_model">
<form onsubmit="updateCan()">

<br><br><label>Enter No of Can</label>
<input type="text" id="adminCanId" maxlength="4" onkeyup="validation()"><span id="canUpdateError" style="color:red"></span><br>
<input type="submit" id="btnAddStockId" class="successBtn"  value="Add Stock">
<input type="button" value="Cancel" class="cancelBtn"
			onclick="window.location.href='?pageName=adminView.jsp'">
</form>
</div>
</body>
</html>