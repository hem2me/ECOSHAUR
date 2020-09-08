<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">


<!-- 본문 시작 template.jsp-->

<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h3 class="mb-2">검색결과 </h3>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"></li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- ============================================================== -->
<!-- end pageheader -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- content -->
<!-- ============================================================== -->
<div class="row">
    <!-- ============================================================== -->
    <!-- profile -->
    <!-- ============================================================== -->
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <!-- ============================================================== -->
        <!-- campaign tab one -->
        <!-- ============================================================== -->
        <div class="influence-profile-content pills-regular">
            
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-campaign" role="tabpanel" aria-labelledby="pills-campaign-tab">
                    <div class="row">
                    <div class="card col-12">
                        <h5 class="card-header">상품목록 <a class="btn btn-primary" href="Category.do?nowpage=1&col=subject_content&search=${search }">더보기</a></h5>
                        
                        <c:forEach var="dto" items="${Rlist}" varStatus="status">
                        	<c:choose>
	                        	<c:when test="${status.index == 0}">
			                        <div class="card-body">
			                            <div class="review-block">
			                                <p class="review-text font-italic m-0"><a href="RentalRead.do?product_no=${dto.product_no }">${dto.description }</a></p>
			                                <span class="text-dark font-weight-bold">${dto.title }</span><small class="text-mute"> (${dto.sub_title })</small>
			                            </div>
			                        </div>
		                        </c:when>
		                        <c:otherwise>
			                        <div class="card-body border-top">
			                            <div class="review-block">
			                                <p class="review-text font-italic m-0"><a href="RentalRead.do?product_no=${dto.product_no }">${dto.description }</a></p>
			                                <span class="text-dark font-weight-bold">${dto.title }</span><small class="text-mute"> (${dto.sub_title })</small>
			                            </div>
			                        </div>
			                    </c:otherwise>
	                        </c:choose>
                        </c:forEach>
                    </div>                    
                	</div>
                	
                	<div class="row">
                    <div class="card col-12">
                        <h5 class="card-header">공지사항<a class="btn btn-primary" href="Notice.do?nowpage=1&col=subject_content&search=${search }">더보기</a></h5>
                        <c:forEach var="dto" items="${list}" varStatus="status">
                        	<c:choose>
	                        	<c:when test="${status.index == 0}">
			                        <div class="card-body">
			                            <div class="review-block">
			                                <p class="review-text font-italic m-0"><a href="Notice.do?postno=${dto.postno }">${dto.description }</a></p>
			                                <span class="text-dark font-weight-bold">${dto.title }</span><small class="text-mute"> (${dto.sub_title })</small>
			                            </div>
			                        </div>
		                        </c:when>
		                        <c:otherwise>
			                        <div class="card-body border-top">
			                            <div class="review-block">
			                                <p class="review-text font-italic m-0">${dto.description }</p>
			                                <span class="text-dark font-weight-bold">${dto.title }</span><small class="text-mute"> (${dto.sub_title })</small>
			                            </div>
			                        </div>
			                    </c:otherwise>
	                        </c:choose>
                        </c:forEach>
                    </div>                    
                	</div>
                	
                	
                	<div class="row">
                    <div class="card col-12">
                        <h5 class="card-header">자유게시판<a class="btn btn-primary" href="Board.do?nowpage=1&col=subject_content&search=${search }">더보기</a></h5>
                        <c:forEach var="dto" items="${Blist}" varStatus="status">
                        	<c:choose>
	                        	<c:when test="${status.index == 0}">
			                        <div class="card-body">
			                            <div class="review-block">
			                                <p class="review-text font-italic m-0"><a href="BRead.do?postno=${dto.postno }">${dto.contents }</a></p>
			                                <span class="text-dark font-weight-bold">${dto.title }</span><small class="text-mute"> (${dto.id })</small>
			                            </div>
			                        </div>
		                        </c:when>
		                        <c:otherwise>
			                        <div class="card-body border-top">
			                            <div class="review-block">
			                                <p class="review-text font-italic m-0">${dto.description }</p>
			                                <span class="text-dark font-weight-bold">${dto.title }</span><small class="text-mute"> (${dto.id })</small>
			                            </div>
			                        </div>
			                    </c:otherwise>
	                        </c:choose>
                        </c:forEach>
                    </div>                    
                	</div>
                	
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end campaign tab one -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end campaign data -->
    <!-- ============================================================== -->
</div>





<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 본문 끝 -->		
<%@ include file="footer.jsp" %>