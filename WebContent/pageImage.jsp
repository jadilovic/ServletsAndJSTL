
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/pageHeader.jsp"></c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images WHERE id=?" var="results">
<sql:param>${param.id}</sql:param>
</sql:query>

<c:set scope="page" var="imageInfo" value="${results.rows[0]}"></c:set>

<c:set scope="page" var="imageName" value="${imageInfo.stem}.${imageInfo.image_extension}"></c:set>

<p><c:out value="${fn:toUpperCase(fn:substring(imageInfo.stem, 0, 1))}${fn:toLowerCase(fn:substring(imageInfo.stem, 1, -1))}" /></p>

<img src="${pageContext.request.contextPath}/pics/${imageName}" />

<c:import url="/pageFooter.jsp"></c:import>