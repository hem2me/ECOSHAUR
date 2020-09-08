<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">


<!-- 본문 시작 template.jsp-->

<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">주문내역서 </h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="mypage.do" class="breadcrumb-link">마이페이지</a></li>
                        <li class="breadcrumb-item active" aria-current="page">주문내역서</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- ============================================================== -->
<!-- end pageheader  -->
<!-- ============================================================== -->
<div class="row">
    <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <div class="card-header p-4">
                 <a class="pt-2 d-inline-block" href="index.html">주문내역서</a>
               
                <div class="float-right"> <h3 class="mb-0">${order.order_no }</h3>
                Date: ${dto[0].payment_date }</div>
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-sm-6">
                        <h5 class="mb-3">구매자:</h5>                                            
                        <h3 class="text-dark mb-1">${id }</h3>
                     
                     	<div>이름 : ${member.mem_name }</div>
                        <div>이메일 : ${member.email }</div>
                        <div>연락처 : ${member.contact_number }</div>
                    </div>
                    <div class="col-sm-6">
                        <h5 class="mb-3">받는사람:</h5>
                        <h3 class="text-dark mb-1">${order.recipient }</h3>                                            
                        <div>배송방법 : ${order.delivery_method }</div>
                        <div>주소 : ${order.address } ${order.address_R }</div>
                        <div>연락처 : ${order.tel }</div>
                    </div>
                </div>
                <div class="table-responsive-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="center">#</th>
                                <th>상품명</th>
                                <th>상품제목</th>
                                <th class="right">일일대여료</th>
                                <th class="center">보증금</th>
                                <th class="center">갯수</th>
                                <th class="center">대여일 수</th>
                                <th class="center">결제방법</th>
                                <th class="right">총 가격</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="Hdto" items="${dto}" varStatus="status">
                            <tr>
                                <td class="center">${Hdto.order_detail_no }</td>
                                <td class="left strong">${Rdto[status.index].product_name }</td>
                                <td class="left">${Rdto[status.index].title }</td>
                                <th class="center">${Rdto[status.index].price_daily }</th>
                                <th class="center">${Rdto[status.index].deposit }</th>
                                <td class="right">${Hdto.quantity }</td>
                                 <td class="right">${Hdto.rental_period }</td>
                                <td class="center">${Hdto.payment }</td>
                                <td class="right">${(Rdto[status.index].price_daily * Hdto.quantity) +  Rdto[status.index].deposit}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-5">
                    </div>
                    <div class="col-lg-4 col-sm-5 ml-auto">
                        <table class="table table-clear">
                            <tbody>
                                <tr>
                                    <td class="left">
                                        <strong class="text-dark">대여료</strong>
                                    </td>
                                    <td class="right">${daily_total }</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong class="text-dark">보증금</strong>
                                    </td>
                                    <td class="right">${deposit_total }</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong class="text-dark">사용한 포인트</strong>
                                    </td>
                                    <td class="right">${point}</td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <strong class="text-dark">총 가격</strong>
                                    </td>
                                    <td class="right">
                                        <strong class="text-dark">${total }</strong>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card-footer bg-white">
            </div>
        </div>
    </div>





<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>