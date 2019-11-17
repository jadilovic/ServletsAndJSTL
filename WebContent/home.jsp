<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="/header.jsp">
<c:param name="title" value="Picture Squirell Home"></c:param>
</c:import>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" />
<sql:query dataSource="${ds}" sql="SELECT * FROM user" var="results" />

<c:forEach var="users" items="${results.rows}">
	<p>${users.email}.${users.password}</p>
</c:forEach>

<c:import url="footer.jsp"></c:import>