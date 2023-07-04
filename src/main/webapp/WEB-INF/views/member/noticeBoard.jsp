<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>




<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<div id="boardHeader">
					<h3 class="mb-4">공지게시판</h3>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${data}">
								<tr>
									<th scope="row">${board.bcode}</th>
									<td><a href="${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=${board.bcode}">${board.btitle}</a></td>
									<td>${board.bname}</td>
									<td>${board.bcreated}</td>
									<td>${board.bviews}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty data}">
						<div class="container-fluid pt-4 pb-4">등록된 게시물이 없습니다</div>
					</c:if>
					<se:authorize access="hasAnyRole('ROLE_ADMIN')">
						<a class="btn btn-primary m-2"
							href="${pageContext.request.contextPath}/admin/noticeBoardInsert">글작성</a>
					</se:authorize>
				</div>
				<div id="noticeBoardPagingDiv" class="d-flex justify-content-center mt-4">
					<nav>
						<ul class="pagination">
							<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
								<a class="page-link"
								href="/member/noticeBoard?page=${currentPage-1}"
								tabindex="-1" aria-disabled="true">이전</a>
							</li>
							<c:forEach var="i" begin="1" end="${totalPage}">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link" href="/member/noticeBoard?page=${i}">${i}</a>
								</li>
							</c:forEach>
							<li
								class="page-item ${currentPage == totalPage ? 'disabled' : ''}">
								<a class="page-link"
								href="/member/noticeBoard?page=${currentPage+1}">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>




<style>
	#boardHeader {
		display:flex;
		justify-content: space-between;
	}
	
	#boardHeader > select {
		padding: 0px 10px 0px;
	}
</style>

<%@include file="../include/footer.jsp"%>