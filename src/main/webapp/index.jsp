<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
</head>
<body style="text-align:center">
<jsp:include page="header.jsp"></jsp:include>


<div class="view" id="view">
        <%
            String pageName = request.getParameter("pageName");http:

            if (pageName == null || "".equals(pageName)) {
                pageName = "home.jsp";
            }
            // out.println(pageName);
        %>

        <jsp:include page="<%=pageName%>"></jsp:include>
    </div>

<div class="footer">Copyright @2019 Chennai,India.Inc All rights reserved</div>
</body>
</html>