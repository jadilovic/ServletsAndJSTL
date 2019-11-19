<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/pageHeader.jsp"></c:import>

<a href="${pageContext.request.contextPath}/PageController?action=images">Click to Go To All Images Page</a>
<br/>
<a href="${pageContext.request.contextPath}/PageController?action=image">Click to Go To Single Image Page</a>

<c:import url="/pageFooter.jsp"></c:import>