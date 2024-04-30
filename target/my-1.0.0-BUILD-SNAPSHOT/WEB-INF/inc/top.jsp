<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/table.css">

<header class="wrap_header">
	<div class="header">
		<div class="bi">
			<a href="<c:url value="/" />" id="saramin_logo"></a>
		</div>
		<nav>
			<ul id="gnb" class="gnb">
				<li><a href="<c:url value="/" />">채용정보</a></li>
				<li><a href="<c:url value="/boardView" />">게시판</a>
					<div id="submenu_guide2" class="submenu">
						<div class="submenu_unit">
							<strong>게시판</strong>
							<ul>
								<li><a href="<c:url value="/boardView" />">전체보기</a></li>
								<li><a href="<c:url value="/boardWriteView" />">글쓰기</a></li>
							</ul>
						</div>
					</div>
				</li>
				<!-- 로그인시 서비스 메뉴 생김  -->
				<c:if test="${sessionScope.login != null}">
					<li><a href="">서비스</a>
						<div id="submenu_guide2" class="submenu">
							<div class="submenu_unit">
								<strong>사용자 서비스</strong>
								<ul>
									<li><a href="">스크랩</a></li>
								</ul>
							</div>
							<div class="submenu_unit">
	                                <strong>AI서비스</strong>
	                                <ul>
	                                    <li><a href="">AI추천정보</a></li>
	                                </ul>
	                            </div>
						</div>
					</li>
				</c:if>
			</ul>
		</nav>
		<!-- 로그인 전  -->
		<c:if test="${sessionScope.login == null}">
		<div class="login_info">
			<a href="<c:url value="/registView" />" class="btn_m">회원가입</a> <a
				href="<c:url value="/loginView" />" class="btn_m type_primary">로그인</a>
		</div>
		</c:if>
		<!-- 로그인 후 -->
		<c:if test="${sessionScope.login != null}">
		<div class="login_info">
			<a href="<c:url value="/myPageView" />" class="btn_m">정보수정</a> 
			<a href="<c:url value="/logoutDo" />" class="btn_m type_primary">로그아웃</a>
		</div>
		</c:if>

		<!-- 모바일 용 버튼 -->
		<button type="button" id="btn_drawer" class="btn_drawer">
			<span class="blind">전체메뉴</span>
		</button>
		<button type="button" id="btn_close_drawer" class="btn_close">
			<span class="blind">전체메뉴 닫기</span>
		</button>
	</div>
</header>