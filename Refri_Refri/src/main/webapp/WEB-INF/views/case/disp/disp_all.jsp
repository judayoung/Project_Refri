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
function fn_foodClick(food_num){
	Swal.fire({ 
		title: '음식정보를 수정하겠습니까, 삭제하겠습니까?', 
		icon: 'question', 
		showCancelButton: true, 
		confirmButtonColor: '#3085d6', 
		cancelButtonColor: '#d33',
		confirmButtonText: '수정', 
		cancelButtonText: '삭제' 
	}).then((result) => { 
		if (result.isConfirmed) { 
			return false;
		}else{
			location.href="/food/del?num="+food_num;
	    }
	});	
}


</script>

</head>
<body>



	<c:if test="${empty list }">
		<p class="text-success">넣은 음식이 없어요~</p>
	</c:if>
	
	
	
	<c:if test="${not empty list }">
		
		<c:forEach items="${list }" var="f">
			<div id="${f.num }" class="div_food" onclick="fn_foodClick(${f.num })">
			
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