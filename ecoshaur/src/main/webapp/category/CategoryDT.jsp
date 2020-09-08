<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="assets/libs/css/category.css" rel="stylesheet" type="text/css">

<!-- 본문 시작 CategoryDT.jsp-->

<!-- 본문 시작 Category.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">대여목록</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Category.do?nowpage=1&col=&search=" class="breadcrumb-link">대여목록</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                        
				<c:choose>
					<c:when test="${cg eq '컴퓨터'}"> 컴퓨터</c:when>
					<c:when test="${cg eq 'TV/영상가전'}">TV/영상가전 </c:when>
					<c:when test="${cg eq '음향기기'}"> 음향기기 </c:when>
					<c:when test="${cg eq '콘솔/게이밍'}"> 콘솔/게이밍</c:when>
					<c:when test="${cg eq '카메라'}"> 카메라 </c:when>
				</c:choose>
                        
                        </li>
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
			<ul class="menu"><!-- class="active" -->
				<li><a href="Category.do?nowpage=1&col=&search=">전체보기</a></li>
				<c:choose><c:when test="${cg eq '컴퓨터'}"> <li class="active"> <a href="CategoryDT.do?category=컴퓨터&nowpage=1&col=&search=">컴퓨터</a> </li> </c:when>
				<c:otherwise> <li> <a href="CategoryDT.do?category=컴퓨터&nowpage=1&col=&search=">컴퓨터</a> </li> </c:otherwise> </c:choose>
				
				<c:choose><c:when test="${cg eq 'TV/영상가전'}"> <li class="active"> <a href="CategoryDT.do?category=TV/영상가전&nowpage=1&col=&search=">TV/영상가전</a> </li> </c:when>
				<c:otherwise> <li> <a href="CategoryDT.do?category=TV/영상가전&nowpage=1&col=&search=">TV/영상가전</a> </li></c:otherwise> </c:choose>
				
				<c:choose><c:when test="${cg eq '음향기기'}"> <li class="active"> <a href="CategoryDT.do?category=음향기기&nowpage=1&col=&search=">음향기기</a></li> </c:when>
				<c:otherwise> <li> <a href="CategoryDT.do?category=음향기기&nowpage=1&col=&search=">음향기기</a></li> </c:otherwise> </c:choose>
				
				<c:choose><c:when test="${cg eq '콘솔/게이밍'}"> <li class="active"> <a href="CategoryDT.do?category=콘솔/게이밍&nowpage=1&col=&search=">콘솔/게이밍</a></li> </c:when>
				<c:otherwise> <li> <a href="CategoryDT.do?category=콘솔/게이밍&nowpage=1&col=&search=">콘솔/게이밍</a></li> </c:otherwise> </c:choose>
				
				<c:choose><c:when test="${cg eq '카메라'}"> <li class="active"><a href="CategoryDT.do?category=카메라&nowpage=1&col=&search=">카메라</a></li> </c:when>
				<c:otherwise> <li><a href="CategoryDT.do?category=카메라&nowpage=1&col=&search=">카메라</a></li> </c:otherwise> </c:choose>
			</ul>
			<form method="post" action="CategoryDT.do" onsubmit="return searchCheck(this)">
			<input type="hidden" name="nowpage" id="nowpage" value="${nowpage}">
			<table align="center">
				<tr class="checktd">
				<c:forEach var="cdto" items="${category}"  varStatus="status">
				<td>
					
							<label class="custom-control custom-radio custom-control-inline">
                    			<input type="radio"  id="filter_b1" name="test_check" class="custom-control-input" value="${cdto.minor }"><span class="custom-control-label">${cdto.minor }</span>
                    		</label>
				</td>	
				</c:forEach>
				</tr>
			</table>
			<div class="btns" align="center">
					<input type="hidden" value="${cg }" name="cg">
					<input type="submit" class="btn btn-primary" value="적용">
				</form>
			</div>
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
<br>
        <nav class="nav justify-content-center" aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    
		    <c:forEach var="i" begin="1" end="${count%recordPerPage==0 ? (count/recordPerPage) : (count/recordPerPage)+1}">
		    	<li class="page-item ${nowpage==i ? 'active' : ''}">
		    	
		    	<c:choose><c:when test="${cg eq '컴퓨터'}"> <a class="page-link" href="CategoryDT.do?category=컴퓨터&nowpage=${i}&col=&search="><c:out value="${i}"/></a></li> </c:when> </c:choose>
				
				<c:choose><c:when test="${cg eq 'TV/영상가전'}"> <a class="page-link" href="CategoryDT.do?category=TV/영상가전&nowpage=${i}&col=&search="><c:out value="${i}"/></a></li>  </c:when></c:choose>
				
				<c:choose><c:when test="${cg eq '음향기기'}"> <a class="page-link" href="CategoryDT.do?category=음향기기&nowpage=${i}&col=&search="><c:out value="${i}"/></a></li>  </c:when></c:choose>
				
				<c:choose><c:when test="${cg eq '콘솔/게이밍'}"> <a class="page-link" href="CategoryDT.do?category=콘솔/게이밍&nowpage=${i}&col=&search="><c:out value="${i}"/></a></li>  </c:when></c:choose>
				
				<c:choose><c:when test="${cg eq '카메라'}"> <a class="page-link" href="CategoryDT.do?category=카메라&nowpage=${i}&col=&search="><c:out value="${i}"/></a></li> </c:when></c:choose>
		    	
		    	
		    </c:forEach>
		    
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</nav>
	<!-- 검색기능 -->
	<div style="text-align:center;">
		<form method="get" action="Category.do">
			<input type="hidden" name="category" value="${cg }">
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
<script src="./assets/libs/js/category.js"></script>
<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>