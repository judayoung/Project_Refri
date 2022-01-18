<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>


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



</body>
</html>