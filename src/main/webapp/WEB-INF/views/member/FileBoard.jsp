<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<div id="boardHeader">
					<h3 class="mb-4">자료게시판</h3>
					<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<a class="btn btn-primary m-2"
							href="${pageContext.request.contextPath}/member/FileBoardInsert">글쓰기</a>
					</se:authorize>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><div class="common-notice">글번호</div></th>
								<th scope="col"><div class="common-notice">제목</div></th>
								<th scope="col"><div class="common-notice">작성자</div></th>
								<th scope="col"><div class="common-notice">작성일</div></th>
								<th scope="col"><div class="common-notice">조회수</div></th>
								<th scope="col"><div class="common-notice">파일명</div></th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="board" items="${data}">
							<tr>
								<th scope="row"><div class="common-notice">${board.bcode}</div></th>
								<td><a class="not-accent" href="${pageContext.request.contextPath}/member/FileBoardDetail?bcode=${board.bcode}">${board.btitle}</a></td>
								<td><div class="common-notice">${board.bname}</div></td>
								<c:set var="formattedDate" value="${fn:substring(board.bcreated, 0, 10)}" />
								<td><div class="common-notice">${formattedDate}</div></td>
								<td><div class="common-notice">${board.bviews}</div></td>
								<td>${board.fbOriginfile}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty data}">
						<div class="container-fluid pt-4 pb-4">등록된 게시물이 없습니다</div>
					</c:if>
				</div>
				<div id="noticeBoardPagingDiv"
					class="d-flex justify-content-center mt-4">
					<nav>
						<ul class="pagination">
							<li class="page-item disabled">
								<a class="page-link" href="#" tabindex="-1"
								aria-disabled="true">이전</a>
							</li>
							<li class="page-item active">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item disabled">
								<a class="page-link" href="#">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp"%>