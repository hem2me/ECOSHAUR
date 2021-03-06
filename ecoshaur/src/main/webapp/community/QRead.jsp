<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 QRead.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">고객센터</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Notice.do?nowpage=1" class="breadcrumb-link">고객센터</a></li>
                        <li class="breadcrumb-item"><a href="QCreate.do" class="breadcrumb-link">1:1 문의</a></li>
                        <li class="breadcrumb-item active" aria-current="page">상세보기</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="container">
<br><br>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th width="20%">NO</th>
								<td>${dto.postno}</td>
							</tr>	
							<tr>
								<th>제목</th>
								<td>${dto.title}</td>
							</tr>	
							<tr>
								<th style="vertical-align:middle">내용</th>
								<td>${dto.contents}<br><br><br>
								<img src="./community/storage/${dto.image_name}"
								onError="this.style.visibility='hidden'"></td>
							</tr>
							<tr>	
								<th>작성일</th>
								<c:set var="date" value="${dto.post_date}" />
								<td>${fn:substring(date,0,10)}</td>
							</tr>			
							<input type='hidden' name=dto.head value='${dto.head}'>
							<input type='hidden' name=dto.pcode value='${dto.pcode}'>
							<input type='hidden' name=dto.ccode value='${dto.ccode}'>
						</thead>						
					</table>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	
<c:choose>
	<c:when  test="${id.equalsIgnoreCase(dto.id) || grade eq 'M' }">
	
	<div style="text-align:center;">
		<a href="QList.do?nowpage=1" class="btn btn-success">돌아가기</a>
		<a href="QRes.do?pcode=${dto.pcode}&ccode=${dto.ccode+1}" 
		class="btn btn-success">답변하기</a>
		<a href="QDelete.do?postno=${dto.postno}" class="btn btn-success">삭제</a>
	</div>
		
	</c:when>
</c:choose>
<br><br><br><br><br><br><br><br><br>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>