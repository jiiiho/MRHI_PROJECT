<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<section>
<div class = "getBoardPage">
	<div class = "noticeImg"></div>

	<div class = "whitelines"></div>
	<div class = "title">공지사항</div>
	
	<form action = "updateBoard.do" method = "post">
	<p id="getBoard_p"><a id="getBoard_a" href = "notice.do">&lt;&emsp;이전 페이지</a></p>
	
	<!-- 글번호 숨김 -->
	<input name = "seq" type = "hidden" value = "${board.seq }">
	<table>
		<tr>
			<td>
			<c:choose>
				<c:when test = "${user.id eq 'admin' }">
					<label for = "title">제목</label>
					<input name = "title" type = "text" value = "${board.title }" placeholder = "Title">
				</c:when>
				<c:otherwise>
					<label for = "title">제목</label>
					<input name = "title" type = "text" value = "${board.title }" readonly>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td>
			<label for = "writer">작성자</label>
			<input name = "writer" type = "text" value = "${board.writer }" readonly></td>
		</tr>
		<tr>
			<td>
			<c:choose>
				<c:when test = "${user.id eq 'admin' }">
					<label for = "content">내용</label>
					<textarea name = "content" placeholder = "Content">${board.content }</textarea>
				</c:when>
				<c:otherwise>
					<label for = "content">내용</label>
					<textarea name = "content" readonly>${board.content }</textarea>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td>
				<label for = "regDate">등록 일자</label><br>
				<input type = "text" value = "${board.regDate }">
			</td>
	
		</tr>
		<tr>
			<td colspan = "2" align = "center">
			<c:choose>
				<c:when test = "${user.id eq 'admin' }">
					<input type = "submit" value = "업데이트">
					<input type = "button" id = "delete" value = "글삭제">
				</c:when>
			</c:choose>
				<input type = "button" id = "list" value = "글목록">
			</td>
		</tr>
	</table>
	</form>
</div>

<script>
	$(document).ready(function(){
		var seq_val = $('input[name=seq]').val();
		
		$('#delete').on('click', function(){
			window.location.href = 'deleteBoard.do?seq=' + seq_val;
		})
		$('#list').on('click', function(){
			history.back();
		})
	})
</script>
</section>

<%@ include file = "footer.jsp" %>

