<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 rental_delete.jsp-->
<body>
<div class="splash-container">
	<br><br><br>
	<div align="center">
		<h2 style="color:#8B0000; font-weight: bold;">정말 삭제하시겠습니까?</h2>
		<p>삭제된 게시글은 복구할 수 없습니다.</p>
	</div>
	<form action="rental_delete.do" method="post">
	<input type="hidden" value="${product_no}" name="product_no">
	<br><br>
	<div class='bottom' align="center">
		<input class="btn btn-danger" type="submit" value="삭제">
		<a class="btn btn-warning" href="Category.do?nowpage=1&col=&search=">취소</a>
	</div>
	</form>
</div>
</div>
</div>
</body>
<!-- 본문 끝 -->		

<%@ include file="../footer.jsp" %>