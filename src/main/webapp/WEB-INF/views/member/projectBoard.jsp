<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp"%>

<div class="container mt-5">
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    프로젝트 정보
                </div>
                <div class="card-body">
                    <h5 class="card-title">프로젝트명 : ${joinProjectSimpleData.projectName}</h5>
                    <p class="card-text">설명 : ${joinProjectSimpleData.projectDescription}</p>
                    <h6 class="card-subtitle mb-2 text-muted">
                        생성자: ${joinProjectSimpleData.membername} [${joinProjectSimpleData.deptname}]
                    </h6>
                    <p class="card-text">참가 인원수: ${joinProjectSimpleData.memberCount}</p>
                </div>
            </div>
            <div class="mt-4">
                <h3>게시글</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 게시글 목록을 여기에 표시 -->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <a href="#" class="btn btn-primary">새 게시글 작성</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp"%>
