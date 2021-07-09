<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

if(session.getAttribute("ok")!=null){
	response.sendRedirect("./admin?menu=list.do");
}

%>


<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>현성 E&E</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<script
		  src="https://code.jquery.com/jquery-3.3.1.min.js"
		  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		  crossorigin="anonymous"></script>
		<link rel="stylesheet" href="./css/common.css">
		<link rel="stylesheet" href="./css/login.css">
		
		<script>
			function noBack(){
				 window.history.forward();
			}
			
			function logins(){
				if(document.frm.id.value.length == 0){
					alert("아이디를 입력해주세요");
					frm.id.focus();
					return false;
				}
				if(document.frm.pass.value == ""){
					alert("암호를 입력해주세요");
					frm.pass.focus();
					return false;
				}
							
				$("#frm").submit();
			}
		</script>
		<script>
			$(document).ready(function(){
			
			
				if($("#msg").val() !=""){
					alert($("#msg").val());
					location.href="./admin?menu=login.do";
				}
				
				$("#pass").keyup(function(key){
					if(key.keyCode==13){
						logins();
					}
				});
		
			});
		</script>
		<script>
			function noBack(){
				 window.history.forward();
				/* //window 내 mouse 위치 여부를 체크하기 위한 변수 
				window.innerDoc = false; //mouseover Event Listener 
				window.addEventListener('mouseover', function(event) { 
					window.innerDoc = true; 
				}); // mouseout Event Listener 
				window.addEventListener('mouseout', function(event) {
					 window.innerDoc = false; 
				}); // 바로 이전 페이지로 이동하는 것을 막기위해 history State 추가 
				history.pushState({page:"?menu=list.do"}, 
				document.title, location.pathname + '?menu=list.do'); //popstate Event Listener 
				
				window.addEventListener('popstate', function(event) { 
					// history State 추가하여 페이지 이동 막음 (뒤로가기 막기) 
					history.pushState({page:"historyChanged"}, document.title, location.pathname + '?menu=list.do'); // window 영역 밖에서 history가 변경 됐을경우 callbackFunction 실행 ( 뒤로가기 버튼 등 )
				// 이전 POST 페이지에 정상적으로 데이터 재전송하여 SUBMIT 등 수행 
					if (!window.innerDoc) { 
						callbackFunction();	
					} 
				}); */

			}
		</script>
	</head>
<body  onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<input type="hidden" id="msg" value="${message}"/>
	<input type="hidden" id="loginUser" value="<%=session.getAttribute("ok")%>"/>
       <div id="login_box">
			<div class="img_box"></div><!--img_box-->
			<div class="txt_box">
				<div>
					<h3>LOGIN</h3>
					<h5>현성 E&E</h5>
				</div>
				<div>
					<form method="post" action="/list/admin?menu=loginProc.do" name="frm" id="frm">
						<input type='text' class='login_id' name='id' id='id' placeholder="Username"/><br>
						<input type="password" placeholder="Password" name="pass" id="pass"/><br>
						<input type="button" id="login" value="LOGIN" onclick="logins()"/><br>
					</form>
				</div>
			</div><!--txt_box-->
        </div><!--login_box-->
</body>
</html>