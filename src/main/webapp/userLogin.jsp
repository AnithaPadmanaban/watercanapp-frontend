<html>
<head>
<title>User Login</title>
<script>
function login() {
    
    event.preventDefault();
    var emailId = document.getElementById("userEmailId").value;
    var passwordId = document.getElementById("userPasswordId").value;
    var formData = "email=" + emailId + "&password=" + passwordId;
    console.log(formData);
    
    var url = "http://localhost:8080/maven-api/LoginServlet?" + formData;
    console.log(url);
   
    var formData = {};
    $.get(url, function(response) {
        console.log(response);
            var data= JSON.parse(response);
        
        if(data.errorMessage == null) {
            localStorage.setItem ("USER_ID",data);
        	alert("Login Successfully");
        	window.location.href="?pageName=userView.jsp";
        	
        }
        else
        	{
                	alert(data.errorMessage);
        	}
    });
}
</script>

</head>
<body style="text-align:center">

<br><br><h1>Welcome to login Page(User)</h1>
<div class="login">
<form>
<br><br><label>Email</label>
<input type="email" id="userEmailId" name="userEmailName"><br>
<label>Password</label>
<input type="password" id="userPasswordId" name="userPasswordName"><br>

<input type="button"  class="successBtn" onclick="login()" value="submit">

<input type="button" class="cancelBtn" onclick="window.location.href='?pageName=home.jsp'"value="Cancel">
</form>
</div>



</body>

</html>

