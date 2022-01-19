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
    

</head>
<body>

<div class="container">

<div class="bs-docs-section">

	<h1 style="padding-top: 20px;">집에 뭐있지?</h1>
	
	<h3>로그인</h3>
	<form action="/member/login" method="post">
	
		<div class="form-group">
        	<label for="id">id</label>
      		<input type="text" class="form-control" name="id" value="yui">
    	</div>
    	<div class="form-group">
      		<label for="exampleInputPassword1">Password</label>
     		<input type="password" class="form-control" name="pwd" value="yui">
    	</div>

		<button type="submit" class="btn btn-primary">로그인</button>
		<button type="button" class="btn btn-secondary">회원가입</button>

	</form>
</div>

</div>




</body>
</html>