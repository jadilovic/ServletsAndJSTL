
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>

<c:import url="/header.jsp"></c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images" var="results"></sql:query>

<table class="images">

<c:forEach var="image" items="${results.rows}" varStatus="row">

<c:set var="tableWidth" value="8"></c:set>
	
		<c:if test="${row.index % tableWidth == 0}">
			<tr>
		</c:if>
			
			<c:set var="imageName" value="${image.stem}.${image.image_extension}"></c:set>
			<td><img width="80" src="${pageContext.request.contextPath}/pics/${imageName}"></td>
		
		<c:if test="${row.index + 1 % tableWidth == 0}">
			</tr>
		</c:if>

</c:forEach>

</table>

<c:import url="/footer.jsp"></c:import>