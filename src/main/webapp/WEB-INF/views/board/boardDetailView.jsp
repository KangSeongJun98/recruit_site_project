<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판 상세</title>
<style>
.del_reply{cursor: pointer;} 
</style>
</head>
<body>
	<!-- 모든 페이지 상단에 들어가는 부분 -->
	<%@include file="/WEB-INF/inc/top.jsp"%>

	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 6%;">
			<!-- Contact Section Form-->
			<div class="row justify-content-center" style="margin-bottom: 50px;">
				<div class="col-lg-8 col-xl-7">
					<table style="width: 100%; text-align: center;">
						<tr>
							<td><strong>제목:&nbsp;</strong> ${board.boardTitle}</td>
							<td><strong>작성자:&nbsp; </strong> ${board.memNm}</td>
							<td><strong>작성일:&nbsp;</strong> ${board.boardDate}</td>
						</tr>
					</table>
					<div class="mb-3">
						<textarea readonly class="form-control bg-white"
							style="height: 20rem">${board.boardContent}</textarea>
					</div>

					<!-- 세션 아이디랑 게시글 작성한 아이디랑 같을 때  -->
					<c:if test="${sessionScope.login.memId == board.memId }">
						<div class="col-lg-7 d-flex justify-content-end">
							<!-- 수정 버튼  -->
							<form action='<c:url value="boardEditView" />' method="post">
								<input type="submit" class="btn btn-warning me-2" value="수정">
								<input type="hidden" name="boardNo" value="${board.boardNo }">
							</form>

							<!-- 삭제 버튼  -->
							<form action="<c:url value="boardDel" />" method="post"
								id="delForm">
								<input type="button" class="btn btn-danger me-2" value="삭제"
									onclick="fn_check()"> <input type="hidden"
									name="boardNo" value="${board.boardNo }">
							</form>
						</div>
					</c:if>

				</div>
			</div>
			<form id="replyForm" action="" method="post">
				<div class="row justify-content-center">
					<div class="row col-lg-8 col-xl-7">
						<div class="col-lg-9">
							<input class="form-control" type="text" id="replyInput"
								name="replyContent"> <input type="hidden" name="memId"
								value="">
						</div>
						<div class="col-lg-3">
							<button type="button" class="btn btn-info me-2"
								onclick="fn_reply('${sessionScope.login.memId}','${board.boardNo}')">등록
							</button>
						</div>
					</div>
				</div>
			</form>
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<table class="table">
						<tbody id="replyBody">
							<c:forEach items="${replyList }" var="reply">
								<tr id="${reply.replyNo}">
									<td>${reply.replyContent }</td>
									<td>${reply.memNm}</td>
									<td>${reply.replyDate}</td>
									<c:if test="${reply.memId eq sessionScope.login.memId}">
										<td class="del_reply"
											onclick="del_reply('${reply.replyNo}','${board.boardNo}')">❌</td>
									</c:if>
									<c:if test="${reply.memId ne sessionScope.login.memId}">
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>

	<script>
			function fn_check(){
				if(confirm("정말 삭제하시겠습니까?")){
					document.getElementById("delForm").submit();
				}
			}
			
			fn_reply= (p_id, p_no) => {
				if(p_id ==''){
					alert("로그인 후 작성할 수 있습니다.")
					// 하위 if문 안타도록 미리 차단
					return;
				}
				let msg = $("#replyInput").val();
				if(msg ==''){
					alert("내용을 작성해주세요")
					return;
				}
				let json_data = {'boardNo' : p_no	
								,'memId': p_id
								,'replyContent': msg};
				$.ajax({
					url: '<c:url value= "writeReplyDo"/>'
				   ,type: 'POST'
				   ,contentType: 'application/json'
				   ,dataType:'json'
				   ,data: JSON.stringify(json_data)
				   ,success:function(res){
					   console.log(res)
					   let str ="";
					   str += "<tr id='"+res.replyNo+"'>";
					   str += "<td>"+ res.replyContent +"</td>";
					   str += "<td>"+ res.memNm +"</td>";
					   str += "<td>"+ res.replyDate +"</td>";
					   if(res.memId == "${sessionScope.login.memId}"){
					   str += "<td class='del_reply'>❌</td>";
					   }else{
						   str += "<td></td>";
						   
					   }
					   str += "</tr>";
					   $("#replyBody").prepend(str);
					   $("#replyInput").val('');
					   location.reload();
				   },error:function(e){
					   console.log(e)
				   }
				});
			}			
			
			
			// 댓글 삭제
			del_reply= (reply_no, board_no) => {
				if (confirm("댓글을 삭제하시겠습니까?")) {
				let json_data = {'boardNo' : board_no	
								,'replyNo': reply_no};
				$.ajax({
					url: '<c:url value= "replyDel"/>'
				   ,type: 'POST'
				   ,contentType: 'application/json'
				   ,dataType:'json'
				   ,data: JSON.stringify(json_data)
				   ,success:function(res){
					   location.reload();
					   
				   },error:function(e){
					   console.log(e)
					   location.reload();
				  		}
					});
				}
			}
			
			
		</script>
</body>
</html>


