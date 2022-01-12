<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    	
    <title>Main</title>

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
	  <!-- Navbar
      ================================================== -->
      <div class="bs-docs-section clearfix">
        <div class="row">
          <div class="col-lg-12">

            <div class="bs-component">
              <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#">집에 뭐있지?</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor01">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                      <a class="nav-link" href="/case/listSwitch">케이스 리스트
                        <span class="sr-only">(current)</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">음식 리스트</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/refri/listSwitch">냉장고 리스트</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/board/listFreshSwitch">음식관리 팁</a>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">추가하기</a>
                      <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">음식 추가하기</a>
                        <a class="dropdown-item" href="/case/addSwitch">케이스 추가하기</a>
                        <a class="dropdown-item" href="/refri/addSwitch">냉장고 추가하기</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/categ/addSwitch">카테고리 추가하기</a>
                      </div>
                    </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                  </form>
                </div>
              </nav>
        	</div>
        	            
          </div>
        </div>
      </div>
	  <!-- Navbar 끝
      ================================================== -->
	</div>
	

	<div class="aside1">
		aside
	</div>
	
	
	<div class="section1">
		<c:set var="url">
			<c:if test="${sessionScope.section=='refriList' }">/refri/list</c:if>		
			<c:if test="${sessionScope.section=='refriAdd' }">/refri/addRefri</c:if>
			<c:if test="${sessionScope.section=='caseList' }">/case/list</c:if>
			<c:if test="${sessionScope.section=='caseAdd' }">/case/addCase</c:if>
			<c:if test="${sessionScope.section=='categAdd' }">/categ/addCateg</c:if>
			<c:if test="${sessionScope.section=='boardFreshList' }">/board/listFresh</c:if>
			<c:if test="${sessionScope.section=='boardFreshAdd' }">/board/addFresh</c:if>
		</c:set>
		<c:import url="${url }" />
		
	</div>
	
	<div class="footer1">
		21/12/09 ~ 22/01/ - 집에 뭐있지?
	</div>


</div>


</body>
</html>