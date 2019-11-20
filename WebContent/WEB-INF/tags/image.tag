<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="width" required="false" type="java.lang.Integer" description="width of the image" %>
<%@ attribute name="stem" required="true" type="java.lang.String" description="name of the image without extension" rtexprvalue="true" %>
<%@ attribute name="extension" required="true" type="java.lang.String" description="extension of the image" rtexprvalue="true" %>


<c:set scope="page" var="imgname" value="${stem}.${extension}" ></c:set>

<c:if test="${empty width}">
	<c:set var="width" value="100" ></c:set>
</c:if>

<p><img width="${width}" src="${pageContext.request.contextPath}/pics/${imgname}"></p>