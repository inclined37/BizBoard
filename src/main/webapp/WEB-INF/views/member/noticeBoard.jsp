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
					<table id="noticeBoardTable" class="table">
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
				<div class="d-none d-md-flex ms-4">
					<select id="searchOption"
						class="BoardSearchSelectTag form-select form-select-sm mb-2 form-control"
						aria-label=".form-select-sm example">
						<option value="" disabled="disabled">--검색--</option>
						<option value="btitle">제목</option>
						<option value="bcontent">내용</option>
						<option value="bname">작성자 이름</option>
					</select>
					<p>&nbsp;&nbsp;</p>
					<input id="searchInput"
						class="form-control border-0 mb-2 BoardSearchTag" type="text"
						placeholder="Search">
					<!-- <button id="searchButton" class="btn btn-primary m-2" type="submit">검색</button> -->
				</div>
				<div id="noticeBoardPagingDiv"
					class="d-flex justify-content-center mt-4">
					<nav>
						<ul class="pagination">
							<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
								<a class="page-link"
								href="/member/noticeBoard?page=${currentPage-1}" tabindex="-1"
								aria-disabled="true">이전</a>
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
	display: flex;
	justify-content: space-between;
}

#boardHeader>select {
	padding: 0px 10px 0px;
}
</style>


<script>
	$(document).ready(function() {
		/* 게시글 전체 목록 가져오기 
		function loadAllPosts() {
		    $.ajax({
		      url: "/api/getAllNoticeBoard",
		      type: "GET",
		      success: function(response) {
		        // 게시글 목록을 받아와서 View 페이지 업데이트
		        let tbody = $("#noticeBoardTable tbody");
		        tbody.empty(); // tbody 비우기
				console.log(response);
		        if (response.length == 0) {
		          // 게시글이 없을 경우
		          let message = "<tr><td colspan='5'>등록된 게시글이 없습니다.</td></tr>";
		          tbody.append(message);
		        } else {
		          // 게시글이 있을 경우
		          $.each(response, function(index, board) {
		            let row = $('<tr>');
		            row.append($('<th scope="row">').text(board.bcode));
		            //row.append($('<td>').html(`<a href="${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=${board.bcode}">${board.bcode}</a>`).text(board.btitle));
		            let titleLink = $('<a>').attr('href', "${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=${board.bcode}").text(board.btitle);
          			row.append($('<td>').append(titleLink));
		            row.append($('<td>').text(board.bname));
		            row.append($('<td>').text(board.bcreated));
		            row.append($('<td>').text(board.bviews));
		            tbody.append(row);
		          });
		        }
		      },
		      error: function() {
		        console.error("게시글 목록 가져오기 실패");
		        let tbody = $("#boardTable tbody");
		        tbody.empty();
		        let message = "<tr><td colspan='5'>게시글 목록을 가져오는 중 오류가 발생했습니다.</td></tr>";
		        tbody.append(message);
		      }
		    });
		  }
		
		  loadAllPosts();
		  $(".page-link").click(function() {
			  let currentPage = this.$(".page-link").val();
			  loadAllPosts();
			  console.log("페이지 값은");
			  let page = $(".page-item .active").val();
				console.log(page);
		  })
		  */
		
		
		/* 게시글 동적 검색 기능 
		$("#searchButton").keyup(function() {
			let searchOption = $("#searchOption").val();
			let searchKeyword = $("#searchInput").val();

			if (!searchKeyword) {
			    // 검색창에 null 값이 입력된 경우 전체 목록 가져오기
	      		loadAllPosts();
		    } else {
		      // 유효한 검색어가 입력된 경우
		        $.ajax({
		            url: "/api/noticeBoardSearch",
		        	type: "POST",
		        	data: {
		          		option: searchOption,
		          		keyword: searchKeyword
		        	},
		        	success: function(response) {
		          	  let tbody = $("#boardTable tbody");
		          	  tbody.empty();

				      if (response.length === 0) {
				          let message = "<tr><td colspan='5'>검색된 결과가 없습니다.</td></tr>";
				          tbody.append(message);
				      } else {
				          for (let i = 0; i < response.length; i++) {
				            let board = response[i];
				            let row = `<tr>
				                         <th scope="row">${board.bcode}</th>
				                         <td><a href="${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=${board.bcode}">${board.btitle}</a></td>
				                         <td>${board.bname}</td>
				                         <td>${board.bcreated}</td>
				                         <td>${board.bviews}</td>
				                       </tr>`;
				            tbody.append(row);
				          }
		              }
		        	},
		        	error: function() {
		          		console.error("검색 요청 실패");
		        	}
		      	});
		      }
		  });
		*/
		});
</script>
<%@include file="../include/footer.jsp"%>