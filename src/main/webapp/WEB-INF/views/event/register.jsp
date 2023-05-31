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
					<h3 class="mt-5 mb-3">이벤트 > 글쓰기</h3>
				</div>
				<div class="panel panel-body">
					<form role="form" action="/event/register" method="post">
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
						        <tr>
						        	<td>
						        		썸네일 등록<br>
						        		<input type="file" multiple name="uploadFile" class="form-control">						        		
						        	</td>
						        </tr>
						    </tbody>
						</table>
						<input type="hidden" name='category' value="event">
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

<script>

var formObj = $("form[role='form']");
var regax = new RegExp("(.*)\.(exe|sh|zip|alz)$");
//(.*) : 임의의 문자가 0개 이상, \.은 그냥 dot, exe 또는 sh......
//어떤 문자로 시작하든지, 몇글자이든지 상관없음. 확장자 4종류 찾겠다.
//$표시는 문장의 끝

var maxSize = 5242880;

function checkExtension(fileName, fileSize){
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regax.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
var successResult;

$("input[type='file']").change(
		function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			for(var i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					console.log("a");
					return false;
				}
				console.log("b");
				formData.append("uploadFile", files[i]);
				console.log("c");
			}
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result){
					console.log(result);
					successResult = result;
				}
				
			});
			console.log("d");
		});
		
		$("button[type='submit']").on("click",
			function(e){
				e.preventDefault();
				console.log("submitttt");
				var str = "";
				$(successResult).each(
					function(i, obj){
						str = "<input type='hidden' name='attachList["+i+"].fileName' value='"+obj.fileName+"'>" +
						"<input type='hidden' name='attachList["+i+"].uuid' value='"+obj.uuid+"'>" +
						"<input type='hidden' name='attachList["+i+"].uploadPath' value='"+obj.uploadPath+"'>" +
						"<input type='hidden' name='attachList["+i+"].type' value='"+obj.type+"'>";
					}
				);
				console.log(str);
				formObj.append(str).submit();
			}
		);


</script>







<%@include file="../includes/footer.jsp" %>