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
	td div{
    width: 27px;
    height: 27px; 
    border-radius: 70%;
    overflow: hidden;
    
	}
	
	td div img{
		width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.nav-link {
		padding:0px;
	}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel panel-heading">
					
					<div class="hstack gap-3">
					    <div class=""><h3 class="mt-5 mb-3">공지사항</h3></div>
					    <div class="ms-auto mt-5 mb-3"><button type="button" class="btn btn-secondary mt-2" onclick="location.href='/notice/register'">글쓰기</button></div>
					</div>    
				</div>
				<div class="panel panel-body">
					<table class="table table-hover table-sm">
						<thead>
							<tr class="table-dark">
								<th width="10%">번호</th>
								<th width="57%">제목</th>
								<th width="6%"></th>
								<th width="13%">작성자</th>
								<th width="14%">작성일</th>
							</tr>
						</thead>
						<c:forEach var="notice" items="${list}">
		                 	<tr>
		                    	<td><c:out value="${notice.bno}" /></td>
		                    	<td><a class='move' href='<c:out value="${notice.bno}"/>' style='text-overflow:ellipsis;overflow:hidden; word-break:break-all'>
		                    		<c:out value = "${notice.title}"/><b>(<c:out value="${notice.replyCnt}"/>)</b></a>
		                    	</td>
		                    	<td class='<c:out value="${notice.writer}"/>'></td>
		                    	<td><c:out value="${notice.writer}"/></td>
		                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regDate}" /></td>
		                  	</tr>
		               </c:forEach>
					</table>
					<form id ='actionForm' action ="/notice/list" method='get'>
		               <input type = 'hidden' name = 'pageNum' value = '${pageMaker.criteria.pageNum }'>
		               <input type = 'hidden' name = 'amount' value = '${pageMaker.criteria.amount }'>
		               <input type = 'hidden' name = 'type' value = '<c:out value = "${pageMaker.criteria.type }"/>'>
		               <input type = 'hidden' name = 'keyword' value = '<c:out value = "${pageMaker.criteria.keyword }"/>'>
		            </form>
				</div>
				<div class="panel panel-footer">
					<div class = 'row'>
					    <div class = "col-lg-12">
					        <form id = 'searchForm' action = "/notice/list" method = 'get'>
					            <select name = 'type'>
					                <option value = "" <c:out value="${pageMaker.criteria.type == null?'selected':'' }"/>>--</option>
					                <option value = "T" <c:out value="${pageMaker.criteria.type eq 'T'?'selected':'' }"/>>제목</option>   
					                <option value = "C" <c:out value="${pageMaker.criteria.type eq 'C'?'selected':'' }"/>>내용</option>   
					                <option value = "W" <c:out value="${pageMaker.criteria.type eq 'W'?'selected':'' }"/>>작성자</option>   
					                <option value = "TC" <c:out value="${pageMaker.criteria.type eq 'TC'?'selected':'' }"/>>제목 or 내용</option>   
					                <option value = "TW" <c:out value="${pageMaker.criteria.type eq 'TW'?'selected':'' }"/>>제목 or 작성자</option>   
					                <option value = "TWC" <c:out value="${pageMaker.criteria.type eq 'TWC'?'selected':'' }"/>>제목 or 내용 or 작성자</option>                        
					            </select>
					            <input type ='text' name = 'keyword' value = '<c:out value="${pageMaker.criteria.keyword}"/>'/>
					            <input type ='hidden' name = 'pageNum' value = '<c:out value="${pageMaker.criteria.pageNum}"/>'/>
					            <input type = 'hidden' name = 'amount' value = '<c:out value="${pageMaker.criteria.amount}"/>'/>
					            <button class = 'btn btn-secondary'>검색</button>
					        </form>
					    </div>
					    <nav>
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
								    <li class="page-item previous">
								    	<a class="page-link" href="${pageMaker.startPage-1}">Previous</a>
								    </li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">    
								    <li class='page-item ${pageMaker.criteria.pageNum == num ? "active":""}'>
								    	<a class="page-link" href="${num}">${num}</a>
								    </li>
								</c:forEach>    
								<c:if test="${pageMaker.next}">    
								    <li class="page-item next">
								    	<a class="page-link" href="${pageMaker.endPage+1}">Next</a>
								    </li>
								</c:if>
							</ul>
						</nav>
					</div> 
				</div>
			</div>
		</div>
	</div>
</div>

<!-- get -->
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $('#actionForm');
		$('.move').on("click",
	    	function(e) {
			 console.log("click");
	         e.preventDefault();
	         if (actionForm.find("input[name = 'bno']").val() != '') {
	            actionForm.find("input[name='bno']").remove();
	         }
	         actionForm.append("<input type = 'hidden' name = 'bno' value ='" + $(this).attr("href")+ "'>");
	         actionForm.attr("action", "/notice/get");
	         actionForm.submit();
	   	});
	});
	
</script>


<!-- pagenate -->
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $('#actionForm');
		$('.page-item a').on("click",
			function(e){
			console.log("click");
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.attr("action", "/notice/list");
			actionForm.submit();
		});
	});
</script>

<!-- 유저 프로필보이기 -->
<script src="/resources/js/memberProfile.js"></script>
<script type="text/javascript">
	var loginId = null;
	
	<sec:authorize access="isAuthenticated()">
		loginId = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	var list = new Array();
	<c:forEach items="${list}" var="notice">
		list.push('<c:out value="${notice.writer}"/>');
	</c:forEach>
	var arr = Array.from(new Set(list));
	var html = "";
	arr.forEach(i =>{
		memberProfileService.getMemberProfile(i,
			function(data){
				
				if(data.userId == loginId && data.uuid == 'default'){       //로그인유저 사진이 없을때
                    html = '<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/resources/img/default-profile.svg"></div></a>'+
						'<ul class="dropdown-menu">'+
						'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
					'<li><a class="dropdown-item" href="/notice/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">내 게시글 보기</a></li>'+
					'<li><a class="dropdown-item  open-modal" data-bs-target="#messageModal" data-bs-toggle="modal">내 쪽지함</a></li>'+
                    '<li><a class="dropdown-item" href="#">좋아요한 게시물</a></li></ul>';	//security
                }else if(data.userId == loginId){                           //로그인유저 사진이 있을때
                    var fileCallPath = encodeURIComponent(data.uploadPath + "/s_" + data.uuid + "_" + data.fileName);
					html ='<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/display/?fileName='+fileCallPath+'"></div></a>'+
					'<ul class="dropdown-menu">'+
					'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
				'<li><a class="dropdown-item" href="/notice/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">내 게시글 보기</a></li>'+
				'<li><a class="dropdown-item open-modal"  data-bs-target="#messageModal" data-bs-toggle="modal">내 쪽지함</a></li>'+
                '<li><a class="dropdown-item" href="#">좋아요한 게시물</a></li></ul>';		//security
                }else if(data.uuid == 'default'){                           //다른유저 사진없을때
                    html = '<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/resources/img/default-profile.svg"></div></a>'+
						'<ul class="dropdown-menu">'+
						'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
					'<li><a class="dropdown-item" href="/notice/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">게시글 보기</a></li>'+
					'<li><a class="dropdown-item open-modal" data-id="'+data.userId+'" data-bs-target="#messageModal" data-bs-toggle="modal">쪽지쓰기</a></li></ul>';	//security
                }else{                                                      //다른유저 사진있을때
                    var fileCallPath = encodeURIComponent(data.uploadPath + "/s_" + data.uuid + "_" + data.fileName);
					html ='<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><div style="float:left;"><img src="/display/?fileName='+fileCallPath+'"></div></a>'+
					'<ul class="dropdown-menu">'+
					'<li><a class="dropdown-item"><strong>'+data.userId+'</strong></a></li><li><hr class="dropdown-divider"></li>'+
				'<li><a class="dropdown-item" href="/notice/list?type=W&keyword='+data.userId+'&pageNum=1&amount=10">게시글 보기</a></li>'+
				'<li><a class="dropdown-item open-modal" data-id="'+data.userId+'" data-bs-target="#messageModal" data-bs-toggle="modal">쪽지쓰기</a></li></ul>';		//security
                }
				$("."+i).html(html);
				
			}
		);	
	});
	
</script>

<%@include file="../includes/footer.jsp" %>