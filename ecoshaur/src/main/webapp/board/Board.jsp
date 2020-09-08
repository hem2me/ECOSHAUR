<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 Board.jsp-->

<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">커뮤니티</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Board.do?nowpage=1" class="breadcrumb-link">커뮤니티</a></li>
                        <li class="breadcrumb-item active" aria-current="page">자유게시판</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="container">
	<div style="text-align:center;">
		<form method="get" action="Board.do">
			<input type="hidden" name="nowpage" value="1">
			<label class="custom-control custom-radio custom-control-inline">
				<input class="custom-control-input" type="radio" name="col" value="subject"
				checked="checked"> 
				<span class="custom-control-label">제목</span>
			</label>
			<label class="custom-control custom-radio custom-control-inline">
				<input class="custom-control-input" type="radio" name="col" value="content">
				<span class="custom-control-label">내용 </span>
			</label>
			<label class="custom-control custom-radio custom-control-inline">
				<input class="custom-control-input" type="radio" name="col" value="subject_content">
				<span class="custom-control-label">제목+내용</span>	
			</label>
			
			<input type="text" name="search">
			<input type="submit" class="btn btn-primary" value="Search">
		</form>
		<br>
	</div>
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
								<th>조회수</th>
								<th>좋아요</th>
								<th>싫어요</th>
							</tr>
						</thead>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td width="7%">${dto.postno}</td>
								<td align="left"><a href="BRead.do?postno=${dto.postno}">${dto.title}</a></td>
								<c:set var="date" value="${dto.post_date}"/>
								<td>${fn:substring(date,0,10)}</td>
								<td>${dto.id }</td>
								<td>${dto.view}</td>
								<td>${dto.good}</td>
								<td>${dto.bad}</td>
							</tr>								
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<br>
	<nav class="nav justify-content-center"
		aria-label="Page navigation example">
		<ul class="pagination">
			<c:choose><c:when test="${(nowpage-1)==0}"> <a class="page-link disabled">  </c:when>
                  <c:otherwise> <a class="page-link" href="Board.do?nowpage=${nowpage-1 }"> </c:otherwise>
          </c:choose>
          Previous</a></li>
		    <c:forEach var="i" begin="1" 
		    end="${count%recordPerPage==0 ? (count/recordPerPage) : (count/recordPerPage)+1}">
		    	<li class="page-item ${nowpage==i ? 'active' : ''}">
		    	<a class="page-link" href="Board.do?nowpage=${i}"><c:out value="${i}"/></a></li>
		    </c:forEach>
		          <li class="page-item"><c:choose><c:when test="${nowpage == i}"> 
		          <a class="page-link disabled">  </c:when>
                  <c:otherwise> <a class="page-link" href="Board.do?nowpage=${nowpage+1 }"> </c:otherwise>
          </c:choose>Next</a></li>        
	</ul>
	</nav>
	<div class="container">
    <button type="button" onclick="create()" class="btn btn-success">글쓰기</button>     	 		
	<script>
	function create(){
		if(${grade eq 'U'} || ${grade eq 'S'} || ${grade eq 'P'} || ${grade eq 'M'} ){
			location.href = "BCreate.do";	
		}
		else{
			alert("글쓰기는 로그인후 가능합니다!")
		}
	}
	</script>
	
<br><br><br><br><br><br><br><br>
<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>