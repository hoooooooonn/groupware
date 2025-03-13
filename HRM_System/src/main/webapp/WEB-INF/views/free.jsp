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
    <title>게시판</title>
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

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f0f0f0;
}

.gray {
	background-color: #ddd;
}

.hidden-row {
    display: none;
}

</style>    
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
        <div class="main-content">
        	<form action="./searchFree.do" method="get" name="searchNotice">
				<div class="table-responsive">
					<fieldset class="btn-container">
						<select name="type" id="type">
							<option value="title" ${(param.type == "title")?"selected":""}>제목</option>
							<option value="content" ${(param.type == "content")?"selected":""}>내용</option>
							<option value="name" ${(param.type == "name")?"selected":""}>작성자</option>
						</select> <input type="text" name="keyword" value="${param.keyword}"
							placeholder="검색어를 입력해주세요.">
						<button type="submit" class="button-common search-btn">
							<img src="images/search.svg" alt="검색 아이콘"
								style="width: 30px; height: 30px;">
						</button>
					</fieldset>
	
					<table class="table table-hover table-rounded table-striped border gy-7 gs-7">
						<thead>
							<tr class="fw-semibold fs-6 text-gray-800 border-bottom-2 border-gray-200">
								<th>NO</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>첨부파일</th>
				            </tr>
						</thead>
						<tbody>
							<c:choose>
	                            <c:when test="${empty lists}">
	                                <tr>
	                                    <td colspan="5" class="text-center text-muted">조회된 글이 없습니다.</td>
	                                </tr>
	                            </c:when>
	                            <c:otherwise>
	                                <c:forEach var="vo" items="${lists}" varStatus="status">
	                                    <tr>
	                                        <td>
										   		<c:if test="${empty type && empty keyword}">
										   			${vo.seq}
										   		</c:if>
										   		<c:if test="${not empty type && not empty keyword}">
										   			${status.index+1}
										   		</c:if>
										   </td>
											<td>
												<a class="panel-title" data-toggle="collapse" data-parent="#accordion" href="#collapse${vo.free_id}">${vo.title}</a>
											</td>
	                                        <td>${vo.name}</td>
	                                        <td>${vo.regdate}</td>
											<td>
												<c:if test="${vo.file_exist eq 'Y'}">
													<img src="./images/filedown.png">
			                               		</c:if>
			                               		<c:if test="${vo.file_exist eq 'N'}">
													<img src="./images/filenot.png">
			                               		</c:if>
											</td>
	                                    </tr>
										<tr class="hidden-row">
									   		<td colspan="${sessionScope.loginVo.role eq 'A' ? 6:6}">
									   			<div id="collapse${vo.free_id}" class="panel-collapse collapse">
									   				<div class="form-group">
									   					<label>내용</label>
														<div class="form-control" style="border: 1px solid #ccc; padding: 10px; background: #f8f9fa;">
														    <c:out value="${vo.content}" escapeXml="false" />
														</div>
									   					<div class="btn-group btn-group-justified">
															<c:if test="${vo.emp_id eq loginVo.emp_id}">
										   						<div class="btn-group">
										   							<input type="button" class="btn btn-primary" onclick="modify('${vo.free_id}')" value="수정">
										   						</div>
										   						<div class="btn-group">
										   							<input type="button" class="btn btn-danger" onclick="del('${vo.free_id}')" value="삭제">
										   						</div>
															</c:if>
									   						<div class="btn-group">
									   							<c:if test="${vo.file_exist eq 'Y'}">
									   								<input type="button" class="btn btn-success" onclick="fileDown('${vo.free_id}')" value="첨부파일 다운로드">
									   							</c:if>
									   						</div>
									   						<div class="btn-group">
									   							<input type="button" class="btn btn-info" onclick="reply('${vo.free_id}')" value="답글달기">
									   						</div>
									   					</div>
									   				</div>
									   			</div>
									   		</td>
									   	</tr>
	                                </c:forEach>
	                            </c:otherwise>
	                        </c:choose>
						</tbody>
					</table>
					
	                <input type="button" class="btn btn-light-primary ms-2" value="등록하기" 
	                		onclick="location.href='./newFree.do'">
					
				</div> 
			</form>           
        </div>
		<div class="pagination-container text-center">
		    <c:if test="${page.totalPage > 1}">
		        <ul class="pagination pagination-lg">
		            <!-- 이전 버튼 -->
		            <c:if test="${page.page > 1}">
		                <li>
		                    <a href="./free.do?page=${page.page - 1}">&laquo;</a>
		                </li>
		            </c:if>

		            <c:forEach var="i" begin="${page.stagePage}" end="${page.endPage}" step="1">
		                <li class="${i == page.page ? 'active' : ''}">
		                    <a href="./free.do?page=${i}">${i}</a>
		                </li>
		            </c:forEach>

		            <!-- 다음 버튼 -->
		            <c:if test="${page.page < page.totalPage}">
		                <li>
		                    <a href="./free.do?page=${page.page + 1}">&raquo;</a>
		                </li>
		            </c:if>
		        </ul>
		    </c:if>
		</div>
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function () {
	    $(".panel-title").click(function (e) {
	        e.preventDefault();

	        var target = $(this).attr("href"); 
	        var $targetPanel = $(target);
	        var $targetRow = $targetPanel.closest("tr"); 

	        if ($targetPanel.hasClass("in")) {
	            $targetPanel.collapse("hide");
	            setTimeout(() => {
	                $targetRow.hide(); 
	            }, 300);
	        } else {
	            $(".collapse.in").collapse("hide");
	            $(".hidden-row").hide();

	            $targetRow.show(); 
	            $targetPanel.collapse("show");
	        }
	    });

	    $(".collapse").on("hidden.bs.collapse", function () {
	        $(this).closest("tr").hide();
	    });
	});

	function modify(free_id) {
	    $.ajax({
	        type: "GET",
	        url: "/freeModify.do",
	        data: { free_id: free_id },
	        success: function(response) {
	            window.location.href = "/freeModify.do?free_id=" + free_id;
	        },
	        error: function(xhr, status, error) {
	            alert("수정 페이지로 이동하는 중 오류 발생: " + error);
	        }
	    });
	}
	
	function del(free_id) {
	    $.ajax({
	        type: "GET",
	        url: "/freeDelete.do", 
	        data: { free_id: free_id },
	        success: function(response) {
	            window.location.href = "/free.do";
	        },
	        error: function(xhr, status, error) {
	            alert("삭제 중 오류 발생: " + error); 
	        }
	    });
	}
	
	function reply(free_id) {
		    $.ajax({
		        type: "GET",
		        url: "/freeReply.do", 
		        data: { free_id: free_id },
		        success: function(response) {
		            window.location.href = "/freeReply.do?free_id=" + free_id;
		        },
		        error: function(xhr, status, error) {
		            alert("삭제 중 오류 발생: " + error); 
		        }
		    });
	}
	
	function fileDown(free_id) {
	    $.ajax({
	        type: "GET",
	        url: "/getFileInfoFree.do",
	        data: { free_id: free_id },
	        success: function(response) {
	            if (response) {
	                // 파일 다운로드 URL
	                let downloadUrl = "/getFileInfoFree.do?free_id=" + free_id;
	                // 다운로드 링크를 만들어서 클릭 이벤트로 트리거
	                let link = document.createElement('a');
	                link.href = downloadUrl;
	                link.download = true; // 다운로드 처리
	                document.body.appendChild(link);
	                link.click();  // 다운로드 시작
	                document.body.removeChild(link);
	            } else {
	                alert("파일 정보를 가져오지 못했습니다.");
	            }
	        },
	        error: function(xhr, status, error) {
	            alert("파일 정보를 가져오는 중 오류 발생: " + error);
	        }
	    });
	}
	
</script>
</html>
