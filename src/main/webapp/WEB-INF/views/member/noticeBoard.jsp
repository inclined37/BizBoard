<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<div id="boardHeader">
					<h3 class="mb-4">공지게시판</h3>
					<se:authorize access="hasAnyRole('ROLE_ADMIN')">
						<a class="btn btn-primary m-2"
							href="${pageContext.request.contextPath}/admin/noticeBoardInsert">글쓰기</a>
					</se:authorize>
				</div>
				<div class="table-responsive">
					<table id="noticeBoardTable" class="table">
						<thead>
							<tr>
								<th scope="col"><div class="common-notice">글번호</div></th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${data}">
								<tr <c:if test="${board.nbchecked eq 1}">class="accentRow"</c:if>>
									<c:if test="${board.nbchecked eq 1}">
										<td><div class="important-notice">중요</div></td>
									</c:if>
									<c:if test="${board.nbchecked eq 0}">
										<th scope="row"><div class="common-notice">${board.bcode}</div></th>
									</c:if>
									<td><a <c:if test="${board.nbchecked eq 1}">class="accent"</c:if>
									<c:if test="${board.nbchecked eq 0}">class="not-accent"</c:if>
									 href="${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=${board.bcode}">${board.btitle}</a></td>
									<td>${board.bname}</td>
									<%-- <td>${board.bcreated}</td> --%>
									<c:set var="formattedDate" value="${fn:substring(board.bcreated, 0, 10)}" />
									<td>${formattedDate}</td>
									<td>${board.bviews}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty data}">
						<div class="container-fluid pt-4 pb-4">등록된 게시물이 없습니다</div>
					</c:if>
				</div>
				<div id="noticeBoardSearchDiv" class="d-none d-md-flex ms-4">
					<select id="searchOption"
						class="BoardSearchSelectTag form-select form-select-sm mb-2 form-control"
						aria-label=".form-select-sm example">
						<option value="btitle" selected>제목</option>
						<option value="bcontent">내용</option>
						<option value="bname">작성자 이름</option>
					</select>
					<p>&nbsp;&nbsp;</p>
					<input id="searchInput" 
					class="form-control border-0 mb-2 BoardSearchTag" type="text" 
					placeholder="검색어를 입력해주세요">
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

.accentRow {
	background-color: #EAEDF0;
}

.accent {
	color: #F57171;
}

.not-accent {
	color: #757575;
}

.important-notice {
	background-color: rgba(255,182,182,0.5);
	text-align: center;
	color: #F57171;
	border-radius: 2px;
	border: 1px;
	border-color: #F57171;
	border-style: solid;
}

.common-notice {
	text-align: center;
}

#noticeBoardSearchDiv {
	margin-top: 20px;
	justify-content: center;
}

#noticeBoardSearchDiv select {
	width: 160px;
}

#noticeBoardSearchDiv > select > option {
	padding: 8px 0px;
}

#noticeBoardSearchDiv input {
	width: 50%;
}

#noticeBoardPagingDiv nav{
	margin-top: 40px;
	align-items: center;
}
</style>


<script>
$(document).ready(function() {
	  /* 게시글 전체 목록 가져오기 */
	  function loadAllPosts() {
	    $.ajax({
	      url: "/api/getAllNoticeBoard",
	      type: "GET",
	      success: function(response) {
	        // 게시글 목록을 받아와서 View 페이지 업데이트
	        let tbody = $("#noticeBoardTable tbody");
	        tbody.empty(); // tbody 비우기
	        //console.log(response);
	        if (response.length == 0) {
	          // 게시글이 없을 경우
	          let message = "<tr><td colspan='5'>등록된 게시글이 없습니다.</td></tr>";
	          tbody.append(message);
	        } else {
	          // 게시글이 있을 경우
	          $.each(response, function(index, board) {
	            let row = $('<tr>');
	            if(board.nbchecked == 1) {
	            	row.addClass("accentRow"); // 스타일 클래스 추가
	                row.append($('<td>').html('<div class="important-notice">중요</div>'));
	            	let titleLink = $('<a>').attr('href', "${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=" + board.bcode).text(board.btitle).addClass("accent");
	            	row.append($('<td>').append(titleLink));
	            } else {
	            	console.log()
	            	row.append($('<td scope="row">').html('<div class="common-notice">' + board.bcode + '</div>'));
	            	let titleLink = $('<a>').attr('href', "${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=" + board.bcode).text(board.btitle).addClass("not-accent");
	            	row.append($('<td>').append(titleLink));
	            }
	            row.append($('<td>').text(board.bname));
	            row.append($('<td>').text(board.bcreated.substring(0, 10)));
	            row.append($('<td>').text(board.bviews));
	            tbody.append(row);
	          });
	          
	          //동적 페이징 처리
	          let pageArea = $("#noticeBoardPagingDiv nav ul");
	          pageArea.empty();
	          
	          let currentPage = ${currentPage};
	          let totalPage = ${totalPage};
	          
	          //이전 페이지 버튼
	          let prevBtn = $('<li>').addClass('page-item disabled');
	          let prevA = $('<a>').addClass('page-link')
	                          .attr({
	                            'href': '#',
	                            'tabindex': '-1',
	                            'aria-disabled': 'true'
	                          })
	                          .text('이전');
	          prevBtn.append(prevA);
	          pageArea.append(prevBtn);

	          //페이지 버튼
	          for(let i=1; i<=totalPage; i++) {
	        	if(i == 1){
	        	  let pageBtn = $('<li>').addClass('page-item active');
	        	  let pageA = $('<a>').addClass('page-link')
					.attr('href', '#').text(i);
				  pageBtn.append(pageA);
				  pageArea.append(pageBtn);
	        	} else {
	        	  let pageBtn = $('<li>').addClass('page-item');
	        	  let pageA = $('<a>').addClass('page-link')
					.attr('href', '#').text(i);
				  pageBtn.append(pageA);
				  pageArea.append(pageBtn);
	        	}
	        	
	          }
	          
	          //다음 페이지 버튼
	          let nextBtn = $('<li>').addClass('page-item ');
	          let nextA = $('<a>').addClass('page-link')
	                          .attr({
	                            'href': '#',
	                            'tabindex': '-1',
	                            'aria-disabled': 'true'
	                          })
	                          .text('다음');
	          nextBtn.append(nextA);
	          pageArea.append(nextBtn);
	        }
	      },
	      error: function() {
	        console.error("게시글 목록 가져오기 실패");
	        //let tbody = $("#noticeBoardTable tbody");
	        //tbody.empty();
	        //let message = "<tr><td colspan='5'>게시글 목록을 가져오는 중 오류가 발생했습니다.</td></tr>";
	        //tbody.append(message);
	      }
	    });
	  }
	  

	  
	  /* 게시글 동적 검색 기능 */
	  $("#searchInput").keyup(function() {
	    let searchOption = $("#searchOption").val();
	    let searchKeyword = $("#searchInput").val();

	    if (!searchKeyword) {
	      // 검색창에 null 값이 입력된 경우 전체 목록 가져오기
	      loadAllPosts();
		  //location.reload();
	    } else {
	      // 유효한 검색어가 입력된 경우
	      $.ajax({
	        url: "/api/noticeBoardSearch",
	        type: "POST",
	        data: JSON.stringify({
	            option: searchOption,
	            keyword: searchKeyword
	        }),
	        contentType: "application/json",
	        success: function(response) {
	          let tbody = $("#noticeBoardTable tbody");
	          tbody.empty();
	          if (response.length == 0) {
	            //검색된 결과가 존재하지 않습니다
	          } else {
				  console.log(response);
	              $.each(response, function(index, board) {
	  	            let row = $('<tr>');
	  	            row.append($('<th scope="row">').text(board.bcode));
	  	            let titleLink = $('<a>').attr('href', "${pageContext.request.contextPath}/member/noticeBoardDetail?bcode=" + board.bcode).text(board.btitle);
	  	            row.append($('<td>').append(titleLink));
	  	            row.append($('<td>').text(board.bname));
	  	            row.append($('<td>').text(board.bcreated.substring(0, 10)));
	  	            row.append($('<td>').text(board.bviews));
	  	            tbody.append(row);
	  	          });
	              
	              
	            //동적 페이징 처리
		          let pageArea = $("#noticeBoardPagingDiv nav ul");
		          pageArea.empty();
		          
		          let currentPage = ${currentPage};
		          let totalPage = ${totalPage};
		          
		          //이전 페이지 버튼
		          let prevBtn = $('<li>').addClass(`page-item ${currentPage == 1 ? 'disabled' : ''}`);
		          let prevA = $('<a>').addClass('page-link')
		                          .attr({
		                            'href': `/api/getAllNoticeBoard?page=${currentPage - 1}`,
		                            'tabindex': '-1',
		                            'aria-disabled': 'true'
		                          })
		                          .text('이전');
		          prevBtn.append(prevA);
		          pageArea.append(prevBtn);

		          //페이지 버튼
		        	let pageBtn = $('<li>').addClass('page-item active');
		        	let pageA = $('<a>').addClass('page-link')
		        					.attr('href', '#').text(1);
		        	pageBtn.append(pageA);
		        	pageArea.append(pageBtn);
		          
		          //다음 페이지 버튼
		          let nextBtn = $('<li>').addClass('page-item disabled');
		          let nextA = $('<a>').addClass('page-link')
		                          .attr({
		                            'href': `/api/getAllNoticeBoard?page=${currentPage - 1}`,
		                            'tabindex': '-1',
		                            'aria-disabled': 'true'
		                          })
		                          .text('다음');
		          nextBtn.append(nextA);
		          pageArea.append(nextBtn);
	          
	          }
	        },
	        error: function() {
	            console.error("검색 요청 실패");
	            let pageArea = $("#noticeBoardPagingDiv nav ul");
		          pageArea.empty();
	        }
	    });
	  }
	});
});

</script>
<%@include file="../include/footer.jsp"%>