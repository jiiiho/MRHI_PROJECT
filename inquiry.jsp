<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<!-- SECTION -->
<section>
<div class = "inquiryPage">
	<div class = "InquiryImg"></div>

	<div class = "whitelines"></div>
	<div class = "title">고객센터</div>
	
	<c:choose>
	<c:when test = "${user.id eq 'admin' }">
	<table class = "adminInquiry">
		<c:forEach items = "${inquiryList }" var = "inquiry">
		<input type = "hidden" name = "seq" value = "${inquiry.seq }">
		<tr>
			<td id = "inquiryDelete"><a href = "deleteInquiry.do?seq=${inquiry.seq }">X</a>
			<td id = "inquiryType">${inquiry.type }</td>
			<td id = "inquiryTitle">${inquiry.title }</td>
			<td id = "inquiryRegdate"><fmt:formatDate value = "${inquiry.regDate }" pattern = "yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td id = "inquiryContent" colspan = "4">${inquiry.content }</td>
		</tr>
		</c:forEach>
	</table>
	</c:when>
	
	<c:when test = "${user.id ne 'admin' }">
		<form action = "insertInquiry.do" id = "signUp" method = "post">
		<p style="font-size:25px; color:#fff; margin: 15px 25px;">개인정보 수집 및 활용동의</p>
		
		<div id="text1">
			<p>1. 개인정보의 수집 및 이용 목적</p><br>
			<p>&emsp;가맹 관련 문의 확인 및 답변을 위한 연락통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.</p><br>
			<p>2. 처리하는 개인정보 항목</p><br>
			<p>&emsp;- 필수항목 : 이름, 연락처 (접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그)</p><br>
			<p>&emsp;- 선택항목 : 이메일</p><br>
			<p>3. 개인정보의 처리 및 보유 기간</p><br>
			<p>&emsp;① 법령에 따른 개인정보 보유. 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유,</p>
			<p>&emsp;이용기간 내에서 개인정보를 처리, 보유합니다.</p><br>
			<p>&emsp;② 개인정보의 보유 기간은 5년입니다.</p>
		</div>
		<br>
		<input type="checkbox" id = "check">&emsp;위 개인정보 수집 및 활용에 동의합니다.
		<br>
		<table class = "userInquiry">
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			<tr>
				<td colspan ="2">
					<span style = "font-size:20px; font-weight:650;">상담자 정보&emsp;</span>
					<span class="star"> * </span><span style="font-size:12px;">은 필수입력항목입니다.</span>
				</td>
			</tr>
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			
			<tr>
				<th><span class="star"> * </span>제목</th>
				<td><input type="text" id = "title" name = "title" placeholder = "TITLE" autocomplete="off"></td>
			</tr>
			
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			<tr>
				<th><span class="star"> * </span>이름</th>
				<td>
				<c:choose>
					<c:when test = "${not empty user.id }">
						<input type="text" id = "writer" name = "writer" value = "${user.name }" readonly autocomplete="off">
					</c:when>
					<c:when test = "${empty user.id }">
						<input type="text" id = "writer" name = "writer" placeholder = "USER NAME" autocomplete="off">
					</c:when>
				</c:choose>
				</td>
			</tr>
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			<tr>
				<th><span class="star"> * </span>연락처</th>
				<td>
				<c:choose>
					<c:when test = "${not empty user.id }">
						<input type="text" id = "tel" name = "tel" value = "${user.tel }" readonly autocomplete="off">
					</c:when>
					<c:when test = "${empty user.id }">
						<input type="text" id = "tel" name = "tel" placeholder = "010-0000-0000" autocomplete="off">
					</c:when>
				</c:choose>
				</td>
			</tr>
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			<tr>
				<th>이메일</th>
				<td>
				<input type="email" id = "email" name = "email" placeholder = "example@example.com" autocomplete="off">
				</td>
			</tr>
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			<tr>
				<th><span class="star"> * </span>상담유형</th>
				<td><input type="radio" id = "type" name="type" value = "칭찬" checked>칭찬&emsp;<input type="radio" id = "type" name="type" value = "불만">불만&emsp;
					<input type="radio" id = "type" name="type" value = "문의">문의&emsp;<input type="radio" id = "type" name="type" value = "제안">제안</td>
			</tr>
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
				
			<tr>
				<th><span class="star"> * </span>문의내용</th>
				<td><textarea name = "content" id = "content" placeholder = "CONTENTS" autocomplete="off"></textarea></td>
			</tr>
			
			<tr><td colspan="2" class = "line"><hr></td></tr>
			
			<tr>
				<td colspan="2" align = "center"><input type = "submit" id = "submit" value = "문의하기"></td>
			</tr>
		</table>
		</form>
	</c:when>
	</c:choose>
</div>

<script>
$(document).ready(function(){
	$('#submit').on('click', function(event){
		if(!$('#check').is(':checked')){
			alert('개인정보수집 약관에 동의해주셔야 합니다 !');
			event.preventDefault();
		}
		else if($('#title').val() == ''){
			alert('제목을 입력하셔야 합니다 !');
			$('#title').focus();
			event.preventDefault();
		}
		else if($('#writer').val() == ''){
			alert('작성자 이름을 입력하셔야 합니다 !');
			$('#writer').focus();
			event.preventDefault();
		}
		else if($('#tel').val() == ''){
			alert('연락처를 입력하셔야 합니다 !');
			$('#tel').focus();
			event.preventDefault();
		}
		else if($('#type').val() == ''){
			alert('문의 유형을 선택하셔야 합니다 !');
			$('#type').focus();
			event.preventDefault();
		}
		else if($('#content').val() == ''){
			alert('내용을 입력하셔야 합니다 !');
			$('#content').focus();
			event.preventDefault();
		}
		else{
			alert('문의가 정상 접수되었습니다. 감사합니다 !');
		}
	})
})
</script>
</section>

<%@ include file = "footer.jsp" %>