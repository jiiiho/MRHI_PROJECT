<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "./resources/js/signup.js"></script>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

    
<!-- SECTION -->
<section>
<div id="cartPage">
   <div class = "cartPageImg"></div>

   <div class = "whitelines"></div>
   <div class = "title">장바구니</div>
   
	<div class="cartPageBtn">
		<ul>
			<li id="cartBtn"><p>장바구니</p></li>
			<li id="orderBtn"><p>주문현황</p></li>
		</ul>
	</div>

	<div id="cartInfo">
	<input type = "hidden" id = "id" name = "id" value = "${user.id }">
		<table class="cartTable">
			<tr>
				<th class = "cart">취소</th>
				<th class = "cart">이미지</th>
				<th class = "cart">상품정보</th>
				<th class = "cart">단가</th>
				<th class = "cart">수량</th>
				<th class = "cart">주문 금액</th>
			</tr>
				<c:set var="priceSum" value="0" />
				<c:set var="deliverySum" value="0" />
				<c:forEach items="${cartList}" var="cart">
				<c:if test = "${cart.id == user.id }">
			<tr>
				<td><a href = "deleteCart.do?cart_no=${cart.cart_no }">X</a>
				<td><img src="${cart.imgname }"></td>
				<td>
				<a href = "getMenu.do?menu_no=${cart.menu_no}">${cart.name }</a>
				</td>
				<td>${cart.price } 원
				</td>
				<td>
					<form action = "updateCart.do" method = "post">
					<input type = "hidden" name = "cart_no" value = "${cart.cart_no }">
					<input type = "number" name = "quantity" value ="${cart.quantity }"> 개<br><br>
					<input type = "submit" id = "updateQuantity" value ="[수정]">
					</form>
				</td>
				<td>
					${cart.quantity * cart.price } 원
					<input type = "hidden" id = "totalPrice" value = "${cart.quantity * cart.price }">
				</td>
			</tr>	
				<c:set var="priceSum" value="${priceSum + (cart.price * cart.quantity) }" />
				<c:set var="deliverySum" value="2500" />
				</c:if>
				</c:forEach>
			<tr>
				<td colspan="3">상품금액&emsp;<fmt:formatNumber value="${priceSum}" pattern="#,###" /> 원&emsp;+&emsp;배송비&emsp;<fmt:formatNumber value="${deliverySum }" pattern="#,###" /> 원</td>
				<td colspan="3">총 주문금액&emsp;<fmt:formatNumber value="${priceSum + deliverySum }" pattern ="#,###" /> 원</td>
			</tr>
			<tr>
				<td colspan = "6">
				<input type = "button" id = "deleteCart" value = "장바구니 비우기">
				<input type = "button" id="payment" value = "구매하기">
				</td>
			</tr>
		</table>
		<script>
		$(document).ready(function(){
			$('#updateQuantity').on('click', function(){
				alert('수량을 변경하였습니다 !');
			})
			$('#deleteCart').on('click', function(){
				alert('장바구니를 비웠습니다 !');
				location.href = 'deleteAll.do?id=' + $('#id').val();
			})
			$('#payment').on('click', function(){
				alert('구매하기 페이지로 이동합니다 !');
				location.href = 'payment.do'
			})
		})
		</script>
	</div>
	
	<div id = "orderInfo">
		"배달이 완료되면 내역이 사라집니다."
		<table class = "cartTable">
			<tr>
				<th class = "cart">주문 취소</th>
				<th class = "cart">주문 번호</th>
				<th class = "cart">주문 메뉴명</th>
				<th class = "cart">주문 수량</th>
				<th class = "cart">개당 가격 / 주문 금액</th>
				<th class = "cart">배송지</th>
				<th class = "cart">요청사항</th>
			</tr>
			<c:forEach items = "${paymentList }" var = "payment">
			<c:if test = "${payment.user_id == user.id }">
			<tr>
				<td><a href = "deletePayment.do?seq=${payment.seq }">X</a></td>
				<td>${payment.seq }</td>
				<td>${payment.name }</td>
				<td>${payment.quantity }</td>
				<td>${payment.price} / ${payment.price * payment.quantity }</td>
				<td>${payment.user_zipcode }<br>${payment.user_faddr }<br>${payment.user_laddr }</td>
				<td>${payment.user_message }</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	<script>
	$(document).ready(function(){
		$('#cartBtn').click(function(){
			$('#cartInfo').show("slow");
			$('#orderInfo').hide("slow");
		})
		$('#orderBtn').click(function(){
			$('#orderInfo').show("slow");
			$('#cartInfo').hide("slow");
		})
	})
	</script>
</div>
</section>

<%@ include file = "footer.jsp" %>