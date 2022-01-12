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

<div class="container1">

	<div class="myInfo1">
		<c:import url="../myInfo.jsp" />
	</div>
	
	<div class="title1">
		<c:import url="../header.jsp" />
	</div>


	<div class="board1">
		<h1>집에 뭐있지?</h1>
	</div>
	
</div>
	
	
<div class="container1">
	<div class="footer1">
		<c:import url="../footer.jsp" />
	</div>

</div>


</body>
</html>