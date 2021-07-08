<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset = "utf-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">

<title>SUSHIDOKU</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<link rel = "shortcut icon" href = "./resources/image/logo.ico">

<!-- HEADER PART CSS -->
<link rel = "stylesheet" href = "./resources/css/button.css">
<link rel = "stylesheet" href = "./resources/css/header.css">
<link rel = "stylesheet" href = "./resources/css/nav.css">

<link rel = "stylesheet" href = "./resources/css/login.css">
<link rel = "stylesheet" href = "./resources/css/mypage.css">
<link rel = "stylesheet" href = "./resources/css/cart.css">
<link rel = "stylesheet" href = "./resources/css/payment.css">
<link rel = "stylesheet" href = "./resources/css/register.css">

<!-- HOME PART CSS -->
<link rel = "stylesheet" href = "./resources/css/home.css">

<!-- NAV PART CSS -->
<link rel = "stylesheet" href = "./resources/css/brand.css">
<link rel = "stylesheet" href = "./resources/css/store.css">
<link rel = "stylesheet" href = "./resources/css/menu.css">
<link rel = "stylesheet" href = "./resources/css/notice.css">
<link rel = "stylesheet" href = "./resources/css/event.css">
<link rel = "stylesheet" href = "./resources/css/inquiry.css">
<link rel = "stylesheet" href = "./resources/css/sns.css">
<link rel = "stylesheet" href = "./resources/css/insertBoard.css">
<link rel = "stylesheet" href = "./resources/css/insertMenu.css">
<link rel = "stylesheet" href = "./resources/css/getBoard.css">
<link rel = "stylesheet" href = "./resources/css/getMenu.css">

<!-- FOOTER PART CSS -->
<link rel = "stylesheet" href = "./resources/css/footer.css">

<!-- WHITELINES -->
<link rel = "stylesheet" href = "./resources/css/whitelines.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Ma+Shan+Zheng&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap');

*{
	padding:0;
	margin:0;
	font-family: 'Nanum Myeongjo', serif;
	color:white;
	font-size:13px;
	scroll-behavior: smooth;
}
section{
	background: #252525;
}
</style>

</head>
<body>

<!-- HEADER -->
<header>
	
	<div class = "login-register-form">
	<c:choose>
		<c:when test = "${empty user.id }">
		<ul>
			<li><a href = "login.jsp">LOGIN</a></li>
			<li><a href = "register.jsp">REGISTER</a></li>
		</ul>
		</c:when>
		<c:otherwise>
		<p>"${user.name }" 님 반갑습니다 !</p>
		<ul>
			<c:if test = "${user.id ne 'admin' }">
					<li><a href = "mypage.jsp">MYPAGE</a></li>
					<li><a href = "cart.do">CART</a></li>
			</c:if>
			<c:if test = "${user.id eq 'admin' }">
				<li><a href = "payment.do">PAYMENT</a></li>
			</c:if>
			<li><a href = "logout.do">LOGOUT</a></li>
		</ul>
		</c:otherwise>
	</c:choose>
	</div>
	
	<!-- 로고 -->
	<div class = "header-wrap">
		<div class = "logoImg"><a href = "index.jsp"><img src = "./resources/image/s_logo.png" alt = "LOGO IMG"></a></div>
	</div>
</header>


