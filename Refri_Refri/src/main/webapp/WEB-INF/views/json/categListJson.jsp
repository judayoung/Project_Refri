<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


[
	<c:forEach items="${list }" var="t" varStatus="status">
		<c:if test="${not status.first }"> , </c:if>	
	
		{"num":${t.num }, "cate":"${t.cate }", "name":"${t.name }"  }
	
	</c:forEach>


]