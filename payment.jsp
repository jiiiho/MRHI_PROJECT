<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="./resources/js/signup.js"></script>

<%@ include file="header.jsp"%>

<%@ include file="nav.jsp"%>

<!-- SECTION -->
<section>
	<div id="paymentPage">
		<div class="cartPageImg"></div>

		<div class="whitelines"></div>
		<c:if test = "${user.id ne 'admin' }">
			<div class="title">구매페이지</div>
		</c:if>
		<c:if test = "${user.id eq 'admin' }">
			<div class="title">주문내역</div>
		</c:if>

		<div id="container">
		
		<!-- 구매 확인 -->
<!-- 	<form name = 'insertPayment.do' method = "post"> -->
		
		<c:if test = "${user.id ne 'admin' }">
		<!-- 장바구니 정보 -->
		<table class="cartTable">
			<tr>
				<td colspan = "6" align = "center"><b style = "font-size:20px;">구매품목</b></td>
			</tr>
			<tr>
				<th class="cart">취소</th>
				<th class="cart">이미지</th>
				<th class="cart">상품정보</th>
				<th class="cart">단가</th>
				<th class="cart">수량</th>
				<th class="cart">주문 금액</th>
			</tr>
			<c:set var="priceSum" value="0" />
			<c:set var="deliverySum" value="0" />
			<c:forEach items="${cartList}" var="cart">
				<input type = "hidden" name = "cart_no" value = "${cart.cart_no }">
				<input type = "hidden" name = "menu_no" value = "${cart.menu_no }">
				<input type = "hidden" name = "user_id" value = "${user.id }">
				<c:if test="${cart.id == user.id }">
					<tr>
						<td><a href="deletePaymentCart.do?cart_no=${cart.cart_no }">X</a>
						<td>
							<img src="${cart.imgname }">
							<input type="hidden" name="chkbox">
						</td>
						<td style = "display:none;">${cart.cart_no }</td>
						<td style = "display:none;">${cart.menu_no }</td>
						<td>
							<a href="getMenu.do?menu_no=${cart.menu_no}">${cart.name }</a>
						</td>
						<td>${cart.price } 원</td>
						<td>${cart.quantity }</td>
						<td>${cart.quantity * cart.price } 원</td>
					</tr>
				<c:set var="priceSum" value="${priceSum + (cart.price * cart.quantity) }" />
				<c:set var="deliverySum" value="2500" />
				</c:if>
			</c:forEach>
		</table>
		
		<!-- 주문자 정보 -->
		<table id="orderUserInfo">
			<tr>
				<td colspan = "2" align = "center"><b style = "font-size:20px;">주문자 정보</b></td>
			</tr>
			<tr>
				<th>주문자 명</th>
				<td>${user.name }
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${user.zipcode }<br>${user.faddr }<br>${user.laddr }
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${user.tel }
				</td>
			</tr>
		</table>
	
		<!-- 배송지 정보 -->
		<table id="deliveryInfo">
			<tr>
				<td colspan = "2" align = "center"><b style = "font-size:20px;">배송지 정보</b></td>
			</tr>
			<tr>
				<th>배송지 선택</th>
				<td>
					<input type="radio" name = "choice" id="sameaddr" checked>&emsp;주문자 정보 동일&emsp;
					<input type="radio" name = "choice" id="newaddr">&emsp;새로운 배송지
				</td>
			</tr>
			<tr>
				<th>받는 사람</th>
				<td>
					<input type="text" name="user_name" id = "name" placeholder="받는 사람" value = "${user.name }">
					<input type="hidden" id="hidden_name" value = "${user.name }">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type = "text" name = "user_zipcode" id = "zipcode" placeholder = "zipcode" value = "${user.zipcode }" readonly>
					<input type = "hidden" id = "hidden_zipcode" value = "${user.zipcode }">
					<input type="button" onclick="searchPost()" value="Search"><br>
					<input type = "text" name = "user_faddr" id = "faddr" placeholder = "faddr" value = "${user.faddr }">
					<input type = "hidden" id = "hidden_faddr" value = "${user.faddr }" readonly><br>
					<input type = "text" name = "user_laddr" id = "laddr" placeholder = "laddr" value = "${user.laddr }">
					<input type = "hidden" id = "hidden_laddr" value = "${user.laddr }">
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="text" name="user_tel" id = "tel" placeholder="010-0000-0000" value="${user.tel}">
					<input type="hidden" id = "hidden_tel" value="${user.tel}">
				</td>
			</tr>
			<tr>
				<th>배송 메세지</th>
				<td><textarea name = "user_message" rows="3" cols="60" maxlength="10" placeholder="배송시 요청메시지 입력(10자 내)"></textarea></td>
			</tr>
		</table>

		<!-- 결제 예정 금액 -->
		<c:set var="total" value="${priceSum + deliverySum }" />
		<c:set var="discountSum" value="0" />
		<table id="priceInfo">
			<tr>
				<td colspan = "3" align = "center"><b style = "font-size:20px;">결제 예정 금액</b></td>
			</tr>
			<tr>
				<th>총 주문 금액</th>
				<th>총 할인 금액</th>
				<th>총 구매 예정 금액</th>
			</tr>
			<tr>
				<td align = "center">
					<fmt:formatNumber value="${total}" pattern="#,###" /> 원</td>
				<td align = "center">
					<fmt:formatNumber value="${discountSum}" pattern="#,###" /> 원</td>
				<td align = "center">
					<fmt:formatNumber value="${total - discountSum}" pattern="#,###" /> 원</td>
			</tr>
		</table>
		
		<!-- 약관 동의 -->
		<table id="signInfo">
			<tr>
				<td align = "center"><b style = "font-size:20px;">약관 동의</b></td>
			</tr>
			<tr>
				<td>
				<textarea id="texta" rows="10" cols="120" readonly>
인터넷 쇼핑몰 『 사이버 몰』회원 약관
제1조(목적)
이 약관은  회사(전자상거래 사업자)가 운영하는  사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)
① “몰”이란  회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
				</textarea><br><br>
				<input type="checkbox" name="chk" id="chk1" />&emsp;쇼핑몰 이용약관
				</td>
			</tr>
			<tr>
				<td>
				<textarea id="texta" rows="10" cols="120" readonly>
1. 개인정보 수집목적 및 이용목적 : 비회원 구매 서비스 제공
2. 수집하는 개인정보 항목- 주문 시, 성명, 주소, 전화번호, 이메일, 결제정보, 비회원 결제 비밀번호- 취소/교환/반품 신청 시, 환불계좌정보(은행명, 계좌번호, 예금주)
3. 개인정보의 보유기간 및 이용기간원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
	
가. 회사 내부 방침에 의한 정보 보유 사유·부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년
나. 관련 법령에 의한 정보보유 사유
		
o 계약 또는 청약철회 등에 관한 기록
	-보존이유 : 전자상거래등에서의소비자보호에관한법률
	-보존기간 : 5년
	
o 대금 결제 및 재화 등의 공급에 관한 기록
	-보존이유: 전자상거래등에서의소비자보호에관한법률
	-보존기간 : 5년
	
o 소비자 불만 또는 분쟁처리에 관한 기록
	-보존이유 : 전자상거래등에서의소비자보호에관한법률
	-보존기간 : 3년
	
o 로그 기록
	-보존이유: 통신비밀보호법
	-보존기간 : 3개월

※ 동의를 거부할 수 있으나 거부시 비회원 구매 서비스 이용이 불가능합니다.
				</textarea><br><br>
				<input type="checkbox" name="chk" id="chk2" />&emsp;구매시 개인정보수집이용 동의
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" name = "chk" id="checkAll" />&emsp;쇼핑몰 이용약관, 비회원 구매시 개인정보수집이용 동의에 모두 동의합니다.</td>
			</tr>	
		</table>

		<!-- 신용카드 정보 -->
		<table id="creditInfo">
			<tr>
				<td colspan = "2" align = "center"><b style = "font-size:20px;">결제</b></td>
			</tr>
			<tr>
				<th>결제 수단</th>
				<td>
					<input type="radio" name="chk_info" value="card" checked>&emsp;카드 결제 &emsp;
					<input type="radio" name="chk_info" value="transfer" />&emsp;계좌 이체&emsp;
					<input type="radio" name="chk_info" value="deposit"/>&emsp;무통장 입금
				</td>
			</tr>
			<tr>
				<th>카드 정보</th>
				<td>
					<input type="text" id = "credit" name = "credit" placeholder = "0000-0000-0000-0000">
				</td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<td>
				상품금액&emsp;<fmt:formatNumber value="${priceSum}" pattern="#,###" /> 원&emsp;+&emsp;
				배송비&emsp;<fmt:formatNumber value="${deliverySum }" pattern="#,###" /> 원&emsp;=&emsp;
				총 주문금액&emsp;<fmt:formatNumber value="${priceSum + deliverySum }" pattern="#,###" /> 원
				<input type = "hidden" name = "totalPrice" value = "${priceSum + deliverySum }">
				</td>
 			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<input type="button" value="결제 하기" onclick = "termChk();"/>
				</td>
			</tr>
		</table>
		</c:if>
		<c:if test = "${user.id eq 'admin' }">
		<table class = "cartTable">
			<tr>
				<th class = "cart">주문 완료</th>
				<th class = "cart">주문 번호</th>
				<th class = "cart">주문 고객명 / 연락처</th>
				<th class = "cart">주문 메뉴명</th>
				<th class = "cart">주문 수량</th>
				<th class = "cart">개당 가격 / 주문 금액</th>
				<th class = "cart">배송지</th>
				<th class = "cart">요청사항</th>
			</tr>
			<c:forEach items = "${paymentList }" var = "payment">
			<tr>
				<td><a href = "deletePayment.do?seq=${payment.seq }">X</a>
				<td>${payment.seq }</td>
				<td>${payment.user_name }<br><br>${payment.user_tel}</td>
				<td>${payment.name }</td>
				<td>${payment.quantity }</td>
				<td>${payment.price} / ${payment.price * payment.quantity }</td>
				<td>${payment.user_zipcode }<br>${payment.user_faddr }<br>${payment.user_laddr }</td>
				<td>${payment.user_message }</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
<!-- 		</form> -->
		</div>
		
		<script>
			$(document).ready(function() { // 최상단 체크박스 클릭
				$("#checkAll").click(function() { // 클릭
					if ($("#checkAll").prop("checked")) { // input tag name="chk" checked=true
						$("input[name=chk]").prop("checked", true);
					} else {
						$("input[name=chk]").prop("checked", false);
						}
				})
				
				$("input[name=chk]").click(function() {
					if ($("input[name=chk]").length == $("input[name=chk]:checkbox:checked").length) {
						$("#checkAll").prop("checked", true);
					} else {
						$("#checkAll").prop("checked", false);
					}
				})
				
				var name = $('#hidden_name').val();
				var zipcode = $('#hidden_zipcode').val();
				var faddr = $('#hidden_faddr').val();
				var laddr = $('#hidden_laddr').val();
				var tel = $('#hidden_tel').val();
				
				$('input[name=choice]').on('click', function(){
					if($('#newaddr').is(':checked')){
						$('#name').val("");
						$('#zipcode').val("");
						$('#faddr').val("");
						$('#laddr').val("");
						$('#tel').val("");
					}
					if($('#sameaddr').is(':checked')){
						$('#name').val(name);
						$('#zipcode').val(zipcode);
						$('#faddr').val(faddr);
						$('#laddr').val(laddr);
						$('#tel').val(tel);
					}
				})
				
				$('#submit').on('click',function(event){
					if(!$('#chk1').is(':checked') || !$('#chk2').is(':checked')){
						event.preventDefault();
						alert('약관에 동의하셔야합니다 !');
						
						if(!$('#chk1').is(':checked')){
							$('#chk1').focus();
						}
						if(!$('#chk2').is(':checked')){
							$('#chk2').focus();
						}
					}
				})
			});	
				
			// 연락처 자릿수 및 자동 '-' 생성
			$(function(){
			    $("#tel").on('keydown', function(e){
			       // 숫자만 입력받기
			        var trans_num = $(this).val().replace(/-/gi,'');
					var k = e.keyCode;
							
					if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
					{
			  	   	 	e.preventDefault();
					}
			    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
			        if($(this).val() == '') return;
				        // 기존 번호에서 - 를 삭제합니다.
			        var trans_num = $(this).val().replace(/-/gi,'');
			      
			        // 입력값이 있을때만 실행합니다.
			        if(trans_num != null && trans_num != '')
			        {
			            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
			            if(trans_num.length==11 || trans_num.length==10) 
			            {   
			                // 유효성 체크
			                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			                if(regExp_ctn.test(trans_num))
			                {
			                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
			                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
			                    $(this).val(trans_num);
			                }
			                else
			                {
			                    alert("유효하지 않은 전화번호 입니다.");
			                    $(this).val("");
			                    $(this).focus();
			                }
			            }
			            else 
			            {
			                alert("유효하지 않은 전화번호 입니다.");
			                $(this).val("");
			                $(this).focus();
			            }
					}
				});  
			});
			
			// 카드번호 12자리 '-' 자동 생성
			$(function(){
			    $("#credit").on('keydown', function(e){
			       // 숫자만 입력받기
			        var trans_num = $(this).val().replace(/-/gi,'');
					var k = e.keyCode;
							
					if(trans_num.length >= 19 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
					{
			  	   	 	e.preventDefault();
					}
			    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
			        if($(this).val() == '') return;
				        // 기존 번호에서 - 를 삭제합니다.
			        var trans_num = $(this).val().replace(/-/gi,'');
			      
			        // 입력값이 있을때만 실행합니다.
			        if(trans_num != null && trans_num != '')
			        {
			            // 총 카드번호 자리수는 16글자이거나, 19자여야 합니다.
			            if(trans_num.length==16 || trans_num.length==19) 
			            {   
			                // 유효성 체크
			                var regExp_ctn = /^([0-9]{4})([0-9]{4})([0-9]{4})([0-9]{4})$/;
			                if(regExp_ctn.test(trans_num))
			                {
			                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
			                    trans_num = trans_num.replace(/^([0-9]{4})([0-9]{4})([0-9]{4})([0-9]{4})$/, "$1-$2-$3-$4");                  
			                    $(this).val(trans_num);
			                }
			                else
			                {
			                    alert("유효하지 않은 카드번호 입니다.");
			                    $(this).val("");
			                    $(this).focus();
			                }
			            }
			            else 
			            {
			                alert("유효하지 않은 카드번호 입니다.");
			                $(this).val("");
			                $(this).focus();
			            }
					}
				});  
			});
			
			function termChk() {
				var chk1 = $("#chk1").is(":checked");
				var chk2 = $("#chk2").is(":checked");
				
				var user_id = $("input[name=user_id]").val();
				var user_name = $("input[name=user_name]").val();
				var user_zipcode = $("input[name=user_zipcode]").val();
				var user_faddr = $("input[name=user_faddr]").val();
				var user_laddr = $("input[name=user_laddr]").val();
				var user_tel = $("input[name=user_tel]").val();
				var user_message = $("textarea[name=user_message]").val();
				var chk_info = $("input[name=chk_info]").val();
				var credit = $('input[name=credit]').val();
				var totalPrice = $("input[name=totalPrice]").val();
				
				var menu_list = [];
				
				var chkbox = $("input[name=chkbox]");
				jQuery.ajaxSettings.traditional = true;
				
				if (chk1 == true && chk2 == true && $("#credit").val() != "") {
 					swal({
						icon : "info", 
						text : "결제를 진행 하시겠습니까?", 
						closeOnClickOutside : false, 
						closeOnEsc : false, 
						buttons : [ "취소", "결제" ],
					}).then(function(isConfirm) {
						if (isConfirm) {
							swal("결제 성공", "결제를 완료했습니다.", "success").then(function(isConfirm) {
								chkbox.each(function(i) {
									var tr = chkbox.parent().parent().eq(i).children();
									var cart_no = tr.eq(2).text();	// cart_no
									var menu_no = tr.eq(3).text();	// menu_no
									var quantity = tr.eq(6).text();	// quantity
									menu_list.push(cart_no);
									menu_list.push(menu_no);
									menu_list.push(quantity);
								});
								$.ajax({
									type : "POST", 
									url : "insertPayment.do",
									datatype : "json",
									data : {
										"menu_list" : menu_list,
										"user_id" : user_id,
										"user_name" : user_name,
										"user_zipcode" : user_zipcode,
										"user_faddr" : user_faddr,
										"user_laddr" : user_laddr,
										"user_tel" : user_tel,
										"user_message" : user_message,
										"chk_info" : chk_info,
										"credit" : credit,
										"totalPrice" : totalPrice
									}, success : function(data) { window.location.href = "deleteAll.do"; },
									error : function(xhr, status, error) { alert('ERROR !!'); }
								});
								console.log(menu_list);
							});
						}
					});
				} else if (chk1 == false || chk2 == false) {
					swal("", "약관에 동의해야 합니다.", "info");
				} else {
					swal("", "카드번호를 입력해주세요.", "info");
				}
			}
		</script>
	</div>
</section>

<%@ include file="footer.jsp"%>