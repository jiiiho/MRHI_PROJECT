<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "./resources/js/signup.js"></script>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>

    
<!-- SECTION -->
<section>
<div id="myPage">
   <div class = "myPageImg"></div>

   <div class = "whitelines"></div>
   <div class = "title">&ensp;&ensp;&ensp;페이지<br>&ensp;마이</div>
      
	<div id="userInfo">
	<form action = "updateUser.do" method = "post">
		<table>
			<tr>
				<td>
				<label for = "id">아이디</label>
				<input type = "text" name = "id" value = "${user.id }" autocomplete="off" readonly></td>
			</tr>
            <tr>   
              	<td>
				<label for = "password">비밀번호</label>
				<input type = "password" id = "password" placeholder = "Input your PASSWORD" name = "password" autocomplete="off"></td>
            </tr>
            <tr>
				<td>
				<label for = "passwordchk">비밀번호 확인</label>
				<input type = "password" id = "passwordchk" placeholder = "Check your PASSWORD" autocomplete="off"></td>
            </tr>
            <tr>
				<td><p id = "check"></td>
            </tr>
            <tr>
				<td>
				<label for = "name">이름</label>
				<input type = "text" name = "name" value = "${user.name }" autocomplete="off"></td>
            </tr>
            <tr>
				<td>
				<label for = "tel">전화</label>
				<input type = "text" name = "tel" value = "${user.tel }">
				</td>
            </tr>
            <tr>
				<td>
				<label for = "e_id">이메일</label><br>
				<input type = "text" name = "e_id" value="${user.e_id }"> @ <input type = "text" name = "e_domain" id = "e_domain" value="${user.e_domain }">
				</td>
            </tr>
            <tr>
				<td>
				<label for = "gender">성별</label>
				<input type = "text" name = "gender" value = "${user.gender }" readonly></td>
            </tr>
            <tr>
				<td>
				<label for = "faddr">주소</label>
				<input type="text" name="zipcode" id="zipcode" class="zipcode" value = "${user.zipcode }" readonly size="10">
				<input type="button" onclick="searchPost()" value="Search"><br><br>
				<input type="text" name="faddr" id="faddr" class="input" size="60" value = "${user.faddr }" readonly>
				</td>
            </tr>
            <tr>
				<td>
				<input type="text" name="laddr" id="laddr" class="input" size="60" value = "${user.laddr }">
				</td>
            </tr>
            <tr>
				<td align = "center"><input type = "submit" id = "submit" value = "Update Info"></td>
            </tr>
            <tr>
            	<td align = "center"><a id = "delete" href = "deleteUser.do?id=${user.id }">Delete Account</a></td>
            </tr>
		</table>
	</form>	
	</div>
         
	<script>
	$(document).ready(function(){
		$('input[type=password]').keyup(function(){
			var p1 = $('#password').val();
			var p2 = $('#passwordchk').val();

            if(p1 == p2){
    			$('#check').html("<span style = 'color:green;'>비밀번호가 일치합니다</span>");
    		}else{
    			$('#check').html("<span style = 'color:red;'>비밀번호가 일치하지 않습니다</span>");
    		}
		});
		
		$('#submit').on('click', function(event){
			alert('회원정보가 수정되었습니다 !');
		});
		
		$('#delete').on('click', function(){
			alert('정상적으로 탈퇴 되었습니다 !');
		})
	})
	</script>
</div>
</section>

<%@ include file = "footer.jsp" %>