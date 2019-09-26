
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

</head>
<body style="text-align:center">

<br><br><h1>Welcome To Register Page</h1>


<script>




function validateName()
{
	var name=document.getElementById("userNameId").value;
	var nameRegex=/^[A-Za-z]*$/;
	if(nameRegex.test(name))
	{
	document.getElementById("nameError").innerHTML="";
	}
else
	{
	document.getElementById("nameError").innerHTML="Name should contain alphabets only";
	
	}
}
function validateEmail()
{
var email=document.getElementById("userEmailId").value;
var emailRegex=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
if(emailRegex.test(email))
	{
	document.getElementById("emailError").innerHTML="";
	}
else
	{
	document.getElementById("emailError").innerHTML="Please enter valid email";
	
	}
}
function validatePassword()
{
	var password=document.getElementById("userPasswordId").value;
	var passwordRegex=/^[A-Za-z0-9]*$/;
if(passwordRegex.test(password))
	{
	document.getElementById("passwordError").innerHTML="";
	}
else
	{
	document.getElementById("passwordError").innerHTML="Password should contain alphabets or numbers";
	
	}
}

function validateAddress()
{
	var address=document.getElementById("userAddressId").value;
	var addressRegex=/^[a-zA-Z0-9\s,'-]*$/;
		
	if(addressRegex.test(address))
	{
	document.getElementById("addressError").innerHTML="";
	}
else
	{
	document.getElementById("addressError").innerHTML="Invalid Address";
	
	}
	
	}
function buttonEnable()
{
	var name=document.getElementById("userNameId").value;
	var nameRegex=/^[A-Za-z]*$/;
	var email=document.getElementById("userEmailId").value;
	var emailRegex=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
	var password=document.getElementById("userPasswordId").value;
	var passwordRegex=/^[A-Za-z0-9]*$/;
	var address=document.getElementById("userAddressId").value;
	var addressRegex=/^[a-zA-Z0-9\s,'-]*$/;

	
	if(nameRegex.test(name) && emailRegex.test(email) && passwordRegex.test(password) && addressRegex.test(address))
		{
		document.getElementById("registerBtnId").disabled=false;
		}
	else
		{
		document.getElementById("registerBtnId").disabled=true;
		
		}
	}

function registerServlet()
{
	event.preventDefault();
	var name = document.getElementById("userNameId").value;
	var email=document.getElementById("userEmailId").value;
	var password=document.getElementById("userPasswordId").value;
	var address=document.getElementById("userAddressId").value;
	
	var formData = "name=" +name + "&email="+ email +"&password="+ password+"&address="+address;
    var url = "http://localhost:8080/maven-api/RegisterServlet?" + formData;
    console.log(url);
    $.get(url, function(response){
    console.log(response);
    var data= response;
    
    if ( data.errorMessage != null) {
    	alert(data.errorMessage);
    }
    else
    	{
    
    	alert("successfully registered");
    	window.location.href= "?pageName=userLogin.jsp";
    	}
       
    });
	
	}
</script>
<div class=container>
<form>
<br><br><label>Enter Name</label>
<input type="text" id="userNameId" name="userName" onkeyup="validateName()"><span style="color:red" id="nameError"></span><br>
<label>Enter Email</label>

<input type="email" id="userEmailId" name="userEmailName" onblur="validateEmail()"><span style="color:red" id="emailError"></span><br>

<label>Enter Password</label>
<input type="password" id="userPasswordId" name="userPasswordName" maxlength="8" onkeyup="validatePassword();"><span style="color:red" id="passwordError"></span><br>
<label>Enter Address</label>
<textarea id="userAddressId" name="userAddressName" onkeyup="validateAddress();buttonEnable();"></textarea><span style="color:red" id="addressError"></span><br>
<input type="button" onclick="registerServlet()" id="registerBtnId" class="successBtn" disabled value="Register">
<input type="button" id="btnCancel" value="Cancel" class="cancelBtn" onclick="window.location.href='?pageName=home.jsp'">

</form>
</div>
</body>
</html>