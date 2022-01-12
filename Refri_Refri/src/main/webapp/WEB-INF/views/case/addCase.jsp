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

<div id="addCase">

	<h3>'${sessionScope.r.name }'에 케이스 추가하기</h3>
	
	<form action="/case/add" method="post">
		<input type="hidden" name="r_num" value="${sessionScope.r.num }">
		
		<table border=1 cellspacing=0>
			<tr><th>이름</th><td><input type="text" name="name" value="케이스"></tr>
			<tr><th>냉장고위치</th><td><input type="text" name="disp" value=0>
				<input type="submit" value="추가"></td></tr>
		</table>
		<b>냉장고위치는 추후 결정할 수도 있습니다.</b>
	
	</form>

</div>

</body>
</html>
