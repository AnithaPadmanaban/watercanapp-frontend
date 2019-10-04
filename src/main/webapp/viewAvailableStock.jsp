<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Stock By User</title>

<script>
function viewStock()
{
   var url = "http://localhost:8080/maven-api/ViewAvailabilityServlet";
   $.getJSON(url, function(response){
       console.log(response);
       var data = response;
       var content="";
       document.getElementById("stock").innerHTML="";
      
           content += "<tr>";
           content += "<td>" + data.availability_stock + "</td>";
           content += "<td>" + data.inserted_date +"</td>";
           content += "</tr>";
      
       document.getElementById("stock").innerHTML = content;
   });
}
</script>
</head>

<body style="text-align:center">


<br><br><h1>Available Stock</h1>

<br><br><div id="stock-section">
       <table border="1" class="table table-condensed">
           <thead>
               <tr>
                   <th>Stock Availabilty</th>
                   <th>Date</th>
               </tr>
           </thead>
           <tbody id="stock">
           </tbody>
       </table>
   </div>
   <input type="button" value="Back" class="btn btn-danger" onclick="window.location.href='?pageName=userView.jsp'">
   
<script>
viewStock();
</script>

</body>
</html>