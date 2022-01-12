<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath }/resources/memberCss.css" />  
<!-- webapp/resources 가 디폴트 경로.  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<h3>음식관리 팁 게시판</h3>

<a href="/board/addFreshSwitch">음식관리 팁 작성하기</a>

</body>
</html>