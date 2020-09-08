<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 template.jsp-->


<div class="container">
	<h3>${id }님,</h3> <h2 style="color:red;">정말 탈퇴하시겠습니까?</h2>
	<br><br><br>
		<a class="btn btn-danger" href="deleteProc.do">탈퇴</a>
		<a class="btn btn-warning" href="login.do">취소</a>
	</form>
</div>

<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>