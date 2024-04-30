<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>회원정보 수정</title>
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
	<!-- top end -->

	<!-- content -->
	<div>
		<div class="page_header" style="margin-top: 3%">
			<h1 class="tit_page" id="h_page_header" style="margin-bottom: 3%">회원정보
				수정</h1>
		</div>
		<main class="content">
			<div class="wrap_register" style="width: 50%;">
				<form id="mypageForm" method="get"
					action="<c:url value="/updateDo" />" onsubmit="return pw_check()">
					<input type="hidden" name="_csrf"
						value="4376bad5-56b6-44c1-8b22-aea96c39fc90"> <input
						type="hidden" name="userNo" value="1701">
					<fieldset>
						<legend class="blind">개발자 정보 수정</legend>
						<div class="wrap_grid">
							<div class="row">
								<input type="text" class="inp_typo size_l"
									value="${sessionScope.login.memId }"
									placeholder="email을 입력해주세요" disabled="disabled"> <input
									type="hidden" name="memId" value="${sessionScope.login.memId }">
							</div>
							<div class="row">
								<label for="name" class="lbl_field">이름</label> <input
									type="text" id="name" name="memNm" class="inp_typo size_l"
									value="${sessionScope.login.memNm }" placeholder="이름을 입력해주세요"
									required>
							</div>
							<div class="row">
								<label for="tel" class="lbl_field">전화번호</label> <input
									oninput="autoHyphen2(this)" maxlength="13"
									pattern="010-[0-9]{4}-[0-9]{4}" type="text" id="tel"
									name="memTel" class="inp_typo size_l"
									value="${sessionScope.login.memTel}" placeholder="전화번호를 입력해주세요"
									required="">
							</div>
							<div class="row">
								<label for="password" class="lbl_field">비밀번호 <span
									style="font-size: 12px; color: #5a82f0;">(최소 4자리 이상 15자리
										이하 한글은 불가능합니다.)</span></label> <input type="password" id="password"
									name="memPw" class="inp_typo size_l" placeholder="비밀번호를 입력해주세요"
									required>
							</div>
							<div class="row">
								<label for="password_re" class="lbl_field">비밀번호 확인</label> <input
									type="password" id="password_re" name="pwCheck"
									class="inp_typo size_l" placeholder="비밀번호를 한번 더 입력해주세요"
									required>
							</div>
							<div class="row area_button">
								<button type="button" class="btn_l type_primary" id="btn_submit">
									<span>수정완료</span>
								</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</main>
	</div>
	<!-- content end  -->

	<!-- footer  -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<script>
	// 약관동의 중복체크
	pw_check=()=> {
		let memPw = $('#password').val();
		let pwCheck = $('#password_re').val();
			if(memPw != pwCheck){
				alert("비밀번호를 다시 입력해주세요")
				 $('#memPw').focus();
			    return false;
		  	}else return true;  
		}
	
	// 연락처 하이픈
	const autoHyphen2 = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
	
	 $('#btn_submit').click(function() {
         if(pw_check()) {
             $('#mypageForm').submit();
         }
     });
</script>
</body>
</html>
