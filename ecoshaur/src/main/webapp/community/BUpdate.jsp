<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 BUpdate.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">커뮤니티</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Board.do?nowpage=1" class="breadcrumb-link">커뮤니티</a></li>
                        <li class="breadcrumb-item active" aria-current="page">게시글 수정</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="container">
<br><br>	
  <form method="post"
        action="BUpdate.do"
        enctype="multipart/form-data" >  
    <input type='hidden' name='postno' value='${dto.postno }'>       
    <table align='center' border='1px' cellspacing='0px' cellpadding='5px'>
    <tr>
      <th>제목</th>
      <td><input type='text' name='title' size='50' value='${dto.title }' required></td>    
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea style="resize: none; "name="contents" 
	  cols="53" rows="7" value='${dto.contents }' required></textarea></td>  
    </tr>
    <tr>
      <th>이미지</th>
      <td align='left'>
          <img src="./community/storage/${dto.image_name}" width="100"
          onError="this.style.visibility='hidden'"><br><br>
      	  <input type='file' name='posterMF' size='50'>
      </td>  
    </tr>             
  </table>    
  <br><br>
  <div style="text-align:center;">
    <input type='submit' value='수정' class="btn btn-success">
	<a href="Board.do?nowpage=1&col=&search=" class="btn btn-success">수정취소</a>
  </div>
  </form>

<!-- ckeditor 적용 -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,     //엔터키 입력 시 br 태그 변경
   shiftEnterMode : CKEDITOR.ENTER_P, //엔터키 입력 시 p 태그로 변경
   };
 
 CKEDITOR.replace("contents", ckeditor_config); //적용할 id값
</script>
<!-- ckeditor 적용 -->
</body>
<!-- 본문 끝 -->		

<%@ include file="../footer.jsp" %>