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

	<!-- ========= 로그인 정보 시작 =================================================== -->

		<form style="text-align: right;">	
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