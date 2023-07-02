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
                                <h3 class="mb-4">새 프로젝트 생성</h3>
                                <form id="project-form" action="${pageContext.request.contextPath}/member/createProject" method="post">
                                    <label for="project-name">프로젝트 이름:</label>
                                    <input type="text" id="project-name" name="projectName" class="form-control"><br><br>

                                    <label for="project-description">프로젝트 설명:</label>
                                    <textarea id="project-description" name="projectDescription" class="form-control"></textarea><br><br>

                                    <div class="d-none d-md-flex ms-4">
                                        <select id="empSearchSelectTag" class="empSearchSelectTag form-select form-select-sm mb-2 form-control" aria-label=".form-select-sm example">
                                            <option value="" disabled="disabled">--검색--</option>
                                            <option value="empno">사원번호</option>
                                            <option value="deptno">부서번호</option>
                                            <option value="membername">이름</option>
                                        </select>
                                        <p>&nbsp;&nbsp;</p>
                                        <input class="form-control border-0 mb-2 empSearchTag" type="text" placeholder="Search" id="projectMemberSearchTag">
                                    </div>

                                    <label>초대 목록:</label>
                                    <button id="projectAddSelect-all" class="btn btn-outline-secondary btn-sm mb-2">전체 선택</button>
                                    <ul id="invite-list" class="list-group">
                                    	<!-- 
                                    	<li class="list-group-item" id="projectAddSearchBefore">추가된 인원이 없습니다.</li>
                                    	 -->
                                    	<li class="list-group-item" id="projectAddSearchBefore">
                                    	<input id="projectAddMyInvited" type="checkbox" name="invitedMembers" value="${sessionScope.empno}" checked>  ${sessionScope.membername}   (${sessionScope.deptname}) (본인)
                                    	<input type="hidden" name="deptname" value="${sessionScope.deptname}">
                                    	<input type="hidden" name="deptno" value="${sessionScope.deptno}">
                                    	<input type="hidden" name="membername" value="${sessionScope.membername}">
                                    	<!-- 
                                    	<input type="hidden" name="deptno" value="${sessionScope.empno}">
                                    	<input type="checkbox" name="invitedMembers" value="${sessionScope.empno}" checked disabled>
      									${sessionScope.memberName} (사원번호: ${sessionScope.empno}, 부서번호: ${sessionScope.deptno})
                                    	 -->
                                    	</li>
                                    </ul>

                                    <input type="hidden" id="selected-users" name="selectedUsers">
                                    <input type="submit" value="프로젝트 생성" class="btn btn-primary mt-3">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	    
</script>

<%@include file="../include/footer.jsp"%>
