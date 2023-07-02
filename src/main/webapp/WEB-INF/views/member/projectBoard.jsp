<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp"%>


<div class="container mt-5" style="font-size: 0.5em;">
    <div class="row">
        <div class="col-lg-6">
            <!-- 달력 영역 -->
            <div class="card">
                <div class="card-body">
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <!-- 프로젝트 정보 영역 -->
            <div class="card">
                <div class="card-header">
                    프로젝트 정보
                </div>
                <div class="card-body">
                    <p class="card-title">프로젝트명 : ${joinProjectSimpleData.projectName}</p>
                    <p class="card-text">설명 : ${joinProjectSimpleData.projectDescription}</p>
                    <p class="card-subtitle mb-2 text-muted">
                        생성자: ${joinProjectSimpleData.membername} [${joinProjectSimpleData.deptname}]
                    </p>
                    <p class="card-text">참가 인원수: ${joinProjectSimpleData.memberCount}</p>
                </div>
            </div>
                        <div class="card">
                <div class="card-header">
                    일정목록
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">일정고유번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">내용</th>
                                <th scope="col">시작일</th>
                                <th scope="col">종료일</th>
                                <th scope="col">작성자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 일정 목록을 여기에 표시 -->
                        </tbody>
                    </table>
                    <div class="text-right">
                    <form action="${pageContext.request.contextPath}/member/projectBoardInsert" method="get">
                    	<input type="hidden" name="projectSeq" value="${joinProjectSimpleData.projectSeq}">
                    	<!-- 
                        <a href="${pageContext.request.contextPath}/member/projectBoardInsert?projectSeq=${joinProjectSimpleData.projectSeq}" class="btn btn-primary">새 일정 작성</a>
                    	 -->
                        <input type="submit" class="btn btn-primary" value="새 일정 작성">
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko', // 한국어 설정
      expandRows: true, // 화면에 맞게 높이 재설정
      height: '500px' // calendar 높이 설정
    });
    calendar.render();
});
</script>
    <!-- FullCalendar
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
     -->
<%@include file="../include/footer.jsp"%>
