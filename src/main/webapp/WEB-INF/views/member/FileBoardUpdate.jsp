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
							name="btitle" value="${data.btitle}" placeholder="글제목">
						<input type="hidden" name="bcode" value="${data.bcode}">
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
						<!--<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" name="bcontent" style="height: 150px;"
							>${data.bcontent}</textarea> -->
							<textarea class="summernote" name="bcontent" style="height: 150px;">
							${data.bcontent}
							</textarea>
					</div>

					<div class="form-floating mb-3">
						<a>기존 파일명 : ${data.fbOriginfile}</a>
					</div>
					
					<div class="form-floating mb-2">
						<input type="file" name="file" class="form-control"

							id="floatingFile" name="fbOriginfile" placeholder="파일선택" > <label

							for="floatingFile">파일 </label>
					</div>


					<div class="form-floating">
						<button type="submit" class="btn btn-primary m-2">확인</button>
						<button class="btn btn-primary m-2">취소</button>
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
	
	$(document).ready(function() {
	      //content값 가져오기
	      let content = '${post.bcontent}';
	      $('#summernote').summernote('code', content);
	   });
</script>
<%@include file="../include/footer.jsp"%>