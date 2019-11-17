<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Links Picture Pages</title>
</head>
<body>
<h3>Pictures with links to Attribution URL</h3>
<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images LIMIT 10" var="results" ></sql:query>
<c:forEach var="photo" items="${results.rows}">
	<c:set scope="page" var="photoName" value="${photo.stem}.${photo.image_extension}" ></c:set>
	<p><img src="${pageContext.request.contextPath}/pics/${photoName}"></p>
	<c:set scope="page" var="name" value="${photo.stem}" ></c:set>
	<a href="${photo.attribution_url}">Photo origin link ${name}</a><br/>
</c:forEach>
</body>
</html>