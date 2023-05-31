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
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel panel-heading">
					<h3 class="mt-5 mb-3">공지사항 > 게시글 수정</h3>
				</div>
				<div class="panel panel-body">
					<form role="form" action="/notice/modify" method="post" id="opForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="hidden" name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
						<input type="hidden" name='amount' value='<c:out value="${criteria.amount}"/>'>
						<input type="hidden" name='type' value='<c:out value="${criteria.type}"/>'>
						<input type="hidden" name='keyword' value='<c:out value="${criteria.keyword}"/>'>
						<input type="hidden" name="bno" value='<c:out value="${board.bno}"/>'>
						<table class="table">
						    <tbody>
						        <tr>
						            <td><div class="form-floating">
						                <input type="text" class="form-control" id="floatingInput" readonly value='<sec:authentication property="principal.username"/>' name='writer'>
						                <label for="floatingInput">작성자</label>
						            </div></td>
						        </tr>
						        <tr>
						            <td><div class="form-floating">
						                <input type="text" class="form-control" id="floatingInput" name='title' value='<c:out value="${board.title}"/>'>
						                <label for="floatingInput">제목</label>
						            </div></td>
						        </tr>
						        <tr>
						            <td>
						                <textarea class="editor" name="content"><c:out value="${board.content}"/></textarea>
						            </td>
						        </tr>
						        <tr>
						            <td>
						                zz
						            </td>
						        </tr>
						    </tbody>
						</table>
						<sec:authentication property="principal" var="pinfo"/>
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq board.writer}">
								<button type="submit" data-oper='modify' class="btn btn-secondary">수정하기</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">게시글 삭제</button>
							</c:if>						
						</sec:authorize>
						<button type="submit" data-oper="list" class="btn btn-info">목록</button>
					</form>
				</div>
				
				<div class="panel panel-footer mt-3">
					
				</div>
				
			</div>
		</div>
	</div>
</div>


<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<script>
$(document).ready(function() {
    var toolbar = [
        // 글꼴 설정
        ['fontname', ['fontname']],
        // 글자 크기 설정
        ['fontsize', ['fontsize']],
        // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        // 글자색
        ['color', ['forecolor','color']],
        // 표만들기
        ['table', ['table']],
        // 글머리 기호, 번호매기기, 문단정렬
        ['para', ['ul', 'ol', 'paragraph']],
        // 줄간격
        ['height', ['height']],
        // 그림첨부, 링크만들기, 동영상첨부
        ['insert',['picture','link','video']],
        // 도움말
        ['view', ['help']]
    ];

    var setting = {
        height : 300,
        minHeight : null,
        maxHeight : null,
        focus : true,
        lang : 'ko-KR',
        toolbar : toolbar,
        callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor, welEditable) {
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i], this);
                }
            }
        }
    };

    $('.editor').summernote(setting);
});
function uploadSummernoteImageFile(file, el){
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data : data,
        type : "POST",
        url : '<c:url value="/uploadSummernoteImageFile"/>?${_csrf.parameterName}=${_csrf.token}',
        contentType : false,
        enctype : 'multipart/form-data',
        processData : false,
        success : function(data){
            $(el).summernote('editor.insertImage', data.url);
        }
    });
}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		var opForm = $("#opForm");
		$('button').on("click",
		function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'remove'){
				opForm.attr("action", "/notice/remove");
			}else if(operation === 'list'){
				var location = false;
				if(location){
					self.location = "/notice/list";
					return;
				}else{
					opForm.attr("action", "/notice/list").attr("method", "get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var typeTag = $("input[name='type']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					opForm.empty();
					opForm.append(pageNumTag);
					opForm.append(amountTag);
					opForm.append(typeTag);
					opForm.append(keywordTag);
				}
			}else if(operation === 'modify'){
				console.log("submit clicked");
				var str = "";
				
				//uploadFile 첨부파일 동적생성자리
			}
			opForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp" %>