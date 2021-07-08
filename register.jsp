<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "./resources/js/signup.js"></script>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<section>
	<div class = "registerPage">
		<form action = "register.do" method = "post" name = "registerform">
		<table>
			<tr>
				<td>
				<label for = "id">아이디</label><br>
				<input type = "text" id = "id" name = "id" placeholder = "Input your ID" autocomplete="off">
				<input type="hidden" name= "reid" id="reid">
				<input type = "button" value = "ID 중복확인" onclick="checkId()">
				</td>
			</tr>
			<tr>
				<td>
				<label for = "password">비밀번호</label>
				<input type = "password" id = "password" placeholder = "Input your PASSWORD" name = "password" autocomplete="off"></td>
			</tr>
			<tr>
				<td>
				<label for = "passwordchk">비밀번호 확인</label>
				<input type = "password" id = "passwordchk" placeholder = "Check your PASSWORD" autocomplete="off"></td>
			</tr>
			<tr>
				<td><p id = "check"></td>
			</tr>
			<tr>
				<td>
				<label for = "name">이름</label>
				<input type = "text" id = "name" name = "name" placeholder = "Input your NAME" autocomplete="off"></td>
			</tr>
			<tr>
				<td>
					<label for = "tel">연락처</label>
					<input type = "text" name = "tel" id = "tel" placeholder = "010-0000-0000">
				</td>
			</tr>
			<tr>
				<td>
				<label for = "email_id">이메일</label><br>
					<input type = "text" name = "e_id" id = "email_id" placeholder = "Email ID"> @ <input type = "text" name = "e_domain" id = "email_addr" placeholder = "Address">
				</td>
			</tr>
			<tr>
				<td>
				<div id = "gender">
					<label for = "gender">성별</label>&emsp;
					<input type = "radio" name = "gender" value = "M">&nbsp;남성&emsp;<input type = "radio" name = "gender" value = "F">&nbsp;여성
				</div>
				</td>
			</tr>
			<tr>
				<td>
					<label>주소</label><br>
					<input type="text" name="zipcode" id="zipcode" class="zipcode" placeholder = "Zipcode" readonly size="10">
					<input type="button" onclick="searchPost()" value="Search"><br><br>
					<input type="text" name="faddr" id="faddr" class="input" size="60" placeholder = "First Address" readonly>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="laddr" id="laddr" class="input" size="60" placeholder = "Last Address">
				</td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<input type = "submit" value = "Register">
				</td>
			</tr>
			<tr>
				<td align = "center">
					<a href = "login.do">이미 회원이신가요?</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script>
	$(document).ready(function(){
		$('input[type=password]').keyup(function(){
			var p1 = $('#password').val();
			var p2 = $('#passwordchk').val();
			
			if(p1 == p2){
				$('#check').html("<span style = 'color:green;'>비밀번호가 일치합니다</span>");
			}else{
				$('#check').html("<span style = 'color:red;'>비밀번호가 일치하지 않습니다</span>");
			}
		})
		
	})
	
	function checkId() {
		if (document.registerform.id.value == "") {
			alert("아이디를 입력해주세요.");
			document.registerform.id.focus();
			return false;
		}

		var url = "checkId.do?id=" + document.registerform.id.value;

		window.open(url, "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=300");
	}
	
	// 연락처 자릿수 및 자동 '-' 생성
	$(function(){
	    $("#tel").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
			var k = e.keyCode;
					
			if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
			{
	  	   	 	e.preventDefault();
			}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
			}
		});  
	});
	</script>
</section>

<%@ include file = "footer.jsp" %>

