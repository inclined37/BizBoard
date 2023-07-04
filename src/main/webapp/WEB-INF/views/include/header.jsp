<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>BizBoard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon 
    <link href="../img/favicon.ico" rel="icon">
    -->

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/jinstyle.css" rel="stylesheet">

    
    
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	


    <!-- FullCalendar -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
         <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="${pageContext.request.contextPath}/common/main" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>BizBOARD</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                    <se:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <img class="rounded-circle" src="../img/admin.png" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </se:authorize>
                    <se:authorize access="hasAnyRole('ROLE_USER')">
                    <c:choose>
  						<c:when test="${empty sessionScope.profileUrl}">
	                        <img class="rounded-circle" src="../img/noProfile.jpg" alt="" style="width: 40px; height: 40px;">
  						</c:when>
  						<c:otherwise>
	                        <img class="rounded-circle" src="${pageContext.request.contextPath}${sessionScope.profileUrl}" alt="" style="width: 40px; height: 40px;">
  						</c:otherwise>
					</c:choose>
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </se:authorize>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">${pageContext.request.userPrincipal.name}</h6>
                    <se:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <h6 class="mb-0">관리자</h6>
                    </se:authorize>
                    <se:authorize access="hasAnyRole('ROLE_USER')">
                        <h6 class="mb-0">일반회원</h6>
                    </se:authorize>
                        <span></span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                <se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                	<button onclick='window.location="${pageContext.request.contextPath}/member/projectAdd"' type="button" class="btn btn-primary rounded-pill m-2">프로젝트 생성</button>
                </se:authorize>
                	<!-- 
                	<button type="button" class="btn btn-secondary rounded-pill m-2">프로젝트 생성</button>
                	 -->
                    <a href="${pageContext.request.contextPath}/member/main" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>메인</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-table me-2"></i>게시판</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/member/noticeBoard" class="dropdown-item">-공지게시판</a>
                            <a href="${pageContext.request.contextPath}/member/AlbumBoard" class="dropdown-item">-앨범게시판</a>
                            <a href="${pageContext.request.contextPath}/member/FileBoard" class="dropdown-item">-파일공유게시판</a>
                        </div>
                    </div>
                    
                    <!-- 
                    <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                    <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                    <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                     -->
                 <se:authorize access="hasAnyRole('ROLE_ADMIN')">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-keyboard me-2"></i>관리자 메뉴</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/admin/main" class="dropdown-item">관리자 메인</a>
                            <a href="${pageContext.request.contextPath}/admin/deptManagement" class="dropdown-item">부서관리</a>
                            <a href="${pageContext.request.contextPath}/admin/memberManagement" class="dropdown-item">회원관리</a>
                        </div>
                    </div>
                </se:authorize>
                    <!-- 
                <se:authorize access="hasAnyRole('ROLE_ADMIN')">
                    <a href="${pageContext.request.contextPath}/admin/adminMenu" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Admin Menu</a>
                </se:authorize>
                     -->
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4" action="${pageContext.request.contextPath}/member/searchResult">
                    <input class="form-control border-0" type="search" placeholder="Search" id="headerSearch">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-envelope me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Message</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                	<se:authorize access="hasAnyRole('ROLE_ADMIN')">
                                    	<img class="rounded-circle" src="../img/admin.png" alt="" style="width: 40px; height: 40px;">
                    				</se:authorize>
                                	<se:authorize access="hasAnyRole('ROLE_USER')">
	                                    <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    				</se:authorize>
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                	<se:authorize access="hasAnyRole('ROLE_ADMIN')">
                                    	<img class="rounded-circle" src="../img/admin.png" alt="" style="width: 40px; height: 40px;">
                    				</se:authorize>
                                	<se:authorize access="hasAnyRole('ROLE_USER')">
	                                    <img class="rounded-circle" src="${pageContext.request.contextPath}${sessionScope.profileUrl}" alt="" style="width: 40px; height: 40px;">
                    				</se:authorize>
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                	<se:authorize access="hasAnyRole('ROLE_ADMIN')">
                                    	<img class="rounded-circle" src="../img/admin.png" alt="" style="width: 40px; height: 40px;">
                    				</se:authorize>
                                	<se:authorize access="hasAnyRole('ROLE_USER')">
					                    <c:choose>
					  						<c:when test="${empty sessionScope.profileUrl}">
						                        <img class="rounded-circle" src="../img/noProfile.jpg" alt="" style="width: 40px; height: 40px;">
					  						</c:when>
					  						<c:otherwise>
						                        <img class="rounded-circle" src="${pageContext.request.contextPath}${sessionScope.profileUrl}" alt="" style="width: 40px; height: 40px;">
					  						</c:otherwise>
										</c:choose>                    				
									</se:authorize>
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all message</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Notificatin</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Profile updated</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">New user added</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Password changed</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all notifications</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        	<se:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                            <span class="d-none d-lg-inline-flex">로그인 해주세요.</span>
                            </se:authorize>
                        	<se:authorize access="hasAnyRole('ROLE_USER')">
	                        	<c:choose>
	  								<c:when test="${empty sessionScope.profileUrl}">
		                        		<img class="rounded-circle" src="../img/noProfile.jpg" alt="" style="width: 40px; height: 40px;">
	  								</c:when>
	  								<c:otherwise>
		                        		<img class="rounded-circle" src="${pageContext.request.contextPath}${sessionScope.profileUrl}" alt="" style="width: 40px; height: 40px;">
	  								</c:otherwise>
								</c:choose>
                        	</se:authorize>
                        	<se:authorize access="hasAnyRole('ROLE_ADMIN')">
	                            <img class="rounded-circle me-lg-2" src="../img/admin.png" alt="" style="width: 40px; height: 40px;">
                        	</se:authorize>
                        	<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                            <span class="d-none d-lg-inline-flex">${LoginUser}</span>
                            </se:authorize>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        	<se:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                            <a href="${pageContext.request.contextPath}/common/login" class="dropdown-item">로그인</a>
                            <a href="${pageContext.request.contextPath}/common/signup" class="dropdown-item">회원가입</a>
                            </se:authorize>
                        	<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                            <a href="${pageContext.request.contextPath}/member/myInfo" class="dropdown-item">내정보</a>
                            <a href="#" class="dropdown-item">미정</a>
                            <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">로그아웃</a>
                            </se:authorize>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->