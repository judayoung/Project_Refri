<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath }/resources/memberCss.css" />  
<!-- webapp/resources 가 디폴트 경로.  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function fn_loadNameList(){
	var html="<select name='nameExist' id='selectExist'>";
	html+="<option>있는 이름들</option>";
	html+="<c:forEach items='${nameList }' var='n'><option value='${n}''>${n }</option></c:forEach>";
	html+="</select>";
	$("#div_Exist").html(html);
}
function fn_selectedNameList(nameList){
	var html="<select name='nameExist' id='selectExist'>";
	
	if(nameList.length==0){
		html+="<option>등록된 이름 없음</option>";
	}else{
		html+="<option>"+nameList[0].cate+"에 있는 이름</option>";
		for(var i=0;i<nameList.length;i++){
			html+="<option value='"+nameList[i].num+"'>"+nameList[i].name+"</option>" 
		}
	}
	
	html+="</select>";
	$("#div_Exist").html(html);
}

$(document).ready(function(){

	fn_loadNameList();
	
	$("#selectCate").change(function(){
		var cate=$(this).val();
		
		$.post("/categ/findByCate", {cate:cate})
		.done(function(json){
			var nameList=JSON.parse(json);
			fn_selectedNameList(nameList);
		})
		.fail(function(){
			alert("error");
		});
	});
	
});
</script>

</head>
<body>



<div id="addCateg">
	<h3>카테고리 등록</h3>
	<form name="f" action="/categ/addOne" method="post" enctype="multipart/form-data">
	
		카테고리 : 
		<select name="cate" id="selectCate">
			<option>카테고리 선택</option>
			<c:forEach items="${list }" var="t">
				<option value="${t }">${t }</option>
			</c:forEach>
		</select>  
		
		<br>
		제품이름 : <input type="text" name="name" placeholder="예) 사과">
		<b id="nameDupl"></b>
		<div id="div_Exist">
		</div>
		
		<br>
		
		이미지 파일 : <input type="file" name="file"><br><br>
		
		<input type="submit" value="추가">
	
	</form>
</div>



</body>
</html>