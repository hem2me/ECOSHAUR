<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>


<!-- 본문 시작 BCreate.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">커뮤니티</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Board.do?nowpage=1" class="breadcrumb-link">커뮤니티</a></li>
                        <li class="breadcrumb-item active" aria-current="page">게시글 등록</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>


<div class="container">
<br><br><br><br><br><br><br><br>
	<H3>게시물 등록</H3>
<br><br>	
  <form method="post"
        action="BCreate.do"
        enctype="multipart/form-data" 
        onsubmit="return boardCheck(this)">
                 
    <table align='center' border='1px' cellspacing='0px' cellpadding='5px'>
    <tr> 
      <th>제목</th>
      <td><input type='text' name='title' id="title" size='80'></td>    
    </tr>
    <tr>
      <th>내용</th>
	  <td><textarea style="resize: none;" name="contents" 
	  rows="10" cols="100" style="width: 100%;"></textarea></td>
    </tr>
    <tr>
      <th>이미지</th>
      <td align='left'><input type='file' name='posterMF' size='80'></td>    
    </tr>    
      <input type='hidden' name='id' value='${id }' size='50'>        
  </table>      
<br><br> 
<div style= "text-align:center;">
  <input type='submit' value='등록' class="btn btn-success">
  <a href="Board.do?nowpage=1&search" class="btn btn-success">등록취소</a>
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
	
<%@ include file="../footer.jsp" %>