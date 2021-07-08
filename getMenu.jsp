<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

<!-- SECTION -->
<section>
<div class = "getMenuPage">
   <div class = "EventImg"></div>
   
   <div class = "whitelines"></div>      
   <div class = "title">상세페이지</div>

   <!-- 장바구니  -->
   <c:choose>
   <c:when test = "${user.id ne 'admin' }">
   <form action = "insertCart.do" method = "post">
   </c:when>
   <c:when test = "${user.id eq 'admin' }">
   <form action = "updateMenu.do" method = "post">
   </c:when>
   </c:choose>
   <a href="javascript:history.back();" id="lt">&lt;&emsp;이전 페이지</a>
   <c:if test = "${user.id ne 'admin' }">
   <input type = "hidden" id = "id" name = "id" value = "${user.id }">
   </c:if>
   <input type = "hidden" id = "pageInfo" name = "pageInfo" value = "menuPage">
   <input type = "hidden" id = "menu_no" name = "menu_no" value = "${menu.menu_no }">
   <ul>
      <li>
         <img src= "${menu.imgname }">
         <input type = "hidden" name = "imgname" value = "${menu.imgname }">
      </li>
      
      <li>
         <table>
            <tr>
               <td>
               <c:if test = "${user.id eq 'admin' }">
                  <input type = "text" id = "name" name = "name" value = "${menu.name }">
               </c:if>
               <c:if test = "${user.id ne 'admin' }">
                  <input type = "text" id = "name" name = "name" value = "${menu.name }" readonly>
               </c:if>
               </td>
            </tr>
            <tr>
               <td>
               <c:if test = "${user.id eq 'admin' }">
                  <textarea name = "info">${menu.info }</textarea>
               </c:if>
               <c:if test = "${user.id ne 'admin' }">
                  <textarea name = "info" readonly>${menu.info }</textarea>
               </c:if>
               </td>
            </tr>
            <tr>
               <td>
               <c:if test = "${user.id eq 'admin' }">
                  <input type = "number" name = "price" value = "${menu.price }"> 원
               </c:if>
               <c:if test = "${user.id ne 'admin' }">
               <input type = "number" name = "price" value = "${menu.price }" readonly> 원
               </c:if>
               </td>
            </tr>
            <tr>
               <td>
               <c:if test = "${user.id ne 'admin' }">
                  <input type = "number" name = "quantity" value = "1"> 개
               </c:if>
               </td>
            </tr>
            <tr>
               <td align = "center">
               <c:choose>
                  <c:when test = "${user.id ne 'admin' }">
                     <input type = "submit" id = "cart" value = "장바구니">&emsp;
                     <input type = "button" id = "buy" value = "구매하기">
                  </c:when>
                  <c:when test = "${user.id eq 'admin' }">
                     <input type = "submit" id = "update" value = "정보 수정">&emsp;
                     <input type = "button" id = "delete" value = "메뉴 삭제">
                  </c:when>
               </c:choose>
               </td>
            </tr>
         </table>
   
         <script>
         $(document).ready(function(){
            $('#cart').on('click', function(event){
               if($('#id').val() == ""){
                  alert('로그인이 필요합니다 !');
                  location.href = "login.jsp";
                  event.preventDefault();
               }
               else{
                  alert('장바구니에 담았습니다 !');
               }
            });
            
            $('#buy').on('click', function(){
               if($('#id').val() == ""){
                  alert('로그인이 필요합니다 !');
                  location.href = "login.jsp";
               }
               else{
                  alert('구매페이지로 이동합니다 !');
                  buy();
               }
            }); 
            
            var menu_no_val = $('input[name=menu_no]').val();
            
            $('#delete').on('click', function(){
               location.href = 'deleteMenu.do?menu_no=' + menu_no_val;
            });
         })
         
         function buy() {
            var pageInfo = $("input[name=pageInfo]").val();
            var menu_no = $("input[name=menu_no]").val();
            var id = $("input[name=id]").val();
            var name = $("input[name=name]").val();
            var imgname = $("input[name=imgname]").val();
            var info = $("textarea[name=info]").val();
            var price = $("input[name=price]").val();
            var quantity = $("input[name=quantity]").val();

            jQuery.ajaxSettings.traditional = true;
            
             $.ajax({
               type : "POST", 
               url : "insertCart.do",
               datatype : "json",
               data : {
                  "pageInfo" : pageInfo,
                  "menu_no" : menu_no,
                  "id" : id,
                  "name" : name,
                  "imgname" : imgname,
                  "info" : info,
                  "price" : price,
                  "quantity" : quantity
               }, success : function(data) { window.location.href = "payment.do"; },
                  error : function(xhr, status, error) { alert('ERROR !!'); }
               });
               console.log(menu_no);
            };
         </script>
      </li>
   </ul>
   </form>
</div>   
</section>

<%@ include file = "footer.jsp" %>