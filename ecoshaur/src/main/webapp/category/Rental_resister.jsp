<%@page import="java.sql.Timestamp"%>
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

<!-- 본문 시작 template.jsp-->
<!-- 본문 시작 Category.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">대여목록</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Category.do?nowpage=1&col=&search=" class="breadcrumb-link">대여목록</a></li>
                        <li class="breadcrumb-item active" aria-current="page">상품등록</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>


<div class="container">
	<h3>* 상품 등록 *</h3>
	<p>
		<a href="Category.do?nowpage=1&col=&search=" class="btn btn-success">상품 목록</a>
	</p>
	<form name="rentalfrm" method="post" action="Rental_resister.do" enctype="multipart/form-data" onsubmit="return rentalCheck(this)">
		<input type="hidden" value="${id }" name="id">
		<table class="table">
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>제목</th>
				<td><input type="text" name="title" id="title" size="10" maxlength="30"
					 class="form-control"></td>
			</tr>
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>소제목</th>
				<td><input type="text" name="sub_title" id="sub_title" size="30" maxlength="30"
					 class="form-control"></td>
			</tr>
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>상품명</th>
				<td><input type="text" name="product_name" id="product_name" size="30" maxlength="30"
					 class="form-control"></td>
			</tr>
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>내용</th>
				<td>
					<textarea class="form-control" id="description" name="description"></textarea>
				</td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">일일가격</th>
				<td><input type="text" name="price_daily"  id="price_daily" size="10"
					maxlength="10" class="form-control"></td>
			</tr>
						<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">보증금</th>
				<td><input type="text" name="deposit" id="deposit" size="10"
					maxlength="10" class="form-control"></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">수량</th>
				<td><input type="text" name="total_quantity" id="total_quantity" size="10"
					maxlength="10" class="form-control"></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">썸네일</th>
				<td align="left"><input type='file' name='posterMF' size='50' accept=".gif, .png, .jpg" required></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">이미지</th>
				<td align="left"><input type='file' name='filenameMF' size='50' accept=".gif, .png, .jpg" required></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">카테고리 선택</th>
				<td align="left">
					<select name="ctCode" id="ctCode">
					    <option value="DSLR">게시판명 선택</option>
					    <c:forEach var="mn" items="${minor}">
					        <option value="${mn.minor}">${mn.minor}</option>
					    </c:forEach>
					</select>
				</td>
				
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="쓰기" class="btn btn-success"> 
				<input type="reset" value="작성내용 지우기" class="btn btn-success"></td>
			</tr>
		</table>
	</form>
</div>




<!-- ckeditor 적용 -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,     //엔터키 입력시 br 태그 변경
   shiftEnterMode : CKEDITOR.ENTER_P, //엔터키 입력시 p 태그로 변경
   };
 
 CKEDITOR.replace("description", ckeditor_config); //적용할 id값
</script>
<!-- ckeditor 적용 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>