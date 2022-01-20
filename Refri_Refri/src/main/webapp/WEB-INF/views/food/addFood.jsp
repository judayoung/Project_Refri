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
var closeFlag=${closeFlag };

function fn_winClose(closeFlag){
	if(closeFlag){
		opener.location.reload();
		window.close();
	}
}


$(document).ready(function(){
	fn_winClose(closeFlag);
	
	$("#else").hide();
	$(".dateHidden").hide();
	$("#div_img").hide();
	
	$("#more").click(function(){
		if($(this).text()=="내용 더보기"){
			$(this).text("내용 숨기기");
			$("#else").show();
		}else{
			$(this).text("내용 더보기");
			$("#else").hide();
		}
	});
	
	// 1. Choose Cate
	$(".cate").on("mousedown",function(e){
		var f=document.addFoodForm;
		
		if(e.which===1){
			if(f.cate.value==$(this).val()){
				$(this).css("background","");
				f.cate.value="";
			}else{
				$(".cate").css("background","");
				$(this).css("background","green");
				
				f.cate.value=$(this).val();
				
				
			}			
		}
	});
	
	// 2. Choose unit
	$(".unit").on("mousedown",function(e){
		var f=document.addFoodForm;
		
		if(e.which===1){
			if(f.unit.value==$(this).val()){
				$(this).css("background","");
				f.unit.value="";
			}else{
				$(".unit").css("background","");
				$(this).css("background","green");
				
				f.unit.value=$(this).val();
			}			
		}
	});
	$("#unit").keyup(function(){
		$(".unit").css("background","");
	});
	
	// 3. Choose date
	$("#shelfdate1").mouseout(function(){
		var f=document.addFoodForm;
		f.shelfdate.value==$(this).val();
	});
	/*
	$("#shelfdate2").keyup(function(){
		var f=document.addFoodForm;
		
		if(isNaN($(this).val())){
			$(this).val("");
		}else if($(this).val()!="" ){
			$.post("/food/changeDate?date="+$(this).val() )
			.done(function(json){
				var strDate=JSON.parse(json);
				alert(strDate);
				var date=new Date(strDate);
				alert(date);
				f.shelfdate.value=date;
				alert(f.shelfdate.value);
			})
			.fail(function(){
				alert("error");
			});
		}
		
	}); */
	$("#usedate1").mouseout(function(){
		var f=document.addFoodForm;
		f.usedate.value==$(this).val();
	});
	
	
	
	// AddFood
	$("#addOne").click(function(){
		var f=document.addFoodForm;
		
		if(f.name.value==""){
			f.name.focus();
			return;
		}
		
		f.quan.value=(f.quan.value=="")? 0:f.quan.value;
		f.file.value=(f.file.value=="")? null:f.file.value;
		
		f.action="/food/addOne";
		f.method="post";
		f.enctype="multipart/form-data";
		f.submit();
	});
	$("#addMore").click(function(){
		self.close();
		//window.open("about:blank","_self").close();
	});
	
	
	
});

</script>

</head>
<body>



<div id="addFood">	

	<h3>'${c.name }'에 음식 추가</h3>
	
	<hr>
	
	
	
	<form name="addFoodForm" id="addFoodForm"
		enctype="multipart/form-data">
	
		<input type="hidden" name="c_num" value="${c.num }">
	
		<table border=1 cellspaing=0>
			<caption>* 이름만 필수입력입니다.</caption>
		
			<tr>
				<th width="80" height="60">- 이미지</th>
				<td>
					<div id="div_img">
					</div>
					<input type="file" name="file">
				</td>
			</tr>
			<tr>
				<th>- 카테고리</th>
				<td>
					<c:forEach items="${cateSet }" var="cate">
						<input type="button" value="${cate }" class="cate">
					</c:forEach>			
					<input type="hidden" name="cate">	
				</td>
			</tr>
			<tr>
				<th>* 이름</th>
				<td><input type="text" name="name" placeholder="이름은 필수입력입니다"></td>
			</tr>
			<tr>
				<th>- 사온 날짜</th>
				<td><input type="date" name="up_date" value="${today }"></td>
			</tr>
			<tr>
				<th colspan=2><input type="button" value="이대로 추가!" id="addOne">
					<input type="button" value="추가하고 또 추가!" id="addMore">
				</th>
			</tr>
			
		</table>
		
		
		<hr><span id="more"> 내용 더보기 </span>  <hr>
		
		
		
		
		
		<div id="else">
		
			<table border=1 cellspacing=0>
			
				<tr>
					<th width="70">- 수량 <br>- 단위</th>
					<td><input type="text" name="quan" class="textHalf" placeholder="수량">
						
						<input type="text" name="unit" id="unit" placeholder="단위" class="textHalf">
		
						<div id="div_unit">
							<input type="button" value="g" class="unit">
							<input type="button" value="ml" class="unit">
							<input type="button" value="kg" class="unit">
							<input type="button" value="L" class="unit">
							<input type="button" value="개" class="unit">
							<input type="button" value="모" class="unit">
							<input type="button" value="통" class="unit">
							<input type="button" value="마리" class="unit">
						</div>
					</td>
				</tr>
				
				
				<tr>
					<th>- 정보<br>(구매/<br>신선도)</th>
					<td><textarea name="info" rows="3"></textarea></td>
				</tr>
				
				
				<tr>
					<th colspan=2> 기한 </th>
				</tr>
				<tr>
					<th>- 유통기한</th>
					<td><input type="date" id="shelfdate1" class="dateHalf">
						/ <input type="text" id="shelfdate2" class="textHalf" placeholder="숫자">일 후
						<input type="date" name="shelfdate" value="${defaultDay }" class="dateHidden">
					</td>
				</tr>
				<tr>
					<th>- 소비기한</th>
					<td><input type="date" id="usedate1" class="dateHalf">
						/ <input type="text" id="usedate2" class="textHalf" placeholder="숫자">일 후
						<input type="date" name="usedate" value="${defaultDay }" class="dateHidden"></td>
				</tr>
			
			</table>
		
		
		</div>
		
	
	</form>
	
	
	

</div>

</body>
</html>