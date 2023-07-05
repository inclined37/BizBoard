<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>
			
<div class="container mt-5">
    <div class="form-floating mb-2">
        <h2 style="color: #34495e; font-weight: bold;">&nbsp;참여중인 프로젝트</h2>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="project" items="${joinProjectSimpleDataList}">
            <div class="col projectCard">
                <div class="card h-100" style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                    <div class="card-body" style="padding: 20px;">
                        <h5 class="card-title" style="color: #3498db; font-size: 18px; margin-bottom: 10px;">프로젝트명 : <span style="font-weight: normal; color: #2c3e50;">${project.projectName}</span></h5>
                        <input type="hidden" name="projectSeq" value="${project.projectSeq}">
                        <p class="card-text" style="color: #7f8c8d; font-size: 14px;">설명 : ${project.projectDescription}</p>
                    </div>
                    <div class="card-footer" style="background-color: #ecf0f1; border-radius: 0 0 10px 10px;">
                        <small style="color: #95a5a6; font-size: 12px;">생성자 : ${project.membername} [${project.deptname}]</small><br>
                        <small style="color: #bdc3c7; font-size: 12px;">참가 인원수 : ${project.memberCount}</small>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<script>
$(document).ready(function() {
    $(".projectCard").on('mouseenter', function(e) {
        $(this).css("transform", "scale(1.25)");
        $(this).css("transition", "transform 0.3s");
        $(this).css("cursor", "pointer");
    }).on('mouseleave', function(e) {
        $(this).css("transform", "scale(1)");
    }).on('click', function(e) {
        // 폼을 동적으로 생성
        var form = document.createElement("form");
        form.setAttribute("method", "get");
        form.setAttribute("action", "/member/projectBoard");

        // projectSeq 값으로 input 요소를 생성
        var projectSeq = $(this).find("input[name='projectSeq']").val();
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "projectSeq");
        hiddenField.setAttribute("value", projectSeq);

        // input 요소를 폼에 추가
        form.appendChild(hiddenField);

        // 폼을 문서에 추가
        document.body.appendChild(form);

        // 폼 제출
        form.submit();
    });
});



</script>

<%@include file="../include/footer.jsp"%>
