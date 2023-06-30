<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>




<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<h3 class="mb-4">자료게시판</h3>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<th scope="col">파일명</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="board" items="${data}">
							<tr>
								<th scope="row">${board.bcode}</th>
								<td>${board.btitle}</td>
								<td>${board.bname}</td>
								<td>${board.bcreated}</td>
								<td>${board.bviews}</td>
								<td>${board.fbOriginfile}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
					<a class="btn btn-primary m-2" href="${pageContext.request.contextPath}/member/FileBoardInsert">글작성</a>
					</se:authorize>
				</div>
			</div>
		</div>
	</div>
	</div>


	<%@include file="../include/footer.jsp"%>