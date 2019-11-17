<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:import url="/header.jsp">
<c:param name="title" value="Pictures"></c:param>
</c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images LIMIT 10" var="results" />

<c:forEach var="image" items="${results.rows}">
<c:set scope="page" var="imageName" value="${image.stem}.${image.image_extension}">
</c:set>
	<p><img src="${pageContext.request.contextPath}/pics/${imageName}" /></p>
</c:forEach>

<c:import url="/footer.jsp"></c:import>