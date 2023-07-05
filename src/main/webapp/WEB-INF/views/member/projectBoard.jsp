<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<div class="card"
				style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 20px;">
				<div class="card-header"
					style="background-color: #3498db; color: #ffffff; font-weight: bold;">프로젝트
					정보</div>
				<div class="card-body" style="padding: 20px;">
					<p class="card-title"
						style="color: #2c3e50; font-size: 18px; margin-bottom: 10px;">
						프로젝트명 : <span style="font-weight: normal; color: #7f8c8d;">${joinProjectSimpleData.projectName}</span>
					</p>
					<p class="card-text" style="color: #7f8c8d; font-size: 14px;">설명
						: ${joinProjectSimpleData.projectDescription}</p>
					<p class="card-subtitle mb-2"
						style="color: #95a5a6; font-size: 12px;">생성자:
						${joinProjectSimpleData.membername}
						[${joinProjectSimpleData.deptname}]</p>
					<p class="card-text" style="color: #bdc3c7; font-size: 14px;">참가
						인원수: ${joinProjectSimpleData.memberCount}</p>
				</div>
			</div>

			<!-- 일정목록 영역 -->
			<div class="card"
				style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<div class="card-header"
					style="background-color: #e74c3c; color: #ffffff; font-weight: bold;">일정목록</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">일정번호</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<th scope="col">시작일</th>
								<th scope="col">종료일</th>
								<th scope="col">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${projectScheduleList}" var="schedule"
								varStatus="status">
								<tr>
									<td>${schedule.scheduleId}</td>
									<td><c:choose>
											<c:when test="${sessionScope.empno == schedule.empno}">
												<a
													href="${pageContext.request.contextPath}/member/projectBoardDetail?scheduleId=${schedule.scheduleId}&projectSeq=${joinProjectSimpleData.projectSeq}"
													style="color: #3498db;">${schedule.title}</a>
											</c:when>
											<c:otherwise>
                                        ${schedule.title}
                                    </c:otherwise>
										</c:choose></td>
									<td>${schedule.description}</td>
									<td>${schedule.startDate}</td>
									<td>${schedule.endDate}</td>
									<td>${schedule.membername}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-right">
						<form
							action="${pageContext.request.contextPath}/member/projectBoardInsert"
							method="get">
							<input type="hidden" name="projectSeq"
								value="${joinProjectSimpleData.projectSeq}">
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
    var projectSeq = ${joinProjectSimpleData.projectSeq}; // 프로젝트 ID 가져오기

    // 서버에서 일정 데이터 가져오기
    fetch('/member/getProjectSchedules?projectSeq=' + projectSeq)
    .then(response => response.json())
    .then(projectSchedules => {

    	// 고정 색상 배열
    	var colors = [
    	    'rgba(255, 87, 51, 0.5)', // #FF5733 with 50% opacity
    	    'rgba(51, 255, 87, 0.5)', // #33FF57 with 50% opacity
    	    'rgba(51, 87, 255, 0.5)', // #3357FF with 50% opacity
    	    'rgba(243, 255, 51, 0.5)', // #F3FF33 with 50% opacity
    	    'rgba(255, 51, 245, 0.5)', // #FF33F5 with 50% opacity
    	    'rgba(141, 51, 255, 0.5)', // #8D33FF with 50% opacity
    	    'rgba(255, 111, 51, 0.5)', // #FF6F33 with 50% opacity
    	    'rgba(51, 255, 215, 0.5)', // #33FFD7 with 50% opacity
    	    'rgba(106, 255, 51, 0.5)'  // #6AFF33 with 50% opacity
    	];

        // 이벤트를 FullCalendar 형식으로 변환
        var events = projectSchedules.map(function(schedule, index) {
        	console.log('****************');
        	console.log(schedule);
            var endDate = new Date(schedule.endDate);
            endDate.setDate(endDate.getDate() + 1); // 종료 날짜에 하루를 추가        	
            return {
                title: schedule.title +" - " + schedule.membername +"(" +schedule.deptname + ")",
                start: schedule.startDate,
                end: endDate.toISOString().substring(0, 10), // ISO 형식으로 변환한 뒤 시간을 제거
                backgroundColor: colors[index % colors.length], // 순환적으로 색상 할당
                borderColor: colors[index % colors.length] // 순환적으로 색상 할당
            };
        });

        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'ko',
            expandRows: true,
            height: '500px',
            events: events, // 변환된 이벤트 배열을 달력에 추가
            eventTextColor: 'black', // 이벤트 텍스트 색상을 검정으로 설정
            // 간단한 툴팁 추가
		    // 간단한 툴팁 추가
		    eventDidMount: function(info) {
		        var tooltip = document.createElement("div");
		        tooltip.classList.add("custom-tooltip");
		        tooltip.innerHTML = info.event.title;
		
		        document.body.appendChild(tooltip);
		
		        info.el.onmouseover = function(event) {
		            tooltip.style.display = "block";
		            tooltip.style.left = event.clientX + 10 + "px";
		            tooltip.style.top = event.clientY + 10 + "px";
		        };
		
		        info.el.onmouseout = function() {
		            tooltip.style.display = "none";
		        };
		    }
        });

        calendar.render();
    });
});

</script>

<!-- FullCalendar
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
     -->
<%@include file="../include/footer.jsp"%>
