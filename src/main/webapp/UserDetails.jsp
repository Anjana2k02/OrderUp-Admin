<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
   <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="admin" items="${adminDetails}">
	
	${admin.ad_id}
	${admin.name}
	${cus.email}
	${cus.password}
	</c:forEach>
</body>
</html>