<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.js" ></script>
</head>
<body bgcolor = "#fff" text = "#000000">
<!-- TITLE -->
<table style = "width:100%; border:1px; cellspacing:0; cellpadding:0">
	<tr>
		<td align = "center" bgcolor = "orange"><b>기본 에러 화면입니다.</b></td>
	</tr>
</table>
<br>
<!-- ERROR MESSAGE -->
<table style = "width:100%; border:1px; cellspacing:0; cellpadding:0" align = "center">
	<tr>
		<td align = "center">
		<br><br><br><br>
		Message : ${exception.message }
		<br><br><br><br>
		</td>
	</tr>	
</table>
</body>
</html>

