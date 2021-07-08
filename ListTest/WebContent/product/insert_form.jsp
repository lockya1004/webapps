<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    	$(document).ready(function(){
    		$("#lgn").click(function(){
    			
    		});
    	});
    
    </script>
	<div class="modal-dialog">    
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">제품등록</h4>
			</div>
			<div class="modal-body">
				<form role="form">
		            <div class="form-group">		              
						<input type="text" class="form-control" id="usrname" placeholder="Enter serial number">
		            </div>
		            <div class="form-group">
						<input type="password" class="form-control" id="psw" placeholder="Enter password">
		            </div>
		            <div class="form-group">
						<input type="text" class="form-control" id="prodnm" placeholder="Enter product name">
		            </div>
		            <div class="form-group">
						<input type="text" class="form-control" id="proddate" placeholder="Enter product ">
		            </div>
		            <div class="form-group">
						<input type="text" class="form-control" id="prodnm" placeholder="Enter product name">
		            </div>
		              
		        </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>      
	</div>