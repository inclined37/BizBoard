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
							<tr>
								<th scope="row">1</th>
								<td>2월 10일 정신교육자료 입니다</td>
								<td>kosa</td>
								<td>2021.02.10</td>
								<td>4</td>
								<td>aa.jpg</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>바이러스 아닙니다. 좋은 자료^^</td>
								<td>kosa2</td>
								<td>2021.02.15</td>
								<td>4</td>
								<td>vvv.jpg</td>
								
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>개발에 도움되는 툴 입니다.</td>
								<td>kosa</td>
								<td>2021.02.19</td>
								<td>4</td>
								<td>tool.zip</td>
							</tr>
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