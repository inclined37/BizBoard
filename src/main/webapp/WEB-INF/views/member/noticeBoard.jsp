<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>




<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<h3 class="mb-4">공지게시판</h3>
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
<<<<<<< HEAD
							<tr>
								<th scope="row">1</th>
								<td>John</td>
								<td>Doe</td>
								<td>jhon@email.com</td>
								<td>1</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>mark@email.com</td>
								<td>10</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>jacob@email.com</td>
								<td>20</td>
							</tr>
						</tbody>
					</table>
					<se:authorize access="hasAnyRole('ROLE_ADMIN')">
					<a class="btn btn-primary m-2" href="${pageContext.request.contextPath}/admin/noticeBoardInsert">글작성</a>
=======
							<c:forEach var="board" items="${data}">
								<tr>
									<th scope="row">${board.bcode}</th>
									<td>${board.btitle}</td>
									<td>${board.bname}</td>
									<td>${board.bcreated}</td>
									<td>${board.bviews}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<se:authorize access="hasAnyRole('ROLE_ADMIN')">
						<a class="btn btn-primary m-2"
							href="${pageContext.request.contextPath}/admin/noticeBoardInsert">글작성</a>
>>>>>>> d3dd20fbb7dd84e292e0ecefb2bf4e0ad9c4aace
					</se:authorize>
				</div>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	</div>
=======
</div>
>>>>>>> d3dd20fbb7dd84e292e0ecefb2bf4e0ad9c4aace






<<<<<<< HEAD
	<%@include file="../include/footer.jsp"%>
=======
<%@include file="../include/footer.jsp"%>
>>>>>>> d3dd20fbb7dd84e292e0ecefb2bf4e0ad9c4aace
