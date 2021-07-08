<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot PW</title>
<link rel = "stylesheet" href = "./resources/css/forgot.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<form method="post" action="forgotPW.do" name="findform">
<table>
   <c:if test="${check != 0}">
   <tr>
      <td>
         <label for="id">아이디</label>
         <input type="text" id="id" name="id" placeholder = "Input your ID" autocomplete="off">
      </td>
   </tr>
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
   </c:if>
   <tr>
      <td>
      <!-- 정보가 일치하지 않을 때-->
      <c:if test="${check == 1}">
         <script>
            opener.document.findform.id.value = "";
            opener.document.findform.name.value = "";
            opener.document.findform.tel.value = "";
         </script>
         <span style = "color:red;">일치하는 정보가 존재하지 않습니다.</span>
      </c:if>

      <!-- 정보가 일치할 때-->
      <c:if test="${check == 0 }">
         <script>
            alert("비밀번호 변경 페이지로 이동합니다 !");
         </script>
      </c:if>
      </td>
   </tr>
   <c:if test="${check == 0 }">
   <tr>
      <td>
         <label for="password">비밀번호</label>
         <input type="hidden" id="id" name="updateid" value="${updateid }">
         <input type="password" id="password" name="password" placeholder = "Input your PASSWORD" autocomplete="off">
      </td>
   </tr>
   <tr>
      <td>
         <label for="confirmpassword">비밀번호 재확인</label>
         <input type="password" id="confirmpassword" name="confirmpwd" placeholder = "Confirm your PASSWORD" autocomplete="off">
      </td>
   </tr>
   <tr>
      <td align = "center">
         <p id = "check"></p>
      </td>
   </tr>
   </c:if>
   <tr>
      <td align = "center">
         <c:if test="${check != 0}">
            <input type="submit" value="check">
         </c:if>
         <c:if test="${check == 0 }">
            <input type="button" value="confirm" onclick="updatePassword()">
         </c:if>
      </td>
   </tr>
</table>
</form>
   
<script>
   $(document).ready(function(){
      $('input[type=password]').keyup(function(){
         var p1 = $('#password').val();
         var p2 = $('#confirmpassword').val();
         
         if(p1 == p2){
            $('#check').html("<span style = 'color:green;'>비밀번호가 일치합니다</span>");
         }else{
            $('#check').html("<span style = 'color:red;'>비밀번호가 일치하지 않습니다</span>");
         }
      })
   
   })

   function updatePassword(){
      document.findform.action="updatePassword.do";
      alert('비밀번호가 변경되었습니다. 로그인을 해주세요 !')
      document.findform.submit();
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
