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
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
var c_num=0;
var c_name="";

function fn_loadDisp(url, sendData){
	$.post(url,
			sendData 
	)
	.done(function(json){
		//alert(json);
		//진열장 초기화.
		for(var i=0;i<=10;i++){
			$("#"+i).html(i);		
		}
		var list=JSON.parse(json);
		//alert(list.length);  //list.size 나 list.size()안됨. 배열형태라서.
		for(var i=0;i<list.length;i++){
			var c=list[i];
			var html=c.disp+" "+c.name+" ";
			html+="<input onclick='fn_addFoodPopup("+c.num+")' class='green' type='button' value='+' >";
			html+="<br><div id='disp"+c.disp+"'></div>";

			$("#"+c.disp).html(html);
			
			fn_putDisp(c.disp);
		}
		
	})
	.fail(function(){
		alert("error");
	});
	

}

function fn_putDisp(disp){
	$("#disp"+disp).load("/case/findDisp?disp="+disp);	
}

function fn_addFoodPopup(c_num){
	// 1. Add Food Popup   window.open('팝업주소','팝업창 이름','팝업창 설정');
	var popup=window.open("/food/addFood?c_num="+c_num,"Add Food Popup",
			"width=300px, height=700px, scrollbars=yes, top=100px, left=300px");
	
	location.href="/member/main";
}


$(document).ready(function(){
	// 1. Loading Display.  진열장에 세팅한 케이스 불러오기.
	fn_loadDisp("/case/listDisp",null);
	
	// 2. Switch Add Case.  케이스 추가하기로 화면 변경.
	$(".addCase").click(function(){
		location.href="/case/addSwitch";
	});
	
	
	// 3-1. Click Case 
	$(".oneCase").mousedown(function(e){
		// 케이스 리스트 좌클릭시 선택, 우클릭시 선택취소.
		$(".oneCase").css("background-color","");
		$(".oneCase").css("color","");
		
		if(e.which===3){
			$(this).css("background-color","");
			$(this).css("color","");
			c_num=0;
			c_name="";
			$("#selectCase").text(c_name);
		}else if(e.which===1){
			$(this).css("background-color","green");
			$(this).css("color","yellow");
			var td=$(this).children();
			c_num=td.eq(0).text();
			c_name=td.eq(1).text();
			$("#selectCase").text(c_name);			
		}
	});
	
	// 3-2. Click Display
	$(".wing, .cen, .half").on("mousedown",function(e){
		// 좌클릭시 진열장에 넣기, 우클릭시 진열장에서 이동하기.
		var disp=$(this).attr("id");
		var length=$(this).text().length;
		
		// 진열장에 넣거나 이동시키기
		if(e.which===1){			
			//빈 진열장에 넣으려면 선택된 케이스가 있어야 함.
			if($("#selectCase").text()=="" && length<=2){  
				alert("케이스를 하나 선택해주세요.");
			}else if($("#selectCase").text()!="" && length<=2){
				// 케이스 집어넣기
				fn_loadDisp("/case/addDisp", {num:c_num, disp:disp} );			
			}else{
				// 케이스 상세보기
			}
		// 진열장에서 제거 (부모창 클릭시만)	
		}else if(e.which===3){
			if(e.target!==e.currentTarget) return;
			
			var flag=confirm("진열장을 빼시겠습니까?");
			
			if(flag){
				fn_loadDisp("/case/removeFromDisp", {disp:disp} );				
			}
		}
	});

	
	
	// 4-1. iframe click - 음식 삭제
	$("iframe").contents().find("div").on("mousedown", function(e){
		if(e.which===3){
			alert("sere");
		}
	});
	
});
</script>


</head>
<body>





<div id="case_list">
	<h3><b>'${sessionScope.r.name }'</b> 케이스 리스트</h3>
	
	<c:if test="${empty list }"> <b>'${sessionScope.r.name }'</b>에는 케이스가 없습니다. <br><br></c:if>
	
	<c:if test="${not empty list }">
		
		<div id="dispLoad">
			<c:forEach items="${dispList }" var="d">
				<input type="hidden" id="" value="">
			</c:forEach>
		</div>
	
		<div id="can">
			<b>케이스를 클릭해서 이동시키세요! (우클릭 케이스 제거)</b>
			<table border=1 cellspacing=0>
				<tr><td rowspan=2 class="wing" id=1>1<br></td>
				<td colspan=2 class="cen" id=2>2<br></td>
				<td rowspan=2 class="wing" id=4>4<br></td></tr>
				<tr><td colspan=2 class="cen" id=3>3<br></td><tr>
				
				<tr><td rowspan=2 class="wing" id=5>5<br></td>
				<td  class="half" id=6>6<br></td>
				<td  class="half" id=8>8<br></td>
				<td rowspan=2 class="wing" id=10>10<br></td></tr>
				<tr><td  class="half" id=7>7<br></td>
				<td  class="half" id=9>9<br></td></tr>
			</table>			
			
		<hr></div>	
	
		<b>케이스 좌클릭하면 냉장고 진열장위치를 선택가능! (우클릭시 선택 취소.) </b><br>
		<b>선택한 케이스 : <b id="selectCase"></b> </b>
		<table>
			<tr><th>num</th><th>name</th><th>disp</th></tr>
			
			<c:forEach items="${list }" var="c">
				<tr class="oneCase"><td>${c.num }</td><td>${c.name }</td><td>${c.disp }</td></tr>
				
			</c:forEach>
		</table><br>
	</c:if>
	
	<span class="addCase">케이스 추가하기</span> <br><br>
	
</div>

</body>
</html>