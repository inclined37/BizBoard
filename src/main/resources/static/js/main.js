(function($) {
	"use strict";

	// Spinner
	var spinner = function() {
		setTimeout(function() {
			if ($('#spinner').length > 0) {
				$('#spinner').removeClass('show');
			}
		}, 1);
	};
	spinner();


	// Back to top button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.back-to-top').fadeIn('slow');
		} else {
			$('.back-to-top').fadeOut('slow');
		}
	});
	$('.back-to-top').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
		return false;
	});


	// Sidebar Toggler
	$('.sidebar-toggler').click(function() {
		$('.sidebar, .content').toggleClass("open");
		return false;
	});

	// Progress Bar
	$('.pg-bar').waypoint(function() {
		$('.progress .progress-bar').each(function() {
			$(this).css("width", $(this).attr("aria-valuenow") + '%');
		});
	}, { offset: '80%' });


	// Calender
	$('#calender').datetimepicker({
		inline: true,
		format: 'L'
	});

	// Testimonials carousel
	$(".testimonial-carousel").owlCarousel({
		autoplay: true,
		smartSpeed: 1000,
		items: 1,
		dots: true,
		loop: true,
		nav: false
	});


	$('.nav-link').click(function() {
		console.log("nav-item.nav-link 이벤 실행");
		$('.nav-link.active').removeClass('active');
		$(this).addClass('active');
	});

	// 사원목록 불러오기 - memberManagement.jsp
	$('#adminPageGetMemberList').on('click', function(e) {
		e.preventDefault(); // 기존이벤트 제거
		window.location = '/admin/memberManagement';
	});

	// 회원검색시 - memberManagement.jsp
	$('#memberSearchTag').keypress(function(event) {
		if (event.keyCode === 13) { // 엔터 키를 눌렀을 때
			event.preventDefault(); // 기본 동작 중지
			var searchText = $(this).val(); // 입력된 검색어 가져오기
			var searchType = $('#empSearchSelectTag').val(); // 선택된 검색 유형 가져오기
			console.log('Search Text:', searchText);
			console.log('Search Type:', searchType);

			var memberSearchData = {
				searchText: searchText,
				searchType: searchType
			}

			// Ajax 요청 실행
			$.ajax({
				type: 'POST', // 요청 방식 설정 (GET 또는 POST)
				url: '/api/memberSearch', // 서버 요청 경로 설정
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				data: JSON.stringify(memberSearchData),
				success: function(result) {
					console.log('통신 성공');
					console.log(result);

					// 결과 처리 로직
					populateMemberTable(result);
					$("#memberManagementPagingDiv").empty();
				},
				error: function(xhr) {
					console.log('통신 에러');
					console.log(xhr.status + '에러 코드');
				}
			});
		}
	});

	// 검색 조건 변경시 (사원번호,부서번호,사원명) input 태그 속성 변경 -memberManagement.jsp
	$('#empSearchSelectTag').on('change', function() {
		console.log('변경이벤트 실행');
		var selectedValue = $(this).val();
		console.log(selectedValue);
		var inputElement = $('#memberSearchTag');
		console.log(inputElement);

		if (selectedValue == 'empno' || selectedValue == 'deptno') {
			inputElement.attr('type', 'number');
		} else {
			inputElement.attr('type', 'text');
		}
	});

	// 회원 검색 조건 동적 생성 - memberManagement.jsp
	function populateMemberTable(data) {
		// tbody 요소를 선택
		var tableBody = $('#memberTableBody');

		// 이전에 추가된 테이블 내용을 제거
		tableBody.empty();


		//class="memberTableBodyTdTag"
		// 데이터를 순회하며 테이블 행을 생성하여 추가
		$.each(data, function(index, member) {
			var row = $('<tr>');
			row.append($('<td>').text(member.deptno));
			row.append($('<td class="memberTableBodyTdTag">').text(member.empno));
			row.append($('<td>').text(member.dname));
			row.append($('<td>').text(member.membername));
			tableBody.append(row);
		});
	}
	// 폼 제출 시 필드 유효성 검사 - signup.jsp
	$('#signupForm').submit(function(event) {
		var emptyField = false;
		$('input[type="text"]').each(function() {
			if ($(this).val() === '') {
				emptyField = true;
				return false;
			}
		});

		if (emptyField) {
			event.preventDefault(); // 폼 제출 막기
			alert('입력 필드를 모두 채워주세요.');
		} else if ($('#checkIdResult').css('color') === 'rgb(255, 0, 0)') {
			event.preventDefault(); // 폼 제출 막기
			alert('이미 사용 중인 아이디입니다. 아이디를 수정해주세요.');
		}
	});

	// 아이디 중복 체크 - signup.jsp
	$('#signupuserid').blur(function() {
		$('#checkIdResult').empty();
		var userid = $(this).val();
		if (userid.length < 5) {
			alert('아이디가 짧습니다.');
			$('#signupuserid').val(''); // 값 초기화
			return;
		}

		console.log('아이디 중복체크 실행');
		var userData = {
			userid: userid
		};
		$.ajax({
			url: '/api/checkId',
			type: 'POST',
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			data: JSON.stringify(userData),
			success: function(data) {
				console.log(data)
				if (data == 1) {
					$('#checkIdResult').text('이미 사용 중인 아이디입니다.').css('color', 'red');
					$('#signupuserid').focus(); // 아이디 입력 필드로 포커스 이동
				} else if (data == 0) {
					$('#checkIdResult').text('사용 가능한 아이디입니다.').css('color', 'green');
				}
			}
		});
	});
	// 페이징 처리 후 동적 태그 생성 - deptManagement.jsp
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
	
    // 부서 목록 가져오기 - deptManagement.jsp
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
	// 동적 태그 생성 deptManagement.jsp
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

	// 검색결과 deptManagement.jsp
    $("#results").on('click', '.pagination-link', function(e) {
        e.preventDefault();
        var pageNumber = $(this).data('page-number');
        renderTable(data, pageNumber, itemsPerPage);
    });
	// 자세히보기 deptManagement.jsp
    $(document).on('click', '.deptDetail', function(e) {
        e.preventDefault();
        console.log('.deptDetail 이벤트 실행');
        var contentDiv = $("#results");
        contentDiv.empty();
        
        $('.deptEditForm').remove(); 
        var parentRow = $(this).closest('tr');
        var deptno = parentRow.find("th").text();
        
        var dname = parentRow.find("a").text();
        //var loc = parentRow.find("td").text();
        var loc = parentRow.find("td:nth-child(3)").text();
        
        console.log("***********************");
        console.log(loc);
        console.log("***********************");
        
        var editForm = $("<form class='deptEditForm mt-2'></form>");
        editForm.append("<input type='text' id='editDeptno' class='form-control mb-2 deptno' value='" + deptno + "' readonly>");
        editForm.append("<input type='text' id='editDname' class='form-control mb-2 dname' value='" + dname + "'>");
        editForm.append("<input type='text' id='editLoc' class='form-control mb-2 loc' value='" + loc + "'>");
        editForm.append("<button class='btn btn-primary btn-sm deptUpdateBtn'>수정</button>");
        
        contentDiv.append(editForm);
    });
    
	// 부서 업데이트 deptManagement.jsp
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
                alert()
                
            }
        });
    });
	
	// 부서 추가 input 생성 deptManagement.jsp
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
	
	// 부서 추가 deptManagement.jsp
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

    

	/*	
		// Worldwide Sales Chart
		var ctx1 = $("#worldwide-sales").get(0).getContext("2d");
		var myChart1 = new Chart(ctx1, {
			type: "bar",
			data: {
				labels: ["2016", "2017", "2018", "2019", "2020", "2021", "2022"],
				datasets: [{
						label: "USA",
						data: [15, 30, 55, 65, 60, 80, 95],
						backgroundColor: "rgba(0, 156, 255, .7)"
					},
					{
						label: "UK",
						data: [8, 35, 40, 60, 70, 55, 75],
						backgroundColor: "rgba(0, 156, 255, .5)"
					},
					{
						label: "AU",
						data: [12, 25, 45, 55, 65, 70, 60],
						backgroundColor: "rgba(0, 156, 255, .3)"
					}
				]
				},
			options: {
				responsive: true
			}
		});
	
	
		// Salse & Revenue Chart
		var ctx2 = $("#salse-revenue").get(0).getContext("2d");
		var myChart2 = new Chart(ctx2, {
			type: "line",
			data: {
				labels: ["2016", "2017", "2018", "2019", "2020", "2021", "2022"],
				datasets: [{
						label: "Salse",
						data: [15, 30, 55, 45, 70, 65, 85],
						backgroundColor: "rgba(0, 156, 255, .5)",
						fill: true
					},
					{
						label: "Revenue",
						data: [99, 135, 170, 130, 190, 180, 270],
						backgroundColor: "rgba(0, 156, 255, .3)",
						fill: true
					}
				]
				},
			options: {
				responsive: true
			}
		});
	    
	
	
		// Single Line Chart
		var ctx3 = $("#line-chart").get(0).getContext("2d");
		var myChart3 = new Chart(ctx3, {
			type: "line",
			data: {
				labels: [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150],
				datasets: [{
					label: "Salse",
					fill: false,
					backgroundColor: "rgba(0, 156, 255, .3)",
					data: [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15]
				}]
			},
			options: {
				responsive: true
			}
		});
	
	
		// Single Bar Chart
		var ctx4 = $("#bar-chart").get(0).getContext("2d");
		var myChart4 = new Chart(ctx4, {
			type: "bar",
			data: {
				labels: ["Italy", "France", "Spain", "USA", "Argentina"],
				datasets: [{
					backgroundColor: [
						"rgba(0, 156, 255, .7)",
						"rgba(0, 156, 255, .6)",
						"rgba(0, 156, 255, .5)",
						"rgba(0, 156, 255, .4)",
						"rgba(0, 156, 255, .3)"
					],
					data: [55, 49, 44, 24, 15]
				}]
			},
			options: {
				responsive: true
			}
		});
	
	
		// Pie Chart
		var ctx5 = $("#pie-chart").get(0).getContext("2d");
		var myChart5 = new Chart(ctx5, {
			type: "pie",
			data: {
				labels: ["Italy", "France", "Spain", "USA", "Argentina"],
				datasets: [{
					backgroundColor: [
						"rgba(0, 156, 255, .7)",
						"rgba(0, 156, 255, .6)",
						"rgba(0, 156, 255, .5)",
						"rgba(0, 156, 255, .4)",
						"rgba(0, 156, 255, .3)"
					],
					data: [55, 49, 44, 24, 15]
				}]
			},
			options: {
				responsive: true
			}
		});
	
	
		// Doughnut Chart
		var ctx6 = $("#doughnut-chart").get(0).getContext("2d");
		var myChart6 = new Chart(ctx6, {
			type: "doughnut",
			data: {
				labels: ["Italy", "France", "Spain", "USA", "Argentina"],
				datasets: [{
					backgroundColor: [
						"rgba(0, 156, 255, .7)",
						"rgba(0, 156, 255, .6)",
						"rgba(0, 156, 255, .5)",
						"rgba(0, 156, 255, .4)",
						"rgba(0, 156, 255, .3)"
					],
					data: [55, 49, 44, 24, 15]
				}]
			},
			options: {
				responsive: true
			}
		});
	*/

})(jQuery);

