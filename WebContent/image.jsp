<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>

<c:import url="header.jsp"></c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images WHERE id=?" var="results">
	<sql:param>${param.image}</sql:param>
</sql:query>
	<c:set scope="page" var="image" value="${results.rows[0]}"></c:set>	
	<c:set scope="page" var="imageName" value="${image.stem}.${image.image_extension}"></c:set>
	<img src="${pageContext.request.contextPath}/pics/${imageName}">

<c:import url="footer.jsp"></c:import>