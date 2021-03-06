<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 QList.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">고객센터</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Notice.do?nowpage=1" class="breadcrumb-link">고객센터</a></li>
                        <li class="breadcrumb-item"><a href="QCreate.do" class="breadcrumb-link">1:1 문의</a></li>
                        <li class="breadcrumb-item active" aria-current="page">문의 목록</li>
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
					<table class="table table-striped table-bordered table-hover"
						   style="text-align: center;">
						<thead>
							<tr>
								<th>NO</th>
								<th>제목</th>															
								<th>작성일</th>
								<th>작성자</th>
							</tr>
						</thead>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td width="7%">${dto.postno}</td>
								<td align="left"><b>
								<c:if test="${dto.ccode > 0 }">
						        <c:forEach var="i" begin="1" end="${dto.ccode }" step="1">
							    <img src="./community/reply.gif"/>
						        </c:forEach></c:if>					             
								<c:if test="${dto.head == 'Qna-A' }">[상품문의]	</c:if>
								<c:if test="${dto.head == 'Qna-B' }">[사이트 이용문의]	</c:if>
								<c:if test="${dto.head == 'Qna-C' }">[수령 및 반납문의]	</c:if></b>
								<c:if test="${dto.head == 'Qna-D' }">[기타문의]	</c:if></b>
								<a href="QRead.do?postno=${dto.postno}">${dto.title}</a>								
								</td>
								<c:set var="date" value="${dto.post_date}"/>
								<td>${fn:substring(date,0,10)}</td>
								<td>${dto.id}</td>
							</tr>															
						</c:forEach>
					</table>
					<a href="Qna.do" class="btn btn-success">돌아가기</a>
				</div>
			</div>
		</div>
	</div>
		<br>
		<nav class="nav justify-content-center"
		aria-label="Page navigation example">
		<ul class="pagination">
			<c:choose><c:when test="${(nowpage-1)==0}"> <a class="page-link disabled">  </c:when>
                  <c:otherwise> <a class="page-link" href="QList.do?nowpage=${nowpage-1 }"> </c:otherwise>
          </c:choose>
          Previous</a></li>
		    <c:forEach var="i" begin="1" 
		    end="${count%recordPerPage==0 ? (count/recordPerPage) : (count/recordPerPage)+1}">
		    	<li class="page-item ${nowpage==i ? 'active' : ''}">
		    	<a class="page-link" href="QList.do?nowpage=${i}"><c:out value="${i}"/></a></li>
		    </c:forEach>
		          <li class="page-item"><c:choose><c:when test="${nowpage == i}"> 
		          <a class="page-link disabled">  </c:when>
                  <c:otherwise> <a class="page-link" href="QList.do?nowpage=${nowpage+1 }"> </c:otherwise>
          </c:choose>Next</a></li>        
	</ul>
	</nav>

<br><br><br><br><br><br><br><br><br><br><br>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>