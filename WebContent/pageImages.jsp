
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>

<c:import url="/pageHeader.jsp"></c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images" var="results"></sql:query>

<c:forEach var="image" items="${results.rows}" >
	<c:set var="imageID" value="${image.id}"></c:set>
	<c:set var="imageName" value="${image.stem}.${image.image_extension}"></c:set>
	<c:set var="imageLocation" value="${pageContext.request.contextPath}/pics/${imageName}"></c:set>
	
	<a href="${pageContext.request.contextPath}/PageController?action=image&id=${imageID}">
		<img width="80" src="${imageLocation}" />
	</a>
	
</c:forEach>

<c:import url="/pageFooter.jsp"></c:import>