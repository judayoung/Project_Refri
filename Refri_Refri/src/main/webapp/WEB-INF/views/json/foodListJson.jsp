<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


[	<c:forEach items="${list }" var="f" varStatus="status">
	<c:if test="${not status.first }"> , </c:if>
{ "num":${c.num},
"r_num":${c.r_num},
"name":"${c.name}",
"disp":${c.disp}  }
	</c:forEach>	]