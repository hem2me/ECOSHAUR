<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 QRes.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">고객센터</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Notice.do?nowpage=1" class="breadcrumb-link">고객센터</a></li>
                        <li class="breadcrumb-item"><a href="QCreate.do" class="breadcrumb-link">1:1 문의</a></li>
                        <li class="breadcrumb-item active" aria-current="page">답변 등록</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="container">
<br><br>
	<form method="post" action="QRes.do" enctype="multipart/form-data">
		<table align='center' border='1px' cellspacing='0px' cellpadding='5px'>
			<input type='hidden' name='head' value='${dto.head}'>
			<input type='hidden' name='pcode' value='${dto.pcode}'>
			<input type='hidden' name='ccode' value='${ccode}'>
			<tr align='left'>
				<th>문의분류</th>
				<td><b>
				<c:if test="${dto.head == 'Qna-A' }">[상품문의]	</c:if>
				<c:if test="${dto.head == 'Qna-B' }">[사이트 이용문의] </c:if>
				<c:if test="${dto.head == 'Qna-C' }">[수령 및 반납문의] </c:if></b></td>
				<c:if test="${dto.head == 'Qna-D' }">[기타문의]	</c:if></b></td>			
			<tr>			
			<tr>
				<th>제목</th>
				<td><input type='text' name='title' size='50' required></td>
    		<tr>
    			<th>내용</th>
	  			<td><textarea style="resize: none; "name="contents" 
				cols="53" rows="7" wrap="hard" required></textarea></td>
    		</tr>
			<tr >
				<th>이미지</th>
				<td align='left'><input type='file' name='posterMF' size='50'></td>
			</tr>
        <input type='hidden' name='id' value='${writer}' size='50'>
		</table>
		<br>
		<br>
		<div class='bottom'>
			<input type='submit' value='등록'> <input type='button'
				value='문의취소하기' onclick="location.href='Qna.do'">
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
<br><br><br><br><br><br><br><br><br>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>