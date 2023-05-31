<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3//DTD HTML 4.01 Transitional//EN"
	"http://www.w3/org/TR/html14/loose.dtd">
<html lang="en">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  	
  	<style>
  		.nav>li>a{
  			font-size:17px;
  		}
  		.nav>li{
  			margin-left:12px;
  			margin-right:5px;
  		}
  		.nav{
  			margin-left:20px;
  		}
  		.border-bottom{
  			width: 70%;
  		}
  		#chatList>div>div>div{
  			width: 55px;
		    height: 55px; 
		    border-radius: 70%;
		    overflow: hidden;
		    
  		}
  		
  		#chatList>div>div>div>img{
  			width: 100%;
		    height: 100%;
		    object-fit: cover;
  		}
  	</style>
	
    <title>header</title>
    
    
</head>

<body>



<header class="d-flex container p-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/main" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            	<!-- 로고 자리 -->
                <img src="../resources/img/logo.png" height="50" alt="마이짐"/>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/notice/list" class="nav-link px-2 link-dark">공지사항</a>
				</li>
                <li>
                	<a href="/event/list" class="nav-link px-2 link-dark">이벤트</a>
                </li>
                <li>
                	<a href="/community/list" class="nav-link px-2 link-dark">커뮤니티</a>
                </li>
            </ul>
			
			
			<!-- searchform 필요x -->
            <!-- <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
            </form> -->

            <div class="dropdown text-end">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                	<sec:authorize access="isAnonymous()">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill-x" viewBox="0 0 16 16">
						  	<path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
						  	<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm-.646-4.854.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 0 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 .708-.708Z"/>
						</svg>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
							<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
						</svg>
					</sec:authorize>
                </a>
                <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                	<sec:authorize access="isAnonymous()">
                    	<li><a class="dropdown-item" href="/customRegister">
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
							  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
							</svg>
                    	회원가입</a></li>
                    	<li><a class="dropdown-item" href="/customLogin">
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
							  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
							</svg>
                    	로그인</a></li>
                    </sec:authorize>
                	
                    <sec:authorize access="isAuthenticated()">
                    	<li><a class="dropdown-item" href="#">
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
							</svg>
                    	프로필</a></li>
                    	<li><a class="dropdown-item" href="#">
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
							  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
							</svg>
                    	내 게시글</a></li>
                    	<li><a class="dropdown-item open-modal" data-bs-target="#messageModal" data-bs-toggle="modal">
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
							  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
							  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
							</svg>
                    	내 쪽지함</a></li>
                    	<li><hr class="dropdown-divider"></li>
					  	<li><a href="#" onclick="document.getElementById('logout').submit();" class="dropdown-item">
					  		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
							  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
							</svg>
					  	로그아웃</a><li>
					</sec:authorize>
					<form id="logout" action="/customLogout" method="Post">
					   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					</form>
                </ul>
            </div>
        </div>
    </div>
</header>
<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">메세지</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="height:550px">
            	<div class="row">
            		<div class="col-8" style="height:520px;">
            			<div class="row" id="chatScroll" style="height:440px;overflow-y:scroll;">
            				<table class="table" id="chatTable">
	            				<tr>
		            				<td>
		            					대화내용이 없습니다.
		            				</td>
	            				</tr>
            				</table>
            				
            			</div>
            			<div class="row" style="height:70px">
            				<table>
            					<tr>
            						<td width="15%">
            						</td>
            						<td width="63">
            							<textarea id="message" class="form-control" placeholder="메세지를 입력해 주세요."></textarea>
            						</td>
            						<td width="17%">
										<button class="btn btn-secondary btn-lg" id="sendMessageBtn">
											전송
										</button>
									</td>
									<td width="15%">
									</td>
								</tr>
							</table>
            			</div>
            		</div>
            		<div class="col-4" style="overflow-y:auto; height:520px;">
						<div class="row" id="chatList">
							<div class="col-4">userProfile</div>
							<div class="col-8"><strong>상대방1</strong><br><small>2000-01-01</small></div>
						</div>
            		</div>
            	</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- message -->
<script src="/resources/js/memberProfile.js"></script>
<script src="/resources/js/message.js"></script>
<script>
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	});
	 

	var loginId = null;
	
	<sec:authorize access="isAuthenticated()">
		loginId = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	var receiver = null;
	
	var checkCount = null;
	
	var chatTable = $("#chatTable");
	
	var chatList = $("#chatList");
	
	$(document).on("click", ".open-modal", function(){
		receiver = $(this).data("id");
		console.log(loginId);
		console.log(receiver);
		
		if(receiver == null){
			chatTable.html('대화 내용이 없습니다.');
			$("#exampleModalLabel").html(loginId + "님의 쪽지함");
		}else{
			$("#exampleModalLabel").html(receiver + "님 과의 대화");
		}
		messageService.getMyChatListCheck(loginId, function(check){
			console.log("check : " + check);
			if(check !=0){
				console.log("getMyChatList")
				showChatList();
			}
		});
		
		messageService.check(loginId, receiver, function(count){
			console.log("count : " + count);
			checkCount = count;
			
			if(count!=0){
				showMessageChat(receiver);
				$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
			}else{
				chatTable.html('대화 내용이 없습니다.');
			}
			
		});
		
		
	});
	

	
	var arr = new Array();
	var list = new Array();
	
	function showChatList(){
		messageService.getMyChatList(loginId, function(data){
			arr.length = 0;
			var html = "";
			for(var i =0; i<data.length; i++){
				
				arr.push(data[i].sender);
				arr.push(data[i].receiver);
				
			}
			list = Array.from(new Set(arr));
			console.log("list 중복제거 : " + list);
			for(var i = 0; i < list.length; i++){
				if(list[i] != loginId){
					memberProfileService.getMemberProfile(list[i],
						function(data){
							console.log(data);
							if(data.uuid == 'default'){                           //다른유저 사진없을때
								html += '<hr><div class="row" style="cursor:pointer;" onclick=\'showMessageChat("'+data.userId+'");\'><div class="col-4"><div style="float:right;"><img src="/resources/img/default-profile.svg"></div><br></div>'+
										'<div class="col-8"><strong>'+data.userId+'</strong></div></div>';
							}else{                                                      //다른유저 사진있을때
								var fileCallPath = encodeURIComponent(data.uploadPath + "/s_" + data.uuid + "_" + data.fileName);
								html += '<hr><div class="row" style="cursor:pointer;" onclick=\'showMessageChat("'+data.userId+'");\'><div class="col-4"><div style="float:right;"><img src="/display/?fileName='+fileCallPath+'"></div><br></div>'+
										'<div class="col-8"><strong>'+data.userId+'</strong></div></div>';
							}
							chatList.html(html);
						}
					);
				}
			}
			$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
		});
	}
	
	$("#sendMessageBtn").on("click",
		function(){
			var message = {
				sender:loginId,
				receiver:receiver,
				message:$("#message").val()
			};
			messageService.sendMessage(message,
				function(result){
					console.log(result);
					$("#message").val("");
					showMessageChat(receiver);
					showChatList();
				}
			);
		}
	);
	//modal에서 receiver가 바귈때마다 조회 해주어야함.
	function showMessageChat(other){
		receiver = other;
		
		$("#exampleModalLabel").html(receiver + "님 과의 대화");
		
		messageService.getChatOf(loginId, receiver, function(data){
			console.log(data);	
			var html="";
			for(var i = 0; i < data.length; i++){
				if(data[i].sender == loginId){
					html += '<tr><td width="50%"></td><td width="50%"><strong>'+
					data[i].sender+
					'</strong><small>'+ 
					messageService.displayTime(data[i].sendDate) + 
					'</small><textarea style="overflow:hidden;" class="form-control" readonly>'+
					data[i].message+
					'</textarea></td></tr>';
				}else{
					html += '<tr><td width="50%"><strong>'+
					data[i].sender+
					'</strong><small>'+ 
					messageService.displayTime(data[i].sendDate) +
					'</small><textarea style="overflow:hidden;" class="form-control" readonly>'+
					data[i].message+
					'</textarea></td><td width="50%"></td></tr>';
				}
				chatTable.html(html);
			}
			
		});
		$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
	}
	
	
	
</script>
