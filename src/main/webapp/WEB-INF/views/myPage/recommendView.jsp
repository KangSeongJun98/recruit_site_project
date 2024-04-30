<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>채용 정보</title>
<link rel="stylesheet" href="resources/css/rec.css">
<link rel="stylesheet" href="resources/css/font.css">
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="resources/js/top.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/table.css">
</head>
<c:if test="${not empty msg}">
	<script>
		alert("${msg}")
	</script>
</c:if>
<body class="api_body no_lnb main">

	<div class="wrap_content" style="margin-top: 0px">
		<main class="content">
			<!-- 스크랩 뷰 -->
			<h2 class="tit_section" style="margin-top: 0px">${sessionScope.login.memId}님 맞춤 공고</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th>회사명</th>
						<th>산업군</th>
						<th>회사위치</th>
						<th>직무</th>
						<th>학력</th>
						<th>연봉</th>
						<th>게시일</th>
						<th>마감일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recommendList}" var="recommend">
						<tr>
							<td><a href="${recommend.recruitmentUrl}" target='_blank'>
									${recommend.recruitmentTitle}</a></td>
							<td>${recommend.companyNm}</td>
							<td>${recommend.industryName}</td>
							<td>${recommend.companyLocation}</td>
							<td>${recommend.jobMidCode}</td>
							<td>${recommend.educationLevel}</td>
							<td>${recommend.salary}</td>
							<td>${recommend.postingDate}</td>
							<td>${recommend.expirationDate}</td>
							<td style="display: none;" class="recruitment_no">${recommend.recruitmentNo}</td>
							<!-- 삭제버튼  -->
							<c:if test="${fn:contains(clippingList, recommend.recruitmentNo)}">
								<td><img class="del_clipping"
									src="resources/img/bookmark_on.png"></td>
							</c:if>

							<!-- 스크랩 안 된 정보는 off으로 표시  -->
							<c:if test="${!fn:contains(clippingList, recommend.recruitmentNo)}">
								<td><img class="get_clipping"
									src="resources/img/bookmark_off.png"></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<script>
	$(document).ready(function () {
		// 스크랩 공고 클릭
		$(".get_clipping").click(function() {
			let el = $(this).closest('tr'); // 클릭된 클리핑 아이콘이 포함된 행(tr)을 가져옴
			let recruitmentNo = el.find('.recruitment_no').text().trim(); // 해당 행의 제목 정보를 가져옴
			$.ajax({
				url : '<c:url value="/clippingDo" />',
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify({
					memId : "${sessionScope.login.memId}",
					recruitmentNo : recruitmentNo,
				}),
				success : function(res) {
					if (res == 'Y') {
						// 스크랩 성공 시
						alert("스크랩됐습니다.");
						location.reload();
					} else if (res == 'N') {
						// 이미 스크랩된 경우
						alert("스크랩한 공고입니다.");
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
		
		$(".del_clipping").click(function () {         
	    	if(confirm("삭제하시겠습니까?")){
	    		let el = $(this).closest('tr'); // 클릭된 클리핑 아이콘이 포함된 행(tr)을 가져옴
		        let recruitmentNo = el.find('.recruitment_no').text().trim(); // 해당 행의 제목 정보를 가져옴
	        $.ajax({
	            url: '<c:url value="/clippingDel" />',
	            type: "POST",
	            contentType: "application/json",
	            data: JSON.stringify({ 
	                memId: "${sessionScope.login.memId}",
	                recruitmentNo: recruitmentNo,
	            }),
	            success: function (res) {
	            	if(res == 'Y'){
	            		el.find('.dle_clipping').removeClass('fa-star').
	            		removeClass('dle_clipping').addClass('get_clipping').addClass('fa-star-o'); 
	            		location.reload();
	            		alert("삭제하였습니다.");
	            	}else if(res =='N'){
	            		alert("스크랩되지 않은 공고입니다.")
	            	}
	               
	            },
	            error: function (e) {
	                console.log(e);
					}
				});
	    	}
	    });
	});
	</script>
</body>
</html>
