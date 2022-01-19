<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath }/resources/iframeCss.css" />  
<!-- webapp/resources 가 디폴트 경로.  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
var foodNum=0;

function fn_delFood(num){
	location.href="/food/del?num="+num;
}

$(document).ready(function(){
	$(".div_food").on("mousedown",function(e){
		foodNum=$(this).attr("id");
		
		if(e.which===3){
			var flag=confirm("정말 이 음식을 삭제하겠습니까?");
			if(flag){
				fn_delFood(foodNum);
			}
			
		}else if(e.which===1){
			
		}
	});
});
</script>

</head>
<body>



	<c:if test="${empty list }">
		넣은 음식이 없어요~
	</c:if>
	
	
	
	<c:if test="${not empty list }">
		
		<c:forEach items="${list }" var="f">
			<div id="${f.num }" class="div_food">
			
				<input type="hidden" value=${f.c_num } id="c_num">
				<input type="hidden" value=${f.num } id="num">
			
				<img src="/food/img?num=${f.num }" width=40 height=40>  <br>
				${f.name }  <br>
				${f.up_date } 
				

			</div>
		</c:forEach>

		
	</c:if>



</body>
</html>