<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page = "header.jsp" />

<jsp:include page = "nav.jsp" />

<!-- SECTION -->
<section>
<div class = "Event">
	<div class = "EventImg"></div>
	
	<div class = "whitelines"></div>		
	<div class = "title">이벤트</div>

		
	<!-- EventPage1 -->
	<div class="EventPage1">
		<div class="event1" style = "background-image:url(./resources/image/event/event1.png)"></div>
		<div class="event1-1">
			<img alt="" src="./resources/image/event/이벤트상세페이지1.png">
		</div>
		
		<div class="event2" style = "background-image:url(./resources/image/event/event2.png)"></div>
		<div class="event2-2">
			<img alt="" src="./resources/image/event/이벤트상세페이지2.jpg">
		</div>
		
		<div class="event3" style = "background-image:url(./resources/image/event/event3.png)"></div>
		<div class="event3-3">
			<img alt="" src="./resources/image/event/이벤트상세페이지3.jpg">
		</div>
	</div>

	<div class="EventPage2">
		<div class="event4" style = "background-image:url(./resources/image/event/event4.png)"></div>
		<div class="event4-4">
			<img alt="" src="./resources/image/event/이벤트상세페이지4.png">
		</div>
		<div class="event5" style = "background-image:url(./resources/image/event/event5.png)"></div>
		<div class="event5-5">
			<img alt="" src="./resources/image/event/이벤트상세페이지5.jpg">
		</div>
		<div class="event6" style = "background-image:url(./resources/image/event/event6.png)"></div>
		<div class="event6-6">
			<img alt="" src="./resources/image/event/이벤트상세페이지6.jpg">
		</div>
	</div>	
	
	<script>
	var event1 = false;
	var event2 = false;
	var event3 = false;
	var event4 = false;
	var event5 = false;
	var event6 = false;
	
    $(document).ready(function(){
    	$('.event1').click(function(){
    		if(event1 == false){
    			event1 = true;
    			event2 = false;
    			event3 = false;
    			event4 = false;
    			event5 = false;
    			event6 = false;
    			if(event1 == true){
    				$('.event1-1').slideDown('slow');
    				$('.event2-2').slideUp('slow');
    				$('.event3-3').slideUp('slow');
    				$('.event4-4').slideUp('slow');
    				$('.event5-5').slideUp('slow');
    				$('.event6-6').slideUp('slow');
    			}
    		}else{
    			$('.event1-1').slideUp('slow');
    			event1 = false;
    		}
    	})
    	$('.event2').click(function(){
    		if(event2 == false){
    			event2 = true;
    			event1 = false;
    			event3 = false;
    			event4 = false;
    			event5 = false;
    			event6 = false;
    			if(event2 == true){
    				$('.event2-2').slideDown('slow');
    				$('.event1-1').slideUp('slow');
    				$('.event3-3').slideUp('slow');
    				$('.event4-4').slideUp('slow');
    				$('.event5-5').slideUp('slow');
    				$('.event6-6').slideUp('slow');
    			}
    		}else{
    			$('.event2-2').slideUp('slow');
    			event2 = false;
    		}
    	})
    	$('.event3').click(function(){
    		if(event3 == false){
    		event3 = true;
    		event1 = false;
    		event2 = false;
    		event4 = false;
    		event5 = false;
    		event6 = false;
    		if(event3 == true){
    			$('.event3-3').slideDown('slow');
    			$('.event1-1').slideUp('slow');
    			$('.event2-2').slideUp('slow');
    			$('.event4-4').slideUp('slow');
    			$('.event5-5').slideUp('slow');
    			$('.event6-6').slideUp('slow');
    		}
    		}else{
    			$('.event3-3').slideUp('slow');
    			event3 = false;
    		}
    	})
    	$('.event4').click(function(){
    		if(event4 == false){
    		event4 = true;
    		event1 = false;
    		event2 = false;
    		event3 = false;
    		event5 = false;
    		event6 = false;
    		if(event4 == true){
    			$('.event4-4').slideDown('slow');
    			$('.event1-1').slideUp('slow');
    			$('.event2-2').slideUp('slow');
    			$('.event3-3').slideUp('slow');
    			$('.event5-5').slideUp('slow');
    			$('.event6-6').slideUp('slow');
    		}
    		}else{
    			$('.event4-4').slideUp('slow');
    			event4 = false;
    		}
    	})
    	$('.event5').click(function(){
    		if(event5 == false){
    		event5 = true;
    		event1 = false;
    		event2 = false;
    		event3 = false;
    		event4 = false;
    		event6 = false;
    		if(event5 == true){
    			$('.event5-5').slideDown('slow');
    			$('.event1-1').slideUp('slow');
    			$('.event2-2').slideUp('slow');
    			$('.event3-3').slideUp('slow');
    			$('.event4-4').slideUp('slow');
    			$('.event6-6').slideUp('slow');
    		}
    		}else{
    			$('.event5-5').slideUp('slow');
    			event5 = false;
    		}
    	})
    	$('.event6').click(function(){
    		if(event6 == false){
    		event6 = true;
    		event1 = false;
    		event2 = false;
    		event3 = false;
    		event4 = false;
    		event5 = false;
    		if(event6 == true){
    			$('.event6-6').slideDown('slow');
    			$('.event1-1').slideUp('slow');
    			$('.event2-2').slideUp('slow');
    			$('.event3-3').slideUp('slow');
    			$('.event4-4').slideUp('slow');
    			$('.event5-5').slideUp('slow');
    		}
    		}else{
    			$('.event6-6').slideUp('slow');
    			event6 = false;
    		}
    	})
    })
	</script>
        
	<div class = "more">
		<button>MORE</button>
	</div>
		
	<script>
	var btn = false;
	
	$(function(){
		$(".more").click(function(){
			if(btn == false){
				$(".EventPage2").slideDown("slow");
				btn = true;
			}else{
				$(".EventPage2").slideUp("slow");
				btn = false;
			}
		});
	});
	</script>
</div>
</section>

<jsp:include page = "footer.jsp" />