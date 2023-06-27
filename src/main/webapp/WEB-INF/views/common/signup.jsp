<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<div class="container-fluid">
	<div class="row h-100 align-items-center justify-content-center"
		style="min-height: 100vh;">
		<div class="col-12 col-sm-8 col-md-8 col-lg-6 col-xl-6">
			<div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
				<div class="d-flex align-items-center justify-content-between mb-3">
					<a href="index.html" class="">
						<h3 class="text-primary">
							<i class="fa fa-hashtag me-2"></i>BizBoard
						</h3>
					</a>
					<h3>회원 가입</h3>
				</div>
				<form action="signup" method="post" enctype="multipart/form-data">	
				<div class="form-floating mb-3">
					<input type="text" name="userid" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">아이디</label>
				</div>
				<div class="form-floating mb-4">
					<input type="password" name="password" class="form-control" id="floatingPassword"
						placeholder="Password"> <label for="floatingPassword">비밀번호</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" name="membername" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">이름</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" name="empno" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">사원번호</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" name="deptno" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">부서번호</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" name="job" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">직급</label>
				</div>
				<div class="form-floating mb-3">
					<input type="date" name="hiredate" class="form-control" id="floatingDate"
						placeholder="입사일"> <label for="floatingDate">입사일</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" name="sal" class="form-control" id="floatingText"
						placeholder="연봉"> <label for="floatingText">연봉</label>
				</div>
				<div class="form-floating mb-3">
					<input type="date" name="birthday" class="form-control" id="floatingDate"
						placeholder="생년월일"> <label for="floatingDate">생년월일</label>
				</div>
				<div class="form-floating mb-3">
					<input type="email" name="email" class="form-control" id="floatingInput"
						placeholder="name@example.com"> <label for="floatingInput">이메일</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" name="phonenumber" class="form-control" id="floatingText"
						placeholder="휴대폰번호"> <label for="floatingText">휴대폰번호</label>
				</div>
				<div class="form-floating mb-3">
					<input type="file" name="file" class="form-control" id="floatingFile"
						placeholder="프로필 사진"> <label for="floatingFile">프로필
						사진</label>
				</div>


				<div class="d-flex align-items-center justify-content-between mb-4">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">정보
							저장하기</label>
					</div>
					<a href="">비밀번호 찾기</a>
				</div>
				<button type="submit" class="btn btn-primary py-3 w-100 mb-4">가입
					하기</button>
					
				<p class="text-center mb-0">
					Already have an Account? <a href="">Sign In</a>
				</p>
			</form>
			</div>
		</div>
	</div>


	</div>
		<!-- <form action="signup" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>아이디 :  <input name="userid"> </td>
		</tr>
		<tr>
			<td>비밀번호 :  <input name="password"> </td>
		</tr>
		<tr>
			<td>이름 :  <input name="membername"> </td>
		</tr>
		<tr>
			<td>사원번호 :  <input name="empno"> </td>
		</tr>
		<tr>
			<td>부서번호 :  <input name="deptno"> </td>
		</tr>
		<tr>
			<td>직급 :  <input name="job"> </td>
		</tr>
		<tr>
			<td>입사일 :  <input type="date" name="hiredate"> </td>
		</tr>
		<tr>
			<td>연봉 :  <input name="sal"> </td>
		</tr>
		<tr>
			<td>생일 :  <input type="date" name="birthday"> </td>
		</tr>
		<tr>
			<td>이메일 :  <input type="email" name="email"> </td>
		</tr>
		<tr>
			<td>휴대폰번호 :  <input name="phonenumber"> </td>
		</tr>
		<tr>
			<td>프로필사진 :  <input type="file" name="file"> </td>
		</tr>
		<tr>
			<td><button type="submit">회원가입</button></td>
		</tr>
	</table>
	
	</form> -->
	</div>

	<%@include file="../include/footer.jsp"%>