<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<link href="assets/libs/css/cart_payment.css" rel="stylesheet" type="text/css">
<script src="../assets/libs/js/cart_payment.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">장바구니</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Cart.do?nowpage=1&id=master" class="breadcrumb-link">장바구니</a></li>
                        <li class="breadcrumb-item active" aria-current="page">결제</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="cart-wrap">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="main-heading">Shopping Cart</div>
            <div class="table-cart">
               <table>
                  <thead>
                     <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th></th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="dto" items="${rental_list}" varStatus="status">
                        <tr>
                           <td>
                              <div class="display-flex align-center">
                                 <div class="img-product">
                                    <img src="category/storage/${dto.thmb_name}" alt="" class="mCS_img_loaded">
                                 </div>
                                 <div class="name-product">
                                    ${dto.title}
                                    <br>${category_code}
                                 </div>
                                 <div class="price"><small>
                                    일일 대여료 : ${dto.price_daily}<br>
                                    보증금 : ${dto.deposit}</small>
                                 </div>
                              </div>
                           </td>
                           <td class="product-count" ><small>
                              수량 : ${cart_list[status.index].quantity}개<br>
                              대여기간 : ${cart_list[status.index].rental_period }일<br>
                              수령일 : ${cart_list[status.index].receipt_date }</small>
                           </td>
                           <td>
                              <div class="total">
                                 ${cart_list[status.index].total_price} 원
                              </div>
                           </td>

                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               
               
                  <nav class="nav justify-content-center" aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		    <c:choose><c:when test="${(nowpage-1)==0}"> <a class="page-link disabled">  </c:when>
		    		  <c:otherwise> <a class="page-link" href="Cartpayment.do?id=${id }&nowpage=${nowpage-1 }"> </c:otherwise>
		    </c:choose>
		    Previous</a></li>
		    
		    <c:forEach var="i" begin="1" end="${count%recordPerPage==0 ? (count/recordPerPage) : (count/recordPerPage)+1}">
		    	<li class="page-item ${nowpage==i ? 'active' : ''}"><a class="page-link" href="Cartpayment.do?${id }&nowpage=${i}"><c:out value="${i}"/></a></li>
		    </c:forEach>
		    
		    <li class="page-item">
		    <c:choose><c:when test="${nowpage == i}"> <a class="page-link disabled">  </c:when>
		    		  <c:otherwise> <a class="page-link" href="Cartpayment.do?${id }&nowpage=${nowpage+1 }"> </c:otherwise>
		    </c:choose>
		    Next</a></li>
		  </ul>
		</nav>
               
            </div>
            <!-- /.table-cart -->
         </div>
         <!-- /.col-lg-8 -->
         <div class="col-lg-9">
            <form action="Cartpayment.do" method="post" accept-charset="utf-8">
            	<input type="hidden" id="point" name="point" value="0">
            	<input type="hidden" id="cid" name="cid" value="${id}">
               <div class="panel panel-default">
                  <div class="panel-body form-horizontal payment-form">
                     <div class="form-group">
                     	<label for="concept" class="col-sm-2 control-label" style="color:red">보유 point : ${point }
                     	</label>
                     	<label for="concept" class="col-sm-3 control-label" style="color:red">(최대 3000 point)
                     	</label>
                     </div>
                     <div class="form-group">
                        <label for="concept" class="col-sm-2 control-label">사용할 point</label>
                        <div class="col-sm-10">
                           <input id="use_point" type="number" name="use_point" size="4" onkeyup="Point()" min="0" max="3000">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="concept" class="col-sm-2 control-label">결제방법</label>
                        <div class="col-sm-10">
                           <select class="form-control" id="payment" name="payment" style="height:auto">
                              <option>신용카드</option>
                              <option>체크카드</option>
                           </select>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">결제카드 종류</label>
                        <div class="col-sm-10">
                           <select class="form-control" id="credit_card" name="credit_card" style="height:auto">
                              <option>VISA</option>
                              <option>Mastercard</option>
                              <option>AMEX</option>
                              <option>UnionPay</option>
                           </select>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="amount" class="col-sm-2 control-label">결제카드 번호</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control cc-inputmask" id="card_num" name="card_num">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">배송주소</label>
                        <div class="col-sm-10">
                           <div class="input-group">
                              <input type="text" class="form-control input-group-addon" id="address" name="address" readonly>
                              <div class="input-group-btn">
                                 <input class="btn btn-primary" type="button" value="주소찾기" onclick="DaumPostcode();">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="date" class="col-sm-2 control-label">상세 주소</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="address_R" name="address_R">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">배송방법</label>
                        <div class="col-sm-10">
                           <select class="form-control" id="delivery_method" name="delivery_method" style="height:auto">
                              <option>직거래</option>
                              <option>우체국</option>
                              <option>대한통운</option>
                              <option>로젠택배</option>
                              <option>현대택배</option>
                              <option>한진택배</option>
                           </select>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="date" class="col-sm-2 control-label">받는사람</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="recipient" name="recipient">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="date" class="col-sm-2 control-label">연락처</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control phone-inputmask" id="tel" name="tel">
                        </div>
                     </div>
                   </div>
               </div>
         </div>
         <div class="col-lg-3">
         <div class="cart-totals">
         <h3>Cart Totals</h3>
         <table>
         <tbody>
         <tr>
         <td>금액</td>
         <td class="subtotal"><span id="o">${total_price}</span></td>
         </tr>
         <tr>
         <td>사용한 point</td>
         <td class="free-shipping" id="h"></td>
         </tr>
         <tr class="total-row">
         <td>총 금액</td>
         <td class="price-total"><span id="r">${total_price}</span></td>
         </tr>
         </tbody>
         </table>
         <div class="btn-cart-totals">
         <input type="reset" value="초기화">
         <input type="submit" value="결제">
         </div>
         <!-- /.btn-cart-totals -->
         </form>
         <!-- /form -->
         </div>
         <!-- /.cart-totals -->
         </div>
         <!-- /.col-lg-4 -->
      </div>
   </div>
</div>
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:absolute;top:50%;left:50%;margin-left:-150px;margin-left:-250px;z-index:3;">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">

</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
    
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
        	
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address_R').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
      

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

<script>
    $(function(e) {
        "use strict";
        $(".date-inputmask").inputmask("dd/mm/yyyy"),
            $(".phone-inputmask").inputmask("999-9999-9999"),
            $(".international-inputmask").inputmask("+9(999)999-9999"),
            $(".xphone-inputmask").inputmask("(999) 999-9999 / x999999"),
            $(".purchase-inputmask").inputmask("aaaa 9999-****"),
            $(".cc-inputmask").inputmask("9999-9999-9999-9999"),
            $(".ssn-inputmask").inputmask("999-99-9999"),
            $(".isbn-inputmask").inputmask("999-99-999-9999-9"),
            $(".currency-inputmask").inputmask("$9999"),
            $(".percentage-inputmask").inputmask("99%"),
            $(".decimal-inputmask").inputmask({
                alias: "decimal",
                radixPoint: "."
            }),

            $(".email-inputmask").inputmask({
                mask: "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[*{2,6}][*{1,2}].*{1,}[.*{2,6}][.*{1,2}]",
                greedy: !1,
                onBeforePaste: function(n, a) {
                    return (e = e.toLowerCase()).replace("mailto:", "")
                },
                definitions: {
                    "*": {
                        validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~/-]",
                        cardinality: 1,
                        casing: "lower"
                    }
                }
            })
    });
    
    function Point() {

	      var use_point =document.getElementById('use_point').value;

	      if (use_point < 0)
	    	  use_point = '0';
		  if(use_point >= 3000) 
		  {
			  use_point = "3000"
			var num_use_point = parseFloat(use_point);
			document.getElementById("h").innerHTML   = num_use_point 
		  }
		  if(use_point > ${point}) 
		  {
			document.getElementById("use_point").value   = ${point}
			use_point = ${point}
			var num_use_point = parseFloat(use_point);
			document.getElementById("h").innerHTML   = num_use_point 
		  }
		  
		  
			var num_use_point = parseFloat(use_point);
			document.getElementById("h").innerHTML   = num_use_point 
		  
		  var htStr =document.getElementById('o').innerHTML;

	      if (!htStr)
	        htStr = '0';
			
		  var num_use_point = parseFloat(use_point);
	      var height = parseFloat(htStr);
	      document.getElementById("r").innerHTML =  height - num_use_point;
	      
	      if(isNaN(document.getElementById("h").innerHTML)){
	    	  document.getElementById("h").innerHTML = 0;
	      }
	      if(isNaN(document.getElementById("r").innerHTML)){
	    	  document.getElementById("r").innerHTML = document.getElementById("o").innerHTML;
	      }
	      document.getElementById("point").value =  document.getElementById('use_point').value;
	    }
    
    
    </script>
    <script src="./assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>