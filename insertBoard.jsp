<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<section>
<div class = "insertPage">
	<div class = "noticeImg"></div>

	<div class = "whitelines"></div>
	<div class = "title">글쓰기</div>

	<form action = "insertBoard.do" method = "post">
	<table>
		<tr>
			<td>
			<label for = "title">제목</label>
			<input type="text" id = "title" name="title" placeholder = "Title" autocomplete="off"></td>
		</tr>
		<tr>
			<td>
			<label for = "writer">작성자</label>
			<input type = "text" name = "writer" value = "${user.name }" readonly></td>
		</tr>
		<tr>
			<td>
			<label for = "content">내용</label>
			<textarea name="content" id = "content" placeholder = "Content" autocomplete="off"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align = "center">
				<input type="submit" id = "submit" value="등록">
				<input type="reset" value="지우기">
				<input type="button" id = "cancel" value = "취소">
			</td>
		</tr>
	</table>
	</form>
</div>
<script>
	$(document).ready(function(){
		$('#cancel').on('click', function(){
			history.back();
		})
		
		$('#submit').on('click', function(event){
			if($('#title').val() == ''){
				alert('제목을 입력해주세요 !');
				event.preventDefault();
			}
			else if($('#content').val() == ''){
				alert('내용을 입력해주세요 !');
				event.preventDefault();
			}
			else{
				alert('공지사항 등록이 되었습니다 !');
			}
		})
	})
</script>
</section>

<%@ include file = "footer.jsp" %>

