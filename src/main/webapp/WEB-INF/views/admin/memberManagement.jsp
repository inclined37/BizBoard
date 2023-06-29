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
							<div class="bg-light rounded h-100 p-4">
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
										<tbody>
											<tr>
												<th scope="row">10</th>
												<td>7781</td>
												<td>비서실</td>
												<td>이재훈</td>
											</tr>
											<tr>
												<th scope="row">20</th>
												<td>7782</td>
												<td>사장실</td>
												<td>김재훈</td>
											</tr>
											<tr>
												<th scope="row">10</th>
												<td>7783</td>
												<td>비서실</td>
												<td>김재훈</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="memberSearchResults" class="mt-4"></div>
				<div class="d-none d-md-flex ms-4">
					<select id="empSearchSelectTag"
						class="form-select form-select-sm mb-2 form-control"
						aria-label=".form-select-sm example">
						<option value="" disabled="disabled">--검색--</option>
						<option value="empno">사원번호</option>
						<option value="deptno">부서번호</option>
						<option value="membername">사원명</option>
					</select><p>&nbsp;&nbsp;</p><input class="form-control border-0 mb-2 empSearchTag" type="number"
						placeholder="Search" id="memberSearchTag">
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
	    $('#memberSearchTag').keypress(function(event) {
	        if (event.keyCode === 13) { // 엔터 키를 눌렀을 때
	            event.preventDefault(); // 기본 동작 중지
	            var searchText = $(this).val(); // 입력된 검색어 가져오기
	            var searchType = $('#empSearchSelectTag').val(); // 선택된 검색 유형 가져오기
	            console.log('Search Text:', searchText);
	            console.log('Search Type:', searchType);
	            
	            // Ajax 요청 실행
	            $.ajax({
	                type: 'POST', // 요청 방식 설정 (GET 또는 POST)
	                url: '/api/memberSearch', // 서버 요청 경로 설정
	                data: { // 전송할 데이터 설정
	                    searchText: searchText,
	                    searchType: searchType
	                },
	                success: function(result) {
	                    console.log('통신 성공');
	                    console.log(result);
	                    
	                    // 결과 처리 로직 작성
	                },
	                error: function(xhr) {
	                    console.log('통신 에러');
	                    console.log(xhr.status + '에러 코드');
	                }
	            });
	        }
	    });

	$('#empSearchSelectTag').on('change', function() {
		console.log('변경이벤트 실행');
		var selectedValue = $(this).val();
		console.log(selectedValue);
		var inputElement = $('#memberSearchTag');
		console.log(inputElement);

		if (selectedValue == 'empno' || selectedValue == 'deptno') {
			inputElement.attr('type', 'number');
		} else {
			inputElement.attr('type', 'text');
		}
	});
</script>


<%@include file="../include/footer.jsp"%>