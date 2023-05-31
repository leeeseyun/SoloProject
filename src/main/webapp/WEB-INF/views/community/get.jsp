<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>


<style>
	.panel{
		width:85%;
		margin:0 auto;
	}
	.form-group{
		margin-top: 10px;
		box-sizing : border-box;
	}
	.form-control[readonly] {
	    background-color: #ffffff;
	    opacity: 1;
	}
	td div{
    width: 55px;
    height: 55px; 
    border-radius: 70%;
    overflow: hidden;
    
	}
	
	td div img{
		width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel panel-heading">
					<h3 class="mt-5 mb-3">커뮤니티 > 글읽기</h3>
				</div>
				<div class="panel panel-body border">
					<div class="form-floating">
					    <input type="text" readonly class="form-control" id="floatingInput"  value='<c:out value="${board.writer}"/>' name='writer'>
					    <label for="floatingInput">작성자</label>
					</div>
					<div class="form-floating">
					    <input type="text" readonly class="form-control" id="floatingInput"  value='<c:out value="${board.title}"/>' name='title'>
					    <label for="floatingInput">제목</label>
					</div>
					<div class="border">
						<c:out value="${board.content}" escapeXml="false"/>
					</div>
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
						
						<div id="like">
							
						</div>
						
						<c:if test="${pinfo.username eq board.writer}">
							<button data-oper='modify' class="btn btn-secondary">게시글 수정</button>
						</c:if>
					</sec:authorize>
					<button data-oper='list' class="btn btn-dark">게시글 목록</button>
					<form id="opForm" action="/community/modify" method="get">
						<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
						<input type="hidden" name="pageNum" value='<c:out value="${criteria.pageNum}"/>'>
						<input type="hidden" name="amount" value='<c:out value="${criteria.amount}"/>'>
						<input type="hidden" name="type" value='<c:out value="${criteria.type}"/>'>
						<input type="hidden" name="keyword" value='<c:out value="${criteria.keyword}"/>'>
					</form>
					
				</div>
				
				
				
				<div class="panel panel-footer mt-3">
					<!-- 멤버판별 후 로그인유도/댓글가능 -->
					<!-- 로그인 했을때 -->
					<sec:authorize access="isAuthenticated()">
							<table class="table" style='vertical-align: middle;'>
								<tr>
									<td width="10%">
										userImage
									</td>
									
									<td width="16%">
										<input type="hidden" class="form-control" name="replyer" readonly
										value='<sec:authentication property="principal.username"/>' id="replyer">
										<strong>
											<sec:authentication property="principal.username"/>
										</strong>
									</td>
									
									<td width="62%">
										<textarea id="reply" class="form-control" placeholder="댓글을 입력해 주세요."></textarea>
									</td>
									
									<td width="12%">
										<button class="btn btn-secondary btn-lg" id="replyAddBtn">
											댓글 등록
										</button>
									</td>
								</tr>
							</table>
					</sec:authorize>
					
					<div id="chat">
						<table class="table" style='vertical-align: middle;'>
							<tr>
								<td width="10%">
									userImage
								</td>
								
								<td width="16%" >
									<strong>user213</strong><br>
									<small>2011-01-01</small>
								</td>
								
								<td width="62%">
									<textarea style='word-break: keep-all;white-space: normal;overflow: hidden; rows:auto;' class="form-control" readonly>rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrreplyerrrrrrrrrrrreplyerererererleprleplrpelrpelrpelrpelreplreplreplreplreplreplreplreplreplreprleprleplreplreplrpelrpelrpelprlrrrrrrrrrrreplyerererererleprleplrpelrpelrpelrpelreplreplreplreplreplreplreplreplreplreprleprleplreplreplrpelrpelrpelprlrrrrrrrrrrreplyerererererleprleplrpelrpelrpelrpelreplreplreplreplreplreplreplreplreplreprleprleplreplreplrpelrpelrpelprlrrrrrrrrrrreplyerererererleprleplrpelrpelrpelrpelreplreplreplreplreplreplreplreplreplreprleprleplreplreplrpelrpelrpelprlrrrrrrrrrrreplyerererererleprleplrpelrpelrpelrpelreplreplreplreplreplreplreplreplreplreprleprleplreplreplrpelrpelrpelprlererererleprleplrpelrpelrpelrpelreplreplreplreplreplreplreplreplreplreprleprleplreplreplrpelrpelrpelprleprlep
									</textarea>
								</td>
								
								<td width="12%">
									
								</td>
							</tr>
						</table>
					</div>
					<div id="replyPageFooter">
						<!-- replyPaging -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- reply -->
<script src="/resources/js/memberProfile.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	
	history.scrollRestoration = "auto";
	
	showList(1);
	
	var inputReply = $("#reply");
	var inputReplyer = $("#replyer");
	var bnoValue='<c:out value="${board.bno}"/>';
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	//reply add
	$("#replyAddBtn").on("click",
		function(e){
			var reply = {
				reply : inputReply.val(),
				replyer : inputReplyer.val(),
				bno : bnoValue
			};
			replyService.add(reply,
				function(result){
					alert(result);
					$("#reply").val("");
					showList(pageNum);
				}
			);
			
			//window.location.reload(true);					//새로고침
			
		}				
	);
	
	var loginId = null;
	
	<sec:authorize access="isAuthenticated()">
		loginId = '<sec:authentication property="principal.username"/>';
 	</sec:authorize>
 	
	//reply showreplypage
	var pageNum = 1;
	var replyPageFooter = $("#replyPageFooter");
	var replyUL = $("#chat");
	
	function showList(page){
		var bnoValue = '<c:out value="${board.bno}"/>';
		replyService.getList(
			{bno : bnoValue, page : page || 1},
			function(replyCnt, list){
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				for(var i = 0, len = list.length || 0; i < len; i++){
					
					if(loginId == list[i].replyer){
						
						str += "<table id='displayTable"
										+ list[i].rno +
							"' style='display:block;vertical-align: middle;' class='table'"
										+
							"><tr><td width='10%' class='"+ list[i].replyer +"' id='replyer"+i+"'>"
										+ "userImage" +
							"</td><td width='16%'><strong>"
										+ list[i].replyer + 
							"</strong><br><small>"
										+ replyService.displayTime(list[i].replyDate) + 
							"</small></td><td width='62%'><textarea name='reply' style='overflow:hidden;' class='form-control' readonly>"
										+ list[i].reply +
							"</textarea></td><td width='12%'>"
										+
										"<input type='button' class='btn btn-outline-dark' value='수정하기' onclick=\"document.all['displayTable"+list[i].rno+"'].style.display='none';document.all['nonedisplayTable"+list[i].rno+"'].style.display='block';\"><br>"
										+
										"<input type='button' class='btn btn-outline-dark' onclick=\"r_b_c("+list[i].rno+");\" value='삭제하기'>"
										+
							"</td></tr></table>"
										+
										
										//히든테이블
								"<table id='nonedisplayTable"
										+ list[i].rno +
							"' style='display:none;vertical-align: middle;' class='table' data-rno='"
										+ list[i].rno +
							"'><tr><td width='10%' class='"+ list[i].replyer +"' id='replyer"+i+"'>"
										+ "userImage" +
							"</td><td width='16%'><strong>"
										+ list[i].replyer + 
							"</strong><br><small>"
										+ replyService.displayTime(list[i].replyDate) + 
							"</small></td><td width='62%'><textarea style='overflow-y:auto' name='reply' class='form-control' placeholder='수정할 댓글을 입력해 주세요.' data-rno='"
										+ list[i].rno +
							"'></textarea></td><td width='12%'>"
										+
										"<input type='button' class='btn btn-outline-dark' onclick=\"m_b_c("+list[i].rno+");\" value='등록하기'><br>"
										+
										"<input type='button' class='btn btn-outline-dark' value='취소하기' onclick=\"document.all['displayTable"+list[i].rno+"'].style.display='block';document.all['nonedisplayTable"+list[i].rno+"'].style.display='none';\">"
										+
							"</td></tr></table>"
							;
							
					}else{
						str += "<table style='vertical-align: middle;' class='table'><tr><td class='"+ list[i].replyer +"' width='10%' id='replyer"+i+"'>"
										+ "userImage" +
							"</td><td width='16%'><strong>"
										+ list[i].replyer + 
							"</strong><br><small>"
										+ replyService.displayTime(list[i].replyDate) + 
							"</small></td><td width='62%'><textarea style='word-break: keep-all;white-space: normal;overflow: hidden;' class='form-control' readonly>"
										+ list[i].reply +
							"</textarea></td><td width='12%'>"
										+ "" +
							"</td></tr></table>";
					}
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
				showProfile();
			}
			
		
		);
	}
	
	
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum/10.0) *10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt) {
			next = true;
		}
		var str="<ul class='pagination pull-right'>";
		if(prev) {
			str+= "<li class='page-itme'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		for(var i =startNum ; i <= endNum; i++) {
			var active = pageNum == i? "active":"";
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if(next) {
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		str+="</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a",
		function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		}	
	);
	

	var loginId = null;
	
	<sec:authorize access="isAuthenticated()">
		loginId = '<sec:authentication property="principal.username"/>';
 	</sec:authorize>
	
	//modify_button_click 함수
	function m_b_c(rnoValue){
		console.log(rnoValue);
		var getTextarea = $('textarea[data-rno='+rnoValue+']');
		
		console.log(getTextarea);
		
		var reply = {
			rno:rnoValue,
			reply:getTextarea.val(),
			replyer:loginId
		};
		replyService.update(reply,
			function(result){
				alert(result);
				
				showList(pageNum);
			}
		);
		
	}
	
	//remove_button_click 함수
	function r_b_c(rnoValue){
		replyService.remove(rnoValue, loginId,
			function(result){
				alert(result);
				showList(pageNum);
			}
				
		);
		
	}
	
	function showProfile(){
		
		var list = new Array();
		for(var i = 0; i < 10; i++){
			list[i] = $("#replyer"+i).attr('class');
		}
		
		var arr = Array.from(new Set(list));
		console.log("중복제거 : " + arr);
		
		var html = "";
		
		arr.forEach(i =>{
			if(i !=null){
				memberProfileService.getMemberProfile(i,
					function(data){
						if(data.userId == loginId && data.uuid == 'default'){       //로그인유저 사진이 없을때
		                    html = '<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/resources/img/default-profile.svg"></div></a>'+
								'<ul class="dropdown-menu">'+
								'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
							'<li><a class="dropdown-item" href="/community/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">내 게시글 보기</a></li>'+
							'<li><a class="dropdown-item open-modal" open-modal" data-bs-target="#messageModal" data-bs-toggle="modal">내 쪽지함</a></li>'+
		                    '<li><a class="dropdown-item" href="#">좋아요한 게시물</a></li></ul>';	//security
		                }else if(data.userId == loginId){                           //로그인유저 사진이 있을때
		                    var fileCallPath = encodeURIComponent(data.uploadPath + "/s_" + data.uuid + "_" + data.fileName);
							html ='<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/display/?fileName='+fileCallPath+'"></div></a>'+
							'<ul class="dropdown-menu">'+
							'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
						'<li><a class="dropdown-item" href="/community/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">내 게시글 보기</a></li>'+
						'<li><a class="dropdown-item open-modal"  open-modal" data-bs-target="#messageModal" data-bs-toggle="modal">내 쪽지함</a></li>'+
		                '<li><a class="dropdown-item" href="#">좋아요한 게시물</a></li></ul>';		//security
		                }else if(data.uuid == 'default'){                           //다른유저 사진없을때
		                    html = '<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/resources/img/default-profile.svg"></div></a>'+
								'<ul class="dropdown-menu">'+
								'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
							'<li><a class="dropdown-item" href="/community/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">게시글 보기</a></li>'+
							'<li><a class="dropdown-item open-modal" data-id="'+data.userId+'" data-bs-target="#messageModal" data-bs-toggle="modal">쪽지쓰기</a></li></ul>';	//security
		                }else{                                                      //다른유저 사진있을때
		                    var fileCallPath = encodeURIComponent(data.uploadPath + "/s_" + data.uuid + "_" + data.fileName);
							html ='<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/display/?fileName='+fileCallPath+'"></div></a>'+
							'<ul class="dropdown-menu">'+
							'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
						'<li><a class="dropdown-item" href="/community/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">게시글 보기</a></li>'+
						'<li><a class="dropdown-item open-modal" data-id="'+data.userId+'" data-bs-target="#messageModal" data-bs-toggle="modal">쪽지쓰기</a></li></ul>';		//security
		                }
						$("."+i).html(html);
					}
				);	
			}
		});
	}
	
	
</script>


<!-- 게시글수정		,	 go to /community/list -->
<script type="text/javascript">
	$(document).ready(function(){
		var opForm = $("#opForm");
		$("button[data-oper='modify']").on("click",
			function(){
				opForm.attr("action", "/community/modify").submit();
		});
		$("button[data-oper='list']").on("click",
			function(){
				opForm.find("#bno").remove();
				opForm.attr("action", "/community/list").submit();
		});
	});
</script>


<!-- like -->
<script type="text/javascript" src="/resources/js/like.js"></script>
<script>

	var loginId = null;
	
	<sec:authorize access="isAuthenticated()">
		loginId = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	var bnoValue='<c:out value="${board.bno}"/>';
	
	function removeHeart(){
		likeService.down(bnoValue, loginId);
		window.location.reload(true);
	}
	
	function addHeart(){
		var likeVO = {
			bno : bnoValue,
			userId : loginId
		};
		likeService.up(likeVO
			
		);
		window.location.reload(true);
	}
	var divLike = $("#like");
	showHeart(bnoValue, loginId);
		
	function showHeart(bnoValue, loginId){
		console.log("showHeart");
		likeService.getState(bnoValue, loginId,
			function(data){
				console.log(data);
				var createHeart = null;
				
				if(data != ""){
					createHeart = '<button type="button" class="btn btn-default" onclick="removeHeart();"><img src="/resources/img/heart_icon_fill.svg" width="30px"> 좋아요 취소</button>';
				}else{
					createHeart = '<button type="button" class="btn btn-default" onclick="addHeart();"><img src="/resources/img/heart_icon_hollow.svg" width="30px"> 좋아요</button>';
				}
				divLike.html(createHeart);
			}
		);
	}

</script>





<%@include file="../includes/footer.jsp" %>