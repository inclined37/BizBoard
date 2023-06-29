<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">공지사항 작성</h6>
				<form action="noticeBoardInsert" method="post">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput" name="bTitle"
							placeholder="글제목"> <label for="floatingInput">글제목</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput" name="bId"
							placeholder="작성자" value="${pageContext.request.userPrincipal.name}" readonly="readonly"> <label
							for="floatingInput">작성자</label>
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" name="bContent" style="height: 150px;"></textarea>
						<label for="floatingTextarea">글내용</label>
					</div>
					<div class="form-floating">
						<button class="btn btn-primary m-2" type="submit">글작성</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>







<%@include file="../include/footer.jsp"%>