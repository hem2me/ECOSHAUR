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
                        <li class="breadcrumb-item active" aria-current="page">상품수정</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>


<div class="container">
	<h3>* 상품 수정 *</h3>
	<form name="rentalfrm" method="post" action="rental_update.do" enctype="multipart/form-data">
		<input type="hidden" value="${dto.product_no}" name="product_no">
		<input type="hidden" value="TEST02" name="id">
		<input type="hidden" value="${dto.thmb_name }" name="old_thmb_name">
		<input type="hidden" value="${dto.image_name }" name="old_image_name">
		<table class="table">
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>제목</th>
				<td><input type="text" name="title" size="10" maxlength="30" value="${dto.title}"
					required class="form-control"></td>
			</tr>
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>소제목</th>
				<td><input type="text" name="sub_title" size="30" maxlength="30" value="${dto.sub_title}"
					required class="form-control"></td>
			</tr>
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>상품명</th>
				<td><input type="text" name="product_name" size="30" maxlength="30" value="${dto.product_name}"
					required class="form-control"></td>
			</tr>
			<tr style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">
				<th>내용</th>
				<td>
					<textarea class="form-control" id="description" name="description">${dto.description}</textarea>
				</td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">일일가격</th>
				<td><input type="text" name="price_daily" size="10" value="${dto.price_daily}"
					maxlength="10" required class="form-control"></td>
			</tr>
						<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">보증금</th>
				<td><input type="text" name="deposit" size="10" value="${dto.deposit}"
					maxlength="10" required class="form-control"></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">수량</th>
				<td><input type="text" name="total_quantity" size="10" value="${dto.total_quantity}"
					maxlength="10" required class="form-control"></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">썸네일</th>
				<td align="left"><input type='file' name='posterMF' size='50' accept=".gif, .png, .jpg"></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">이미지</th>
				<td align="left"><input type='file' name='filenameMF' size='50' accept=".gif, .png, .jpg"></td>
			</tr>
			<tr>
				<th style="font-family: 'NanumSquare', sans-serif; font-size: 120%;">카테고리 선택</th>
				<td align="left">
					<select name="ctCode" id="ctCode" class="selectpicker" data-live-search="true">
					    <option value="DSLR">게시판명 선택</option>
					    <c:forEach var="mn" items="${minor}">
					        <c:choose>	<c:when test="${select_minor eq mn.minor}"><option value="${mn.minor}" selected>${mn.minor}</option>	</c:when>
					        <c:otherwise><option value="${mn.minor}">${mn.minor}</option></c:otherwise></c:choose>
					    </c:forEach>
					</select>
				</td>
				
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정"
					class="btn btn-success"> </td>
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