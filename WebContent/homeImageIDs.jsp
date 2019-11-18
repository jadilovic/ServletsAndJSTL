
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>

<c:import url="/header.jsp"></c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images LIMIT 10" var="results"></sql:query>
<c:forEach var="image" items="${results.rows}" >
	<c:set var="imageName" value="${image.stem}.${image.image_extension}" ></c:set>
	<p><img src="${pageContext.request.contextPath}/pics/${imageName}" /></p>
	<b>Image ID: ${image.id} and Name: ${imageName} </b><br/>
	<b>Owner Link: ${image.attribution_url} </b><br/>
</c:forEach>

<c:import url="/footer.jsp"></c:import>