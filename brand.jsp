<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<!-- SECTION -->
<section>
<div class = "Brand">
	<div class = "BrandImg"></div>
	
	<div id = "GreetingPage">
	<div class = "whitelines"></div>
	<div class = "title">인사말</div>
	
	
		<div id="content4">
			<p style = "font-size:23px; font-weight:700;">" 어서오세요.&nbsp;스시도쿠 입니다. "</p><br><br>
			<p>스시도쿠의  '<b>도쿠</b>' 는  <b>얻을 득(得)</b>으로,  <b>맛(味)</b>을 얻고, <b>정(情)</b>을 얻고 , <b>사람의 마음(心)</b>을  얻자라는  뜻을 담고  있습니다.<p><br>
			<p>스시도쿠를  개업한  이후로부터  현재까지.  찾아주시는  고객님들  덕분에  소중한  것들을  얻어  갈  수  있었습니다.</p><br><br>
					
			<p style = "font-size:18px; font-weight:700;">" 스시도쿠 "를 통해 맛(味)을  얻고, 정(情)을 얻고 , 사람의 마음(心)을  얻다</p><br><br>
			<p>고객님들의 기억 속에 소중한 분들과의 추억을 얻어갈 수 있는 장소로 남을 수 있도록<p><br>	
			<p>더욱 더 최선을 다하는 스시도쿠가 되겠습니다<p><br>
			<p>감사합니다</p><br><br>
			<h3 style = "text-align:right">스시도쿠 대표 &emsp;<span style = "font-family: 'Nanum Brush Script', cursive; font-size:30px; font-weight:lighter;">손&nbsp;영&nbsp;래</span></h3>
		</div>
		
		<div id = "greetingPeople">
			<img src = "./resources/image/brand/greetingpeople.png">
		</div>
	</div>
	
	<div id = "EgoPage">
	<div class = "whitelines"></div>
	<div class = "title">경영<br>&emsp;&emsp;철학</div>
		
		<div id = "content5">
			<p style = "font-size:20px; font-weight:700;">스시도쿠는 모든 음식이 [:라이브] 입니다.</p>
			<hr>
			<p style = "font-size:15px; font-weight:600;">스시도쿠의  경영  철학  하나 !</p><br>
			<p><b>' 주문 즉시 바로 '</b></p><br><br>
			<p>주문이 들어오면 만들기 시작 합니다.</p><br>
			<p>음식의 일부라도 절대 미리 만들어 놓지 않습니다!<p><br>
			<p>떄문에 동종업계 최대 인력을 동원하여 요리하고 있습니다.</p>
			<hr>
			<p style = "font-size:15px; font-weight:600;">스시도쿠의  경영  철학  둘 !</p><br>
			<p><b>' 당일 재료 당일 소진 '</b></p><br><br>
			<p>스시도쿠의 모든 재료는 그날 소진 합니다.</p><br>
			<p>개점 이후로 단 한번도 ! 어긴 적이 없습니다.</p><br>
			<p>언제나 최상급 재료만을 취급하며 아낌없이 사용하고 있으니</p><br>
			<p>항상 안심하고 맛있게 즐겨주세요!</p>
			<hr>
			<p style = "font-size:15px; font-weight:600;">스시도쿠의  경영  철학  셋 !</p><br>
			<p><b>스시도쿠는&emsp;'&emsp;&emsp;'&emsp;합니다</b></p><br><br>
			
			<ul >
				<li class = "conbujimeImg">
				<div class = "conbujime">
					<h1>곤부지메</h1>
				</div>
				<div id = "conbujimeWrap"></div>
				</li>
				<li class = "ikesimeImg">
				<div class = "ikesime">
					<h1>이케시메</h1>
				</div>
				<div id = "ikesimeWrap"></div>
				</li>
			</ul>
			<script>
			$(document).ready(function(){
				$('.conbujimeImg').on('click', function(){
					var url = "popup.jsp";

					window.open(url, "_blank", "toolbar=no, menubar=no, scrollbars=no, resizable=no, top=320, left=612, width=660, height=460");
				})
				$('.ikesimeImg').on('click', function(){
					var url = "popup.jsp";

					window.open(url, "_blank", "toolbar=no, menubar=no, scrollbars=no, resizable=no, top=320, left=612, width=660, height=460");
				})
			})
			</script>
		</div>
	</div>
	
	<div id = "BIPage">
	<div class = "whitelines"></div>
	<div class = "title">BI</div>
	
		<div id = "content6">
			<p style = "font-size:23px; font-weight:700;">" 찍지말고 바르세요 "</p><br><br>
			<p>스시도쿠의 아이덴티티이자 로고 타입은 오로지 스시도쿠에서만 볼 수 있는 <b>'붓'</b> 을 모티브로 하였습니다.</p><br>
			<p>매장에서 붓을 활용하는 이유는 스시의 맛과 신선도를 있는 그대로 느끼기 위함입니다.</p><br><br>
			<p>또한, <b>" 주문 즉시 바로 "</b> 라는 스시도쿠의 [:라이브] 슬로건과도 연결되는데, 주문과 동시에 쥐어내는<p><br>
			<p>스시이기 때문에 연약할 수 밖에 없는 스시 퀄리티를 상징하는 역할로써도 적합합니다.<p>
			
			<br>
			<div class = "ICON">
			<ul>
				<li><img src = "./resources/image/brand/ICON_BLACK.png" alt = "Type-1"></li>
				<li><img src = "./resources/image/brand/ICON_WHITE.png" alt = "Type-2"></li>
			</ul>
			</div>
			<br>
			
			<p style = "font-size:23px; font-weight:700;">BI 색상</p><br>
			<!-- <img src="./image/pentagon.png"> -->
			<br>
			<div class = "pentagon">
			<input type = "radio" id = "blue" name = "color">
			<input type = "radio" id = "red" name = "color">
			<input type = "radio" id = "brown" name = "color">
			<input type = "radio" id = "darkgray" name = "color">
			<input type = "radio" id = "white" name = "color">
			<ul>
				<li><label for = "blue" id = "blueBtn"></label></li>
				<li><label for = "red" id = "redBtn"></label></li>
				<li><label for = "brown" id = "brownBtn"></label></li>
				<li><label for = "darkgray" id = "darkgrayBtn"></label></li>
				<li><label for = "white" id = "whiteBtn"></label></li>
			</ul>
			<br>
			
			<div id = "pentagon"></div>
			<p id = 'colorInfo'>색상을 눌러<br><br>정보를 확인하세요</p>
			</div>
			
			<script>
			$(document).ready(function(){
				$('input[name=color]').change(function(){
					if($('#blue').is(':checked')){
						$('#colorInfo').html("<p><b>Blue</b></p><br><br><p>HEX Code　#172b50</p><br><p>CMYK　C:100% M:100% Y:58% K:10%</p><br><p>RGB　R:23 G:43 B:80</p>");
					}
					else if($('#red').is(':checked')){
						$('#colorInfo').html("<p><b>Red</b></p><br><br><p>HEX Code　#912221</p><br><p>CMYK　C:44% M:100% Y:100% K:12%</p><br><p>RGB　R:156 G:24 B:28</p>");
					}
					else if($('#brown').is(':checked')){
						$('#colorInfo').html("<p><b>Brown</b></p><br><br><p>HEX Code　#5C4E45</p><br><p>CMYK　C:67% M:67% Y:70% K:24%</p><br><p>RGB　R:92 G:78 B:69</p>");
					}
					else if($('#darkgray').is(':checked')){
						$('#colorInfo').html("<p><b>Darkgray</b></p><br><br><p>HEX Code　#474643</p><br><p>CMYK　C:74% M:68% Y:68% K:30%</p><br><p>RGB　R:71 G:70 B:67</p>");
					}
					else if($('#white').is(':checked')){
						$('#colorInfo').html("<p><b>White</b></p><br><br><p>HEX Code　#ffffff</p><br><p>CMYK　C:0% M:0% Y:0% K:0%</p><br><p>RGB　R:255 G:255 B:255</p>");
					}
				})
			})
			</script>
		</div>
	</div>
</div>
</section>

<%@ include file = "footer.jsp" %>