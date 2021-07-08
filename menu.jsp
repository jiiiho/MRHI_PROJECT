<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file = "header.jsp" %>			

<%@ include file = "nav.jsp" %>

<!-- SECTION -->
<section>
<div class = "menu">
	<div class="menuImg"></div>
	
	<!-- onload시 search값을 받아와서 보여지는 페이지를 변경 -->
	<script>
	window.onload = function(){
		/* search 는 ? 이후의 값 예: menu.do?type=course */
		/* url = ?type=course */
		var url = $(location).attr('search');
		
		/* =을 기준으로 array로 저장 */
		/* type[0] = ?type / type[1] = course */
		var type = url.split('=');
			
		if(type[1] == 'course'){
			$('#menuPage1').show('slow');
			$('#menuPage2').hide('slow');
		}
		else if(type[1] == 'single'){
			$('#menuPage1').hide('slow');
			$('#menuPage2').show('slow');
		}
	};
	</script>
	
	<!-- 특정식 / 정식 -->
	<div id = "menuPage1">
	<div class = "whitelines"></div>
	<div class = "title">특정식<br><br>&ensp;정식</div>
	
	<!-- 특정식 -->
	<div class = "special">
	<h1>특정식</h1>
	<ul>
		<c:forEach items = "${menuList }" var = "menu">
		<c:choose>	
			<c:when test = "${menu.type eq '특정식' }">
			<li>	
				<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
				<p>${menu.name }</p>
				<p>${menu.price } 원</p></a>
			</li>
			</c:when>
		</c:choose>
		</c:forEach>
	</ul>
	</div>

	<!-- 정식 -->
	<div class = "course">
	<h1>정식</h1>
		<div class = "courseBtn">
		<ul>
			<li id = "sushiBtn">스시</li>
			<li id = "sasimiBtn">사시미</li>
			<li id = "themeBtn">테마스시</li>
		</ul>
		</div>
		
		<!-- 스시정식 -->
		<div class = "sushiCourse">
		<ul>
			<c:forEach items = "${menuList }" var = "menu">
			<c:choose>	
				<c:when test = "${menu.type eq '스시정식' }">
				<li>	
					<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
					<p>${menu.name }</p>
					<p>${menu.price } 원</p></a>
				</li>
				</c:when>
			</c:choose>
			</c:forEach>
		</ul>
		</div>
		<!-- 사시미정식 -->
		<div class = "sasimiCourse">
		<ul>
			<c:forEach items = "${menuList }" var = "menu">
			<c:choose>	
				<c:when test = "${menu.type eq '사시미정식' }">
				<li>	
					<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
					<p>${menu.name }</p>
					<p>${menu.price } 원</p></a>
				</li>
				</c:when>
			</c:choose>
			</c:forEach>
		</ul>
		</div>
		<!-- 테마정식 -->
		<div class = "themeCourse">
		<ul>
			<c:forEach items = "${menuList }" var = "menu">
			<c:choose>	
				<c:when test = "${menu.type eq '테마정식' }">
				<li>	
					<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
					<p>${menu.name }</p>
					<p>${menu.price } 원</p></a>
				</li>
				</c:when>
			</c:choose>
			</c:forEach>
		</ul>
		</div>
			
		<script>
		$(document).ready(function(){
			$('#sushiBtn').click(function(){
				$('.sushiCourse').show("slow");
				$('.sasimiCourse').hide("slow");
				$('.themeCourse').hide("slow");
			})
			$('#sasimiBtn').click(function(){
				$('.sushiCourse').hide("slow");
				$('.sasimiCourse').show("slow");
				$('.themeCourse').hide("slow");
			})
			$('#themeBtn').click(function(){
				$('.sushiCourse').hide("slow");
				$('.sasimiCourse').hide("slow");
				$('.themeCourse').show("slow");
			})
		})
		</script>
		</div>
		
		<div id = "singlePageBtn">
			<input type = "button" id = "nextPage" value = "단품/주류 페이지">
			<c:if test = "${user.id eq 'admin' }">
			<input type = "button" id = "insert" value = "메뉴 추가">
			</c:if>
		</div>
	</div>
	
	<!-- 단품요리 -->
	<div id = "menuPage2">
	<div class = "whitelines"></div>
	<div class = "title">단품요리<br><br>&ensp;주류</div>
	
	<!-- 단품요리 -->
		<div class = "course">
			<div class = "courseBtn">
			<ul>
				<li id = "single1Btn">단품요리</li>
				<li id = "single2Btn">스시단품</li>
				<li id = "friedBtn">튀김/구이/우동</li>
				<li id = "drinkBtn">주류/음료</li>
			</ul>
			</div>
		
			<!-- 단품요리 -->
			<div class = "single1Course">
			<ul>
				<c:forEach items = "${menuList }" var = "menu">
				<c:choose>	
					<c:when test = "${menu.type eq '단품요리' }">
					<li>	
						<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
						<p>${menu.name }</p>
						<p>${menu.price } 원</p></a>
					</li>
					</c:when>
				</c:choose>
				</c:forEach>
			</ul>
			</div>
		
			<!-- 단품스시 -->
			<div class = "single2Course">
			<ul>
				<c:forEach items = "${menuList }" var = "menu">
				<c:choose>	
					<c:when test = "${menu.type eq '스시단품' }">
					<li>	
						<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
						<p>${menu.name }</p>
						<p>${menu.price } 원</p></a>
					</li>
					</c:when>
				</c:choose>
				</c:forEach>
			</ul>
			</div>
	
			<!-- 튀김/구이/우동 * 주류/음료 -->
			<div class = "friedCourse">
			<ul>
				<c:forEach items = "${menuList }" var = "menu">
				<c:choose>	
					<c:when test = "${menu.type eq '튀김/구이/우동' }">
					<li>	
						<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
						<p>${menu.name }</p>
						<p>${menu.price } 원</p></a>
					</li>
					</c:when>
				</c:choose>
				</c:forEach>
			</ul>
			</div>
			
			<div class = "drinkCourse">
			<ul>
				<c:forEach items = "${menuList }" var = "menu">
				<c:choose>	
					<c:when test = "${menu.type eq '주류/음료' }">
					<li>	
						<a href = "getMenu.do?menu_no=${menu.menu_no }"><img src = "${menu.imgname }">
						<p>${menu.name }</p>
						<p>${menu.price } 원</p></a>
					</li>
					</c:when>
				</c:choose>
				</c:forEach>
			</ul>
			</div>	
		</div>
		
		<div id = "coursePageBtn">
			<input type = "button" id = "prevPage" value = "특정식/스시 페이지">
			<c:if test = "${user.id eq 'admin' }">
				<input type = "button" id = "insert" value = "메뉴 추가">
			</c:if>
		</div>
	</div>
</div>
	
<script>
	$(document).ready(function(){
		$('#single1Btn').click(function(){
			$('.single1Course').show("slow");
			$('.single2Course').hide("slow");
			$('.friedCourse').hide("slow");
			$('.drinkCourse').hide("slow");
		})
		$('#single2Btn').click(function(){
			$('.single2Course').show("slow");
			$('.single1Course').hide("slow");
			$('.friedCourse').hide("slow");
			$('.drinkCourse').hide("slow");
		})	
		$('#friedBtn').click(function(){
			$('.friedCourse').show("slow");
			$('.single2Course').hide("slow");
			$('.single1Course').hide("slow");
			$('.drinkCourse').hide("slow");
		})
		$('#drinkBtn').click(function(){
			$('.drinkCourse').show("slow");
			$('.single2Course').hide("slow");
			$('.single1Course').hide("slow");
			$('.friedCourse').hide("slow");
		})
			
		$('#nextPage').on('click', function(){
			$('#menuPage2').show("slow");
			$('#menuPage1').hide("slow");
		})
		$('#prevPage').on('click', function(){
			$('#menuPage1').show("slow");
			$('#menuPage2').hide("slow");
		})
		
		$('#insert').on('click', function(){
			window.location.href = 'insertMenu.jsp';
		})
	})
</script>

</section>

<%@ include file = "footer.jsp" %>			
