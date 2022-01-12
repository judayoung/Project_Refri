<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    	
    <title>index</title>

	<!-- 1. Css -->
	<!-- webapp/resources 가 디폴트 경로.  -->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/layoutit_css.css" />

	<!-- 2. JS -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
	<script id="_carbonads_projs" type="text/javascript" src="https://srv.carbonads.net/ads/CKYIE23N.json?segment=placement:bootswatchcom&amp;callback=_carbonads_go"></script>
	<script src="../_vendor/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
    <script src="../_assets/js/custom.js"></script>


</head>
<body>

	<!-- ========= 로그인 정보 시작 =================================================== -->

		<form>	
			<h5>
                ${sessionScope.id } 님 로그인 중. 	
                <button type="button" class="btn btn-primary btn-sm">로그아웃</button>	
                <small class="text-muted">현재 냉장고 : ${sessionScope.r.name }</small>
            </h5>
            <h6><small>${caseListSwitchResult }${caseAddSwitchResult }</small></h6>
		</form>

	<!-- ========= 로그인 정보 끝 =================================================== -->


</body>
</html>