<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row h-100 align-items-center justify-content-center"
		style="min-height: 100vh;">
		<div class="col-12 col-sm-8 col-md-8 col-lg-6 col-xl-10">
			<!-- col-xl-10 해당부분이 가로길이  -->
			<div class="bg-light rounded p-4 p-sm-4 my-2 mx-3">
				<!-- my-1 헤더서치바와의 간격 p-sm-5 전체영역을 둘러싸는 회색영역 -->
				<div class="d-flex align-items-center justify-content-between mb-1">
					<a href="index.html" class="text-primary"> <i
						class="fa fa-hashtag me-1"></i>비즈보드
						<h3 class="text-primary">
							<i class="fa fa-hashtag me-1"></i>BizBoard
						</h3>
					</a>
					<h3>회원 가입</h3>
				</div>
				<form id="signupForm" action="signup" method="post"
					enctype="multipart/form-data">
					<div class="form-floating mb-2">
						<input id="signupuserid" type="text" name="userid"
							class="form-control" id="floatingText" placeholder="jhondoe">
						<label for="floatingText">아이디</label>
					</div>
					<div class="form-floating mb-2" id="checkIdResult"></div>
					<!-- 아이디 중복 결과를 표시할 영역 -->
					<div class="form-floating mb-2">
						<input type="password" name="password" class="form-control"
							id="floatingPassword" placeholder="Password"> <label
							for="floatingPassword">비밀번호</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="membername" class="form-control"
							id="floatingText" placeholder="jhondoe"> <label
							for="floatingText">이름</label>
					</div>
					<!--
					<div class="form-floating mb-2">
						<input type="text" name="empno" class="form-control"
							id="floatingText" placeholder="jhondoe"> <label
							for="floatingText">사원번호</label>
					</div>
					-->
					<!--
					<div class="form-floating mb-2">
						<input type="text" name="deptno" class="form-control"
							id="floatingText" placeholder="jhondoe"> <label
							for="floatingText">부서번호</label>
					</div>
					-->
					<div class="form-floating mb-2">
						<select name="deptno" class="form-control" id="floatingText">
							<c:forEach var="dept" items="${deptList}">
								<option value="${dept.deptno}">${dept.dname}</option>
							</c:forEach>
						</select> <label for="floatingText">부서명</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="job" class="form-control"
							id="floatingText" placeholder="jhondoe"> <label
							for="floatingText">직급</label>
					</div>
					<div class="form-floating mb-2">
						<input type="date" name="hiredate" class="form-control "
							id="floatingDate" placeholder="입사일"> <label
							for="floatingDate">입사일</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="sal" class="form-control" id="floatingText"
							placeholder="연봉"> <label for="floatingText">연봉</label>
					</div>
					<div class="form-floating mb-2">
						<input type="date" name="birthday" class="form-control"
							id="floatingDate" placeholder="생년월일"> <label
							for="floatingDate">생년월일</label>
					</div>
					<div class="form-floating mb-2">
						<input type="email" name="email" class="form-control"
							id="floatingInput" placeholder="name@example.com"> <label
							for="floatingInput">이메일</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="phonenumber" class="form-control"
							id="floatingText" placeholder="휴대폰번호"> <label
							for="floatingText">휴대폰번호</label>
					</div>
					<div class="form-floating mb-2">
						<input type="file" name="file" class="form-control"
							id="floatingFile" placeholder="프로필 사진"> <label
							for="floatingFile">프로필 사진</label>
					</div>
					<button type="submit" class="btn btn-primary py-3 w-100 mb-4">가입
						하기</button>

					<p class="text-center mb-0">
						이미 회원이신가요? <a href="${pageContext.request.contextPath}/login">로그인</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 폼 제출 시 필드 유효성 검사
	$('#signupForm').submit(function(event) {
		var emptyField = false;
		$('input[type="text"]').each(function() {
			if ($(this).val() === '') {
				emptyField = true;
				return false;
			}
		});

		if (emptyField) {
			event.preventDefault(); // 폼 제출 막기
			alert('입력 필드를 모두 채워주세요.');
		} else if ($('#checkIdResult').css('color') === 'rgb(255, 0, 0)') {
			event.preventDefault(); // 폼 제출 막기
			alert('이미 사용 중인 아이디입니다. 아이디를 수정해주세요.');
		}
	});

	// 아이디 중복 체크
	$('#signupuserid').blur(function() {
		$('#checkIdResult').empty();
		var userid = $(this).val();
		if (userid.length < 5) {
			alert('아이디가 짧습니다.');
			$('#signupuserid').val(''); // 값 초기화
			return;
		}

		console.log('아이디 중복체크 실행');
		var userData = {
			userid: userid
		};
		$.ajax({
			url: '/api/checkId',
			type: 'POST',
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			data: JSON.stringify(userData),
			success: function(data) {
				console.log(data)
				if (data == 1) {
					$('#checkIdResult').text('이미 사용 중인 아이디입니다.').css('color', 'red');
					$('#signupuserid').focus(); // 아이디 입력 필드로 포커스 이동
				} else if (data == 0) {
					$('#checkIdResult').text('사용 가능한 아이디입니다.').css('color', 'green');
				}
			}
		});
	});
});
</script>

<%@include file="../include/footer.jsp"%>
