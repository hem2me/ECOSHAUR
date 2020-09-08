<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

<style>
 p {
    font-family: "Nanum Gothic", sans-serif;
    font-size: 30px;
    font-weight: 800;
   }

 
</style>

<!-- 본문 시작 loginProc.jsp-->
<body>
<br><br><br><br><br>
<div class="container">
<div class="splash-container" align="center">
<h3>로그인 결과</h3>
<c:choose>
	<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
    	아이디 :${id } <br>
    	등급 :${grade }
    	
    	<br><br>
<tr>
    <td colspan="2" align="center">
    	<form method="post" action="logout.do">
      		<a class="btn btn-success" href="logout.do">로그아웃</a>
        </form>
        <br>
        <a class="btn btn-primary" href="./">메인페이지</a>
    	<a class="btn btn-primary" href="mypage.do">마이페이지</a>
    	<c:choose>
			<c:when  test="${grade eq 'M' }">
				<a class="btn btn-primary" href="admin/index.do">관리자페이지</a>
			</c:when>
		</c:choose>

    </td>
</tr>
	</c:when>
	<c:when test="${grade eq 'D'}">
		<h1>휴먼계정입니다. 1대1문의에서 문의 주세요~^^</h1>
		<a class="btn btn-primary" href="./">메인페이지</a>
    	<a class="btn btn-primary" href="QCreate.do">1대1문의</a>
	</c:when>
	<c:otherwise>
		<script>alert('잘못된 요청입니다'); window.location.href = './';</script>
	</c:otherwise>
</c:choose>
</div>
</div>
</div>
</div>
</div>
</body>	

<%@ include file="../footer.jsp" %>