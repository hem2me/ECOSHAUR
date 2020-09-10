<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 BRead.jsp-->

<div class="splash-container">
	<br><br><br>
	<div align="center">
		<h2 style="color:#7B68EE; font-weight: bold;">알림창</h2>
	</div>
 	<br><br>
  <div class="content" align="center">
	<dl>
		<dd>${msg }</dd>
	</dl>
  </div>
  	<br><br>		
	<div class='bottom' align="center">
		<input class="btn btn-info" type='button' value='게시판 목록' onclick="location.href='Board.do?nowpage=1&search'">
	</div>
</div>
</div>
</div>	
<!-- 본문 끝 -->		
<%@ include file="../footer.jsp" %>