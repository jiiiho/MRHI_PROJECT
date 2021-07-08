<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file = "header.jsp" %>

<%@ include file = "nav.jsp" %>


<!-- SECTION -->
<section>
	<div class = "notice">
		<div class = "noticeImg"></div>

		<div class = "whitelines"></div>
		<div class = "title">공지사항</div>

		<!-- 검색 기능 구현 -->
		<%-- <form action = "searchNotice.do" method = "post">
			<table id = "search">
				<tr>
					<td align = "center">
						<select name = "searchCondition">
						<c:forEach items = "${conditionMap }" var = "option">
							<option value = "${option.value }">${option.key }</option>
						</c:forEach>
						</select>
						<input name = "searchKeyword" type = "text">
						<input type = "submit" value = "검색">
					</td>
				</tr>
			</table>
		</form> --%>
			
		<div id="NoticeSection">
		 	<ul id="noticelist">
		 	<c:forEach items = "${boardList }" var="board" varStatus="status">
		 		<li id = "list${board.seq }" >
		 			<p id = "noticeTitle"><a href = "getBoard.do?seq=${board.seq }">${board.title }</a></p>
		 			
		 			<p class = "date"><fmt:formatDate value = "${board.regDate }" pattern = "yyyy-MM-dd" /></p>
		 		</li>
		 	</c:forEach>
		 	</ul>
		 	
		 	<div class = "noticeBtn">
		 		<c:choose>
		 			<c:when test = "${user.id eq 'admin' }">
		 				<input type = "button" id = "button" value = "새 글 등록">
		 			</c:when>
		 			<c:otherwise>
		 			</c:otherwise>
		 		</c:choose>
		 	</div>
		 	
		 	<script>
		 	$(document).ready(function(){
		 		$('#button').on('click', function(){
		 			window.location.href = 'insertBoard.jsp';
		 		})
		 	})
		 	</script>
		 	
		</div>
		
		<div class = "paging" style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/BoardWeb/notice.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;&emsp;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>&emsp;
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/BoardWeb/notice.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>&emsp;
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/BoardWeb/notice.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
		</div>
		
	</div>
	
</section>

<%@ include file = "footer.jsp" %>