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
					action="${pageContext.request.contextPath}/member/FileBoardDetail"
					method="post">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							name="btitle" value="${data.btitle}" placeholder="글제목"
							readonly="readonly">
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
							id="floatingTextarea" name="bcontent" style="height: 150px;"
							readonly="readonly">${data.bcontent}</textarea>
					</div>

					<div class="form-floating mb-3">
						<a>기존 파일명 : ${data.fbOriginfile}</a>
					</div>


					<div class="form-floating">
						<a class="btn btn-primary m-2"
							href="${pageContext.request.contextPath}/member/FileBoardUpdate?bcode=${data.bcode}">글수정</a>
						<button class="btn btn-primary m-2">글삭제</button>
						<button class="btn btn-primary m-2">목록으로</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>