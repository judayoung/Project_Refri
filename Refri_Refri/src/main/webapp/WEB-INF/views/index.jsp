<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    	
    <title>집에 뭐 있지?12</title>

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

	<div class="title1">
		<c:import url="header.jsp" />
	</div>


	<div class="board1">
		<h1>집에 뭐있지?</h1>
	</div>
	
	
	<div class="aside1">

		<!-- =======로그인 form 시작==================================================== -->
            <form action="/member/login" method="post">
              <fieldset>
                <legend>로그인</legend>
                  <div class="form-group">
                    <label for="exampleInputEmail1">id</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="id" value="yui" name="id">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" value="yui" name="pwd">
                    <small id="pwdHelp" class="form-text text-muted"></small>
                  </div>
                  <button type="submit" class="btn btn-primary">로그인</button>
                  <button type="button" class="btn btn-primary">회원가입</button>
              </fieldset>
            </form>
		<!-- =======로그인 form 끝==================================================== -->
	</div>
	
	
	<div class="footer1">
		<c:import url="footer.jsp" />
	</div>


</div>


</body>
</html>