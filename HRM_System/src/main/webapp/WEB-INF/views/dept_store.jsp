<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./css/emplist.css">
    <meta charset="UTF-8">
    <title>전자결재</title>
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
</style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
        <div class="main-content">
			<!-- 부서별 결재 완료된 문서 조회 -->
			<div>
        		<table>
        			<thead>
	        			<tr>
	        				<th>발급번호</th>
	        				<th>유형</th>
	        				<th>제목</th>
	        				<th>부서</th>
	        				<th>작성자</th>
	        				<th>승인상태</th>
	        				<th>승인날짜</th>
	        			</tr>
        			</thead>
        			<tbody>
        				<tr>
        					<td></td>
        					<td></td>
        					<td></td>
        					<td>${loginVo.dept_name}</td>
        					<td>${loginVo.name}</td>
        					<td></td>
        					<td></td>
        				</tr>
        			</tbody>
        		</table>
        	</div>

        </div>
    </div>
</body>
</html>
