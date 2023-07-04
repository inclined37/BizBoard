<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="container mt-5 mb-2" id='projectBoardInsert'>
    <form action="${pageContext.request.contextPath}/member/projectBoardUpdateOk" method="POST" id="scheduleUpdateForm">
	    <h3>일정 수정</h3>
        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="title" name="title" required placeholder="제목" value="${projectSchedule.title}">
            <label for="title">제목</label>
        </div>
		<div class="form-floating mb-2">
            <textarea class="form-control" id="description" name="description" required placeholder="내용" >${projectSchedule.description}</textarea>
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
        
        <input type="hidden" class="form-control" id="startDate" name="startDate" required value="${projectSchedule.startDate}">
        <input type="hidden" class="form-control" id="endDate" name="endDate" required value="${projectSchedule.endDate}">
        <input type="hidden" name="projectSeq" value="${projectSeq}">
        <input type="hidden" name="scheduleId" value="${projectSchedule.scheduleId}">
        <input type="hidden" name="empno" value="${sessionScope.empno}">
        <input type="hidden" name="deptname" value="${sessionScope.deptname}">
        <input type="hidden" name="deptno" value="${sessionScope.deptno}">
        <input type="hidden" name="membername" value="${sessionScope.membername}">
        <div class="form-control">
        	<button type="submit" class="btn btn-primary m-2">일정 수정</button>
        	<button type="button" class="btn btn-danger m-2" id="projectBoardDelete">일정 삭제</button>
        </div>
    </form>
    <div class="modal" tabindex="-1" role="dialog" id="customAlert">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">일정삭제</h5>
            </div>
            <div class="modal-body">
                <p>정말 일정을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirmDelete">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="projectBoardDeleteCancle">취소</button>
            </div>
        </div>
    </div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>

<script>

document.getElementById("projectBoardDelete").addEventListener("click", function() {
    $('#customAlert').modal('show');
});

document.getElementById("projectBoardDeleteCancle").addEventListener("click", function() {
    $('#customAlert').modal('hide');
});



document.getElementById("confirmDelete").addEventListener("click", function() {
	console.log('삭제실행');
    var form = document.createElement("form");
    form.setAttribute("method", "POST");
    form.setAttribute("action", "${pageContext.request.contextPath}/member/projectBoardDeleteOk");

    var scheduleId = document.createElement("input");
    scheduleId.setAttribute("type", "hidden");
    scheduleId.setAttribute("name", "scheduleId");
    scheduleId.setAttribute("value", "${projectSchedule.scheduleId}");

    var projectSeq = document.createElement("input");
    projectSeq.setAttribute("type", "hidden");
    projectSeq.setAttribute("name", "projectSeq");
    projectSeq.setAttribute("value", "${projectSeq}");

    form.appendChild(scheduleId);
    form.appendChild(projectSeq);

    document.body.appendChild(form);
    form.submit();
});


/*
document.getElementById("projectBoardDelete").addEventListener("click", function() {
    if (confirm("일정을 삭제하시겠습니까?")) {
        var form = document.createElement("form");
        form.setAttribute("method", "POST");
        form.setAttribute("action", "${pageContext.request.contextPath}/member/projectBoardDeleteOk");

        var scheduleId = document.createElement("input");
        scheduleId.setAttribute("type", "hidden");
        scheduleId.setAttribute("name", "scheduleId");
        scheduleId.setAttribute("value", "${projectSchedule.scheduleId}");

        var projectSeq = document.createElement("input");
        projectSeq.setAttribute("type", "hidden");
        projectSeq.setAttribute("name", "projectSeq");
        projectSeq.setAttribute("value", "${projectSeq}");

        form.appendChild(scheduleId);
        form.appendChild(projectSeq);

        document.body.appendChild(form);
        form.submit();
    }
});
*/





document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('scheduleUpdateForm');
    form.addEventListener('submit', function(event) {
        var title = document.getElementById("title").value;
        var description = document.getElementById("description").value;
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;
        if (title === '' || description === '' || startDate === '' || endDate === '') {
            alert("빈값을 채워주세요!");
            event.preventDefault();
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
        unselectAuto: false,
        select: function(info) {
            clickCount++;

            if (clickCount === 1) {
                firstDate = info.startStr;
                var startDate = document.getElementById("startDate");
                startDate.value = firstDate;
                var endDate = document.getElementById("endDate");
                endDate.value = '';
            } else if (clickCount === 2) {
                secondDate = info.startStr;
                var endDate = document.getElementById("endDate");
                endDate.value = secondDate;
                var adjustedEndDate = new Date(secondDate);
                adjustedEndDate.setDate(adjustedEndDate.getDate() + 1);
                adjustedEndDate = adjustedEndDate.toISOString().split("T")[0];
                var memberName = "${sessionScope.membername}";
                var title = document.getElementById("title").value;

                calendar.addEvent({
                    title: memberName + " - " + title,
                    start: firstDate,
                    end: adjustedEndDate,
                    rendering: 'background',
                    backgroundColor: '#9FC5E8'
                });
            } else {
                // Reset
                clickCount = 0;
                removeEvents();
                calendar.unselect();
            }
        },
        unselect: function() {
            removeEvents();
        }
    });

    function removeEvents() {
        calendar.getEvents().forEach(function(event) {
            event.remove();
        });
    }
    
    calendar.render();

    var initialStartDate = "${projectSchedule.startDate}";
    var initialEndDate = "${projectSchedule.endDate}";
    var memberName = "${sessionScope.membername}";
    var title = "${projectSchedule.title}";

    var adjustedEndDate = new Date(initialEndDate);
    adjustedEndDate.setDate(adjustedEndDate.getDate() + 1);
    adjustedEndDate = adjustedEndDate.toISOString().split("T")[0];

    calendar.addEvent({
        title: memberName + " - " + title,
        start: initialStartDate,
        end: adjustedEndDate,
        rendering: 'background',
        backgroundColor: '#9FC5E8'
    });

});
</script>







