<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="./includes/header.jsp"%>

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
#divBody{
	width:70%;
	margin:0 auto;
}
</style>

<link href="/resources/css/carousel.css" rel="stylesheet">

<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

            <div class="container">
                <div class="carousel-caption text-start">
                    <h1>HeadLine A</h1>
                    <p>AAAAA</p>
                    <p><a class="btn btn-lg btn-primary" href="#">Go To A</a></p>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

            <div class="container">
                <div class="carousel-caption">
                    <h1>HeadLine B</h1>
                    <p>BBBBB</p>
                    <p><a class="btn btn-lg btn-primary" href="#">Go To B</a></p>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

            <div class="container">
                <div class="carousel-caption text-end">
                    <h1>HeadLine C</h1>
                    <p>CCCCC</p>
                    <p><a class="btn btn-lg btn-primary" href="#">Go To C</a></p>
                </div>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<div id="divBody">
	<div class="container">
		<div class="row mb-2">
		    <div class="col-md-6">
		        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		            <div class="col p-4 d-flex flex-column position-static">
		                <strong class="d-inline-block mb-2 text-primary">신규 공지사항</strong>
		                <h3 class="mb-0">관리자</h3>
		            <div class="mb-1 text-muted">${newNotice.regDate}</div>
		                <p class="card-text mb-auto">${newNotice.title}</p>
		                <a href="#" class="stretched-link">Continue reading</a>
		            </div>
		            <div class="col-auto d-none d-lg-block">
		                <svg class="bd-placeholder-img newNotice" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
		
		            </div>
		        </div>
		    </div>
		    <div class="col-md-6">
		        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		            <div class="col p-4 d-flex flex-column position-static">
		                <strong class="d-inline-block mb-2 text-success">신규 이벤트</strong>
		                <h3 class="mb-0">이벤트 담당자</h3>
		            <div class="mb-1 text-muted">${newEvent.regDate}</div>
		                <p class="mb-auto">${newEvent.title}</p>
		                <a href="#" class="stretched-link">Continue reading</a>
		            </div>
		            <div class="col-auto d-none d-lg-block">
		                <svg class="bd-placeholder-img newEvent" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
		
		            </div>
		        </div>
		    </div>
		</div>
	</div>
	
	<div class="container">
		
		<div class="mt-5">
		<h3>인기 게시글</h3>
		    <table class="table ms">
		        
		        <tbody>
		            <tr>
		                <th scope="row">1</th>
		                <td>제목ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</td>
		                <td>작성자</td>
		                <td>작성일</td>
		            </tr>
		            <tr>
		                <th scope="row">2</th>
		                <td>제목</td>
		                <td>작성자</td>
		                <td>작성일</td>
		            </tr>
		            <tr>
		                <th scope="row">3</th>
		                <td>제목</td>
		                <td>작성자</td>
		                <td>작성일</td>
		            </tr>
		            <tr>
		                <th scope="row">4</th>
		                <td>제목</td>
		                <td>작성자</td>
		                <td>작성일</td>
		            </tr>
		            <tr>
		                <th scope="row">5</th>
		                <td>제목</td>
		                <td>작성자</td>
		                <td>작성일</td>
		            </tr>
		        </tbody>
		    </table>
		</div>
	</div>
</div>

<script type="text/javascript">

</script>

<%@include file="./includes/footer.jsp" %>