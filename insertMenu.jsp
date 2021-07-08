<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<section>
<div class = "insertMenu">
	<div class = "noticeImg"></div>

	<div class = "whitelines"></div>
	<div class = "title">메뉴 추가</div>

	<form action = "insertMenu.do" method = "post" enctype = "multipart/form-data">
	<table>
		<tr>
			<td>
			<div class = "type">
			<label for = "type">분류</label><br>
			<select id = "type" name="type">
				<option value="특정식">특정식</option>
				<option value="스시정식">스시정식</option>
				<option value="사시미정식">사시미정식</option>
				<option value="테마정식">테마정식</option>
				<option value="단품요리">단품요리</option>
				<option value="스시단품">스시단품</option>
				<option value="튀김/구이/우동">튀김/구이/우동</option>
				<option value="주류/음료">주류/음료</option>
			</select>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<label for = "name">메뉴 이름</label>
			<input type="text" id = "name" name="name" placeholder = "input menu title" autocomplete="off"></td>
		</tr>
		<tr>
			<td>
			<label for = "price">가격</label>
			<input type = "number" id = "price" placeholder = "input menu price" name = "price" autocomplete="off"> 원
			</td>
		</tr>
		<tr>
			<td>
			<label for = "info">설명</label>
			<textarea name="info" id = "info" placeholder = "input menu info" autocomplete="off"></textarea></td>
		</tr>
		<tr>
			<td>
			<label for = "imgname">이미지 첨부</label>
				<input type="file" id = "uploadFile" name="uploadFile"><br>
				<input type="text" id = "imgname" name = "imgname" readonly>
			</td>
		</tr>
		<tr>
			<td colspan="2" align = "center">
				<input type="submit" id = "submit" value="등록">
				<input type="button" id = "cancel" value="취소">
			</td>
		</tr>
	</table>
	</form>
</div>

	<script>
	$(document).ready(function(){
		
		
		$("#uploadFile").on('change',function(){
			var fileValue = $('#uploadFile').val().split('\\');
			var fileName = fileValue[fileValue.length-1];
			
			if($('#type').val() == '특정식')
				$("#imgname").val("resources/image/menu/special/" + fileName);
			else if($('#type').val() == '스시정식' || $('#type').val() == '사시미정식' || $('#type').val() == '테마정식')
				$("#imgname").val("resources/image/menu/course/" + fileName);
			else if($('#type').val() == '단품요리' || $('#type').val() == '스시단품')
				$("#imgname").val("resources/image/menu/single/" + fileName);
			else if($('#type').val() == '튀김/구이/우동' || $('#type').val() == '주류/음료')
				$("#imgname").val("resources/image/menu/etc/" + fileName);
		});
		
		$('#cancel').on('click', function(){
			history.back();
		});
		
		$('#submit').on('click', function(event){
			if($('#name').val() == ""){
				alert('메뉴 이름을 정해주세요 !');
				event.preventDefault();
			}
			else if($('#price').val() == ""){
				alert('가격을 정해주세요 !');
				event.preventDefault();
			}
			else if($('#info').val() == ""){
				alert('메뉴 설명을 해주세요 !');
				event.preventDefault();
			}
			else if($('#imgname').val() == ""){
				alert('이미지 업로드를 해주세요 !');
				event.preventDefault();
			}
			else{
				alert('메뉴 추가가 되었습니다 !');
			}
		});
	})
</script>
</section>

<%@ include file = "footer.jsp" %>

