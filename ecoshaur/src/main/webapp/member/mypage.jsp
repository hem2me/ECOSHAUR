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
<c:choose>
	<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
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
	.tital{ font-size:16px; font-weight:500;}
	 .bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}	
</style>


 <!-- ============================================================== -->
        
                    <!-- ============================================================== -->
                    <!-- pageheader -->
                    <!-- ============================================================== -->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">마이페이지</h2>
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
                        <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- card profile -->
                            <!-- ============================================================== -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="user-avatar text-center d-block">
                                        <img src="member/storage/${mymem.pro_name}" alt="User Avatar" class="rounded-circle user-avatar-xxl">
                                    </div>
                                    <div class="text-center">
                                        <h2 class="font-24 mb-0">${id }</h2>
                                        <p>${mymem.mem_name }</p>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Contact Information</h3>
                                    <div class="">
                                        <ul class="list-unstyled mb-0">
                                        <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${mymem.email }</li>
                                        <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>${mymem.contact_number }</li>
                                    </ul>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Rating</h3>
                                    <c:choose>
										<c:when  test="${grade eq 'U'}">
                                    		<h3 class="mb-0">유저 등급</h3>
                                    	</c:when>
                                    	<c:when  test="${grade eq 'S'}">
                                    		<h3 class="mb-0">슈퍼 등급</h3>
                                    	</c:when>
                                    	<c:when  test="${grade eq 'P'}">
                                    		<h3 class="mb-0">프리미엄 등급</h3>
                                    	</c:when>
                                    	<c:when  test="${grade eq 'M'}">
                                    		<h3 class="mb-0">마스터 등급</h3>
                                    	</c:when>
                                    </c:choose>
                                    
                                    
                                </div>
                                
                                 <div class="card-body border-top">
                                    <h3 class="font-16">상세정보</h3>
                                    <div class="">
                                        <ul class="list-unstyled mb-0">
                                        <li class="mb-2"><i class="fas fa-address-card"></i> ${mymem.zip }</li>
                                        <li class="mb-0">${mymem.address }</li>
                                        <li class="mb-0">${mymem.address_r }</li><br>
                                        <li class="mb-0"><i class="fas fa-user"></i> ${mymem.joined_date }</li>
                                    </ul>
                                    </div>
                                </div>
                                
                                    
                            </div>
                            
                            <a class="btn btn-success" href="ModifyForm.do?id=${id }" >수정</a>
							<a href="delete.do" class="btn btn-danger">탈퇴</a>
							<a class="btn btn-primary" href="logout.do">로그아웃</a>
                            <!-- ============================================================== -->
                            <!-- end card profile -->
                            <!-- ============================================================== -->
                        </div>
                        <!-- ============================================================== -->
                        <!-- end profile -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- campaign data -->
                        <!-- ============================================================== -->
                        <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- campaign tab one -->
                            <!-- ============================================================== -->
                            <div class="influence-profile-content pills-regular">
                                <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-campaign-tab" data-toggle="pill" href="#pills-campaign" role="tab" aria-controls="pills-campaign" aria-selected="true">포인트 내역</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-packages-tab" data-toggle="pill" href="#pills-packages" role="tab" aria-controls="pills-packages" aria-selected="false">활동내역</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false">게시판 글 목록</a>
                                    </li>
                                    
                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-campaign" role="tabpanel" aria-labelledby="pills-campaign-tab">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h3 class="section-title">포인트 & 좋아요 & 싫어요</h3>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">잔여 포인트</h1>
                                                        <p>${point_p }점</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">사용포인트</h1>
                                                        <p>${point_m }점</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">총 좋아요 수</h1>
                                                        <p>${rating_good }개</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">총 싫어요 수</h1>
                                                        <p>${rating_bad }개</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="section-block">
                                            <h3 class="section-title">1:1문의 글 목록</h3>
                                        </div>
                                        
                                        
                                        <div class="card">
			                            <h5 class="card-header">문의사항 목록</h5>
			                            <div class="card-body">
			                            
			                            <c:forEach var="dto" items="${qna_list}">
			                            	<c:choose>
			                            	<c:when test="${dto.ccode == 0 }">
			                                <div class="media">
			                                	
			                                	<c:choose>
			                                		<c:when test="${(dto.image_name eq '') or (dto.image_name == null)}">
			                                    		<img class="mr-3 user-avatar-lg rounded" src="./assets/images/avatar-1.jpg">
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		<img class="mr-3 user-avatar-lg rounded" src="./community/storage/${dto.image_name }">
			                                    	</c:otherwise>
			                                    </c:choose>
			                                    
			                                    <div class="media-body">
			                                        <h5 class="mt-0">
			                                        <c:if test="${dto.head == 'Qna-A' }">[상품문의]	</c:if>
													<c:if test="${dto.head == 'Qna-B' }">[사이트 이용문의]	</c:if>
													<c:if test="${dto.head == 'Qna-C' }">[수령 및 반납문의]	</c:if>
													<c:if test="${dto.head == 'Qna-D' }">[기타문의]	</c:if>
													${dto.title}
			                                        </h5> ${dto.contents }
			                                   </div>
			                             </div>
                                  </c:when> 
                                  
                                  <c:otherwise>   
		                             <div class="media mt-3" style="padding-left: 3%;">
			                                 <c:choose>
		                                		<c:when test="${(dto.image_name eq '') or (dto.image_name == null)}">
		                                    		<img class="mr-3 user-avatar-lg rounded" src="./assets/images/avatar-1.jpg">
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		<img class="mr-3 user-avatar-lg rounded" src="./community/storage/${dto.image_name }">
		                                    	</c:otherwise>
		                                    </c:choose>
		                                 <div class="media-body">
		                                     <h5 class="mt-0">
		                                     <c:if test="${dto.head == 'Qna-A' }">[상품문의]	</c:if>
											<c:if test="${dto.head == 'Qna-B' }">[사이트 이용문의]	</c:if>
											<c:if test="${dto.head == 'Qna-C' }">[수령 및 반납문의]	</c:if>
											<c:if test="${dto.head == 'Qna-D' }">[기타문의]	</c:if>
		                                    ${dto.title}
		                                     </h5> ${dto.contents } 
		                                 </div>
		                             </div>
                             	</c:otherwise>  
                             </c:choose>
                             </c:forEach>       
                                    
                                </div>
                                
                            </div>
                                        
                                     
                                    </div>
                                    <div class="tab-pane fade" id="pills-packages" role="tabpanel" aria-labelledby="pills-packages-tab">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h2 class="section-title">내 상품목록</h2>
                                                </div>
                                            </div>
                                            
                                            <table class="table">
                            		<thead class="thead-dark">
      									<tr>
        								<th>상품게시번호</th>
        								<th>상품명</th>
        								<th>상품등록일</th>
        								<th>제목</th>
      									</tr>
    								</thead>  
    							
    								<tbody>
    								<c:forEach var="dto" items="${mypage}">
      									<tr>
	        								<td><a href="RentalRead.do?product_no=${dto.product_no }">${dto.product_no }</a></td>
	        								<td>${dto.product_name }</td>
	        								<td>${dto.reg_date }</td>
	        								<td>${dto.title }</td>
      									</tr>  
      								</c:forEach>        
									</tbody>
										
								</table>
                                      
                                      </div>
                                      <br>
                                      <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h2 class="section-title">내 주문서</h2>
                                                </div>
                                            </div>
                                            
                                            <table class="table">
                            		<thead class="thead-dark">
      									<tr>
        								<th>주문서번호</th>
        								<th>결제금액</th>
        								<th>받는사람</th>
        								<th>배송방법</th>
        								<th>배송주소</th>
        								<th>상세주소</th>
        								<th>연락처</th>
      									</tr>
    								</thead>  
    							
    								<tbody>
    								<c:forEach var="dto" items="${order_sheet}" varStatus="status">
      									<tr>
	        								<td><a href="order_history.do?order_no=${dto.order_no }">${dto.order_no }</a></td>
	        								<td>${dto.payment_price }</td>
	        								<td>${dto.recipient }</td>
	        								<td>${dto.delivery_method }</td>
	        								<td>${dto.address }</td>
	        								<td>${dto.address_R }</td>
	        								<td>${dto.tel }</td>
      									</tr>  
      								</c:forEach>        
									</tbody>
										
								</table>
                                     </div>
                                     </div>
                                 
                                    <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                        <div class="card">
                                        <c:forEach var="dto" items="${board_list}">
                                            <h5 class="card-header"><a href="BRead.do?postno=${dto.postno}">${dto.title }</a></h5>
                                            <div class="card-body">
                                                <div class="review-block">
                                                    <p class="review-text font-italic m-0">${dto.contents }</p>
                                                    <span class="text-dark font-weight-bold">${dto.post_date }</span>
                                                </div>
                                            </div>
                                            <hr>
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
              </c:when>
              	<c:otherwise>
			<script>alert('잘못된 요청입니다'); window.location.href = './';</script>
	</c:otherwise>
              </c:choose>
   

<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>