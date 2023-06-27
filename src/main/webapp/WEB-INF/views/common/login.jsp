<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<!-- Sign In Start -->
<div class="container-fluid">
	<div class="row h-100 align-items-center justify-content-center"
		style="min-height: 100vh;">
		<div id="loginform-area" class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
			<div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
				<div class="d-flex align-items-center justify-content-between mb-3">
					<h3>
						<a href="common/main" class="text-primary"><i class="fa fa-hashtag me-2"></i>BizBoard</a>
					</h3>
					<h3>Login</h3>
				</div>
				<form action="login" method="post">
					<div class="form-floating mb-3">
						<input type="text" name="username" class="form-control"
							id="floatingInput" placeholder="아이디를 입력하세요"> <label
							for="floatingInput">아이디</label>
					</div>
					<div class="form-floating mb-4">
						<input type="password" name="password" class="form-control"
							id="floatingPassword" placeholder="비밀번호를 입력하세요"> <label
							for="floatingPassword">비밀번호</label>
					</div>

					<button type="submit" class="btn btn-primary py-3 w-100 mb-4">Login</button>
				</form>
				<p class="text-center mb-0">
					계정이 없으십니까? <a href="${pageContext.request.contextPath}/common/signup">회원가입</a>
				</p>
			</div>
		</div>
	</div>
</div>
<!-- Sign In End -->
<%@include file="../include/footer.jsp"%>