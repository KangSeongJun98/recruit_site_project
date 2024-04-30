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
<style type="text/css">
.floating {
	position: fixed;
	right: 50%;
	top: 400px;
	margin-right: -800px;
	text-align: center;
	width: 120px;
}
</style>
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
			<!-- 검색창 -->
			<form name="search" id="form_url"
				action="<c:url value="/recruitmentView" />" method="post">
				<div class="apidoc">
					<h2 class="tit_section">채용정보 검색</h2>
					<div class="wrap_register frm_api_url">
						<fieldset>
							<div class="wrap_grid">
								<input type="hidden" name="curPage" value="${searchVO.curPage }">
								<div class="row">
									<label for="keywords" class="lbl_field">키워드</label> <input
										type="text" name="keywords" id="keywords" class="inp_typo"
										value="${recSearchVO.keywords }">
								</div>
								<!-- 학력코드  -->
								<div class="row">
									<span class="lbl_field">학력</span> <span class="inp_rdo">
										<input type="radio" name="eduLv" id="edu_lv" value=""
										checked
										${recSearchVO.eduLv
										eq "10" ? "checked='checked'": ""} > <label
										class="lbl" for="edu_lv">전체</label>
									</span><span class="inp_rdo"> <input type="radio" name="eduLv"
										id="edu_lv1,6" value="6"
										${recSearchVO.eduLv eq "6" ? "checked='checked'": ""}>
										<label class="lbl" for="edu_lv1,6">고등학교 졸업 이상</label>
									</span><span class="inp_rdo"> <input type="radio" name="eduLv"
										id="edu_lv2,7" value="7" value="6"
										${recSearchVO.eduLv eq "7" ? "checked='checked'": ""}>
										<label class="lbl" for="edu_lv2,7">대학(2,3년) 졸업 이상</label>
									</span><span class="inp_rdo"> <input type="radio" name="eduLv"
										id="edu_lv3,8" value="8" value="6"
										${recSearchVO.eduLv eq "8" ? "checked='checked'": ""}>
										<label class="lbl" for="edu_lv3,8">대학교(4년) 졸업 이상</label>
									</span><span class="inp_rdo"> <input type="radio" name="eduLv"
										id="edu_lv4,9" value="9" value="6"
										${recSearchVO.eduLv eq "9" ? "checked='checked'": ""}>
										<label class="lbl" for="edu_lv4,9">석사졸업 이상</label>
									</span><span class="inp_rdo"> <input type="radio" name="eduLv"
										id="edu_lv99" value="0" value="6"
										${recSearchVO.eduLv eq "0" ? "checked='checked'": ""}>
										<label class="lbl" for="edu_lv99">학력무관</label>
									</span>
								</div>
								<!-- 지역 코드  -->
								<div class="row">
									<div class="col">
										<label for="loc_cd" class="lbl_field">지역</label> <select
											name="locCd" id="loc_cd" class="inp_sel">
											<option value="" label="전체">전체</option>
											<optgroup label="서울">
												<option value="101000"
													${recSearchVO.locCd eq "101000" ? "selected='selected'": ""}>서울전체</option>
												<option value="101010"
													${recSearchVO.locCd eq "101010" ? "selected='selected'": ""}>강남구</option>
												<option value="101020"
													${recSearchVO.locCd eq "101020" ? "selected='selected'": ""}>강동구</option>
												<option value="101030"
													${recSearchVO.locCd eq "101030" ? "selected='selected'": ""}>강북구</option>
												<option value="101040"
													${recSearchVO.locCd eq "101040" ? "selected='selected'": ""}>강서구</option>
												<option value="101050"
													${recSearchVO.locCd eq "101050" ? "selected='selected'": ""}>관악구</option>
												<option value="101060"
													${recSearchVO.locCd eq "101060" ? "selected='selected'": ""}>광진구</option>
												<option value="101070"
													${recSearchVO.locCd eq "101070" ? "selected='selected'": ""}>구로구</option>
												<option value="101080"
													${recSearchVO.locCd eq "101080" ? "selected='selected'": ""}>금천구</option>
												<option value="101090"
													${recSearchVO.locCd eq "101090" ? "selected='selected'": ""}>노원구</option>
												<option value="101100"
													${recSearchVO.locCd eq "101100" ? "selected='selected'": ""}>도봉구</option>
												<option value="101110"
													${recSearchVO.locCd eq "101110" ? "selected='selected'": ""}>동대문구</option>
												<option value="101120"
													${recSearchVO.locCd eq "101120" ? "selected='selected'": ""}>동작구</option>
												<option value="101130"
													${recSearchVO.locCd eq "101130" ? "selected='selected'": ""}>마포구</option>
												<option value="101140"
													${recSearchVO.locCd eq "101140" ? "selected='selected'": ""}>서대문구</option>
												<option value="101150"
													${recSearchVO.locCd eq "101150" ? "selected='selected'": ""}>서초구</option>
												<option value="101160"
													${recSearchVO.locCd eq "101160" ? "selected='selected'": ""}>성동구</option>
												<option value="101170"
													${recSearchVO.locCd eq "101170" ? "selected='selected'": ""}>성북구</option>
												<option value="101180"
													${recSearchVO.locCd eq "101180" ? "selected='selected'": ""}>송파구</option>
												<option value="101190"
													${recSearchVO.locCd eq "101190" ? "selected='selected'": ""}>양천구</option>
												<option value="101200"
													${recSearchVO.locCd eq "101200" ? "selected='selected'": ""}>영등포구</option>
												<option value="101210"
													${recSearchVO.locCd eq "101210" ? "selected='selected'": ""}>용산구</option>
												<option value="101220"
													${recSearchVO.locCd eq "101220" ? "selected='selected'": ""}>은평구</option>
												<option value="101230"
													${recSearchVO.locCd eq "101230" ? "selected='selected'": ""}>종로구</option>
												<option value="101240"
													${recSearchVO.locCd eq "101240" ? "selected='selected'": ""}>중구</option>
												<option value="101250"
													${recSearchVO.locCd eq "101250" ? "selected='selected'": ""}>중랑구</option>
											</optgroup>
											<optgroup label="경기">
												<option value="102000"
													${recSearchVO.locCd eq "102000" ? "selected='selected'": ""}>경기전체</option>
												<option value="102010"
													${recSearchVO.locCd eq "102010" ? "selected='selected'": ""}>가평군</option>
												<option value="102020"
													${recSearchVO.locCd eq "102020" ? "selected='selected'": ""}>고양시</option>
												<option value="102030"
													${recSearchVO.locCd eq "102030" ? "selected='selected'": ""}>고양시
													덕양구</option>
												<option value="102040"
													${recSearchVO.locCd eq "102040" ? "selected='selected'": ""}>고양시
													일산동구</option>
												<option value="102050"
													${recSearchVO.locCd eq "102050" ? "selected='selected'": ""}>고양시
													일산서구</option>
												<option value="102060"
													${recSearchVO.locCd eq "102060" ? "selected='selected'": ""}>과천시</option>
												<option value="102070"
													${recSearchVO.locCd eq "102070" ? "selected='selected'": ""}>광명시</option>
												<option value="102080"
													${recSearchVO.locCd eq "102080" ? "selected='selected'": ""}>광주시</option>
												<option value="102090"
													${recSearchVO.locCd eq "102090" ? "selected='selected'": ""}>구리시</option>
												<option value="102100"
													${recSearchVO.locCd eq "102100" ? "selected='selected'": ""}>군포시</option>
												<option value="102110"
													${recSearchVO.locCd eq "102110" ? "selected='selected'": ""}>김포시</option>
												<option value="102120"
													${recSearchVO.locCd eq "102120" ? "selected='selected'": ""}>남양주시</option>
												<option value="102130"
													${recSearchVO.locCd eq "102130" ? "selected='selected'": ""}>동두천시</option>
												<option value="102140"
													${recSearchVO.locCd eq "102140" ? "selected='selected'": ""}>부천시</option>
												<option value="102150"
													${recSearchVO.locCd eq "102150" ? "selected='selected'": ""}>부천시
													소사구</option>
												<option value="102160"
													${recSearchVO.locCd eq "102160" ? "selected='selected'": ""}>부천시
													오정구</option>
												<option value="102170"
													${recSearchVO.locCd eq "102170" ? "selected='selected'": ""}>부천시
													원미구</option>
												<option value="102180"
													${recSearchVO.locCd eq "102180" ? "selected='selected'": ""}>성남시</option>
												<option value="102190"
													${recSearchVO.locCd eq "102190" ? "selected='selected'": ""}>성남시
													분당구</option>
												<option value="102200"
													${recSearchVO.locCd eq "102200" ? "selected='selected'": ""}>성남시
													수정구</option>
												<option value="102210"
													${recSearchVO.locCd eq "102210" ? "selected='selected'": ""}>성남시
													중원구</option>
												<option value="102220"
													${recSearchVO.locCd eq "102220" ? "selected='selected'": ""}>수원시</option>
												<option value="102230"
													${recSearchVO.locCd eq "102230" ? "selected='selected'": ""}>수원시
													권선구</option>
												<option value="102240"
													${recSearchVO.locCd eq "102240" ? "selected='selected'": ""}>수원시
													영통구</option>
												<option value="102250"
													${recSearchVO.locCd eq "102250" ? "selected='selected'": ""}>수원시
													장안구</option>
												<option value="102260"
													${recSearchVO.locCd eq "102260" ? "selected='selected'": ""}>수원시
													팔달구</option>
												<option value="102270"
													${recSearchVO.locCd eq "102270" ? "selected='selected'": ""}>시흥시</option>
												<option value="102280"
													${recSearchVO.locCd eq "102280" ? "selected='selected'": ""}>안산시</option>
												<option value="102290"
													${recSearchVO.locCd eq "102290" ? "selected='selected'": ""}>안산시
													단원구</option>
												<option value="102300"
													${recSearchVO.locCd eq "102300" ? "selected='selected'": ""}>안산시
													상록구</option>
												<option value="102310"
													${recSearchVO.locCd eq "102310" ? "selected='selected'": ""}>안성시</option>
												<option value="102320"
													${recSearchVO.locCd eq "102320" ? "selected='selected'": ""}>안양시</option>
												<option value="102330"
													${recSearchVO.locCd eq "102330" ? "selected='selected'": ""}>안양시
													동안구</option>
												<option value="102340"
													${recSearchVO.locCd eq "102340" ? "selected='selected'": ""}>안양시
													만안구</option>
												<option value="102350"
													${recSearchVO.locCd eq "102350" ? "selected='selected'": ""}>양주시</option>
												<option value="102360"
													${recSearchVO.locCd eq "102360" ? "selected='selected'": ""}>양평군</option>
												<option value="102370"
													${recSearchVO.locCd eq "102370" ? "selected='selected'": ""}>여주시</option>
												<option value="102380"
													${recSearchVO.locCd eq "102380" ? "selected='selected'": ""}>연천군</option>
												<option value="102390"
													${recSearchVO.locCd eq "102390" ? "selected='selected'": ""}>오산시</option>
												<option value="102400"
													${recSearchVO.locCd eq "102400" ? "selected='selected'": ""}>용인시</option>
												<option value="102410"
													${recSearchVO.locCd eq "102410" ? "selected='selected'": ""}>용인시
													기흥구</option>
												<option value="102420"
													${recSearchVO.locCd eq "102420" ? "selected='selected'": ""}>용인시
													수지구</option>
												<option value="102430"
													${recSearchVO.locCd eq "102430" ? "selected='selected'": ""}>용인시
													처인구</option>
												<option value="102440"
													${recSearchVO.locCd eq "102440" ? "selected='selected'": ""}>의왕시</option>
												<option value="102450"
													${recSearchVO.locCd eq "102450" ? "selected='selected'": ""}>의정부시</option>
												<option value="102460"
													${recSearchVO.locCd eq "102460" ? "selected='selected'": ""}>이천시</option>
												<option value="102470"
													${recSearchVO.locCd eq "102470" ? "selected='selected'": ""}>파주시</option>
												<option value="102480"
													${recSearchVO.locCd eq "102480" ? "selected='selected'": ""}>평택시</option>
												<option value="102490"
													${recSearchVO.locCd eq "102490" ? "selected='selected'": ""}>포천시</option>
												<option value="102500"
													${recSearchVO.locCd eq "102500" ? "selected='selected'": ""}>하남시</option>
												<option value="102510"
													${recSearchVO.locCd eq "102510" ? "selected='selected'": ""}>화성시</option>
											</optgroup>
											<optgroup label="충남">
												<option value="115000"
													${recSearchVO.locCd eq "115000" ? "selected='selected'": ""}>충남전체</option>
												<option value="115010"
													${recSearchVO.locCd eq "115010" ? "selected='selected'": ""}>계룡시</option>
												<option value="115020"
													${recSearchVO.locCd eq "115020" ? "selected='selected'": ""}>공주시</option>
												<option value="115030"
													${recSearchVO.locCd eq "115030" ? "selected='selected'": ""}>금산군</option>
												<option value="115040"
													${recSearchVO.locCd eq "115040" ? "selected='selected'": ""}>논산시</option>
												<option value="115050"
													${recSearchVO.locCd eq "115050" ? "selected='selected'": ""}>당진시</option>
												<option value="115060"
													${recSearchVO.locCd eq "115060" ? "selected='selected'": ""}>보령시</option>
												<option value="115070"
													${recSearchVO.locCd eq "115070" ? "selected='selected'": ""}>부여군</option>
												<option value="115080"
													${recSearchVO.locCd eq "115080" ? "selected='selected'": ""}>서산시</option>
												<option value="115090"
													${recSearchVO.locCd eq "115090" ? "selected='selected'": ""}>서천군</option>
												<option value="115100"
													${recSearchVO.locCd eq "115100" ? "selected='selected'": ""}>아산시</option>
												<option value="115110"
													${recSearchVO.locCd eq "115110" ? "selected='selected'": ""}>연기군</option>
												<option value="115120"
													${recSearchVO.locCd eq "115120" ? "selected='selected'": ""}>예산군</option>
												<option value="115130"
													${recSearchVO.locCd eq "115130" ? "selected='selected'": ""}>천안시</option>
												<option value="115140"
													${recSearchVO.locCd eq "115140" ? "selected='selected'": ""}>청양군</option>
												<option value="115150"
													${recSearchVO.locCd eq "115150" ? "selected='selected'": ""}>태안군</option>
												<option value="115160"
													${recSearchVO.locCd eq "115160" ? "selected='selected'": ""}>홍성군</option>
												<option value="115133"
													${recSearchVO.locCd eq "115133" ? "selected='selected'": ""}>천안시
													동남구</option>
												<option value="115135"
													${recSearchVO.locCd eq "115135" ? "selected='selected'": ""}>천안시
													서북구</option>
											</optgroup>
											<optgroup label="강원">
												<option value="109000"
													${recSearchVO.locCd eq "109000" ? "selected='selected'": ""}>강원전체</option>
												<option value="109010"
													${recSearchVO.locCd eq "109010" ? "selected='selected'": ""}>강릉시</option>
												<option value="109020"
													${recSearchVO.locCd eq "109020" ? "selected='selected'": ""}>고성군</option>
												<option value="109030"
													${recSearchVO.locCd eq "109030" ? "selected='selected'": ""}>동해시</option>
												<option value="109040"
													${recSearchVO.locCd eq "109040" ? "selected='selected'": ""}>삼척시</option>
												<option value="109050"
													${recSearchVO.locCd eq "109050" ? "selected='selected'": ""}>속초시</option>
												<option value="109060"
													${recSearchVO.locCd eq "109060" ? "selected='selected'": ""}>양구군</option>
												<option value="109070"
													${recSearchVO.locCd eq "109070" ? "selected='selected'": ""}>양양군</option>
												<option value="109080"
													${recSearchVO.locCd eq "109080" ? "selected='selected'": ""}>영월군</option>
												<option value="109090"
													${recSearchVO.locCd eq "109090" ? "selected='selected'": ""}>원주시</option>
												<option value="109100"
													${recSearchVO.locCd eq "109100" ? "selected='selected'": ""}>인제군</option>
												<option value="109110"
													${recSearchVO.locCd eq "109110" ? "selected='selected'": ""}>정선군</option>
												<option value="109120"
													${recSearchVO.locCd eq "109120" ? "selected='selected'": ""}>철원군</option>
												<option value="109130"
													${recSearchVO.locCd eq "109130" ? "selected='selected'": ""}>춘천시</option>
												<option value="109140"
													${recSearchVO.locCd eq "109140" ? "selected='selected'": ""}>태백시</option>
												<option value="109150"
													${recSearchVO.locCd eq "109150" ? "selected='selected'": ""}>평창군</option>
												<option value="109160"
													${recSearchVO.locCd eq "109160" ? "selected='selected'": ""}>홍천군</option>
												<option value="109170"
													${recSearchVO.locCd eq "109170" ? "selected='selected'": ""}>화천군</option>
												<option value="109180"
													${recSearchVO.locCd eq "109180" ? "selected='selected'": ""}>횡성군</option>
											</optgroup>
											<optgroup label="대전">
												<option value="105000"
													${recSearchVO.locCd eq "105000" ? "selected='selected'": ""}>대전전체</option>
												<option value="105010"
													${recSearchVO.locCd eq "105010" ? "selected='selected'": ""}>대덕구</option>
												<option value="105020"
													${recSearchVO.locCd eq "105020" ? "selected='selected'": ""}>동구</option>
												<option value="105030"
													${recSearchVO.locCd eq "105030" ? "selected='selected'": ""}>서구</option>
												<option value="105040"
													${recSearchVO.locCd eq "105040" ? "selected='selected'": ""}>유성구</option>
												<option value="105050"
													${recSearchVO.locCd eq "105050" ? "selected='selected'": ""}>중구</option>
											</optgroup>
											<optgroup label="세종">
												<option value="118000"
													${recSearchVO.locCd eq "118000" ? "selected='selected'": ""}>세종특별자치시</option>
											</optgroup>
											<optgroup label="광주">
												<option value="103000"
													${recSearchVO.locCd eq "103000" ? "selected='selected'": ""}>광주전체</option>
												<option value="103010"
													${recSearchVO.locCd eq "103010" ? "selected='selected'": ""}>광산구</option>
												<option value="103020"
													${recSearchVO.locCd eq "103020" ? "selected='selected'": ""}>남구</option>
												<option value="103030"
													${recSearchVO.locCd eq "103030" ? "selected='selected'": ""}>동구</option>
												<option value="103040"
													${recSearchVO.locCd eq "103040" ? "selected='selected'": ""}>북구</option>
												<option value="103050"
													${recSearchVO.locCd eq "103050" ? "selected='selected'": ""}>서구</option>
											</optgroup>
											<optgroup label="경남">
												<option value="110000"
													${recSearchVO.locCd eq "110000" ? "selected='selected'": ""}>경남전체</option>
												<option value="110010"
													${recSearchVO.locCd eq "110010" ? "selected='selected'": ""}>거제시</option>
												<option value="110020"
													${recSearchVO.locCd eq "110020" ? "selected='selected'": ""}>거창군</option>
												<option value="110030"
													${recSearchVO.locCd eq "110030" ? "selected='selected'": ""}>고성군</option>
												<option value="110040"
													${recSearchVO.locCd eq "110040" ? "selected='selected'": ""}>김해시</option>
												<option value="110050"
													${recSearchVO.locCd eq "110050" ? "selected='selected'": ""}>남해군</option>
												<option value="110070"
													${recSearchVO.locCd eq "110070" ? "selected='selected'": ""}>밀양시</option>
												<option value="110080"
													${recSearchVO.locCd eq "110080" ? "selected='selected'": ""}>사천시</option>
												<option value="110090"
													${recSearchVO.locCd eq "110090" ? "selected='selected'": ""}>산청군</option>
												<option value="110100"
													${recSearchVO.locCd eq "110100" ? "selected='selected'": ""}>양산시</option>
												<option value="110110"
													${recSearchVO.locCd eq "110110" ? "selected='selected'": ""}>의령군</option>
												<option value="110120"
													${recSearchVO.locCd eq "110120" ? "selected='selected'": ""}>진주시</option>
												<option value="110130"
													${recSearchVO.locCd eq "110130" ? "selected='selected'": ""}>창원시
													진해구</option>
												<option value="110140"
													${recSearchVO.locCd eq "110140" ? "selected='selected'": ""}>창녕군</option>
												<option value="110150"
													${recSearchVO.locCd eq "110150" ? "selected='selected'": ""}>창원시</option>
												<option value="110160"
													${recSearchVO.locCd eq "110160" ? "selected='selected'": ""}>통영시</option>
												<option value="110170"
													${recSearchVO.locCd eq "110170" ? "selected='selected'": ""}>하동군</option>
												<option value="110180"
													${recSearchVO.locCd eq "110180" ? "selected='selected'": ""}>함안군</option>
												<option value="110190"
													${recSearchVO.locCd eq "110190" ? "selected='selected'": ""}>함양군</option>
												<option value="110200"
													${recSearchVO.locCd eq "110200" ? "selected='selected'": ""}>합천군</option>
												<option value="110053"
													${recSearchVO.locCd eq "110053" ? "selected='selected'": ""}>창원시
													마산회원구</option>
												<option value="110055"
													${recSearchVO.locCd eq "110055" ? "selected='selected'": ""}>창원시
													마산합포구</option>
												<option value="110057"
													${recSearchVO.locCd eq "110057" ? "selected='selected'": ""}>창원시
													성산구</option>
												<option value="110059"
													${recSearchVO.locCd eq "110059" ? "selected='selected'": ""}>창원시
													의창구</option>
											</optgroup>
											<optgroup label="울산">
												<option value="107000"
													${recSearchVO.locCd eq "107000" ? "selected='selected'": ""}>울산전체</option>
												<option value="107010"
													${recSearchVO.locCd eq "107010" ? "selected='selected'": ""}>남구</option>
												<option value="107020"
													${recSearchVO.locCd eq "107020" ? "selected='selected'": ""}>동구</option>
												<option value="107030"
													${recSearchVO.locCd eq "107030" ? "selected='selected'": ""}>북구</option>
												<option value="107040"
													${recSearchVO.locCd eq "107040" ? "selected='selected'": ""}>울주군</option>
												<option value="107050"
													${recSearchVO.locCd eq "107050" ? "selected='selected'": ""}>중구</option>
											</optgroup>
											<optgroup label="충북">
												<option value="114000"
													${recSearchVO.locCd eq "114000" ? "selected='selected'": ""}>충북전체</option>
												<option value="114010"
													${recSearchVO.locCd eq "114010" ? "selected='selected'": ""}>괴산군</option>
												<option value="114020"
													${recSearchVO.locCd eq "114020" ? "selected='selected'": ""}>단양군</option>
												<option value="114030"
													${recSearchVO.locCd eq "114030" ? "selected='selected'": ""}>보은군</option>
												<option value="114040"
													${recSearchVO.locCd eq "114040" ? "selected='selected'": ""}>영동군</option>
												<option value="114050"
													${recSearchVO.locCd eq "114050" ? "selected='selected'": ""}>옥천군</option>
												<option value="114060"
													${recSearchVO.locCd eq "114060" ? "selected='selected'": ""}>음성군</option>
												<option value="114070"
													${recSearchVO.locCd eq "114070" ? "selected='selected'": ""}>제천시</option>
												<option value="114080"
													${recSearchVO.locCd eq "114080" ? "selected='selected'": ""}>증평군</option>
												<option value="114090"
													${recSearchVO.locCd eq "114090" ? "selected='selected'": ""}>진천군</option>
												<option value="114100"
													${recSearchVO.locCd eq "114100" ? "selected='selected'": ""}>청원군</option>
												<option value="114110"
													${recSearchVO.locCd eq "114110" ? "selected='selected'": ""}>청주시</option>
												<option value="114120"
													${recSearchVO.locCd eq "114120" ? "selected='selected'": ""}>청주시
													상당구</option>
												<option value="114130"
													${recSearchVO.locCd eq "114130" ? "selected='selected'": ""}>청주시
													흥덕구</option>
												<option value="114140"
													${recSearchVO.locCd eq "114140" ? "selected='selected'": ""}>충주시</option>
												<option value="114150"
													${recSearchVO.locCd eq "114150" ? "selected='selected'": ""}>청주시
													청원구</option>
												<option value="114160"
													${recSearchVO.locCd eq "114160" ? "selected='selected'": ""}>청주시
													서원구</option>
											</optgroup>
											<optgroup label="전북">
												<option value="113000"
													${recSearchVO.locCd eq "113000" ? "selected='selected'": ""}>전북전체</option>
												<option value="113010"
													${recSearchVO.locCd eq "113010" ? "selected='selected'": ""}>고창군</option>
												<option value="113020"
													${recSearchVO.locCd eq "113020" ? "selected='selected'": ""}>군산시</option>
												<option value="113030"
													${recSearchVO.locCd eq "113030" ? "selected='selected'": ""}>김제시</option>
												<option value="113040"
													${recSearchVO.locCd eq "113040" ? "selected='selected'": ""}>남원시</option>
												<option value="113050"
													${recSearchVO.locCd eq "113050" ? "selected='selected'": ""}>무주군</option>
												<option value="113060"
													${recSearchVO.locCd eq "113060" ? "selected='selected'": ""}>부안군</option>
												<option value="113070"
													${recSearchVO.locCd eq "113070" ? "selected='selected'": ""}>순창군</option>
												<option value="113080"
													${recSearchVO.locCd eq "113080" ? "selected='selected'": ""}>완주군</option>
												<option value="113090"
													${recSearchVO.locCd eq "113090" ? "selected='selected'": ""}>익산시</option>
												<option value="113100"
													${recSearchVO.locCd eq "113100" ? "selected='selected'": ""}>임실군</option>
												<option value="113110"
													${recSearchVO.locCd eq "113110" ? "selected='selected'": ""}>장수군</option>
												<option value="113120"
													${recSearchVO.locCd eq "113120" ? "selected='selected'": ""}>전주시</option>
												<option value="113130"
													${recSearchVO.locCd eq "113130" ? "selected='selected'": ""}>전주시
													덕진구</option>
												<option value="113140"
													${recSearchVO.locCd eq "113140" ? "selected='selected'": ""}>전주시
													완산구</option>
												<option value="113150"
													${recSearchVO.locCd eq "113150" ? "selected='selected'": ""}>정읍시</option>
												<option value="113160"
													${recSearchVO.locCd eq "113160" ? "selected='selected'": ""}>진안군</option>
											</optgroup>
											<optgroup label="부산">
												<option value="106000"
													${recSearchVO.locCd eq "106000" ? "selected='selected'": ""}>부산전체</option>
												<option value="106010"
													${recSearchVO.locCd eq "106010" ? "selected='selected'": ""}>강서구</option>
												<option value="106020"
													${recSearchVO.locCd eq "106020" ? "selected='selected'": ""}>금정구</option>
												<option value="106030"
													${recSearchVO.locCd eq "106030" ? "selected='selected'": ""}>기장군</option>
												<option value="106040"
													${recSearchVO.locCd eq "106040" ? "selected='selected'": ""}>남구</option>
												<option value="106050"
													${recSearchVO.locCd eq "106050" ? "selected='selected'": ""}>동구</option>
												<option value="106060"
													${recSearchVO.locCd eq "106060" ? "selected='selected'": ""}>동래구</option>
												<option value="106070"
													${recSearchVO.locCd eq "106070" ? "selected='selected'": ""}>부산진구</option>
												<option value="106080"
													${recSearchVO.locCd eq "106080" ? "selected='selected'": ""}>북구</option>
												<option value="106090"
													${recSearchVO.locCd eq "106090" ? "selected='selected'": ""}>사상구</option>
												<option value="106100"
													${recSearchVO.locCd eq "106100" ? "selected='selected'": ""}>사하구</option>
												<option value="106110"
													${recSearchVO.locCd eq "106110" ? "selected='selected'": ""}>서구</option>
												<option value="106120"
													${recSearchVO.locCd eq "106120" ? "selected='selected'": ""}>수영구</option>
												<option value="106130"
													${recSearchVO.locCd eq "106130" ? "selected='selected'": ""}>연제구</option>
												<option value="106140"
													${recSearchVO.locCd eq "106140" ? "selected='selected'": ""}>영도구</option>
												<option value="106150"
													${recSearchVO.locCd eq "106150" ? "selected='selected'": ""}>중구</option>
												<option value="106160"
													${recSearchVO.locCd eq "106160" ? "selected='selected'": ""}>해운대구</option>
											</optgroup>
											<optgroup label="경북">
												<option value="111000"
													${recSearchVO.locCd eq "111000" ? "selected='selected'": ""}>경북전체</option>
												<option value="111010"
													${recSearchVO.locCd eq "111010" ? "selected='selected'": ""}>경산시</option>
												<option value="111020"
													${recSearchVO.locCd eq "111020" ? "selected='selected'": ""}>경주시</option>
												<option value="111030"
													${recSearchVO.locCd eq "111030" ? "selected='selected'": ""}>고령군</option>
												<option value="111040"
													${recSearchVO.locCd eq "111040" ? "selected='selected'": ""}>구미시</option>
												<option value="111050"
													${recSearchVO.locCd eq "111050" ? "selected='selected'": ""}>군위군</option>
												<option value="111060"
													${recSearchVO.locCd eq "111060" ? "selected='selected'": ""}>김천시</option>
												<option value="111070"
													${recSearchVO.locCd eq "111070" ? "selected='selected'": ""}>문경시</option>
												<option value="111080"
													${recSearchVO.locCd eq "111080" ? "selected='selected'": ""}>봉화군</option>
												<option value="111090"
													${recSearchVO.locCd eq "111090" ? "selected='selected'": ""}>상주시</option>
												<option value="111100"
													${recSearchVO.locCd eq "111100" ? "selected='selected'": ""}>성주군</option>
												<option value="111110"
													${recSearchVO.locCd eq "111110" ? "selected='selected'": ""}>안동시</option>
												<option value="111120"
													${recSearchVO.locCd eq "111120" ? "selected='selected'": ""}>영덕군</option>
												<option value="111130"
													${recSearchVO.locCd eq "111130" ? "selected='selected'": ""}>영양군</option>
												<option value="111140"
													${recSearchVO.locCd eq "111140" ? "selected='selected'": ""}>영주시</option>
												<option value="111150"
													${recSearchVO.locCd eq "111150" ? "selected='selected'": ""}>영천시</option>
												<option value="111160"
													${recSearchVO.locCd eq "111160" ? "selected='selected'": ""}>예천군</option>
												<option value="111170"
													${recSearchVO.locCd eq "111170" ? "selected='selected'": ""}>울릉군</option>
												<option value="111180"
													${recSearchVO.locCd eq "111180" ? "selected='selected'": ""}>울진군</option>
												<option value="111190"
													${recSearchVO.locCd eq "111190" ? "selected='selected'": ""}>의성군</option>
												<option value="111200"
													${recSearchVO.locCd eq "111200" ? "selected='selected'": ""}>청도군</option>
												<option value="111210"
													${recSearchVO.locCd eq "111210" ? "selected='selected'": ""}>청송군</option>
												<option value="111220"
													${recSearchVO.locCd eq "111220" ? "selected='selected'": ""}>칠곡군</option>
												<option value="111230"
													${recSearchVO.locCd eq "111230" ? "selected='selected'": ""}>포항시</option>
												<option value="111240"
													${recSearchVO.locCd eq "111240" ? "selected='selected'": ""}>포항시
													남구</option>
												<option value="111250"
													${recSearchVO.locCd eq "111250" ? "selected='selected'": ""}>포항시
													북구</option>
											</optgroup>
											<optgroup label="제주">
												<option value="116000"
													${recSearchVO.locCd eq "116000" ? "selected='selected'": ""}>제주전체</option>
												<option value="116030"
													${recSearchVO.locCd eq "116030" ? "selected='selected'": ""}>서귀포시</option>
												<option value="116040"
													${recSearchVO.locCd eq "116040" ? "selected='selected'": ""}>제주시</option>
											</optgroup>
											<optgroup label="대구">
												<option value="104000"
													${recSearchVO.locCd eq "104000" ? "selected='selected'": ""}>대구전체</option>
												<option value="104010"
													${recSearchVO.locCd eq "104010" ? "selected='selected'": ""}>남구</option>
												<option value="104020"
													${recSearchVO.locCd eq "104020" ? "selected='selected'": ""}>달서구</option>
												<option value="104030"
													${recSearchVO.locCd eq "104030" ? "selected='selected'": ""}>달성군</option>
												<option value="104040"
													${recSearchVO.locCd eq "104040" ? "selected='selected'": ""}>동구</option>
												<option value="104050"
													${recSearchVO.locCd eq "104050" ? "selected='selected'": ""}>북구</option>
												<option value="104060"
													${recSearchVO.locCd eq "104060" ? "selected='selected'": ""}>서구</option>
												<option value="104070"
													${recSearchVO.locCd eq "104070" ? "selected='selected'": ""}>수성구</option>
												<option value="104080"
													${recSearchVO.locCd eq "104080" ? "selected='selected'": ""}>중구</option>
												<option value="104090"
													${recSearchVO.locCd eq "104090" ? "selected='selected'": ""}>군위군</option>
											</optgroup>
											<optgroup label="인천">
												<option value="108000"
													${recSearchVO.locCd eq "108000" ? "selected='selected'": ""}>인천전체</option>
												<option value="108010"
													${recSearchVO.locCd eq "108010" ? "selected='selected'": ""}>강화군</option>
												<option value="108020"
													${recSearchVO.locCd eq "108020" ? "selected='selected'": ""}>계양구</option>
												<option value="108030"
													${recSearchVO.locCd eq "108030" ? "selected='selected'": ""}>미추홀구</option>
												<option value="108040"
													${recSearchVO.locCd eq "108040" ? "selected='selected'": ""}>남동구</option>
												<option value="108050"
													${recSearchVO.locCd eq "108050" ? "selected='selected'": ""}>동구</option>
												<option value="108060"
													${recSearchVO.locCd eq "108060" ? "selected='selected'": ""}>부평구</option>
												<option value="108070"
													${recSearchVO.locCd eq "108070" ? "selected='selected'": ""}>서구</option>
												<option value="108080"
													${recSearchVO.locCd eq "108080" ? "selected='selected'": ""}>연수구</option>
												<option value="108090"
													${recSearchVO.locCd eq "108090" ? "selected='selected'": ""}>옹진군</option>
												<option value="108100"
													${recSearchVO.locCd eq "108100" ? "selected='selected'": ""}>중구</option>
											</optgroup>
											<optgroup label="전남">
												<option value="112000"
													${recSearchVO.locCd eq "112000" ? "selected='selected'": ""}>전남전체</option>
												<option value="112010"
													${recSearchVO.locCd eq "112010" ? "selected='selected'": ""}>강진군</option>
												<option value="112020"
													${recSearchVO.locCd eq "112020" ? "selected='selected'": ""}>고흥군</option>
												<option value="112030"
													${recSearchVO.locCd eq "112030" ? "selected='selected'": ""}>곡성군</option>
												<option value="112040"
													${recSearchVO.locCd eq "112040" ? "selected='selected'": ""}>광양시</option>
												<option value="112050"
													${recSearchVO.locCd eq "112050" ? "selected='selected'": ""}>구례군</option>
												<option value="112060"
													${recSearchVO.locCd eq "112060" ? "selected='selected'": ""}>나주시</option>
												<option value="112070"
													${recSearchVO.locCd eq "112070" ? "selected='selected'": ""}>담양군</option>
												<option value="112080"
													${recSearchVO.locCd eq "112080" ? "selected='selected'": ""}>목포시</option>
												<option value="112090"
													${recSearchVO.locCd eq "112090" ? "selected='selected'": ""}>무안군</option>
												<option value="112100"
													${recSearchVO.locCd eq "112100" ? "selected='selected'": ""}>보성군</option>
												<option value="112110"
													${recSearchVO.locCd eq "112110" ? "selected='selected'": ""}>순천시</option>
												<option value="112120"
													${recSearchVO.locCd eq "112120" ? "selected='selected'": ""}>신안군</option>
												<option value="112130"
													${recSearchVO.locCd eq "112130" ? "selected='selected'": ""}>여수시</option>
												<option value="112140"
													${recSearchVO.locCd eq "112140" ? "selected='selected'": ""}>영광군</option>
												<option value="112150"
													${recSearchVO.locCd eq "112150" ? "selected='selected'": ""}>영암군</option>
												<option value="112160"
													${recSearchVO.locCd eq "112160" ? "selected='selected'": ""}>완도군</option>
												<option value="112170"
													${recSearchVO.locCd eq "112170" ? "selected='selected'": ""}>장성군</option>
												<option value="112180"
													${recSearchVO.locCd eq "112180" ? "selected='selected'": ""}>장흥군</option>
												<option value="112190"
													${recSearchVO.locCd eq "112190" ? "selected='selected'": ""}>진도군</option>
												<option value="112200"
													${recSearchVO.locCd eq "112200" ? "selected='selected'": ""}>함평군</option>
												<option value="112210"
													${recSearchVO.locCd eq "112210" ? "selected='selected'": ""}>해남군</option>
												<option value="112220"
													${recSearchVO.locCd eq "112220" ? "selected='selected'": ""}>화순군</option>
											</optgroup>
										</select>
									</div>
									<div class="col">
										<label for="order_by" class="lbl_field">정렬</label> <select
											name="orderBy" id="order_by" class="inp_sel">
											<option value="posting_date" label="등록일순"
												${recSearchVO.orderBy eq "posting_date" ? "selected='selected'": ""}>등록일순
											</option>
											<option value="expiration_date" label="최근마감일순"
												${recSearchVO.orderBy eq "expiration_date" ? "selected='selected'": ""}>최근마감일순</option>
										</select>
									</div>
								</div>

								<div class="row area_button">
									<span class="col_6">
										<button type="submit" id="btn_create_url"
											class="btn_l type_primary">
											<span>검색</span>
										</button>
									</span> <span class="col_6">
										<button type="reset" class="btn_l">
											<span>초기화</span>
										</button>
									</span>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
				<!-- search end -->

				<!-- 리스트 값이 있을때만 표시  -->
				<c:if test="${not empty recList}">
					<!-- 메일 버튼  -->
					<h2 class="tit_section">총${recSearchVO.totalRowCount }건의 채용 정보</h2>
					<div class="row justify-content-md-end">
						<div class="col-sm-2">
							<div class="input-group">
								<label class="form-control input-sm"
									style="width: 2%; text-align: center;">count</label> <select
									id="id_rowSizePerPage" name="rowSizePerPage"
									class="form-control">
									<c:forEach var="i" begin="10" end="50" step="10">
										<!-- forEach 반복문 begin부터 50까지 10씩 증가 i는 10,20,30,40,50 -->
										<option value="${i}"
											${recSearchVO.rowSizePerPage eq i? "selected='selected'" :"" }>
											${i }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
			</form>
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
						<!-- 로그인시 즐겨찾기  -->
						<c:if test="${sessionScope.login != null}">
							<th></th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recList}" var="rec">
						<tr>
							<td><a href="${rec.recruitmentUrl}" target='_blank'>
									${rec.recruitmentTitle}</a></td>
							<td class="title">${rec.companyNm}</td>
							<td>${rec.industryName}</td>
							<td>${rec.companyLocation}</td>
							<td>${rec.jobMidCode}</td>
							<td>${rec.educationLevel}</td>
							<td>${rec.salary}</td>
							<td>${rec.postingDate}</td>
							<td>${rec.expirationDate}</td>
							<!-- 로그인됐을 때만 스크랩 버튼 나옴 -->
							<c:if test="${sessionScope.login != null}">
								<!-- 스크랩 된 정보는 on으로 표시  -->
								<c:if test="${fn:contains(clippingList, rec.recruitmentNo)}">
									<td><img class="del_clipping"
										src="resources/img/bookmark_on.png"></td>
								</c:if>

								<!-- 스크랩 안 된 정보는 off으로 표시  -->
								<c:if test="${!fn:contains(clippingList, rec.recruitmentNo)}">
									<td><img class="get_clipping"
										src="resources/img/bookmark_off.png"></td>
								</c:if>
							</c:if>
							<td style="display: none" class="recruitment_no">${rec.recruitmentNo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 페이지 -->
					<c:if test="${recSearchVO.firstPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/recruitmentView?curPage=${recSearchVO.firstPage-1 }" />"
							data-page="${recSearchVO.firstPage-1 }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<!-- 이전 페이지 -->
					<!-- paging -->
					<c:forEach begin="${recSearchVO.firstPage}"
						end="${recSearchVO.lastPage }" var='i'>
						<c:if test="${recSearchVO.curPage == i }">
							<li class="page-item active"><a class="page-link" href="#"
								data-page="${i}">${i}</a></li>
						</c:if>
						<c:if test="${recSearchVO.curPage != i }">
							<li class="page-item"><a class="page-link" href="#"
								data-page="${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<!-- paging -->
					<!-- 다음  페이지  -->
					<c:if test="${recSearchVO.lastPage != searchVO.totalPageCount }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/recruitmentView?curPage=${recSearchVO.lastPage+1}" />"
							data-page="${recSearchVO.lastPage+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<!-- 다음  페이지  -->
				</ul>
			</nav>
		</main>
	</div>
</c:if>
	<!-- 로그인했을 때만 연관 채용정보가 보임  -->
	<c:if test="${sessionScope.login != null}">
		<div class="floating">
			<img id="note" src="">
		</div>
	</c:if>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<script>	
	$(document).ready(function () {
		
		// 쿠키 관련 코드
		let cookie = $.cookie("res");
		if (cookie == null) {
		    // 쿠키가 존재하지 않는 경우의 처리
		    $("#note").attr("src", "");
		    console.log("쿠키가 존재하지 않습니다.");
		} else {
		    // 쿠키가 존재하는 경우의 처리
		    $("#note").attr("src", "resources/img/mail.png");
		    }  
		
		// 이미지 선택시 추천 테이블로 이동
		$(".floating").click(function(){
			let _width = '1200';
			let _height = '800';
			let _left = Math.ceil(( window.screen.width - _width )/2);
			let _top = Math.ceil(( window.screen.height - _height )/2); 
			window.open("<c:url value="/recommendView" />","관련 채용 정보",
					'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top)
		});

		// 공고 스크랩 클릭
	    $(".get_clipping").click(function () {            
        let el = $(this).closest('tr'); // 클릭된 클리핑 아이콘이 포함된 행(tr)을 가져옴
        let recruitmentNo = el.find('.recruitment_no').text().trim(); // 해당 행의 제목 정보를 가져옴
        $.ajax({
            url: '<c:url value="/clippingDo" />',
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ 
                memId: "${sessionScope.login.memId}",
                recruitmentNo: recruitmentNo,
            }),
            success: function (res) {
                if(res == 'Y'){
                    // 스크랩 성공 시
                    alert("스크랩됐습니다.");
                    fn_recommend(recruitmentNo); 
                    
                } else if(res =='N'){
                    // 이미 스크랩된 경우
                    alert("스크랩한 공고입니다.");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    });
		
		// 채용 추천
		fn_recommend = (recruitmentNo) =>{
			$.ajax({
				url: "http://192.168.0.31:5000/get_recommend",
				type: "GET",
				data: { "recruitmentNo": recruitmentNo },
				success: function (res) {
					$.cookie("res", res);
					location.reload(); // 페이지를 새로고침
				},
				error: function (e) {
					console.log(e);
				}
			});
		}
		 
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

	let search_form = $("form[name='search']");
	let cur_page =search_form.find('input[name="curPage"]')
	$(document).ready(function(){
		// 10, 20, 30, 40 select box 변경시 선택행만큼 출력되도록
		$("#id_rowSizePerPage").change(function(){
			cur_page.val(1);
			search_form.find('input[name="rowSizePerPage"]').val($(this).val());
			search_form.submit();
		});
		search_form.find("button[type='submit']").click(function(e){
			e.preventDefault(); //디폴트 행동 취소
			cur_page.val(1)
			search_form.submit();
		});
		$('ul.pagination li a[data-page]').click(function(e){
			e.preventDefault();
			cur_page.val($(this).data('page'));
			search_form.submit();
		})
	});
</script>
</body>
</html>
