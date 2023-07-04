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
						<button type="button" id="boardDetailDeleteBtn" class="btn btn-primary m-2">삭제</button>
						<button class="btn btn-primary m-2">목록으로</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
const deleteBtn = document.getElementById("boardDetailDeleteBtn");

deleteBtn.addEventListener("click", function() {
	// 확인 메시지 출력
	if (confirm("게시글을 삭제하시겠습니까?")) {
		// AJAX 요청 생성
		$.ajax({
			url : "/member/fileStorageBoardDelete",
			type : "GET",
			data: {
                bcode: ${data.bcode}
            },
			success : function() {
				// 성공적으로 삭제되었을 때의 동작
				alert("성공적으로 삭제되었습니다");
				window.location.href = "${pageContext.request.contextPath}/member/FileBoard";
				// 추가적인 동작 수행 가능
			},
			error : function() {
				// 삭제 실패 시의 동작
				alert("삭제요청 실패");
				// 추가적인 동작 수행 가능
			}
		});
	}
});
</script>
<%@include file="../include/footer.jsp"%>