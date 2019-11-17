<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSTL SQL Entering the database</title>
</head>
<body>
<sql:setDataSource var="ds" dataSource="jdbc/flights" />
<sql:query dataSource="${ds}" sql="SELECT * FROM flight" var="results" />
<c:forEach var="flights" items="${results.rows}">
	<p>Flight ID: ${flights.id} from ${flights.origin} to ${flights.destination}</p>
</c:forEach>
</body>
</html>