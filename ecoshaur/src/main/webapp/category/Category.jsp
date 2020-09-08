<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="assets/libs/css/category.css" rel="stylesheet" type="text/css">


<!-- 깃 테스트 -->

<!-- 본문 시작 Category.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">대여목록</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Category.do?nowpage=1&col=&search=" class="breadcrumb-link">대여목록</a></li>
                        <li class="breadcrumb-item active" aria-current="page">전체보기</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>



<div class="container">

<c:choose>
	<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
		<div style="text-align:center;">
			<a href="Rental_resister.do" class="btn btn-success">글 쓰기</a>
		</div>
	</c:when>
</c:choose>

	<nav class="category">
		<div class="list">
			<ul class="menu">
				<li class="active"><a href="Category.do?nowpage=1&col=&search=">전체보기</a></li>
				<li> <a href="CategoryDT.do?category=컴퓨터&nowpage=1&col=&search=">컴퓨터</a> </li>
				<li> <a href="CategoryDT.do?category=TV/영상가전&nowpage=1&col=&search=">TV/영상가전</a> </li>
				<li> <a href="CategoryDT.do?category=음향기기&nowpage=1&col=&search=">음향기기</a></li>
				<li> <a href="CategoryDT.do?category=콘솔/게이밍&nowpage=1&col=&search=">콘솔/게이밍</a></li>
				<li><a href="CategoryDT.do?category=카메라&nowpage=1&col=&search=">카메라</a></li>
			</ul>
		</div>
	</nav>
        <div class="row">
        <c:forEach var="dto" items="${list}">
        
            <div class="col-sm-6 col-md-4 col-lg-3 mt-4">
                <div class="card">
                    <img class="card-img-top" src="category/storage/${dto.thmb_name}">
                    <div class="card-block">
                        <h4 class="card-title"><a href="RentalRead.do?product_no=${dto.product_no}">${dto.title}</a></h4>
                        <div class="meta">
                            ${dto.sub_title}
                        </div>
                        <div class="card-text">
                            ${dto.product_name}
                        </div>
                    </div>
                    <div class="card-footer">
                        <span>일일대여료 : ${dto.price_daily}</span><br>
                        <span>보증금 : ${dto.deposit}</span><br>
                        <span>수량 : ${dto.remaining_quantity}/${dto.total_quantity}</span>
                    </div>
                </div>
            </div>
            	
            
        </c:forEach>
        </div>
       
        
</div>
<br><br><br>

        <nav class="nav justify-content-center" aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		    <c:choose>
		    	<c:when test="${(nowpage-1)==0}"> <a class="page-link disabled">  </c:when>
		    	<c:otherwise> <a class="page-link" href="Category.do?nowpage=${nowpage-1 }&col=&search="> </c:otherwise>
		    </c:choose>
		    Previous</a></li>
		    
		    <c:forEach var="i" begin="1" end="${count%recordPerPage==0 ? (count/recordPerPage) : (count/recordPerPage)+1}">
		    	<li class="page-item ${nowpage==i ? 'active' : ''}"><a class="page-link" href="Category.do?nowpage=${i}&col=&search="><c:out value="${i}"/></a></li>
		    </c:forEach>
		    
		    <li class="page-item">
		    <c:choose><c:when test="${nowpage == i}"> <a class="page-link disabled">  </c:when>
		    	<c:otherwise> <a class="page-link" href="Category.do?nowpage=${nowpage+1 }&col=&search="> </c:otherwise>
		    </c:choose>
		    Next</a></li>
		  </ul>
		</nav>
	<!-- 검색기능 -->
	<div style="text-align:center;">
		<form method="get" action="Category.do">
			<input type="hidden" name="nowpage" value="1">
			<label class="custom-control custom-radio custom-control-inline">
				<input class="custom-control-input" type="radio" name="col" value="subject"> 
				<span class="custom-control-label">제목</span>
			</label>
			<label class="custom-control custom-radio custom-control-inline">
				<input class="custom-control-input" type="radio" name="col" value="content">
				<span class="custom-control-label">내용 </span>
			</label>
			<label class="custom-control custom-radio custom-control-inline">
				<input class="custom-control-input" type="radio" name="col" value="subject_content">
				<span class="custom-control-label">제목+내용</span>	
			</label>
			
			<input type="text" name="search">
			<input type="submit" class="btn btn-primary" value="Search">
		</form>
	</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>