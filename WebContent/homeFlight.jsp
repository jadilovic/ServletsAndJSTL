<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Flights</title>
</head>
<body>
<sql:setDataSource var="ds" dataSource="jdbc/flights" />
<sql:query dataSource="${ds}" sql="SELECT * FROM flight WHERE id > 6" var="results" /> 
<p>Flights with ID greater than 6</p>
<c:forEach var="flight" items="${results.rows}">
	<p>Flight ID: ${flight.id} from ${flight.origin} to ${flight.destination}</p>
</c:forEach>
</body>
</html>