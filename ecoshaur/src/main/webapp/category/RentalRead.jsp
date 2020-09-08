
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link  href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="assets/libs/css/category.css" rel="stylesheet" type="text/css">

<style>
p {
   font-family: "Nanum Gothic", sans-serif;
   font-size: 30px;
   font-weight: 800;
}
</style>

<br>
<!-- 본문 시작 Category.jsp-->
<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">대여목록</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Category.do?nowpage=1&col=&search=" class="breadcrumb-link">대여목록</a></li>
                        <li class="breadcrumb-item active" aria-current="page">상세보기</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="container">
   <div class="row mt-4">
      <div class="col-lg-4 text-center border-right border-secondery">
         <div
            class="tab-content row h-100 d-flex justify-content-center align-items-center"
            id="myTabContent">
            <div class="tab-pane fade show active col-lg-12" id="home"
               role="tabpanel" aria-labelledby="home-tab">
               <img class="img-fluid"
                  src="category/storage/${dto.thmb_name}" />
            </div>
         </div>
      </div>
      <div class="col-lg-7">
         <h5>${dto.title}</h5>
         <h5>${dto.sub_title}</h5>
         <h5>${dto.product_name}</h5>
	         <div class="progress">
	            <c:choose>
	               <c:when test="${good+bad != 0}">
	               	  <c:if test="${good < 15}">
		               	  	<div class="progress-bar bg-success" role="progressbar"
		                     style="width:${good}%"></div>
		                  	<div class="progress-bar bg-danger" role="progressbar"
		                     style="width:${bad}%">싫어요 (${bad}%)</div>
	               	  </c:if>
	               	  <c:if test="${bad < 15}">
		               	  	<div class="progress-bar bg-success" role="progressbar"
	                     	style="width:${good}%">좋아요 (${good}%)</div>
		                  	<div class="progress-bar bg-danger" role="progressbar"
		                     style="width:${bad}%"></div>
	               	  </c:if>
	               	  <c:if test="${!((good < 15) or (bad < 15))}">
		                  <div class="progress-bar bg-success" role="progressbar"
		                     style="width:${good}%">좋아요 (${good}%)</div>
		                  <div class="progress-bar bg-danger" role="progressbar"
		                     style="width:${bad}%">싫어요 (${bad}%)</div>
		              </c:if>
	               </c:when>
	               <c:otherwise>
	                  <div class="progress-bar" role="progressbar" style="width: 100%">
	                     	평가없음</div>
	               </c:otherwise>
	            </c:choose>
	         </div>
         <table class="table">
            <tbody>
               <tr>
                  <th>일일가격 : ${dto.price_daily}</th>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <th>보증금 : ${dto.deposit}</th>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <th>기간</th>
                  <td>2주 이상은 문의</td>
                  <th><h2><span id="days"></span></h2></th>
               </tr>
               
               <tr>
               <th>대여 기간</th>
                  <td></td>
                  <td></td>                 
               </tr>
               
              <form action="Cart.do" method="post">
               <input type="hidden" value="${id }" id="id" name="id">
               <input type="hidden" value="1" id="nowpage" name="nowpage">
               <input type="hidden" value="${dto.product_no }" id="product_no" name="product_no">
               <input type="hidden" value="" id="RENTAL_PERIOD" name="rental_period">
               <input type="hidden" value="${dto.price_daily}" id="price_daily" name="price_daily">
               <input type="hidden" value="${dto.deposit}" id="deposit" name="deposit">
               <tr>
                  <th>수량</th>
                  <td></td>
                  <th><input type="number" name="quantity" id="quantity" onkeyup="call()" onchange="call()" required></th>
               </tr>
               <tr>
                  <th>대여 : <input type="date" name="receipt_date" id="receipt_date" onchange="call()"></th>
                  <td></td>
                  <th>반납 : <input type="date" name="regDate2" id="regDate2" onchange="call()"></th>
               </tr>
               

               
            </tbody>
         </table>
      </div>
      <table class="table">
         <tr>
            <th width="10%">제공자</th>
            <td width="50%">${dto.id}</td>
            <td width="20%"></td>
            <td width="20%"></td>
         </tr>
         <tr>
            <th>상품명</th>
            <td>${code}</td>
            <td colspan="2">
            <c:choose>
				<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
            		<input type="submit" value="장바구니추가">
            	</c:when>
            </c:choose>
            </td>
         </tr>
         <tr>
         <td colspan="4" align="center"><img class="img-fluid"
                  src="category/storage/${dto.image_name}" /></td>
         </tr>
         <tr>
         <td colspan="4" align="center">${dto.description }</td>
         </tr>
      </table>
   </div>
</div>

 </form>
 
     <script>
         function call() {        
        	 var quantity =document.getElementById('quantity').value;
			 var qq = ${dto.remaining_quantity};

	   		 if(parseFloat(quantity) >= parseFloat(qq)) 
	   		 {
	   			document.getElementById('quantity').value   = qq;
	   		 }

        	 
            var sdd = document.getElementById("receipt_date").value;
            var edd = document.getElementById("regDate2").value;
            var ar1 = sdd.split('-');
            var ar2 = edd.split('-');
            var da1 = new Date(ar1[0], ar1[1], ar1[2]);
            var da2 = new Date(ar2[0], ar2[1], ar2[2]);
            var dif = da2 - da1;
            var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
            if (sdd && edd) {
               document.getElementById('days').innerHTML = parseInt(dif / cDay) + "일"
               document.getElementById('RENTAL_PERIOD').value = parseInt(dif / cDay)
            }
         }
         
         // 현재날짜 세팅 
         var today = new Date().toISOString().substring(0, 10);
         var tomorrow = new Date();
         
         tomorrow.setDate(tomorrow.getDate() + 1);
         tomorrow = tomorrow.toISOString().substring(0, 10);
         
         max_regDate2 = new Date();
         max_regDate2.setDate(max_regDate2.getDate() + 14);
         max_regDate2 = max_regDate2.toISOString().substring(0, 10);
         
         document.getElementById("receipt_date").setAttribute("min", today);
         document.getElementById("receipt_date").value = today;
         document.getElementById("regDate2").setAttribute("min", tomorrow);
         document.getElementById("regDate2").setAttribute("max", max_regDate2);
         document.getElementById("regDate2").value = tomorrow;
       </script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<c:choose>
	<c:when  test="${id.equalsIgnoreCase(dto.id) || grade eq 'M' }">
	
		<div style="text-align:center;">
			<a href="rental_update.do?product_no=${dto.product_no}" class="btn btn-warning">수정하기</a>
			<a href="rental_delete.do?product_no=${dto.product_no}" class="btn btn-danger">삭제하기</a>
		</div>

	</c:when>
</c:choose>
<br>
<c:choose>
	<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
	
	<div style="text-align:center;">
		<a href="RGood.do?postno=${dto.product_no}" class="btn btn-primary">좋아요</a>
		<a href="RBad.do?postno=${dto.product_no}" class="btn btn-primary">싫어요</a>
	</div>
	
	</c:when>
</c:choose>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>