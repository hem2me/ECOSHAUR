<!doctype html>
<html lang="en">
 
<head>
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Data Tables</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../../assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../../assets/libs/css/style.css">
    <link rel="stylesheet" href="../../assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" type="text/css" href="../../assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../../assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../../assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../../assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
</head>
<%@ include file="header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                 <form method="post" action="rating.do">
                <div class="row">
                    <div class="col-xl-7 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">회원 좋아요/싫어요 관리</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                    	<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">회원관리</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">회원 좋아요/싫어요 관리</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
				<h3>Rating : <label class="custom-control custom-radio custom-control-inline">
	            <input type="radio" name="evaluation" id="evaluation" class="custom-control-input" value="Good"><span class="custom-control-label">좋아요</span>
	           	</label>
	           	<label class="custom-control custom-radio custom-control-inline">
	            <input type="radio" name="evaluation" id="evaluation" class="custom-control-input" value="Bad"><span class="custom-control-label">싫어요</span>
	           	</label><input type="submit" class="btn btn-primary" value="적용"></h3>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                        <div class="card">
                            <h5 class="card-header">평가할 회원</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                              <th>선택</th>
                                              <th>프로필</th>
	                                          <th>id</th>
	                                          <th>이름</th>
	                                          <th>생년월일</th>
	                                          <th>연락처</th>
	                                          <th>등급</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                      <c:forEach var="dto" items="${list}">
                                      <tr>
                                      		  <td><label class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" name="id_give" id="id_give" class="custom-control-input" value="${dto.id}"><span class="custom-control-label">선택</span>
                                              </label></td>
                                              <td><div class="m-r-10"><img src="../../member/storage/${dto.pro_name}" alt="user" class="rounded" width="45"></div></td>
                                              <td><a href="member_manager.do?id=${dto.id}">${dto.id}</a></td>
                                              <td>${dto.mem_name}</td>
                                              <td>${dto.birth}</td>
                                              <td>${dto.contact_number}</td>
                                              <td>
                                              	<c:choose>
                                              		<c:when test="${dto.grade eq 'M'}">관리자<span style="display:none">master</span>  </c:when>
                                              		<c:when test="${dto.grade eq 'P'}">프리미엄<span style="display:none">premium</span>  </c:when>
                                              		<c:when test="${dto.grade eq 'S'}">슈퍼등급<span style="display:none">super</span>  </c:when>
                                              		<c:when test="${dto.grade eq 'U'}">일반유저<span style="display:none">user</span>  </c:when>
                                              		<c:when test="${dto.grade eq 'D'}">휴먼계정<span style="display:none">human Dormant</span> </c:when>
                                              		<c:when test="${dto.grade eq 'W'}">탈퇴계정<span style="display:none">del Withdrawal</span>  </c:when>
		    		  							</c:choose>
                                              </td>
                                          </tr>
                                      </c:forEach>


                                        </tbody>
                                        <tfoot>
                                            <tr>
                                              <th>선택</th>
                                              <th>프로필</th>
	                                          <th>id</th>
	                                          <th>이름</th>
	                                          <th>생년월일</th>
	                                          <th>연락처</th>
	                                          <th>등급</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
             
                    
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                        <div class="card">
                            <h5 class="card-header">평가 받을 상품 및 회원</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                           		<th>선택</th>
                                                <th>#</th>
                                                <th>이미지</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>등록일</th>
                                                <th>상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="dto" items="${Rlist}">
                                            <tr>
                                            	<td><label class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" name="no" id="no" class="custom-control-input" value="${dto.product_no}"><span class="custom-control-label">선택</span>
                                              	</label></td>
                                                <td>${dto.product_no}</td>
                                                <td><div class="m-r-10"><img src="../../category/storage/${dto.thmb_name}" alt="user" class="rounded" width="45"></div></td>
                                                <td>${dto.title }</td>
                                                <td>${dto.id }</td>
                                                <td>${dto.reg_date }</td>
                                                <td>${dto.availability }</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            	<th>선택</th>
                                                <th>#</th>
                                                <th>이미지</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>등록일</th>
                                                <th>상태</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-5 col-lg-5 col-md-5 col-sm-5 col-5">
                        <div class="card">
                            <h5 class="card-header">포인트</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>상품번호</th>
                                                <th>평가를 준 아이디</th>
                                                <th>평가를 받은 아이디</th>
                                                <th>평가상태</th>
                                                <th>날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="dto" items="${rating}" varStatus="status">
                                                    <tr>
                                                        <td>${dto.no }</td>
                                                        <td>${dto.id_give } </td>
                                                        <td>${dto.id_receive }</td>
                                                        <td>${dto.evaluation }</td>
                                                        <td>${dto.rated_date }</td>
                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>상품번호</th>
                                                <th>평가를 준 아이디</th>
                                                <th>평가를 받은 아이디</th>
                                                <th>평가상태</th>
                                                <th>날짜</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>

                </div>
                </form>
            </div>
            

            
            
        </div>
    

    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="../../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="../../assets/vendor/multi-select/js/jquery.multi-select.js"></script>
    <script src="../../assets/libs/js/main-js.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="../../assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="../../assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="../../assets/vendor/datatables/js/data-table.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
    
</body>
 
</html>
