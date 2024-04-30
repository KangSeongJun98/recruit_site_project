<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/font.css">
<style>
th, td{
	text-align: center !important; 
}
</style>
</head>
<body>
	<!-- 탑 영역  -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
		<h2 class="tit_section" style="margin-bottom: 1em">게시판</h2>
			<table class="table table-hover">
				<thead >
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
				<!-- 데이터의 수만큼 반복되는 부분 -->
				<c:forEach items="${boardList}" var ="board">
					<tr>
						<td>${board.boardNo}</td>
						<td><a href='<c:url value="boardDetailView?boardNo=${board.boardNo }" />' >${board.boardTitle}</a></td>
						<td>${board.memNm}</td>
						<td>${board.boardDate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<a href='<c:url value="boardWriteView" />' >
				<button type="button" class="btn btn-primary">글쓰기</button>
			</a>
		</div>
	</section>
	
	<!-- footer 영역 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>