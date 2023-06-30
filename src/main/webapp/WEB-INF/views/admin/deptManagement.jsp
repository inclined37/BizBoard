<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>



<div class="container-fluid pt-4 px-2">
    <div class="row g-12 align-items-center justify-content-center">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-light rounded h-100 p-4 d-flex flex-column justify-content-center align-items-center">
                <h1>부서관리</h1>
                <div id="contentDiv">
                    <button id="deptList" type="button" class="btn btn-primary rounded-pill m-2">부서목록보기</button>
                    <button id="deptAdd" type="button" class="btn btn-primary rounded-pill m-2">부서추가</button>
                </div>
                <div id="results" class="mt-4"></div>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp"%>
