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
					<h3>가입 정보</h3>
				</div>
				<form action="signup" method="post" enctype="multipart/form-data">
					<div class="form-floating mb-2">
						<input type="text" name="userid" class="form-control"
							id="floatingText" placeholder="jhondoe" readonly="readonly" value="${memberData.userid}"> <label
							for="floatingText">아이디</label>
					</div>
					<!-- 
					<div class="form-floating mb-2">
						<input type="password" name="password" class="form-control"
							id="floatingPassword" placeholder="Password" value="${memberData.password}"> <label
							for="floatingPassword" >비밀번호</label>
					</div>
					 -->
					<div class="form-floating mb-2">
						<input type="text" name="membername" class="form-control"
							id="floatingText" placeholder="jhondoe" value="${memberData.membername}"> <label
							for="floatingText">이름</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="empno" class="form-control"
							id="floatingText" placeholder="jhondoe" readonly="readonly" value="${memberData.empno}"> <label
							for="floatingText">사원번호</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="deptno" class="form-control"
							id="floatingText" placeholder="jhondoe" readonly="readonly" value="${memberData.deptno}"> <label
							for="floatingText">부서번호</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="job" class="form-control"
							id="floatingText" placeholder="jhondoe" readonly="readonly" value="${memberData.job}"> <label
							for="floatingText">직급</label>
					</div>
					<div class="form-floating mb-2">
						<input type="date" name="hiredate" class="form-control"
							id="floatingDate" placeholder="입사일" readonly="readonly" value="${memberData.hiredate}"> <label
							for="floatingDate">입사일</label>
					</div>
					<div class="form-floating mb-2">
						<input type="date" name="birthday" class="form-control"
							id="floatingDate" placeholder="생년월일" value="${memberData.birthday}"> <label
							for="floatingDate">생년월일</label>
					</div>
					<div class="form-floating mb-2">
						<input type="email" name="email" class="form-control"
							id="floatingInput" placeholder="name@example.com" value="${memberData.email}"> <label
							for="floatingInput">이메일</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="phonenumber" class="form-control"
							id="floatingText" placeholder="휴대폰번호" value="${memberData.phonenumber}"> <label
							for="floatingText">휴대폰번호</label>
					</div>
					<div class="form-floating mb-2">
						<a>기존 파일명 : ${memberData.fileOriginalName }</a>
					</div>
					<div class="form-floating mb-2">
						<img src="${pageContext.request.contextPath}${memberData.filePath}/${memberData.fileStoredName}">
					</div>
					<div class="form-floating mb-2">
						<input type="file" name="file" class="form-control"
							id="floatingFile" placeholder="프로필 사진"> <label
							for="floatingFile">프로필 사진 </label>
					</div>
					<button type="submit" class="btn btn-primary py-3 w-100 mb-4">수정
						하기</button>

				</form>
			</div>
		</div>
	</div>


</div>

<%@include file="../include/footer.jsp"%>

