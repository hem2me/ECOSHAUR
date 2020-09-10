<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 QDelete.jsp-->
<body>
<div class="splash-container">
	<br><br><br>
	<div align="center">
	<form method="post" action="QDelete.do">
		<input type="hidden" name="postno" value="${dto.postno}">
		<div class="content">
			<h2 style="color:#8B0000; font-weight: bold;">문의사항을 삭제하시겠습니까?</h2>
			<p>삭제된 문의사항은 복구할 수 없습니다.</p>
		</div>
		<br><br>
		<div class='bottom'>
			<input class="btn btn-danger" type="submit" value="삭제하기">
			<input class="btn btn-warning" type='button' value='삭제취소'
				   onclick="location.href='QRead.do?postno=${dto.postno}'">
		</div>
	</form>
</div>
</div>
</div>	
</body>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>