<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 QCreate.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">고객센터</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Notice.do?nowpage=1" class="breadcrumb-link">고객센터</a></li>
                        <li class="breadcrumb-item"><a href="QCreate.do" class="breadcrumb-link">1:1 문의</a></li>
                        <li class="breadcrumb-item active" aria-current="page">문의 등록</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="container">

<br><br>
	<form method="post" action="QCreate.do" enctype="multipart/form-data" onsubmit="return qnaCheck(this)">
		<table align='center' border='1px' cellspacing='0px' cellpadding='5px'>
			<tr align='left'>
				<th>문의분류</th>
				<td><select class="form-control form-control-sm" name="head" >
				<option value="Qna-A">상품문의</option>
				<option value="Qna-B">사이트 이용문의</option>
				<option value="Qna-C">수령 및 반납문의</option>	
				<option value="Qna-D">기타문의</option>							
				</select></td>
			<tr>			
			<tr>
				<th>제목</th>
				<td><input type='text' name='title' id='title' size='80' ></td>
			</tr>
				<th>내용</th>
				<td><textarea style="resize: none; " name="contents" id="contents" 
				cols="53" rows="7" wrap="hard"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td align='left'><input type='file' name='posterMF' size='50'></td>
			</tr>
		<c:choose>
			<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
        		<input type='hidden' name='id' value='${id}' size='50'>  
        	</c:when>
        	<c:otherwise>
        		<input type='hidden' name='id' value='guest' size='50'>  
        	</c:otherwise>
        </c:choose>
		</table>
		<br><br>
		<div style= "text-align:center;">
		<input type='submit' value='등록' class="btn btn-success">
        <a href="Qna.do" class="btn btn-success">등록취소</a>
        </div>
	</form>
</body>
<!-- ckeditor 적용 -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,     //엔터키 입력시 br 태그 변경
   shiftEnterMode : CKEDITOR.ENTER_P, //엔터키 입력시 p 태그로 변경
   };
 
 CKEDITOR.replace("contents", ckeditor_config); //적용할 id값
</script>
<!-- ckeditor 적용 -->
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>