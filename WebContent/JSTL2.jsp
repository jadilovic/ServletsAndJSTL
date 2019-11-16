<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSTL #2</title>
</head>
<body>
<c:out value="Hello JSTL 2" ></c:out>

<jsp:useBean id="test" class="beans.TestBean" scope="page"></jsp:useBean>

<p>Method from the Bean: <c:out value="${test.info}" /></p>

<%-- Getting Paramaters --%>
<p>Name paramater: <c:out value="${param.name}" />
</p>
<%--JSTL IF Statement --%>
<c:if test='${param.name == "Bob"}'>
Hello Bob
</c:if>
<c:if test='${param.name != "Bob"}'>
Hello there
</c:if>

<%-- JSTL Coose --%>
<br/>

<c:choose>
	<c:when test='${param.id == 1}'>
	ID is equal to: 1
	</c:when>
	<c:when test='${param.id == 2}'>
	ID is equal to: 2
	</c:when>
	<c:otherwise>
	ID is equal to: 0
	</c:otherwise>
</c:choose>

<%-- JSTL "For" Loop --%>
<c:forEach var="i" begin="0" end="10" step="2" varStatus="status">
	Loop iteration: <c:out value="${i}"/>
	<c:if test="${status.first}"> First Loop</c:if><br/>
	<c:if test="${status.last}"> Last Loop</c:if><br/>
</c:forEach>
</body>
</html>