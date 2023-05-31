<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<script src="/resources/js/jquery-3.1.1.min.js"></script>
<link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">

<script src="/resources/dist/js/datepicker.js"></script>
<script src="/resources/dist/js/i18n/datepicker.ko.js"></script>

<title>login page</title>


<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media (min-width: 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
body {
  height: 100%;
}
body {
  display: flex;
  align-items: center;
  padding-top: 20px;
  padding-bottom: 15px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: -1px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
#profile{
	margin-bottom: 20px;
}

#datepicker{
	width: 100%;
	max-width: 330px;
	padding: 15px;
}
.uploadResult{
	width:100%;
}
.uploadResult ul{
	list-style:none;
	
}

.uploadResult ul li{
    list-style: none;
}

.uploadResult ul li div{
    width: 220px;
    height: 220px; 
    border-radius: 70%;
    overflow: hidden;
    
}

.uploadResult ul li div img{
	width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>


<!-- Custom styles for this template -->

</head>
<body class="text-center">
	<!-- bootstrap -->
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
	<main class="form-signin">
		<form role="form" method="post" action="/customRegister">
			<!-- 나중에 수정 -->
			<!-- 로고 -->
			<a href="/main">
				<h1>로고임 ㅋ</h1>
			</a>
			<h1 class="h3 mb-3 fw-normal">회원가입</h1>
			
			<div>
				<input type="file" class="form-control" id="uploadFile" name="uploadFile" style='display: none;' multiple accept="image/*">
				<div class="uploadResult">
					<ul>
					
						<li>
							<div>
								<img src="/resources/img/default-profile.svg" onclick='document.all.uploadFile.click();'>
							</div>
						</li>
					</ul>
					
				</div>
		   	</div>
			
			<div class="form-floating mt-3">
				<input type="text" class="form-control" id="floatingInput" placeholder="User name" name="userName">
				<label for="floatingInput">이름</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput" placeholder="User ID" name="userId">
				<label for="floatingInput">아이디</label>
			</div>
			
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPw">
				<label for="floatingPassword">비밀번호</label>
			</div>
			
			<div class="datePickerDiv">
		        <input type="text" id="datepicker" placeholder="생년월일" name="birthDay">
		    </div>
		   
			<button class="w-100 btn btn-lg btn-primary mt-3" type="submit">회원가입</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</main>
	
</body>

<!-- 데이트피커 -->
<script>
    $("#datepicker").datepicker({
    	language: 'ko'
    });
</script>

<!-- 유저 프로필 -->
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
				showUploadResult(result);
			}
			
		});
		console.log("d");
	});
function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length == 0){return;}
	var uploadUL = $(".uploadResult ul");
	var str = "";
	
	$(uploadResultArr).each(
		function(i, obj){
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str = "<li data-path='" +
				obj.uploadPath +
				"' data-uuid='" +
				obj.uuid +
				"' data-filename='" +
				obj.fileName +
				"' data-type='" +
				obj.image +
				"'><div><img class='circle' id='user-profile' src='/display?fileName=" +
				fileCallPath +
				"' onclick='document.all.uploadFile.click();'></div><button type='button' data-file='" +
				fileCallPath +
				"' data-type='image' class='btn-close'></button></li>";
			}
		});
	uploadUL.html(str);
}

$(".uploadResult").on("click", "button",
		function(e){
			console.log("delete file");
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			var uploadUL = $(".uploadResult ul");
			var str = "";
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type:type},
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType:'text',
				type:'POST',
				success: function(result){
					alert(result);
					targetLi.remove();
					str = "<li><div><img src='/resources/img/default-profile.svg' onclick='document.all.uploadFile.click();'></div></li>";
					uploadUL.html(str);
				}
		});		
});

$("button[type='submit']").on("click",
		function(e){
			e.preventDefault();
			console.log("submit clicked");
			var str = "";
			$(".uploadResult ul li").each(
					function(i, obj){
						var jobj = $(obj);
						if(jobj.data("filename") == null){
							str += "<input type='hidden' name='memberProfile["+i+"].fileName' value='noProfile.jpg'>'";
							str += "<input type='hidden' name='memberProfile["+i+"].uuid' value='default'>'";
							str += "<input type='hidden' name='memberProfile["+i+"].uploadPath' value='2023\01\30'>'";
								str += "<input type='hidden' name='memberProfile["+i+"].fileType' value='1'>'";
						}else{
							console.dir(jobj);
							console.log("-----------------");
							console.log(jobj.data("filename"));
							str += "<input type='hidden' name='memberProfile["+i+"].fileName' value='"+jobj.data("filename")+"'>'";
							str += "<input type='hidden' name='memberProfile["+i+"].uuid' value='"+jobj.data("uuid")+"'>'";
							str += "<input type='hidden' name='memberProfile["+i+"].uploadPath' value='"+jobj.data("path")+"'>'";
								str += "<input type='hidden' name='memberProfile["+i+"].fileType' value='"+jobj.data("type")+"'>'";
						}
			});
			console.log(str);
			formObj.append(str).submit();
});
</script>


</html>


