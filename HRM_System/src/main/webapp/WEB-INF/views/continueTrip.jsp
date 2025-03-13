<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출장 신청</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/approval.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <script src="./js/approval_line.js"></script>
<style>
:root {
	--bs-primary: #1b84ff;
	--bs-primary-light: #e9f3ff;
	--bs-primary-white: #fff;
}

.btn.btn-light-primary {
	color: var(--bs-primary);
	border-color: var(--bs-primary-light);
	background-color: var(--bs-primary-light);
}

.btn.btn-light-primary:hover {
	color: var(--bs-primary-white);
	border-color: var(--bs-primary);
	background-color: var(--bs-primary);
}

.btn.btn-light-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-primary), 0.5);
}

.ck-editor {
	min-height: 500px;
}

.ck-editor__editable_inline {
	min-height: 500px; /* 최소 높이 설정 */
	max-height: 600px; /* 최대 높이 설정 */
	overflow-y: auto; /* 높이를 넘어서면 스크롤 */
}

th, td {
	align-content: center;
}

#reason {
	min-height: 500px; /* 최소 높이 설정 */
	max-height: 600px; /* 최대 높이 설정 */
	overflow-y: auto; /* 높이를 넘어서면 스크롤 */
}

</style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	<div class="content" id="content">
        <%@ include file="header.jsp"%>
        <div class="main-content">
        	<form action="./TempTrip.do" method="post" enctype="multipart/form-data">
	            <div class="card shadow-lg p-4">
	                <h2 class="text-center mb-4">출장서</h2>
	                <div>
	                	<div style="float: left; width: 30%">
							<table class="table table-borderless w-100 mb-3">
								<tr>
									<th rowspan="2">기안자</th>
									<th>소속부서</th>
									<th>직급</th>
									<th>성명</th>
									<th>사원번호</th>
								</tr>
								<tr>
									<td>${loginVo.dept_name}</td>
									<td>${loginVo.position}</td>
									<td>${loginVo.name}</td>
									<td>${loginVo.emp_id}</td>
								</tr>
							</table>
						</div>
						<div style="float: right; width: 60%">
							<table class="table table-borderless mb-3">
								<tr>
									<th rowspan="2">결재</th>
									<th>본인</th>
									<th>결재자1</th>
									<th>결재자2</th>
									<th>결재자3</th>
								</tr>
								<tr id="approvalLineTd_1">
									<td id="approvalLineTd_2"><img id="signatureImage"
										src="${loginVo.signSaved}" width="80" height="75"
										style="border: 1px solid black;" /></td>
								</tr>
							</table>
						</div>
	                </div>
	                
	                <table class="table table-borderless mb-3">
	                	<c:forEach var="vo" items="${reportDto}">
		                	<tr>
								<th>제목</th>
								<th><input type="text" id="title" name="title" value="${vo.title}"
									class="form-control" placeholder="제목을 입력하세요."></th>
							</tr>
							<tr>
								<th>기간</th>
								<th style="text-align: left;">
									<input type="date" class="form-control" name="trip_start" 
											style="width: 30%; display: inline-block;" value="${tripDto.trip_start}">
									 ~ 
									<input type="date" class="form-control" name="trip_end" 
											style="width: 30%; display: inline-block;" value="${tripDto.trip_end}">
								</th>
							</tr>
							<tr>
								<th>지역</th>
								<th>
									<textarea id="place" name="destination" class="form-control" rows="5" placeholder="지역을 입력하세요.">${tripDto.destination}</textarea>
								</th>
							</tr>
							<tr>
								<th>목적</th>
								<th>
									<textarea id="reason" name="content" class="form-control" rows="5" placeholder="목적을 입력하세요.">${vo.content}</textarea>
								</th>
							</tr>
						</c:forEach>
	                </table>
	                <div class="d-flex justify-content-end mb-3">
						<button type="button" id="line" onclick="windowOpen()" class="btn btn-light-primary ms-2">결재선 선택</button>
						<button type="button" class="btn btn-light-primary ms-2" onclick="history.back(-1)">취소</button>
						<button type="button" class="btn btn-light-primary ms-2">상신 하기</button>
					</div>
	            </div>
			</form>
        </div>
	</div>
	<script type="text/javascript">
		function line(approvalLine) {
			console.log(approvalLine)
			let row1 = document.getElementById("approvalLineTd_1");
	        let row2 = document.getElementById("approvalLineTd_2");
	
	
// 	        이름 목록을 approvalLindTd_1의 td로 추가
	        approvalLine.forEach(person => {
				console.log(person.name)
	            let td_1 = document.createElement("td");
	            td_1.textContent = person.name;
	            row1.appendChild(td_1);
	            
	            let td_2 = document.createElement("td");
	            td_2.setAttribute("rowspan", approvalLine.length);
		        row2.appendChild(td_2)
	        });
	
		}
	</script>
</body>
</html>