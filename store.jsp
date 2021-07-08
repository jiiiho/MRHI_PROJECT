<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page = "header.jsp" />

<jsp:include page = "nav.jsp" />

<!-- SECTION -->
<section>
<div class = "Store">
	<div class="StoreImg"></div>
	
	<div id = "LocatePage">
		<div class="whitelines"></div>
		<div class = "title">오시는길</div>

		<div id = "content7">
         <div id = "map"></div>
         <div id = "logo"></div>
         <table>
            <tr>
               <th>위치
               <td>서울 성동구 행당동 196-18&emsp;B1(지하1층)
            <tr>
               <th>연락처
               <td>T.0507-1320-3255
            <tr>
               <th>영업시간
               <td>매일 AM 10:30 - 21:00<br><br>( 브레이크 타임  월  / 화  15:00 - 17:00 )
            <tr>
               <th>대중교통 이용시
               <td>- 지하철역 7번 출구 뒷편<br><br>- 4211번 버스 왕십리광장,왕십리역 7번 출구 정거장 하차
         </table>
      </div>
	</div>
	
	<div id = "StorePage">
		<div class="whitelines"></div>
		<div class = "title">매장안내</div>
		
	<!------- 매장안내 -------->	
	<div class="StoreSlide">
		<div class="StoreSlides">
        	<input type="radio" id="ra01" name="ra" value="" checked>
        	<input type="radio" id="ra02" name="ra" value="">
        	<input type="radio" id="ra03" name="ra" value="">
        	<input type="radio" id="ra04" name="ra" value="">
			<input type="radio" id="ra05" name="ra" value="">
        	<input type="radio" id="ra06" name="ra" value="">
        	<input type="radio" id="ra07" name="ra" value="">

			<div class="sl" style = "background-image:url(./resources/image/store/store1.jpg)"></div>
		</div>

		<div class="page">
			<label for="ra01"><img src="./resources/image/store/store1.jpg" alt=""></label>
			<label for="ra02"><img src="./resources/image/store/store2.jpg" alt=""></label>
			<label for="ra03"><img src="./resources/image/store/store3.jpg" alt=""></label>
			<label for="ra04"><img src="./resources/image/store/store4.jpg" alt=""></label>
			<label for="ra05"><img src="./resources/image/store/store5.jpg" alt=""></label>
			<label for="ra06"><img src="./resources/image/store/store6.jpg" alt=""></label>
			<label for="ra07"><img src="./resources/image/store/store7.jpg" alt=""></label>
		</div>
    </div>
	<script>
	$(document).ready(function(){
		$('#ra01').change(function(){
			if($('#ra01').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store1.jpg)'});
			}	
		})
		$('#ra02').change(function(){
			if($('#ra02').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store2.jpg)'});
			}	
		})
		$('#ra03').change(function(){
			if($('#ra03').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store3.jpg)'});
			}	
		})
		$('#ra04').change(function(){
			if($('#ra04').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store4.jpg)'});
			}	
		})
		$('#ra05').change(function(){
			if($('#ra05').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store5.jpg)'});
			}	
		})
		$('#ra06').change(function(){
			if($('#ra06').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store6.jpg)'});
			}	
		})
		$('#ra07').change(function(){
			if($('#ra07').is(":checked")){
				$('.sl').css({'background-image':'url(./resources/image/store/store7.jpg)'});
			}	
		})
	})
	</script>
	</div>		
</div>
</section>

<jsp:include page = "footer.jsp" />