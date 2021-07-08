<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page = "header.jsp" />

<jsp:include page = "nav.jsp" />

<!-- SECTION -->
<section>
<div class = "SNS">
	<div class = "SNSImg"></div>
	
	<script>
	window.onload = function(){
		var url = $(location).attr('search');
		var type = url.split("=");

		if(type[1] == 'kakao'){
			$('#img1').css({'background-image':'url(./resources/image/sns/kakao1.png)'});
			$('#img2').css({'background-image':'url(./resources/image/sns/kakao2.png)'});
			$('#img3').css({'background-image':'url(./resources/image/sns/kakao3.png)'});
		}	
		else if(type[1] == 'insta'){
			$('#img1').css({'background-image':'url(./resources/image/sns/insta1.png)'});
			$('#img2').css({'background-image':'url(./resources/image/sns/insta2.png)'});
			$('#img3').css({'background-image':'url(./resources/image/sns/insta3.png)'});
		}	
		else if(type[1] == 'blog'){
			$('#img1').css({'background-image':'url(./resources/image/sns/blog1.png)'});
			$('#img2').css({'background-image':'url(./resources/image/sns/blog2.png)'});
			$('#img3').css({'background-image':'url(./resources/image/sns/blog3.png)'});
		}
	};
	</script>
	
	<div>
		<div class = "whitelines"></div>
		<div class = "title">SNS</div>
	</div>
	
	<div class = "SNSInfo">
		<p>스시도쿠의 활동 여기서 끝이 아닙니다<p><br>
		<p>스시도쿠의 라이브 정보를 얻고싶다면</p><br>
		<p>SNS를 이용하세요<p>
	</div>
	
	<div class = "btn">
		<ul>
			<li id = "kakao"><p>카카오톡</p></li>
			<li id = "insta"><p>인스타그램</p></li>
			<li id = "naver"><p>네이버 블로그</p></li>
		</ul>
	</div>
		
	<div class="SnsSection">
	<ul>
		<li id="img1" style = "background-image:url(./resources/image/sns/kakao1.png)"></li>
		<li id="img2" style = "background-image:url(./resources/image/sns/kakao2.png)"></li>
		<li id="img3" style = "background-image:url(./resources/image/sns/kakao3.png)"></li>
	</ul>
	</div>
	
	<script>
	$(document).ready(function(){
		$('#kakao').click(function(){
			$('#img1').css({'background-image':'url(./resources/image/sns/kakao1.png)'});
			$('#img2').css({'background-image':'url(./resources/image/sns/kakao2.png)'});
			$('#img3').css({'background-image':'url(./resources/image/sns/kakao3.png)'});
		});
			
		$('#insta').click(function(){
			$('#img1').css({'background-image':'url(./resources/image/sns/insta1.png)'});
			$('#img2').css({'background-image':'url(./resources/image/sns/insta2.png)'});
			$('#img3').css({'background-image':'url(./resources/image/sns/insta3.png)'});
		});
			
		$('#naver').click(function(){
			$('#img1').css({'background-image':'url(./resources/image/sns/blog1.png)'});
			$('#img2').css({'background-image':'url(./resources/image/sns/blog2.png)'});
			$('#img3').css({'background-image':'url(./resources/image/sns/blog3.png)'});
		});
	})
	</script>
</div>
</section>

<jsp:include page = "footer.jsp" />