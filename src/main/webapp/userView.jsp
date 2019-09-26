<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>User View</title>
<script>
function logout()
{
	localStorage.clear();
	window.location.href="?pageName=home.jsp";
	}
</script>
</head>
<body style="text-align:center">
<br><br><h1>What do you like to perform</h1>
<div class="box_model">
<form action="">
<br><br><a href="?pageName=viewAvailableStock.jsp">View Stock Availability</a> <br>
<a href="?pageName=orderCan.jsp">Order Can</a><br>
<a href="?pageName=reserveCan.jsp">Reserve Can</a><br>
<!-- <a href="?pageName=orderReservedCane">Order Reserved Can</a><br> -->
<a href="?pageName=home.jsp">Home</a><br>
<button class="cancelBtn" onclick="logout()">Logout</button>
</form>
</div>
</body>
</html>