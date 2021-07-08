<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- FOOTER -->
<footer>
	<div class = "footer-wrap">
		<div class = "topBtn"><p>↑</p></div>
			
		<div class = "logoInfo">
			<img src = "./resources/image/footer/s_logo.png" alt = "LOGO IMG"><br><br><br>
			
		</div><br><br>
		
		<div class = "info">
			<c:choose>
				<c:when test = "${user.id ne 'admin' }">
					<p><a href = "inquiry.jsp#signUp">|&emsp;개인 정보 처리 방침&emsp;|</a></p><br><br>
				</c:when>
			</c:choose>
			<p>스시도쿠&emsp;&ensp;손영래&emsp;&ensp;448-81-01947&emsp;&ensp;서울 성동구 행당동 196-18 B1(지하 1층)&emsp;&ensp;T.0507-1320-3255</p>
			<br>
			<p>영업시간&emsp;&ensp;AM 10:30 - 21:00&emsp;&ensp;( 브레이크 타임  월  / 화  15:00 - 17:00 )</p>
			<br>
			<p>Copyright ⓒ  Sushidoku Inc. All Rights reserved</p> 
		</div>
		
		<div class = "snsBtn">
			<button id = "kakao"><a href="https://pf.kakao.com/_xjWlxmC" target="_blank"><img src = "./resources/image/footer/kakao.png" alt = "kakao"></a></button>
			<button id = "insta"><a href="https://www.instagram.com/sushidoku2014/" target="_blank"><img src = "./resources/image/footer/insta.png" alt = "insta"></a></button>
			<button id = "blog"><a href="https://m.blog.naver.com/PostList.naver?blogId=todayjust" target="_blank"><img src = "./resources/image/footer/naver.png" alt = "blog"></a></button>
		</div>
	</div>
	
	
	<script>
	$(document).ready(function(){
		$(".topBtn").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 0);
	        return false;
	    });
	});
	</script>
</footer>

</body>
</html>