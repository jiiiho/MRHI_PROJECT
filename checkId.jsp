<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.js" ></script>

<link rel = "stylesheet" href = "./resources/css/checkId.css">
</head>
<body>
	<script>
		function idok() {
			opener.registerform.id.value = "${id}";
			opener.registerform.reid.value = "${id}";
			window.open('','_self').close();
		}
	</script>

	<form method="post" action="checkId.do" name="registerform">
	<table>
		<tr>
			<td>
			<label for = "id">아이디</label><br>
			<input type="text" id="id" name="id" placeholder = "Check ID" value="${id}">
			</td>
		</tr>
		<tr>
			<td align = "center">
				<!-- 아이디가 존재할 때 -->
				<c:if test="${check == 1 }">
				<script>
					opener.document.registerform.id.value = "";
				</script>
				<p id = "check" style = "color:red;">${id }는 사용 불가능한 아이디입니다.</p>
				</c:if>
				<!-- 아이디가 존재하지 않을 때 -->
				<c:if test="${check == 0 }">
				<p id = "check" style = "color:green;">${id }는 사용가능한 아이디입니다.</p>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align = "center">
			<input type="submit" id = "submit" value="check">
			<c:if test = "${check == 0 }">
				<input type="button" value="use this ID" onclick="idok()">
			</c:if>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>

