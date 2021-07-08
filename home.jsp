<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src = "./resources/js/slide.js"></script>

<!-- HOME SlIDE PART START -->
<div class = "home-div1">
	<div class="slides">
		<!-- radio btn start -->
		<input type="radio" name="slide-btn" id = "slide1" checked>
		<input type="radio" name="slide-btn" id = "slide2">
		<input type="radio" name="slide-btn" id = "slide3">
		<input type="radio" name="slide-btn" id = "slide4">
		<!-- radio btn end -->
            
		<!-- slide img start -->
		<div class = "slide first">
			<img src = "./resources/image/home/mainimg1.png" alt = "">
		</div>
		<div class = "slide">
			<img src = "./resources/image/home/mainimg2.png" alt = "">
		</div>
		<div class = "slide">
			<img src = "./resources/image/home/mainimg3.png" alt = "">
		</div>
		<div class = "slide">
			<img src = "./resources/image/home/mainimg4.png" alt = "">
		</div>
		<!-- slide img end -->
		<!-- automatic navigation start -->
		<div class="navigation-auto">
			<div class="auto-btn1"></div>
			<div class="auto-btn2"></div>
			<div class="auto-btn3"></div>
			<div class="auto-btn4"></div>
		</div>
		<!-- automatic navigation end -->
	</div>	
	
	<!-- manual navigation start -->
	<div class = "navigation-manual">
		<label for="slide1" class = "manual-btn"></label>
		<label for="slide2" class = "manual-btn"></label>
		<label for="slide3" class = "manual-btn"></label>
		<label for="slide4" class = "manual-btn"></label>
	</div>
	<!-- manual navigation end -->
</div>
<!-- HOME SlIDE PART END -->

<div class="whitelines"></div>

<!-- HOME LIVE PART START -->
<div class = "home-div2">
	<div id = "content1">
 	<span style = "font-size:18px; font-weight: 750;">스시도쿠는 오늘도 [:라이브]</span><br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;모든 메뉴를 <b>주문 즉시 수제 조리</b>하는<br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;이것이 스시도쿠의 <b>[:라이브]</b>입니다
	</div>
		
	<div class = "live">
		<div id = "shari">
			<img src = "./resources/image/home/shari.png"><br><br>
			<pre>주문 즉시 바로 
			
밥을 비비고 쥐어 올립니다</pre>
		</div>
		<div id = "neta">
			<img src = "./resources/image/home/neta.png"><br><br>
			<pre>당일의 재료를 
			
당일에 정통숙성하여 당일 소진합니다</pre>
		</div>
		<div id = "people">
			<img src = "./resources/image/home/people.png"><br><br>
			<pre>스시도쿠의 25명의 셰프가
			
주문 즉시 바로</pre>
		</div>
	</div>
</div>
<!-- HOME LIVE PART END -->

<div class="whitelines"></div>

<!-- HOME SPECIAL PART START -->
<div class = "home-div3">
	<p>得</p>
	<b>[:얻을 득]</b>
	<div id = "content2">
 	<span style = "font-size:18px; font-weight: 750;">스시도쿠만의 [:특별함]</span><br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;고객 감동의 이유<b>오로지 스시도쿠에서만</b>느낄 수 있는<br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;세 가지 <b>[:특별함]</b>에 있습니다.
	</div>

 	<div class="home-list">
 		<ul>
 			<li class = "tasty">
 				<div id = "tastyText">
 					<h1 style = "font-family: 'Ma Shan Zheng', cursive;">味</h1>
 				</div>
 				<div id = "tastyWrap"></div>
 			</li>
 			<li class = "friendship">
 				<div id = "friendshipText">
 					<h1 style = "font-family: 'Ma Shan Zheng', cursive;">情</h1>
 				</div>
 				<div id = "friendshipWrap"></div>
 			</li>
 			<li class = "mind">
 				<div id = "mindText">
 					<h1 style = "font-family: 'Ma Shan Zheng', cursive;">心</h1>
 				</div>
 				<div id = "mindWrap"></div>
 			</li>
 		</ul>
 	 </div>
 	 
 	 <script>
 	 $(document).ready(function(){
 		 $('.tasty').on('click',function(){
 			 window.location.href = 'menu.do';
 		 })
 		 $('.friendship').on('click', function(){
 			 window.location.href = 'store.jsp';
 		 })
 		 $('.mind').on('click', function(){
 			 window.location.href = 'event.jsp';
 		 })
 	 })
 	 </script>
</div>
<!-- HOME SPECIAL PART END -->

<div class="whitelines"></div>

<!-- HOME YOUTUBE PART START -->
<div class = "home-div4">
	<div id = "content3">
 	<span style = "font-size:18px; font-weight: 750;">스시도쿠를 향한[:관심]</span><br><br>
	&emsp;&emsp;&emsp;&emsp;고객들의 <b>[:관심]</b> 덕에 지금의 스시도쿠가 있습니다<br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;앞으로도 <b>맛,정성,마음</b> 아낌없이 드리는<br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;스시도쿠가 되겠습니다 감사합니다
	</div>
	
	<!-- IFRAME START-->
	<div class = "player">
		<iframe width="740" height="420" src="https://www.youtube.com/embed/_U2VBCx3b0s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<!-- IFRAME START-->
</div>
<!-- HOME YOUTUBE PART END -->