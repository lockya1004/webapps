<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <style type="text/css">
		.ui-datepicker-calendar > tbody td:first-child a { 
		    COLOR: #f00; 
		}
		
		.ui-datepicker-calendar > tbody td:last-child a { 
		    COLOR: blue; 
		}
		.ui-datepicker select.ui-datepicker-month{ 
			width:35%; font-size: 12px; margin-left:10px; 
		}
		.ui-datepicker select.ui-datepicker-year{
			 width:40%; font-size: 12px; 
		}
		.ui-datepicker-calendar th span{
			color: black;
		}
		</style>
		<script>
    	$(document).ready(function(){
			$("#form_update").click(function(){				
				$.ajax({
					url : "./admin?menu=produp.do",
					data : $("#ins_frm").serialize(),
					type : "POST",
					success:function(data){
						alert("수정이 완료되었습니다.");
						location.reload();
					}
				});
			});    		
    	});
    </script>
	<div class="modal-dialog">    
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<c:if test="${mode=='w'}">
					<h4 class="modal-title">제품등록</h4>
				</c:if>
				<c:if test="${mode=='u'}">
					<h4 class="modal-title">제품수정</h4>
				</c:if>
				
			</div>
			<div class="modal-body">
				<form role="form" id="ins_frm">
					<input type="hidden" id="mode" name="modes" value="${mode}"/>
					
			            <div class="form-group">		              
			            	<c:choose>
			            		<c:when test="${mode=='w'}">
			            			<input type="text" class="form-control" name="usrname" id="usrname" placeholder="시리얼번호를 입력해주세요.">	
			            		</c:when>
			            		<c:otherwise>
			            			<input type="text" class="form-control" name="usrname" id="usrname" placeholder="시리얼번호를 입력해주세요." value="${view.serial_num}" readonly="readonly">
			            		</c:otherwise>
			            	</c:choose>
							<button style="width:110px;">번호 수정</button>
			            </div>
			            <div class="form-group">
							<input type="text" class="form-control" id="prodnm" name ="prodnm" placeholder="품명을 입력해주세요." value="${view.prod_nm}">
			            </div>
			            
			            <div class="form-group">
							<input type="text" class="form-control" id="proddate" name="proddate" placeholder="출고일을 선택해주세요." value="${view.prod_date}">
			            </div>
			            <div class="form-group">
							<input type="text" class="form-control" id="compnm"  name="compnm" placeholder="사용자이름을 입력해주세요." value="${view.comp_nm}">
			            </div>
			            <div class="form-group">
							<input type="text" class="form-control" id="prodlocal"  name="prodlocal" placeholder="지역명을 입력해주세요." value="${view.prod_local}">
			            </div>
			            <div class="form-group">
							<select class="form-control" id="prodcontry"  name="prodcontry">
								<option value="">국가를 선택해 주세요.</option>
								 <c:forEach items="${country_list}" var="lists">
								 	<c:choose>
								 		<c:when test="${mode=='u'&&view.prod_country != lists.country_nm}">
								 			<option value="${lists.country_cd}" ><c:out value="${lists.country_nm}"></c:out></option>		
								 		</c:when>
								 		<c:when test="${mode=='u'&&view.prod_country == lists.country_nm}">
								 			<option value="${lists.country_cd}" selected="selected"><c:out value="${lists.country_nm}"></c:out></option>
								 		</c:when>
								 		<c:otherwise>
								 			<option value="${lists.country_cd}" ><c:out value="${lists.country_nm}"></c:out></option>
								 		</c:otherwise>
								 	</c:choose>
									
								</c:forEach>
							</select>
			            </div>
		              
		        </form>
			</div>
			<div class="modal-footer">
				<c:if test="${mode=='w'}">
					<button type="button" class="btn btn-default" id="form_insert" data-dismiss="modal">등록</button>
				</c:if>
				<c:if test="${mode=='u'}">
					<button type="button" class="btn btn-default" id="form_update" data-dismiss="modal">수정</button>
				</c:if>
			</div>
		</div>      
	</div>
