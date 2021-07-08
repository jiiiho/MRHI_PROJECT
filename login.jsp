<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<section>
	<div class = "loginPage">
		<form action = "login.do" method = "post">
		<table>
			<tr>
				<td>
				<label for = "id">아이디</label>
				<input type = "text" id = "id" name = "id" placeholder = "Input your ID" autocomplete="off"></td>
			</tr>
			<tr>
				<td>
				<label for = "password">비밀번호</label>
				<input type = "password" id = "password" name = "password" placeholder = "Input your PASSWORD" autocomplete="off"></td>
			</tr>
			<tr>
				<td>
					<p id = "check" style = "color:red"><c:if test = "${check == 1 }">${message }</c:if></p>
				</td>
			</tr>
			<tr>
				<td>
					<input type = "submit" id = "submit" value = "login">
				</td>
			</tr>
			<tr>
				<td align = "center">
					<a href = "register.jsp">아직 회원이 아니신가요?</a>
				</td>
			</tr>
			<tr>
				<td align = "center">
					<span id = "forgotID" onclick="forgotID();" style = "cursor:pointer;">아이디 찾기</span>
					&emsp;/&emsp;
					<span id = "forgotPW" onclick="forgotPW();" style = "cursor:pointer;">비밀번호 찾기</span>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script>
		$(document).ready(function(){
			$('#submit').on('click', function(event){
				if($('#id').val() == ''){
					event.preventDefault();
					$('#id').focus();
					$('#check').html("<span style = 'color:red;'>아이디를 입력해주세요 !</span>");
				}
				else if($('#password').val() == ''){
					event.preventDefault();
					$('#password').focus();
					$('#check').html("<span style = 'color:red;'>비밀번호를 입력해주세요 !</span>");
				}
			})
		})
		
		function forgotID() {
			var url = "forgotID.jsp";

			window.open(url, "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=300");
		}
		
		function forgotPW() {
			var url = "forgotPW.jsp";

			window.open(url, "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
		}
	</script>
</section>

<%@ include file = "footer.jsp" %>

