
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("javax.servlet.jsp.jstl.fmt.fallbackLocale.page", java.util.Locale.US); %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ph" %>

<c:import url="/pageHeader.jsp"></c:import>

<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />
<sql:query dataSource="${ds}" sql="SELECT * FROM images WHERE id=?" var="results">
<sql:param>${param.id}</sql:param>
</sql:query>

<c:set scope="page" var="imageInfo" value="${results.rows[0]}"></c:set>

<c:set scope="page" var="imageName" value="${imageInfo.stem}.${imageInfo.image_extension}"></c:set>

<p><c:out value="${fn:toUpperCase(fn:substring(imageInfo.stem, 0, 1))}${fn:toLowerCase(fn:substring(imageInfo.stem, 1, -1))}" /></p>
<p><c:out value="${fn:length(imageInfo.stem)}"></c:out></p>

<p><ph:image stem="${imageInfo.stem}" extension="${imageInfo.image_extension}" /></p>
<img src="${pageContext.request.contextPath}/pics/${imageName}" />

<form action="${pageContext.request.contextPath}/PageController?id=${imageInfo.id}" method="post">
	Grade good: <input type="radio" name="grade" value="1">
	Grade very good: <input type="radio" name="grade" value="2" checked>
	Grade great: <input type="radio" name="grade" value="3">
	<input type="submit" value="OK">
</form>

<c:set scope="page" var="average_ranking" value="${imageInfo.average_ranking}" />

<c:if test='${param.action == "rate"}'>
	<c:set scope="page" var="newRating"
		value="${(imageInfo.average_ranking * imageInfo.ranking + param.grade)/(imageInfo.ranking + 1)}" />
			<c:set scope="page" var="average_ranking" value="${newRating}" />
			
		<sql:update dataSource="${ds}" sql="UPDATE images SET ranking=? WHERE id=?" var="results">
		<sql:param>${imageInfo.ranking + 1}</sql:param>
		<sql:param>${param.id}</sql:param>
		</sql:update>
		
		<sql:update dataSource="${ds}" sql="UPDATE images SET average_ranking=? WHERE id=?" var="results">
		<sql:param>${newRating}</sql:param>
		<sql:param>${param.id}</sql:param>
		</sql:update>
	</c:if>
			
	<h3>Number Format:</h3>
      <c:set var = "balance" value = "${average_ranking}" />
	<p>Formatted Number (3): <fmt:formatNumber type = "number" 
         maxFractionDigits = "1" value = "${balance}" /></p>

<c:import url="/pageFooter.jsp"></c:import>