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

<div id="addRefri">

	<h3>냉장고 추가하기</h3>
	
	<form action="/refri/add" method="post">
	
		<table border=1 cellspacing=0>
			<tr><th>이름</th><td><input type="text" name="name" value="냉장고">
				<input type="submit" value="추가"></td></tr>
		</table>
	
	</form>

</div>

</body>
</html>
