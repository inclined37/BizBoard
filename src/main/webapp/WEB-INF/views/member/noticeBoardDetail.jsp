<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<a href="${pageContext.request.contextPath}/member/noticeBoard">▶공지게시판</a>
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<c:set var="data" value="${data}"/>
				<form id="noticeBoardUpdateForm" action="noticeBoardUpdate" method="post">
					<input type="hidden" name="bcode" value="${data.bcode}" />
					<div>
						<input type="text" class="form-control" id="floatingInput"
							name="btitle" value="${data.btitle}" placeholder="글제목" readonly="readonly">
					</div>
					<div class="form-floating">
						<div id="" style="display: flex; align-items: center;">
							<div id="profile-image"></div>
							<div id="board-desc">
								<p style="font-size:14px">${data.bname}</p>
								<c:if test="${empty data.bupdated}">
									<p style="font-size:12px">작성일: ${data.bcreated}<span>&nbsp;&nbsp;&nbsp;조회 ${data.bviews}</span></p>
								</c:if>
								<c:if test="${not empty data.bupdated}">
									<p style="font-size:12px">최근수정일: ${data.bupdated}<span>&nbsp;&nbsp;&nbsp;조회 ${data.bviews}</span></p>
								</c:if>
							</div>
						</div>
					</div>
					<div>
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" name="bcontent" readonly="readonly">${data.bcontent}</textarea>
					</div>
					<div id="button-area" class="form-floating">
						<div>
							<a href="${pageContext.request.contextPath}/member/noticeBoard" class="btn btn-primary m-2">목록으로</a>
						</div>
						<c:if test="${pageContext.request.userPrincipal.name eq data.bid}">
						  <div>
						    <button type="button" id="boardDetailUpdateBtn" class="btn btn-primary m-2">수정</button>
						    <button type="submit" id="boardDetailSaveBtn" class="btn btn-primary m-2" style="display: none;">저장</button>
						    <button type="button" id="boardDetailCancelBtn" class="btn btn-primary m-2" style="display: none;">취소</button>
						    <button type="button" id="boardDetailDeleteBtn" class="btn btn-primary m-2">삭제</button>
						  </div>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<style>
	#backToBoardList {
		margin-bottom: 100px;
	}
	
	#profile-image {
		width: 60px; 
		height: 60px;
		margin: 10px;
		background-image: url('../img/admin.png'); 
		background-size:contain; 
		background-repeat: no-repeat;
	}
	
	#board-desc {
		margin-left: 10px;
	}
	
	#board-desc > p {
		margin-bottom: 0px;
	}
	
	#floatingInput #floatingTextarea {
		padding-top: 10px;
		resize: none;
		background-color: white;
	}
	
	#button-area {
		margin-top:10px;
		display: flex;
		justify-content: space-between;
	}
</style>
<script>
	function adjustTextareaHeight() {
		const textarea = document.getElementById('floatingTextarea');
		textarea.style.height = 'auto'; // 초기값으로 설정
		textarea.style.height = Math.max(textarea.scrollHeight, 400) + 'px'; // 최소 세로 길이 400px
	}
	
	window.addEventListener('DOMContentLoaded', adjustTextareaHeight);
	window.addEventListener('resize', adjustTextareaHeight);
	
	const updateBtn = document.getElementById("boardDetailUpdateBtn");
	const saveBtn = document.getElementById("boardDetailSaveBtn");
	const cancelBtn = document.getElementById("boardDetailCancelBtn");
	const deleteBtn = document.getElementById("boardDetailDeleteBtn");
	
	updateBtn.addEventListener("click", function() {
		updateBtn.style.display = "none";
	    deleteBtn.style.display = "none";
	    saveBtn.style.display = "inline-block";
	    cancelBtn.style.display = "inline-block";
	    
	    document.getElementById("floatingInput").readOnly = false;
	    document.getElementById("floatingTextarea").readOnly = false;
	});
	
	saveBtn.addEventListener("click", function() {
	    saveBtn.style.display = "none";
	    cancelBtn.style.display = "none";
	    updateBtn.style.display = "inline-block";
	    deleteBtn.style.display = "inline-block";
	    
	    document.getElementById("noticeBoardUpdateForm").submit();
	});

	cancelBtn.addEventListener("click", function() {
	    saveBtn.style.display = "none";
	    cancelBtn.style.display = "none";
	    updateBtn.style.display = "inline-block";
	    deleteBtn.style.display = "inline-block";
	});
	
</script>
<%@include file="../include/footer.jsp"%>