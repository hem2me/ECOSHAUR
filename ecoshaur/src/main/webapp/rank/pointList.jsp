<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>


<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/ranklist.css">

<!-- 본문 시작 pointList.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">랭킹보드</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./Point.do" class="breadcrumb-link">랭킹보드</a></li>
                        <li class="breadcrumb-item active" aria-current="page">포인트 랭킹</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="container">                                   
<div class="ranking-highest">
<ul id="select_summoner_highest" class="ranking-highest__list">

<!-- 포인트/좋아요 페이지 전환 버튼 -->
<br><br><br>
<div>
	<input type="button" value="포인트 순위" onClick="location.href='./Point.do'" class="btn btn-warning">
	<input type="button" value="좋아요 순위" onClick="location.href='./Rating.do'" class="btn btn-info">
</div>
<br><br><br><br>
	
	<!-- 포인트 1등 회원 정보 -->
	<c:forEach items="${list}" var="dto" end="0">
		<li class="ranking-highest__item ranking-highest__item--big" id="summoner-41913808">
			<div class="ranking-highest__rank">1</div>
			<div class="ranking-highest__icon">
			<a href="Userpage.do?id=${dto.id}">
				<img src="member/storage/${dto.pro_name}" class="ranking-highest__image">
			</a>
			</div>
			<div class="ranking-highest-champions">
				<span>${dto.id}</span><br>
				<span>${dto.point}점</span>
			</div>
			<a href="Userpage.do?id=${dto.id}" class="ranking-highest__name">${dto.mem_name}</a>
			<div class="ranking-highest__tierrank first">
				<img src="assets/images/firstgrade.png">
				<c:choose>
					<c:when  test="${dto.grade eq 'U'}">
                   		<span class="status"></span><span>유저 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'S'}">
                   		<span class="status"></span><span>슈퍼 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'P'}">
                   		<span class="status"></span><span>프리미엄 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'M'}">
                   		<span class="status"></span><span>마스터 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'D'}">
	                   	<span class="status"></span><span>휴면 계정</span>
	                </c:when>
	                <c:when  test="${dto.grade eq 'W'}">
	                   <span class="status"></span><span>탈퇴 계정</span>
	                </c:when>
                 </c:choose>
			</div>
		</li>
	</c:forEach>
	
	<!-- 포인트 2~5등 회원 정보 -->
	<c:forEach items="${list}" var="dto" begin="1" end="4"  varStatus="status">	
		<li class="ranking-highest__item " id="summoner-85224235">
			<div class="ranking-highest__rank">${status.count+1}</div>
			<div class="ranking-highest__icon">
				<a href="Userpage.do?id=${dto.id}"><img src="member/storage/${dto.pro_name}" class="ranking-highest__image"></a>
			</div>
			<a href="Userpage.do?id=${dto.id}" class="ranking-highest__name">${dto.mem_name}</a>
			<div class="ranking-highest__tierrank ">
				<img src="assets/images/secondgrade.png">
				<c:choose>
					<c:when  test="${dto.grade eq 'U'}">
                   		<span class="status"></span><span>유저 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'S'}">
                   		<span class="status"></span><span>슈퍼 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'P'}">
                   		<span class="status"></span><span>프리미엄 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'M'}">
                   		<span class="status"></span><span>마스터 등급</span>
                   	</c:when>
                   	<c:when  test="${dto.grade eq 'D'}">
	                   	<span class="status"></span><span>휴면 계정</span>
	                </c:when>
	                <c:when  test="${dto.grade eq 'W'}">
	                   <span class="status"></span><span>탈퇴 계정</span>
	                </c:when>
                 </c:choose>
				<span>${dto.id}</span>
			</div>
			<div class="ranking-highest-winratio">
				<div class="winratio">
					<div class="winratio-graph">
					<div class="winratio-graph__fill winratio-graph__fill--left"></div>
					<div class="winratio-graph__text winratio-graph__text--left">&nbsp;&nbsp;&nbsp;&nbsp;포인트 : ${dto.point}점</div>
				</div>
			</div>
			</div>
		</li>
	</c:forEach>
</ul>
</div>

<br><br><br>

<!-- 포인트 5~20등 회원 정보 -->
<c:forEach items="${list}" var="dto" begin="5" end="19" varStatus="status">
<div class=”table-responsive“>
<table class="table table-hover">
	<thead>
		<tr>
			<th scope="col" class="table-primary">순위</th>
			<th scope="col" class="table-primary">프로필</th>
			<th scope="col" class="table-primary">아이디</th>
			<th scope="col" class="table-primary">닉네임</th>
			<th scope="col" class="table-primary">등급</th>
			<th scope="col" class="table-primary">포인트</th>		
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${status.count+5}</td>
			<td>
				<a href="Userpage.do?id=${dto.id}">
					<img src="member/storage/${dto.pro_name}" width="50" height="50">
				</a>
			</td>
			<td>
				<a href="Userpage.do?id=${dto.id}"><span>${dto.id}</span></a>
			</td>
			<td>
				<a href="Userpage.do?id=${dto.id}"><span>${dto.mem_name}</span></a>
			</td>
				<td>
					<c:choose>
						<c:when  test="${dto.grade eq 'U'}">
	                   		<span class="status"></span><span>유저 등급</span>
	                   	</c:when>
	                   	<c:when  test="${dto.grade eq 'S'}">
	                   		<span class="status"></span><span>슈퍼 등급</span>
	                   	</c:when>
	                   	<c:when  test="${dto.grade eq 'P'}">
	                   		<span class="status"></span><span>프리미엄 등급</span>
	                   	</c:when>
	                   	<c:when  test="${dto.grade eq 'M'}">
	                   		<span class="status"></span><span>마스터 등급</span>
	                   	</c:when>
	                   	<c:when  test="${dto.grade eq 'D'}">
	                   		<span class="status"></span><span>휴면 계정</span>
	                   	</c:when>
	                   	<c:when  test="${dto.grade eq 'W'}">
	                   		<span class="status"></span><span>탈퇴 계정</span>
	                   	</c:when>
	                 </c:choose>
                 </td>
			<td>${dto.point}</td>
		</tr>
	</tbody>
</table>
</div>
</c:forEach>
</div>    

<div class="ranking-pagination__desc">
	<span>1 ~ 20</span> 위
</div>
<!-- 본문 끝 -->
			
<%@ include file="../footer.jsp" %>