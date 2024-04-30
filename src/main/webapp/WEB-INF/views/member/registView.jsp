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
	<!-- top end -->

	<!-- content -->
	<div class="wrap_content">
		<div class="content">
			<div class="page_header">
				<h1 class="tit_page" id="h_page_header">회원가입</h1>
			</div>
			<main class="content">
				<div class="wrap_register join">
					<form action="<c:url value="/registDo" />" onsubmit="return form_check()">
						<fieldset>
							<div class="wrap_grid">
								<div class="row">
									<label for="mem_id" class="lbl_field">아이디</label> <span
										class="col_9"> <input type="text"
										class="inp_typo size_l" id="mem_id" name="memId"
										placeholder="아이디를 입력해주세요(4~15글자)" 
										pattern="[a-zA-Z가-힣0-9]{4,15}"
										required>

									</span> <span class="col_3">
										<button type="button" class="btn_l" id="loginCheck">
											<span>중복체크</span>
										</button>
									</span>
								</div>
								<div class="row">
									<label for="mem_nm" class="lbl_field">이름</label> <input
										type="text" id="mem_nm" name="memNm" class="inp_typo size_l"
										placeholder="이름을 입력해주세요" required>
								</div>
								<div class="row">
									<label for="password" class="lbl_field"> 비밀번호<span
										style="font-size: 12px; color: #5a82f0;">(최소 4자리 이상 15자리 이하 한글은 불가능합니다.)</span>
									</label> <input type="password" id="password" class="inp_typo size_l"
										placeholder="최소 4자리 이상 15자리 이하 한글은 불가능합니다."
										pattern="[a-zA-Z0-9]{4,15}"
										name="memPw">

								</div>
								<div class="row">
									<label for="typo_password_re" class="lbl_field">비밀번호 확인</label>
									<input type="password" id="typo_password_re"
										class="inp_typo size_l" placeholder="비밀번호를 한번 더 입력해주세요"
										name="pwCheck" value="">
								</div>
								<div class="row">
									<label for="mem_tel" class="lbl_field">연락처</label> <input
										type="text" id="mem_tel" name="memTel"
										class="inp_typo size_l" oninput="autoHyphen2(this)" maxlength="13"  placeholder="전화번호를 입력해주세요" required
										pattern="010-[0-9]{4}-[0-9]{4}">
								</div>

								<div class="row agree">
									<div class="row agree_detail">
										<strong>개인정보 수집 이용에 동의</strong>
										<ul>
											<li>① 수집 항목: 아이디, 비밀번호, 이름, 전화번호</li>
											<li>② 수집 이용목적 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용</li>
											<li>③ 보유 및 이용기간 : 제휴 시 서비스 이용 종료 까지</li>
											<li>④ 동의 거부시 서비스 이용 신청 불가</li>
										</ul>
										<span class="inp_chk"> <input type="checkbox"
											id="ck_agree"> <label class="lbl"
											for="ck_agree">위의 '개인정보 수집 이용'에 동의 합니다.</label>
										</span>
									</div>
								</div>
								<div class="row area_button">
									<button type="submit" id="login_check"
										class="btn_l type_primary">
										<span>신청하기</span>
									</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</main>
		</div>
	</div>
	<!-- content end  -->

	<!-- footer  -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
<script>
let login_check = false

// 아이디 체크 ajax
$(document).ready(function () {
	$("#loginCheck").click(function () {  
        let memId = $("#mem_id").val();
        $.ajax({
            url: '<c:url value="/loginCheck" />',
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ 
                memId: memId
            }),
            success: function (res) {
            	if(res=='false'){
            		login_check = true
            		alert("사용가능한 아이디입니다.")
            		 $("input[id=mem_id]").attr("readonly",true);
            		 $("#mem_id").css("background-color", "#d2d2d2");
            		 $("#mem_nm").focus()
          
            	}else if(res=='true'){
            		login_check == false
            		alert("이미 있는 아이디입니다.")
            	}
            },
            error: function (e) {
                console.log(e);
			}
		});
	});
});
	
	// 약관동의 중복체크
	form_check=()=> {
		var checked = $('#ck_agree').is(':checked');
			if(!checked){
			alert("개인정보 수집을 동의해주세요")
			 $('#ck_agree').focus();
		    return false;
		  } else{ 
			  if(login_check) return true;
			  else if(!login_check){
				  alert("아이디 중복을 체크해주세요")
				   $("#mem_id").focus()
				  return false;
			  }
			}
		}
	
	// 연락처 하이픈
	const autoHyphen2 = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
</script>
</body>
</html>
