<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<!-- xl 숫자 건드리면 input 태그 길어지거나 짧아짐 -->
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">공지사항 자세히 보기</h6>
				<form action="noticeBoardInsert" method="post">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							name="btitle" placeholder="글제목" readonly="readonly">
					</div>
					<div class="form-floating mb-3">
						<div style="display: flex; align-items: center;">
							<div style="width: 60px; height: 60px;background-size:contain; background-image: url('../img/admin.png'); margin-right: 10px;"></div>
							<div>
								<p style="margin-bottom: 0; font-size:14px">작성자</p>
								<p style="margin-bottom: 0; font-size:12px">최초작성일: 2012-02-24</p>
								<p style="margin-bottom: 0; font-size:12px">최근수정일: 2012-02-24</p>
							</div>
						</div>
					</div>

					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" name="bcontent" style="height: 150px; readonly="readonly"></textarea>
					</div>
					<div class="form-floating">
						<button class="btn btn-primary m-2">글수정</button>
						<button class="btn btn-primary m-2">글삭제</button>
						<button class="btn btn-primary m-2">목록으로</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>