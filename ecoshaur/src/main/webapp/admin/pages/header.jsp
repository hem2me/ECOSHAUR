<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when  test="${grade eq 'M'}">
<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="../index.do">Ecoshaur</a>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="../../">
                            	<img src="../../assets/images/ㄹㅇ공룡.png" alt="" class="user-avatar-md rounded-circle">
                            </a>
                        </li>
                    </ul>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">대시보드</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                	메뉴
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="../index.do" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>통합관리 <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="../index.do" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-2" aria-controls="submenu-1-2">대시보드</a>
                                            <div id="submenu-1-2" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="../index.do">통합 대시보드</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="newOrderList.do">최근 주문목록</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="top_point.do">Top 유저 포인트</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="BadTopUser.do">환불 Top 대여자</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                        	<a class="nav-link" href="member_list.do" data-toggle="collapse" aria-expanded="false" data-target="#submenu-11" aria-controls="submenu-11">회원관리</a>
                                            <div id="submenu-11" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                	<li class="nav-item">
                                                        <a class="nav-link" href="member_list.do">회원목록</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="point.do">포인트</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="rating.do">좋아요/싫어요</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
	                                        <a class="nav-link" href="./pages/member_list.do" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-1" aria-controls="submenu-1-1">상품관리</a>
	                                            <div id="submenu-1-1" class="collapse submenu" style="">
	                                                <ul class="nav flex-column">
	                                                	<li class="nav-item">
	                                                        <a class="nav-link" href="rental_list.do">상품목록</a>
	                                                    </li>
	                                                    <li class="nav-item">
	                                                        <a class="nav-link" href="order_list.do">주문서 목록</a>
	                                                    </li>
	                                                    <li class="nav-item">
	                                                        <a class="nav-link" href="orderh_list.do">주문내역서 목록</a>
	                                                    </li>
	                                                </ul>
	                                            </div>
                                            <a class="nav-link" href="dashboard-sales.html"></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        
        
                      </c:when>
              	<c:otherwise>
			<script>alert('잘못된 요청입니다'); window.location.href = '../index.do';</script>
	</c:otherwise>
              </c:choose>
   