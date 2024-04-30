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
</head>
<c:if test="${not empty msg}">
	<script>
		alert("${msg}")
	</script>
</c:if>
<body class="api_body no_lnb main">
	<!-- top  -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<div class="wrap_content">
		<main class="content">
			<!-- 스크랩 뷰 -->
				<h2 class="tit_section">${login.memId }님의 관심 공고</h2>
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
					<c:forEach items="${clippingList}" var="clipping">
						<tr>
							<td><a href="${clipping.recruitmentUrl}" target='_blank'>
							${clipping.recruitmentTitle}</a></td>
							<td>${clipping.companyNm}</td>
							<td>${clipping.industryName}</td>
							<td>${clipping.companyLocation}</td>
							<td>${clipping.jobMidCode}</td>
							<td>${clipping.educationLevel}</td>
							<td>${clipping.salary}</td>
							<td>${clipping.postingDate}</td>
							<td>${clipping.expirationDate}</td>
							<!-- 삭제버튼  -->
							<td><img class="del_clipping" src="resources/img/del.png"
							style="width: 4em"></td>
							<td style="display: none" class="recruitment_no">${clipping.recruitmentNo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</div>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<script>	
	 // 스크랩 삭제 클릭
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
	            		alert("스크랩되지 않은 뉴스입니다.")
	            	}
	               
	            },
	            error: function (e) {
	                console.log(e);
					}
				});
	    	}
	    });
</script>
</body>
</html>
