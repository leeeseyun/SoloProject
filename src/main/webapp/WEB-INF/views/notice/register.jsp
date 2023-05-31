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
					<h3 class="mt-5 mb-3">공지사항 > 글쓰기</h3>
				</div>
				<div class="panel panel-body">
					<form role="form" action="/notice/register" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
						                <input type="text" class="form-control" id="floatingInput" name='title'>
						                <label for="floatingInput">제목</label>
						            </div></td>
						        </tr>
						        <tr>
						            <td>
						                <textarea class="editor" name="content"></textarea>
						            </td>
						        </tr>
						    </tbody>
						</table>
						<input type="hidden" name='category' value="notice">
						<button type="submit" class="btn btn-dark mt-3">게시글 등록</button>
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
<%@include file="../includes/footer.jsp" %>