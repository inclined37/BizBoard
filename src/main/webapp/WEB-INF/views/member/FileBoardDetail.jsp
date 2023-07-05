<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">파일게시판 상세보기</h6>
				<form id="fileStorageBoardUpdateForm"
					action="${pageContext.request.contextPath}/member/FileBoardUpdate"
					method="post" enctype="multipart/form-data">
					<c:set var="data" value="${data}" />
					<input type="hidden" name="bcode" value="${data.bcode}" />
					<div class="form-floating mb-3">
						<div id="userInfo"></div>
						<input type="text" class="form-control" id="floatingInput"
							name="btitle" value="${data.btitle}" placeholder="글제목"
							readonly="readonly">
					</div>
					<div class="form-floating mb-3">
						<div style="display: flex; align-items: center;">
							<div
								style="width: 60px; height: 60px; background-size: contain; background-image: url('../img/admin.png'); margin-right: 10px;"></div>
							<div>
								<p class="bname"
									style="margin-bottom: 0; font-size: 14px; cursor: pointer;">${data.bname}</p>
								<p style="margin-bottom: 0; font-size: 12px">${data.bcreated}</p>
								<p style="margin-bottom: 0; font-size: 12px">${data.bupdated}</p>
							</div>
						</div>
					</div>

					<div class="form-floating">
						<div class="form-control"
							style="height: 500px; background-color: #E9ECEF; border: 1px solid #CED4DA;">${data.bcontent}
						</div>
					</div>

					<div class="form-floating mb-3">
						<a>기존 파일 : ${data.fbOriginfile}</a> <a
							href="${pageContext.request.contextPath}/member/download?fbSavedfile=${data.fbSavedfile}&fbOriginfile=${data.fbOriginfile}"
							target="_blank">다운로드</a>
					</div>

					<div id="fileUploadField" class="form-floating mb-2"
						style="display: none;">
						<input type="file" name="file" class="form-control"
							id="floatingFile" name="fbOriginfile" placeholder="파일선택">
						<label for="floatingFile">파일</label>
					</div>

					<div id="button-area" class="form-floating">
						<div class="d-flex justify-content-between align-items-center">
							<div>
								<a href="${pageContext.request.contextPath}/member/FileBoard"
									class="btn btn-primary m-2">목록으로</a>
							</div>
							<c:if
								test="${pageContext.request.userPrincipal.name eq data.bid}">
								<div>
									<!-- <button type="button" id="boardDetailUpdateBtn"
										class="btn btn-primary m-2">수정</button> -->
									<a class="btn btn-primary m-2"
										href="${pageContext.request.contextPath}/member/FileBoardUpdate?bcode=${data.bcode}">글수정</a>
									<button type="submit" id="boardDetailSaveBtn"
										class="btn btn-primary m-2" style="display: none;">저장</button>
									<button type="button" id="boardDetailCancelBtn"
										class="btn btn-primary m-2" style="display: none;">취소</button>
									<button type="button" id="boardDetailDeleteBtn"
										class="btn btn-primary m-2">삭제</button>
								</div>
							</c:if>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>


<style>
.bname {
	position: relative;
}

#userInfo {
	display: none;
	position: absolute;
	z-index: 9999;
	background-color: #f9f9f9;
	padding: 15px; /* 패딩을 더 추가 */
	border: 1px solid #ccc;
	font-size: 14px;
	box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.2); /* 그림자 색상 조정 */
	max-width: 320px; /* 최대 너비 지정 */
	word-wrap: break-word; /* 긴 텍스트 줄 바꿈 처리 */
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* 그림자 색상 조정 */
	top: -9px;
}

.close-button {
	position: absolute;
	top: 5px;
	right: 5px;
	padding: 0;
	width: 20px;
	height: 20px;
	line-height: 20px;
	text-align: center;
	font-size: 14px;
	background-color: #f9f9f9;
	border: none;
	cursor: pointer;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* 그림자 색상 조정 */
}
</style>

<script>
const updateBtn = document.getElementById("boardDetailUpdateBtn");
const saveBtn = document.getElementById("boardDetailSaveBtn");
const cancelBtn = document.getElementById("boardDetailCancelBtn");
const deleteBtn = document.getElementById("boardDetailDeleteBtn");
const fileUploadField = document.getElementById("fileUploadField");
const form = document.getElementById("fileStorageBoardUpdateForm");

let title = document.getElementById('floatingInput');
let content = document.getElementById('floatingTextarea');

function adjustTextareaHeight() {
	const textarea = content;
	textarea.style.height = 'auto'; // 초기값으로 설정
	textarea.style.height = Math.max(textarea.scrollHeight, 400) + 'px'; // 최소 세로 길이 400px
}

window.addEventListener('DOMContentLoaded', adjustTextareaHeight);
window.addEventListener('resize', adjustTextareaHeight);


cancelBtn.addEventListener("click", function() {
    saveBtn.style.display = "none";
    cancelBtn.style.display = "none";
    updateBtn.style.display = "inline-block";
    deleteBtn.style.display = "inline-block";
    title.value = previousTitle;
    content.value = previousContent;
    title.readOnly = true;
    content.readOnly = true;
    fileUploadField.style.display = "none";
});

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

updateBtn.addEventListener("click", function() {
    updateBtn.style.display = "none";
    deleteBtn.style.display = "none";
    saveBtn.style.display = "inline-block";
    cancelBtn.style.display = "inline-block";

    previousTitle = title.value;
    previousContent = content.value;

    title.readOnly = false;
    content.readOnly = false;
    
    fileUploadField.style.display = "block"; // 파일 업로드 필드를 보이도록 설정
});



const bname = document.querySelector(".bname");
const userInfo = document.getElementById("userInfo");

// X 버튼 생성
const closeButton = document.createElement("button");
closeButton.innerHTML = "X";
closeButton.classList.add("close-button");

bname.addEventListener("click", function() {
  // 사용자 정보 표시
  userInfo.innerHTML = `이름: ${data.bname}<br>부서명: ${data.bdname}<br>이메일: ${data.bemail}`;
  userInfo.style.display = "block";
  userInfo.style.left = "110px";

  // X 버튼 추가
  userInfo.appendChild(closeButton);
});

closeButton.addEventListener("click", function() {
  // 사용자 정보 숨기기
  userInfo.innerHTML = ""; // 내용 비우기
  userInfo.style.display = "none";
});

updateBtn.addEventListener("click", function() {
    window.location.href = "${pageContext.request.contextPath}/member/FileBoardUpdate.jsp";
});





</script>




<%@include file="../include/footer.jsp"%>