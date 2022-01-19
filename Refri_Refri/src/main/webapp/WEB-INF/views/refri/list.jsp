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

<script>
$(document).ready(function(){
	$("#info").hide();
	
	$(".addRefri").click(function(){
		location.href="/refri/addSwitch";
	});
	
	$("table").mouseover(function(){
		$("#info").show();
	});
	$("table").mouseout(function(){
		$("#info").hide();
	});
	
	$("tr").on("mousedown",function(e){
		if(e.which===1){  // 케이스 추가
			var td=$(this).children();
			var num=0;
			num=td.eq(0).text();
			location.href="/case/addSwitch?r_num="+num;
		}else if(e.which===3){  // 냉장고 편집
			
		}
	});

});
</script>

</head>
<body>

<div id="refri_list">
	<h3>냉장고 리스트 <span id="info" style="font-size:10px">좌:케이스추가 우:냉장고편집</span></h3>
	
	
	<c:if test="${empty list }">냉장고가 없습니다. <br><br></c:if>
	
	<c:if test="${not empty list }">
		<table>
			<tr><th>num</th><th>name</th></tr>
			
			<c:forEach items="${list }" var="r">
				<tr><td>${r.num }</td><td>${r.name }<br>
					<img src="/refri/img?num=0" width=30%></td></tr>
			</c:forEach>
		</table><br>
	</c:if>
	
	<span class="addRefri">냉장고 추가하기</span> <br><br>
	
	<c:if test="${empty list }"><img src="/refri/img?num=0" width=30%></c:if>
</div>

</body>
</html>