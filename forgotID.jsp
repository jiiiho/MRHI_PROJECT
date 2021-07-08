<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot ID</title>
<link rel = "stylesheet" href = "./resources/css/forgot.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<form method="post" class="form-signin" action="forgotID.do" name="findform">
<table>
   <tr>
      <td>
         <label for="name">이름</label>
         <input type="text" id="name" name="name" placeholder = "Input your NAME" autocomplete="off">
      </td>
   </tr>
   <tr>
      <td>
         <label for="tel">연락처</label>
         <input type="text" id="tel" name="tel" placeholder = "Input your TEL" autocomplete="off">
      </td>
   </tr>
   <tr>
      <td align = "center">
      <!-- 이름과 전화번호가 일치하지 않을 때-->
      <c:if test="${check == 1}">
         <script>
            opener.document.findform.name.value = "";
            opener.document.findform.tel.value = "";
         </script>
         <span style = "color:red;">일치하는 정보가 존재하지 않습니다.</span>
      </c:if>

      <!-- 이름과 비밀번호가 일치하지 않을 때 -->
      <c:if test="${check == 0 }">
         <span style = "color:green;">찾으시는 아이디는 '${id}' 입니다.</span>
      </c:if>
      </td>
   </tr>
   <tr>
      <td align = "center">
         <input type="submit" value="check">
         <c:if test="${check == 0 }">
            <input type = "button" value = "close" onclick="closethewindow()">
         </c:if>
      </td>
   </tr>
</table>
</form>
   
<script>
   function closethewindow(){
      window.open('','_self').close();
   }
   
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
</script>
</body>
</html>
