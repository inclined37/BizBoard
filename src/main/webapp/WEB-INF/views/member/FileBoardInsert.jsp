<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<h3 class="mb-4">파일공유게시판 글쓰기</h3>

				<form action="${pageContext.request.contextPath}/member/FileBoardInsert" method="post" enctype="multipart/form-data">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput" name="btitle"
							placeholder="글제목"> <label for="floatingInput">글제목</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput" name="bid"
							placeholder="작성자" value="${pageContext.request.userPrincipal.name}" readonly="readonly"> <label

							for="floatingInput">작성자</label>
					</div>
					<div class="form-floating mb-3">
						<!-- <input class="form-control" placeholder="Leave a comment here"

							id="floatingTextarea" name="bcontent" style="height: 150px;"></input> -->
							 
							<textarea class="summernote" name="bcontent"></textarea>
					</div>
					<div class="form-floating mb-2">
						<input type="file" name="file" class="form-control"

							id="floatingFile" name="fbOriginfile" placeholder="파일선택" > <label

							for="floatingFile">파일 </label>
					</div>

					<div class="form-floating">
						<button class="btn btn-primary m-2" id = "submit-btn" type="submit">글작성</button>
						<a class="btn btn-primary m-2" id="cancle-btn" href="${pageContext.request.contextPath}/member/FileBoard">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>





<script>
	$('.summernote').summernote({
	  height: 150,
	  /* lang: "ko-KR" */
	});
	document.querySelector('#floatingFile').addEventListener('change', function (event) {
	    // 파일 선택시 이벤트 발생
	    var file = event.target.files[0];
	    var maxFileSize = 10 * 1024 * 1024; // 10MB
	    
	    // 선택된 파일의 크기가 10MB를 초과하면 경고를 표시하고 선택 취소
	    if (file && file.size > maxFileSize) {
	        alert('파일 용량은 10MB까지 가능합니다.');
	        event.target.value = ''; // 파일 선택을 취소
	    }
 	});
</script>

<%@include file="../include/footer.jsp"%>