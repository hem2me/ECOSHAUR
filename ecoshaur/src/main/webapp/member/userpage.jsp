<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="./assets/libs/css/mypage.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

<style>
   
input.hidden {
    position: absolute;
    left: -9999px;
}

#profile-image1 {
    cursor: pointer;
    width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
	.tital{font-size:16px; font-weight:500;}
	.bot-border{border-bottom:1px #f8f8f8 solid; margin:5px 0 5px 0}	
</style>


<!-- 본문 시작 userpage.jsp-->

	<!-- 페이지 헤더 시작 -->
	<div class="row">
   		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        	<div class="page-header">
               <h2 class="mb-2">회원정보 </h2>
        	</div>
   		</div>
	</div>
	<!-- 페이지 헤더 끝 -->
	
    <div class="row">
        <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
             <div class="card">
                  <div class="card-body">
                       <div class="user-avatar text-center d-block">
                            <img src="member/storage/${dto.pro_name}" alt="User Avatar" class="rounded-circle user-avatar-xxl">
                       </div>
                       <div class="text-center">
                            <h2 class="font-24 mb-0">${dto.id}</h2>
                            <p>${dto.mem_name}</p>
                       </div>
                   </div>
                   <div class="card-body border-top">
                        <h3 class="font-16">회원 정보</h3>
                        <div class="">
                             <ul class="list-unstyled mb-0">
                                  <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${dto.email}</li>
                             </ul>
                        </div>
                   </div>
                   <div class="card-body border-top">
                        <h3 class="font-16">등급</h3>
                        <div class="">
                             <ul class="list-unstyled mb-0">
                        		<li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>
									<c:choose>
										<c:when  test="${dto.grade eq 'U'}">
                                    		유저 등급
                                    	</c:when>
                                    	<c:when  test="${dto.grade eq 'S'}">
                                    		슈퍼 등급
                                    	</c:when>
                                    	<c:when  test="${dto.grade eq 'P'}">
                                    		프리미엄 등급
                                    	</c:when>
                                    	<c:when  test="${dto.grade eq 'M'}">
                                    		마스터 등급
                                    	</c:when>
                                    	<c:when  test="${dto.grade eq 'W'}">
                                    		탈퇴 회원
                                    	</c:when>
                                    </c:choose>
								</li>
                        	</ul>
                        </div>
                   </div>
                   <div class="card-body border-top">
                        <h3 class="font-16">포인트</h3>
                        <div class="">
                             <ul class="list-unstyled mb-0">
                       			<li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${dto.point}점</li>
                       		</ul>
                        </div>
                   </div>
                   <div class="card-body border-top">
                        <h3 class="font-16">좋아요</h3>
                        <div class="">
                             <ul class="list-unstyled mb-0">
                        		<li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${dto.likecnt}개</li>
                        	</ul>
                        </div>
                   </div>
             </div>
        </div>
                      
        <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
             <div class="influence-profile-content pills-regular">
                  <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                      <li class="nav-item">
                           <a class="nav-link" id="pills-packages-tab" data-toggle="pill" href="#pills-packages" role="tab" aria-controls="pills-packages" aria-selected="false">상품 목록</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false">활동 내역</a>
                      </li>
                   </ul>
                   <div class="tab-content" id="pills-tabContent">
                          <!-- 상품목록 -->
                          <div class="tab-pane fade show active" id="pills-packages" role="tabpanel" aria-labelledby="pills-packages-tab">
                               <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                         <div class="section-block">
                                              <h2 class="section-title">회원 등록 상품 목록</h2>
                                         </div>
                                    </div>
                                    <table class="table table-hover">
                            		<thead class="thead-dark">
      									<tr>
        								<th>상품게시번호</th>
        								<th>상품명</th>
        								<th>상품등록일</th>
        								<th>제목</th>
      									</tr>
    								</thead>  
    								<tbody>
    								<c:forEach var="dto" items="${user_rental}">
      									<tr>
	        								<td>${dto.product_no}</td>
	        								<td>${dto.product_name}</td>
	        								<td>${dto.reg_date}</td>
	        								<td>${dto.title}</td>
      									</tr>  
      								</c:forEach>        
									</tbody>	
									</table>                   
								</div>     
                           </div>
                           <!-- 활동내역 -->
                           <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                               <div class="section-block">
                                    <h2 class="section-title">회원 등록 게시글 목록</h2>
                               </div>
                                <div class="card">
                                     <c:forEach var="dto" items="${user_board}">
                                         <h5 class="card-header">${dto.title}</h5>
                                         <div class="card-body">
                                              <div class="review-block">
                                                    <p class="review-text font-italic m-0"><a href="BRead.do?postno=${dto.postno}">${dto.contents}</a></p>
                                                    <span class="text-dark font-weight-bold">${dto.post_date}</span>
                                              </div>
                                         </div>
                                         <hr>
                                      </c:forEach>
                                 </div>
                            </div>
                   </div>
             </div>
        </div>
   </div>
   

<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>