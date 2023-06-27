<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!--
<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-18">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">회원가입</h6>
				<form>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">아이디</label> 
						<input type="email" class="form-control" 
							id="exampleInputEmail1" aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1">
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
			</div>
		</div>
		
	</div>
</div>
-->
<div class="container-fluid">
	<div class="row h-100 align-items-center justify-content-center"
		style="min-height: 100vh;">
		<div class="col-12 col-sm-8 col-md-8 col-lg-6 col-xl-10"><!-- col-xl-10 해당부분이 가로길이  -->
			<div class="bg-light rounded p-4 p-sm-4 my-2 mx-3"><!-- my-1 헤더서치바와의 간격 p-sm-5 전체영역을 둘러싸는 회색영역 -->
				<div class="d-flex align-items-center justify-content-between mb-1">
					<a href="index.html" class="text-primary">
							<i class="fa fa-hashtag me-1"></i>비즈보드
						<h3 class="text-primary">
							<i class="fa fa-hashtag me-1"></i>BizBoard
						</h3>
					</a>
					<h3>회원 가입</h3>
				</div>
				<form action="signup" method="post" enctype="multipart/form-data">	
				<div class="form-floating mb-2">
					<input type="text" name="userid" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">아이디</label>
				</div>
				<div class="form-floating mb-2">
					<input type="password" name="password" class="form-control" id="floatingPassword"
						placeholder="Password"> <label for="floatingPassword">비밀번호</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" name="membername" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">이름</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" name="empno" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">사원번호</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" name="deptno" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">부서번호</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" name="job" class="form-control" id="floatingText"
						placeholder="jhondoe"> <label for="floatingText">직급</label>
				</div>
				<div class="form-floating mb-2">
					<input type="date" name="hiredate" class="form-control" id="floatingDate"
						placeholder="입사일"> <label for="floatingDate">입사일</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" name="sal" class="form-control" id="floatingText"
						placeholder="연봉"> <label for="floatingText">연봉</label>
				</div>
				<div class="form-floating mb-2">
					<input type="date" name="birthday" class="form-control" id="floatingDate"
						placeholder="생년월일"> <label for="floatingDate">생년월일</label>
				</div>
				<div class="form-floating mb-2">
					<input type="email" name="email" class="form-control" id="floatingInput"
						placeholder="name@example.com"> <label for="floatingInput">이메일</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" name="phonenumber" class="form-control" id="floatingText"
						placeholder="휴대폰번호"> <label for="floatingText">휴대폰번호</label>
				</div>
				<div class="form-floating mb-2">
					<input type="file" name="file" class="form-control" id="floatingFile"
						placeholder="프로필 사진"> <label for="floatingFile">프로필
						사진</label>
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
	
	</form> 
</div>
	-->

<%@include file="../include/footer.jsp"%>