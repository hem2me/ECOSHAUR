<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="./assets/libs/css/cart_payment.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


<c:choose>
	<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
	
	<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
            <h2 class="pageheader-title">장바구니</h2>
            <div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Cart.do?nowpage=1&id=master" class="breadcrumb-link">장바구니</a></li>
                        <li class="breadcrumb-item active" aria-current="page">장바구니 목록</li>
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
	        <div class="table-cart" id="cartlist">
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
                                <img src="category/storage/${dto.thmb_name}"alt="" width=100 class="mCS_img_loaded">
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
                       <td class="product-count" >
                         	수량 : ${cart_list[status.index].quantity}개<br>
                         	대여기간 : ${cart_list[status.index].rental_period }일<br>
                         	수령일 : ${cart_list[status.index].receipt_date }
                       </td>
                       <td>
                           <div class="total">
                               ${cart_list[status.index].total_price} 원
                           </div>
                       </td>
                       <td>
                           <a href="CartDel.do?cart_no=${cart_list[status.index].cart_no}" class="btn btn-danger">X</a>
                       </td>
                   </tr>
                  </c:forEach> 
                  <tr>
                  		<td colspan="2"></td>
                  		<td colspan="1"><div class="total">
                              	총 ${price} 원
                           </div>
                        </td>
                        <td/>
                  </tr>
                 </tbody>
             </table>
                  
        <nav class="nav justify-content-center" aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		    <c:choose><c:when test="${(nowpage-1)==0}"> <a class="page-link disabled">  </c:when>
		    		  <c:otherwise> <a class="page-link" href="Cart.do?id=Buyer&nowpage=${nowpage-1 }"> </c:otherwise>
		    </c:choose>
		    Previous</a></li>
		    
		    <c:forEach var="i" begin="1" end="${count%recordPerPage==0 ? (count/recordPerPage) : (count/recordPerPage)+1}">
		    	<li class="page-item ${nowpage==i ? 'active' : ''}"><a class="page-link" href="Cart.do?id=Buyer&nowpage=${i}"><c:out value="${i}"/></a></li>
		    </c:forEach>
		    
		    <li class="page-item">
		    <c:choose><c:when test="${nowpage == i}"> <a class="page-link disabled">  </c:when>
		    		  <c:otherwise> <a class="page-link" href="Cart.do?id=Buyer&nowpage=${nowpage+1 }"> </c:otherwise>
		    </c:choose>
		    Next</a></li>
		  </ul>
		</nav>     
	    </div>
	        <a href="./Category.do?nowpage=1&col=&search=" class="btn btn-primary">쇼핑 계속하기</a>
  			<a href="Cartpayment.do?id=${id}&nowpage=1" class="btn btn-info">결제</a>
	    </div>
</div>
</div>
</div>
<script>
	//1)X 버튼을 클릭했을 때
	$("#delete").click(function(){
		var params="no=" + $("#no").val();
		$.post("CartDel.do", params, check, "json");
		
	});//click() end
	
	//4)콜백함수 작성
	function check(result){	
		location.reload();
	}//checkID() end
</script>
	</c:when>
	<c:otherwise>
	<script>window.location.href = './';</script>
</c:otherwise>
</c:choose>
<!-- 본문끝 -->
	

	
<%@ include file="../footer.jsp"%>
