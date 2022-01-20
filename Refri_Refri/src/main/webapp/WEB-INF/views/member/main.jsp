<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<!-- 1. Bootstrap Css / Bootwatch cosmo -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.1/dist/cosmo/bootstrap.min.css" 
	crossorigin="anonymous">

    <!-- 2. jquery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- 3. Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<!-- 4. swal.fire : alert, confirm 창. -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script>
$(document).ready(function(){
	$(".addRefri").click(function(){
		location.href="/refri/addSwitch";
	});	
	$(".listRefri").click(function(){
		location.href="/refri/listSwitch";
	});
	
	$(".listCase").click(function(){
		location.href="/case/listSwitch";
	});
	$(".addCase").click(function(){
		location.href="/case/addSwitch";
	});
	
	$(".addCateg").click(function(){
		location.href="/categ/addSwitch";
	});
	
	
	
});
</script>

</head>
<body style="padding: 10px;">

<div id="loginInfo" style="text-align: right;">
	<p class="text-primary">
		${sessionScope.id } 님 로그인 중. 
		<button type="button" class="btn btn-secondary" style="font-size: 9px; padding: 1px;">로그아웃</button>
	</p>
	<p class="text-primary">
		<b>현재 냉장고 : ${sessionScope.r.name }</b>
	</p>
</div>

<div id="tryResult">
	<b>${caseListSwitchResult }</b>
	<b>${caseAddSwitchResult }</b> 
</div>


<div id="header">

	<div id="nav1">
		<ul class="nav nav-pills">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">리스트/추가하기</a>
				
				<div class="dropdown-menu" style="">
					<a class="dropdown-item" href="#"><span class="listRefri">냉장고 리스트</span></a>
      				<a class="dropdown-item" href="#"><span class="listCase">케이스 리스트</span></a>
      				<a class="dropdown-item" href="#">음식 리스트</a>
      				<a class="dropdown-item" href="#">음식기한 리스트</a>
      				
      				<div class="dropdown-divider"></div>
      				<a class="dropdown-item" href="#"><span class="addRefri">냉장고 추가하기</span></a>
      				<a class="dropdown-item" href="#"><span class="addCase">케이스 추가하기</span></a>
      				<a class="dropdown-item" href="#"><span class="addCateg">카테고리 추가하기</span></a>
      				<a class="dropdown-item" href="#">음식 추가하기</a>
    			</div>
    			
			</li>
		</ul>
	<hr></div>

</div>


	<div style="padding: 20px;">
		<c:if test="${sessionScope.section=='refriList' }"><c:import url="/refri/list" /></c:if>		
		<c:if test="${sessionScope.section=='refriAdd' }"><c:import url="/refri/addRefri" /></c:if>
		<c:if test="${sessionScope.section=='caseList' }"><c:import url="/case/list" /></c:if>
		<c:if test="${sessionScope.section=='caseAdd' }"><c:import url="/case/addCase" /></c:if>
		<c:if test="${sessionScope.section=='categAdd' }"><c:import url="/categ/addCateg" /></c:if>
	</div>


<div id="footer" style="clear:both;">
	21/12/09 ~ 22/02/10 - 집에 뭐있지?
</div>


</body>
</html>