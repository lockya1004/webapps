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
		<script
		  src="https://code.jquery.com/jquery-3.3.1.min.js"
		  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		  crossorigin="anonymous"></script>		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
			function noBack(){
				 window.history.forward();
			}
		</script>
		<link rel="stylesheet" href="./css/common.css">
		<link rel="stylesheet" href="./css/list.css">
	</head>
<div class="black_bg"></div>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div style="text-align: right">
		<a href="./admin?menu=logout.do">로그아웃</a>
	</div>
	<div id="list_box">
		<h2>제품등록 현황</h2>
		<div class="menu_wrap">
			<div class="search">
				<select name="terms">
					<option value="">검색조건</option>
					<option value="serial">시리얼번호</option>
					<option value="nm">품명</option>
					<option value="date">출고일</option>
					<option value="local">지역</option>
					<option value="country">국가</option>
				</select>
				<input type="text" placeholder="Search">
				<button>검색</button>
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
						<td><a><img src="./img/icon_modify.png" alt="수정"></a><a><img src="./img/icon_delet.png" alt="삭제"></a></td>
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

