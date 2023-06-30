<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="container-fluid pt-4 px-2">
	<div class="row g-12 align-items-center justify-content-center">
		<div class="col-sm-12 col-xl-12">
			<div
				class="bg-light rounded h-100 p-4 d-flex flex-column justify-content-center align-items-center">
				<div class="container-fluid pt-4 px-4">
					<div class="row g-4">
						<div class="col-12">
							<div class="bg-light rounded h-100 p-4 ">
								<h3 class="mb-4">사원목록</h3>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">부서번호</th>
												<th scope="col">사원번호</th>
												<th scope="col">부서명</th>
												<th scope="col">이름</th>
											</tr>
										</thead>
										<tbody id="memberTableBody">
											<c:forEach var="member" items="${memberList}">
												<tr>
													<td>${member.deptno}</td>
													<td class="memberTableBodyTdTag">${member.empno}</td>
													<td>${member.dname}</td>
													<td>${member.membername}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<button type="button" id="adminPageGetMemberList" class="btn btn-outline-primary m-2">목록불러오기</button>
							</div>
						</div>
					</div>
				</div>
				<div id="memberSearchResults" class="mt-4"></div>
				<div class="d-none d-md-flex ms-4">
					<select class="empSearchSelectTag"
						class="form-select form-select-sm mb-2 form-control"
						aria-label=".form-select-sm example">
						<option value="" disabled="disabled">--검색--</option>
						<option value="empno">사원번호</option>
						<option value="deptno">부서번호</option>
						<option value="membername">사원명</option>
					</select>
					<p>&nbsp;&nbsp;</p>
					<input class="form-control border-0 mb-2 empSearchTag"
						type="number" placeholder="Search" id="memberSearchTag">
				</div>
				<div id="memberManagementPagingDiv" class="d-flex justify-content-center mt-4">
					<nav>
						<ul class="pagination">
							<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
								<a class="page-link"
								href="/admin/memberManagement?page=${currentPage-1}"
								tabindex="-1" aria-disabled="true">이전</a>
							</li>
							<c:forEach var="i" begin="1" end="${totalPage}">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link" href="/admin/memberManagement?page=${i}">${i}</a>
								</li>
							</c:forEach>
							<li
								class="page-item ${currentPage == totalPage ? 'disabled' : ''}">
								<a class="page-link"
								href="/admin/memberManagement?page=${currentPage+1}">다음</a>
							</li>
						</ul>
					</nav>
				</div>

			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>