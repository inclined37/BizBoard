<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
    #projectBoardInsert {
        max-width: 70%;
        font-size: 0.9em;
    }
</style>

<div class="container mt-5 mb-2" id='projectBoardInsert'>
    <form action="${pageContext.request.contextPath}/member/projectBoardInsertOk" method="POST" id="scheduleForm">
	    <h3>새 일정 추가</h3>
        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="title" name="title" required placeholder="제목">
            <label for="title">제목</label>
        </div>
		<div class="form-floating mb-2">
            <textarea class="form-control" id="description" name="description" required placeholder="내용"></textarea>
            <label for="description">내용</label>
        </div>
	    <div id="calendar"></div>
        <!-- 
        <div class="form-group">
            <label for="startDate">시작일:</label>
            <input type="hidden" class="form-control" id="startDate" name="startDate" required>
        </div>
        
        <div class="form-group">
            <label for="endDate">종료일:</label>
            <input type="hidden" class="form-control" id="endDate" name="endDate" required>
        </div>
         -->
        
        <input type="hidden" class="form-control" id="startDate" name="startDate" required>
        <input type="hidden" class="form-control" id="endDate" name="endDate" required>
        <input type="hidden" name="projectSeq" value="${projectSeq}">
        <input type="hidden" name="empno" value="${sessionScope.empno}">
        <input type="hidden" name="deptname" value="${sessionScope.deptname}">
        <input type="hidden" name="deptno" value="${sessionScope.deptno}">
        <input type="hidden" name="membername" value="${sessionScope.membername}">
        <div class="form-control">
        	<button type="submit" class="btn btn-primary">일정 추가</button>
        </div>
    </form>
</div>

<%@include file="../include/footer.jsp"%>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('scheduleForm');
    // 폼 제출 이벤트 리스너 추가
    form.addEventListener('submit', function(event) {
        // 필요한 입력 요소들
        var title = document.getElementById("title").value;
        var description = document.getElementById("description").value;
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;
        // 검증
        if (title === '' || description === '' || startDate === '' || endDate === '') {
            // 필요한 값이 채워지지 않았을 경우
            alert("빈값을 채워주세요!");
            event.preventDefault(); // 폼 제출 중지
        }
    });
    var calendarEl = document.getElementById('calendar');
    var clickCount = 0;
    var firstDate, secondDate;

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko',
        height: 'auto',
        selectable: true,
        unselectAuto: false, // to allow multiple selections
        select: function(info) {
            clickCount++;

            if (clickCount === 1) {
                firstDate = info.startStr;
                var startDate = document.getElementById("startDate");
                startDate.value = firstDate;
                // Reset endDate
                var endDate = document.getElementById("endDate");
                endDate.value = '';
            } else if (clickCount === 2) {
                secondDate = info.startStr;
                var endDate = document.getElementById("endDate");
                endDate.value = secondDate;

                // Add one day to the end date to include it in the range
                var adjustedEndDate = new Date(secondDate);
                adjustedEndDate.setDate(adjustedEndDate.getDate() + 1);
                adjustedEndDate = adjustedEndDate.toISOString().split("T")[0];

                // Get the member name from session
                var memberName = "${sessionScope.membername}";

                // Get the title from the input field
                var title = document.getElementById("title").value;

                // Highlight range on calendar
                calendar.addEvent({
                    title: memberName + " - " + title, // Set the title of the event
                    start: firstDate,
                    end: adjustedEndDate,
                    rendering: 'background',
                    backgroundColor: '#9FC5E8'
                });
            } else {
                // Reset
                clickCount = 1;
                firstDate = info.startStr;
                var startDate = document.getElementById("startDate");
                startDate.value = firstDate;
                // Reset endDate
                var endDate = document.getElementById("endDate");
                endDate.value = '';

                // Remove previously selected range
                calendar.getEvents().forEach(function(event) {
                    event.remove();
                });
            }
        }
    });
    calendar.render();
});
</script>

