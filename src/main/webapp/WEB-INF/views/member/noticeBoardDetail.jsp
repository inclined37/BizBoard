<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<a href="${pageContext.request.contextPath}/member/noticeBoard">▶공지게시판</a>
			<div class="backToBoard"></div>
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<c:set var="data" value="${data}" />
				<form class="noticeBoardUpdateForm" action="noticeBoardUpdate"
					method="post">
					<input type="hidden" name="bcode" value="${data.bcode}" />
					<div class="form-floating mb-2">
						<input type="text" class="form-control" id="floatingInput" id="floatingText"
							name="btitle" value="${data.btitle}" placeholder="글제목"
							readonly="readonly" required>
						<label for="floatingText">글제목</label>
					</div>
					<div class="form-floating">
						<div id="boardDetailHeaderInfo">
							<div class="profile-image-admin"></div>
							<div id="board-desc" style="border-left: 4px solid #007bff; background-color: #f2f2f2; padding: 10px; margin: 10px 0px; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);">
							    <p style="font-size: 14px; margin: 0; font-weight: bold;">
							        <span style="color: #2c3e50;">${data.bname}</span>
							        <span style="color: #3498db;">${data.bdname}</span>
							        <span style="color: #27ae60;">${data.bemail}</span>
							    </p>
							    <c:if test="${empty data.bupdated}">
							        <p style="font-size: 12px; margin: 0;">
							            작성일: <em>${data.bcreated}</em><span>&nbsp;&nbsp;&nbsp;조회 ${data.bviews}</span>
							        </p>
							    </c:if>
							    <c:if test="${not empty data.bupdated}">
							        <p style="font-size: 12px; margin: 0;">
							            최근수정일: <em>${data.bupdated}</em><span>&nbsp;&nbsp;&nbsp;조회 ${data.bviews}</span>
							        </p>
							    </c:if>
							</div>
						</div>
					</div>
					<div>
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" name="bcontent" readonly="readonly"
							required>${data.bcontent}</textarea>
					</div>
					<div class="form-check form-check-inline" style="display: none;">
                        <input class="form-check-input" type="radio" name="nbchecked" id="inlineRadio1" value="0" checked>
                        <label class="form-check-label" for="inlineRadio1">일반 노출</label>
                    </div>
					<div class="form-check form-check-inline" style="display: none;">
                        <input class="form-check-input" type="radio" name="nbchecked" id="inlineRadio1" value="1">
                        <label class="form-check-label" for="inlineRadio1">상단 노출</label>
                    </div>
					<div id="button-area" class="form-floating">
						<div>
							<a href="${pageContext.request.contextPath}/member/noticeBoard"
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


<script>
	const updateBtn = document.getElementById("boardDetailUpdateBtn");
	const saveBtn = document.getElementById("boardDetailSaveBtn");
	const cancelBtn = document.getElementById("boardDetailCancelBtn");
	const deleteBtn = document.getElementById("boardDetailDeleteBtn");

	let title = document.getElementById('floatingInput');
	let content = document.getElementById('floatingTextarea');

	function adjustTextareaHeight() {
		const textarea = content;
		textarea.style.height = 'auto'; // 초기값으로 설정
		textarea.style.height = Math.max(textarea.scrollHeight, 400) + 'px'; // 최소 세로 길이 400px
	}

	window.addEventListener('DOMContentLoaded', adjustTextareaHeight);
	window.addEventListener('resize', adjustTextareaHeight);

	updateBtn.addEventListener("click", function() {
		updateBtn.style.display = "none";
		deleteBtn.style.display = "none";
		saveBtn.style.display = "inline-block";
		cancelBtn.style.display = "inline-block";

		previousTitle = title.value;
		previousContent = content.value;

		title.readOnly = false;
		content.readOnly = false;
		
		$(".form-check.form-check-inline").css("display","inline-block");
	});

	saveBtn.addEventListener("click", function(event) {
		if (title.value.trim() == '' || content.value.trim() == '') {
			event.preventDefault();
			alert('제목과 내용을 모두 입력해주세요.');
		} else {
			saveBtn.style.display = "none";
			cancelBtn.style.display = "none";
			updateBtn.style.display = "inline-block";
			deleteBtn.style.display = "inline-block";
			document.getElementById("noticeBoardUpdateForm").submit();
			$(".form-check.form-check-inline").css("display","none");
		}
	});

	cancelBtn.addEventListener("click", function() {
		saveBtn.style.display = "none";
		cancelBtn.style.display = "none";
		updateBtn.style.display = "inline-block";
		deleteBtn.style.display = "inline-block";
		title.value = previousTitle;
		content.value = previousContent;
		title.readOnly = true;
		content.readOnly = true;
		$(".form-check.form-check-inline").css("display","none");
	});

	deleteBtn.addEventListener("click", function() {
		// 확인 메시지 출력
		if (confirm("게시글을 삭제하시겠습니까?")) {
			// AJAX 요청 생성
			$.ajax({
				url : "/member/noticeBoardDelete",
				type : "GET",
				data: {
	                bcode: ${data.bcode}
	            },
				success : function() {
					// 성공적으로 삭제되었을 때의 동작
					alert("성공적으로 삭제되었습니다");
					window.location.href = "${pageContext.request.contextPath}/member/noticeBoard";
				},
				error : function() {
					// 삭제 실패 시의 동작
					alert("삭제요청 실패");
				}
			});
		}
	});
</script>
<%@include file="../include/footer.jsp"%>