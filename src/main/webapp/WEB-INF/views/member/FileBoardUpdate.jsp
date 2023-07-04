<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">파일게시판 상세보기</h6>
				<form
					action="${pageContext.request.contextPath}/member/FileBoardUpdate"
					method="post" enctype="multipart/form-data">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							name="btitle" value="${data.btitle}" placeholder="글제목"> <input
							type="hidden" name="bcode" value="${data.bcode}">
					</div>
					<div class="form-floating mb-3">
						<div style="display: flex; align-items: center;">
							<div
								style="width: 60px; height: 60px; background-size: contain; background-image: url('../img/admin.png'); margin-right: 10px;"></div>
							<div>
								<p style="margin-bottom: 0; font-size: 14px">${data.bname}</p>
								<p style="margin-bottom: 0; font-size: 12px">${data.bcreated}</p>
								<p style="margin-bottom: 0; font-size: 12px">${data.bupdated}</p>
							</div>
						</div>
					</div>

					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" name="bcontent" style="height: 150px;">${data.bcontent}</textarea>
					</div>

					<div class="form-floating mb-3">
						<a>기존 파일명 : ${data.fbOriginfile}</a>
					</div>

					<div class="form-floating mb-2">
						<input type="file" name="file" class="form-control"
							id="floatingFile" name="fbOriginfile" placeholder="파일선택">
						<label for="floatingFile">파일 </label>
					</div>


					<!-- <div class="form-floating">
						<div class="float-start">
							<button class="btn btn-primary m-2">목록으로</button>
						</div>
						<div class="float-end">
							<button type="submit" class="btn btn-primary m-2">수정</button>
							<button>취소</button>
						</div>
					</div> -->
					<div id="button-area" class="form-floating">
						<div>
							<a href="${pageContext.request.contextPath}/member/FileBoard"
								class="btn btn-primary m-2">목록으로</a>
						</div>
						<c:if test="${pageContext.request.userPrincipal.name eq data.bid}">
							<div>
								<button type="button" id="boardDetailUpdateBtn"
									class="btn btn-primary m-2">수정</button>
								<button type="submit" id="boardDetailSaveBtn"
									class="btn btn-primary m-2" style="display: none;">저장</button>
								<button type="button" id="boardDetailCancelBtn"
									class="btn btn-primary m-2" style="display: none;">취소</button>
								<button type="button" id="boardDetailDeleteBtn"
									class="btn btn-primary m-2">삭제</button>
							</div>
						</c:if>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>