<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>제품등록현황</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script
		  src="https://code.jquery.com/jquery-3.3.1.min.js"
		  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		  crossorigin="anonymous"></script>		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			$(document).ready(function(){
				$("#register").click(function(){
					$.ajax({
						url : "./admin?menu=prodform.do",
						type:"POST",
						success : function(data){
							$("#myModal").html(data);
						}
					});
				});
			
			});
		</script>
		<script>
    	$(document).ready(function(){
    		$("#form_insert").click(function(){
    			
    		});
    		$("#proddate").datepicker({
    			closeText: "닫기", 
    			currentText: "오늘", 
    			prevText: '이전 달', 
    			nextText: '다음 달',
    			dateFormat: 'yy-mm-dd',
    			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
    			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
    			weekHeader: "주", 
    			yearSuffix: '년'
    		});
    		
    		 $('#datepicker').datepicker('setDate', 'today'); 
    		 
    		 if($(".ui-datepicker-calendar th span").attr("title")=="Satureday"){
    			 $(this).css({color : "blue"});
    			 
    		 }else if($(".ui-datepicker-calendar th span").attr("title")=="Sunday"){
    			 $(this).css({color : "red"});
    		 }
    		 
    	});
    
    </script>
   
		<script>
					
			function search(){
				var filter = $("#terms").val();
				var keyword=$("#search_text").val();
				if(filter == ""){
					alert("검색조건을 선택해 주세요.");
					return false;
				} 
				
				if(keyword==""){
					alert("검색 내용을 선택해 주세요.");
					return false;
				}
				if(filter!=""&&keyword!=""){
					$("#frm").submit();
				}
				
			}
			
			function get_update_btn(id){
				
				 $.ajax({
					url : "./admin?menu=produpform.do",
					type:"POST",
					data : {"serial":id},
					success : function(data){
						$("#myModal").html(data);
					}
				});
			}
		</script>
		 
		<link rel="stylesheet" href="./css/common.css">
		<link rel="stylesheet" href="./css/list.css">
	</head>
<div class="black_bg"></div>

<body>
	<div style="text-align: right">
		<a href="./admin?menu=logout.do">로그아웃</a>
	</div>
	<div id="list_box">
		<h2><a href="./admin?menu=list.do">제품등록 현황</a></h2>
		<div class="menu_wrap">
			<div class="search" style="line-height:22px;">
				<form id="frm" action="./admin" method="get">
					<input type="hidden" name="menu" value="listSearch.do">
					<select name="filter" id="filter">
						<option value="">검색조건</option>
						<option value="serial">시리얼번호</option>
						<option value="nm">품명</option>
						<option value="date">출고일</option>
						<option value="local">지역</option>
						<option value="country">국가</option>
					</select>
					<input type="text" name="keyword" id="search_text" placeholder="Search">
					<button id="Search_btn" onclick="search()">검색</button>
				</form>
			
			</div><!--search-->

			<div class="button">
				<button class="register" id="register"  data-toggle="modal" data-target="#myModal">등록</button>
				<button class="ham_bu">
					<span></span>
					<span></span>
					<span></span>
				</button>
			</div><!--button-->
		</div><!--menu_wrap-->
		<div class="table_a">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr class="head_tr">
					<th>No</th>
					<th>시리얼번호</th>
					<th>품명</th>
					<th>출고일</th>
					<th>사용자이름</th>
					<th>지역</th>
					<th>국가</th>
					<th>등록일</th>
					<th>마지막 사용일</th>
					<th>수정</th>
				</tr>
				<c:if test="${fn:length(prod_list) eq 0}">
					<tr>
						<td colspan="9">현재 등록된 제품이 없습니다.</td>
					</tr>
				</c:if>
				
			    <c:forEach items="${prod_list}" var="lists" varStatus="listno">
					<tr>
						<td><c:out value="${lists.index}"></c:out></td>
						<td><c:out value="${lists.serial_num}"></c:out></td>
						<td><c:out value="${lists.prod_nm}"></c:out></td>
						<td><c:out value="${lists.prod_date}"></c:out></td>
						<td><c:out value="${lists.comp_nm}"></c:out></td>
						<td><c:out value="${lists.prod_local}"></c:out></td>
						<td><c:out value="${lists.prod_country}"></c:out></td>
						<td>
							<fmt:formatDate value="${lists.reg_date}"
													pattern="yyyy-MM-dd" />
						</td>
						<td>
						<!-- 마지막 사용일 정해지면 그때 넣는 걸로... -->
							<fmt:formatDate value="${lists.prod_lastdate}"
													pattern="yyyy-MM-dd HH:mm:ss" /> 
						</td>
						<td><a><img src="./img/icon_modify.png" alt="수정" id="${lists.serial_num}" onclick="get_update_btn(this.id)" data-toggle="modal" data-target="#myModal"/></a>
							<a><img src="./img/icon_delet.png" alt="삭제" data-toggle="modal" data-target="#myModal"></a>
						</td>
					</tr>
					
				</c:forEach>
			</table>
		</div><!--table_a-->
		<ul class="num">
			<c:if test="${pageInfo.page<pageInfo.startPage}">
				<li class="arrow"><a href="./admin?menu=list.do&page=${pageInfo.startPage}">&#60;</a></li>
			</c:if>
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" var="index">
				<c:choose>
		        	<c:when test="${pageInfo.page==index}">
		            	<li class="on"><a><c:out value="${index}"></c:out></a></li>
		        	</c:when>
		        	<c:otherwise>
		            	<li><a href="./admin?menu=list.do&page=${index}">${index}</a></li>
		        	</c:otherwise>
		    	</c:choose>					
			</c:forEach>
			<c:if test="${pageInfo.endPage<pageInfo.maxPage}">
				<li class="arrow"><a href="./admin?menu=list.do&page=${pageInfo.endPage}">&#62;</a></li>
			</c:if>
		</ul><!--num-->
    </div><!--list_box-->
  <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		
	</div>

</body>
</html>

