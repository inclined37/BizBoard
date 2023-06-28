<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<style>
.pagination {
    display: inline-block;
}
.pagination-link {
    margin-right: 5px;
}
</style>

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

<script>


$(document).ready(function(){
	function renderPagination(totalCount, itemsPerPage) {
	    var contentDiv = $("#results");
	    var paginationDiv = $("<div class='pagination'></div>");
	    var totalPages = Math.ceil(totalCount / itemsPerPage);
	
	    for (var i = 1; i <= totalPages; i++) {
	        var pageLink = $("<a href='#' class='btn btn-secondary pagination-link'></a>").text(i);
	        pageLink.data('page-number', i);
	        paginationDiv.append(pageLink);
	    }
	
	    contentDiv.append(paginationDiv);
	}
    var data;
    var itemsPerPage = 5;

    $("#deptList").on("click", function() {
        var contentDiv = $("#contentDiv");
        contentDiv.find('#deptAddForm').remove();
        
        $.ajax({
            type: "get",
            url: "/api/deptList",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {
                data = result;
                renderTable(data, 1, itemsPerPage);
                //renderPagination(data.length, itemsPerPage);
            },
            error: function(xhr) {
                console.log("통신에러");
                console.log(xhr.status + "에러코드");
            }
        });
    });

    function renderTable(data, pageNumber, itemsPerPage) {
        var contentDiv = $("#results");

        var startIndex = (pageNumber - 1) * itemsPerPage;
        var endIndex = Math.min(startIndex + itemsPerPage, data.length);

        var table = $('<table class="table"></table>');
        var thead = $('<thead></thead>');
        var headerRow = $('<tr></tr>');
        headerRow.append($('<th scope="col">부서번호</th>'));
        headerRow.append($('<th scope="col">부서명</th>'));
        headerRow.append($('<th scope="col">지역명</th>'));
        thead.append(headerRow);
        table.append(thead);

        var tbody = $('<tbody></tbody>');
        for (var i = startIndex; i < endIndex; i++) {
            var dept = data[i];
            var row = $("<tr></tr>");
            row.append($("<th scope='row'></th>").text(dept.deptno));
            var deptDetailLink = $("<a class='deptDetail' href='#'></a>").text(dept.dname);
            deptDetailLink.data('deptno', dept.deptno); 
            row.append($("<td></td>").append(deptDetailLink));
            row.append($("<td></td>").text(dept.loc));
            tbody.append(row);
        }
        table.append(tbody);
        contentDiv.empty().append(table); 

        renderPagination(data.length, itemsPerPage);
    }


    $("#results").on('click', '.pagination-link', function(e) {
        e.preventDefault();
        var pageNumber = $(this).data('page-number');
        renderTable(data, pageNumber, itemsPerPage);
    });

    $(document).on('click', '.deptDetail', function(e) {
        e.preventDefault();
        console.log('.deptDetail 이벤트 실행');
        var contentDiv = $("#results");
        contentDiv.empty();
        
        $('.deptEditForm').remove(); 
        var parentRow = $(this).closest('tr');
        var deptno = parentRow.find("th").text();
        
        var dname = parentRow.find("a").text();
        var loc = parentRow.find("td").text();
        
        var editForm = $("<form class='deptEditForm mt-2'></form>");
        editForm.append("<input type='text' id='editDeptno' class='form-control mb-2 deptno' value='" + deptno + "' readonly>");
        editForm.append("<input type='text' id='editDname' class='form-control mb-2 dname' value='" + dname + "'>");
        editForm.append("<input type='text' id='editLoc' class='form-control mb-2 loc' value='" + loc + "'>");
        editForm.append("<button class='btn btn-primary btn-sm deptUpdateBtn'>수정</button>");
        
        contentDiv.append(editForm);
    });
    
    $(document).on('click', '.deptUpdateBtn', function(e) {
        e.preventDefault();
        console.log('.deptUpdateBtn 실행');
        
        var parentRow = $(this).closest('tr');
        
        var deptno = $('#editDeptno').val();
        var dname = $('#editDname').val();
        var loc = $('#editLoc').val();
        console.log(dname);
        
        var deptInfo = {
            'deptno': deptno,
            'dname': dname,
            'loc': loc
        };
        console.log(deptInfo);
        
        $.ajax({
            type: "post",
            url: "/api/deptUpdate",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(deptInfo),
            success: function(result) {
                console.log("통신성공");
                console.log(result);
                $("#deptList").trigger("click");
            },
            error: function(xhr) {
                console.log("통신에러");
                console.log(xhr.status + "에러코드");
            }
        });
    });

    $(document).on('click', '#deptAdd', function(e) {
        e.preventDefault();
        var contentDiv = $("#results");
        contentDiv.empty();
        
        var contentDiv = $("#contentDiv");
        contentDiv.find('#deptAddForm').remove();
        
        var form = $('<form id="deptAddForm" class="mt-3"></form>');
        form.append('<input type="number" class="form-control mb-2" id="deptno" placeholder="부서번호 입력">');
        form.append('<input type="text" class="form-control mb-2" id="dname" placeholder="부서명 입력">');
        form.append('<input type="text" class="form-control mb-2" id="loc" placeholder="지역명 입력">');
        form.append('<button id="deptInfoBtn" type="button" class="btn btn-primary">부서 추가</button>');
        
        contentDiv.append(form);
    });

    $(document).on('click', '#deptInfoBtn', function(e) {
        e.preventDefault();
        var deptno = $('#deptno').val();
        var dname = $('#dname').val();
        var loc = $('#loc').val();
        
        if (!deptno || !dname || !loc) {
            alert("부서번호, 부서명, 지역명을 모두 입력해주세요.");
            return;
        }
        
        var deptInfo = {
            deptno: deptno,
            dname: dname,
            loc: loc
        };
        
        $.ajax({
            type: "post",
            url: "/api/deptInsert",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(deptInfo),
            success: function(result) {
                console.log("통신성공");
                console.log(result);
                $("#deptList").trigger("click");
            },
            error: function(xhr) {
                console.log("통신에러");
                console.log(xhr.status + "에러코드");
                alert('부서번호 중복!!');
            }
        });
        
    });

    
});
</script>
<%@include file="../include/footer.jsp"%>
