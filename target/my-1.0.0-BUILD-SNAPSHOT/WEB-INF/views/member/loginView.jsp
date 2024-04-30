<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>채용 정보</title>
<link rel="stylesheet" href="resources/css/login.css">
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
			<!-- 아이디 폼 -->
			<div class="form-box">
				<div class="header-text">Login Form</div>
				<form action="<c:url value="/loginDo" />">
				<input placeholder="Your Email Address" type="text" name="memId"
				value="${cookie.rememberId.value }"> 
				<input placeholder="Your Password" type="password" name="memPw"> 
				<input id="check" name="remember" type="checkbox"
				${cookie.rememberId.value == null ? "" : "checked"}> 
				<label for="check"></label><span>아아디기억하기</span>
				<button>login</button>
				</form>
			</div>
		</main>
	</div>
	
	
	<!-- footer  -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>
