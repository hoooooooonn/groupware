<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HtmlToPdf</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script type="text/javascript" src="./js/htp.js"></script>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
			<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
							active" href="/keen/demo1/account/overview.html">
						내 정보
					</a>
				</li>
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active" href="/keen/demo1/account/overview.html">
						일정 관리
					</a>
				</li>
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active" href="./certification.do">
						증명서 관리
					</a>
				</li>
			</ul>
        <div class="main-content">
	<div>
		<button id="savePdf">PDF 저장</button>
	</div>
	<div id="saveZone">
		<!-- Page Wrapping (start) : Style retention -->
		<div id="divCustomWrapper"
			style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
			<!-- Embededd Style이 적용받는 범위 입니다. 상단의 스타일은 이 요소 안에서만 동작합니다. -->
			<!-- 1. Title Section (start) : 문서제목이 작성되는 영역입니다.-->
			<div id="titleSection"
				style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 19pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">재직증명서</div>
			<!-- 1. Title Section (end) -->
			<!-- 2. Draft Section (Start) : 결재정보가 작성되는 영역입니다. -->
			<div class="partition" id="draftSection"
				style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
				<!-- 2.1 Drafter Information (Start) -->
				<div class="left"
					style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<table style="width: 250px; height: 120px;">
						<colgroup>
							<col width="80">
							<col width="170">
						</colgroup>
						<tbody>
							<tr>
								<td
									class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

									기 안 자</td>
								<td
									class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<span class="comp_wrap" contenteditable="false" data-value=""
									unselectable="on" data-wrapper="" data-autotype=""
									data-dsl="{{label:draftUser}}" data-cid="0"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="comp_item"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안자</span><span
										class="comp_hover" contenteditable="false"
										data-content-protect-cover="true" data-origin="0"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
											<a class="ic_prototype ic_prototype_trash"
											contenteditable="false" data-content-protect-cover="true"
											data-component-delete-button="true"></a>
									</span></span>
								</td>
							</tr>
							<tr>
								<td
									class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

									소 속</td>
								<td
									class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<span class="comp_wrap" contenteditable="false" data-value=""
									unselectable="on" data-wrapper="" data-autotype=""
									data-dsl="{{label:draftDept}}" data-cid="1"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="comp_item"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안부서</span><span
										class="comp_hover" contenteditable="false"
										data-content-protect-cover="true" data-origin="1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
											<a class="ic_prototype ic_prototype_trash"
											contenteditable="false" data-content-protect-cover="true"
											data-component-delete-button="true"></a>
									</span></span>
								</td>
							</tr>
							<tr>
								<td
									class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

									기 안 일</td>
								<td
									class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<span class="comp_wrap" contenteditable="false" data-value=""
									unselectable="on" data-wrapper="" data-autotype=""
									data-dsl="{{label:draftDate}}" data-cid="2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="comp_item"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안일</span><span
										class="comp_hover" contenteditable="false"
										data-content-protect-cover="true" data-origin="2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
											<a class="ic_prototype ic_prototype_trash"
											contenteditable="false" data-content-protect-cover="true"
											data-component-delete-button="true"></a>
									</span></span>
								</td>
							</tr>
							<tr>
								<td
									class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

									문서번호</td>
								<td
									class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<span class="comp_wrap" contenteditable="false" data-value=""
									unselectable="on" data-wrapper="" data-autotype=""
									data-dsl="{{label:docNo}}" data-cid="3"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="comp_item"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">문서번호</span><span
										class="comp_hover" contenteditable="false"
										data-content-protect-cover="true" data-origin="3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><a
											class="ic_prototype ic_prototype_trash"
											contenteditable="false" data-content-protect-cover="true"
											data-component-delete-button="true"></a></span></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 2.1 Drafter Information (end) -->
				<!-- 2.2 Draft Line (start) -->
				<div class="inaRowRight"
					style="width: 800px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<!-- 결재선 1 Start-->
					<span unselectable="on" contenteditable="false" class="comp_wrap"
						data-wrapper=""
						style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<!-- 결재선 타입, 결재자 수 -->
						<span class="sign_type1_inline" data-group-seq="0"
						data-group-name="기안" data-group-max-count="1"
						data-group-type="type1" data-is-reception=""
						style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
							<!-- 결재선 이름 -->
							<span class="sign_tit_wrap"
							style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
								class="sign_tit"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><strong>기안</strong></span></span>
						<!-- 결재방 1EA Start -->
							<span class="sign_member_wrap"
							style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
								class="sign_member"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
									class="sign_rank_wrap test2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_rank"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span
									class="sign_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span
									class="sign_date_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_date"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span>
						<!-- 결재방 1EA End-->
							<!-- 휴지통 컴포넌트 Start-->
					</span><span contenteditable="false" class="comp_hover"
						data-content-protect-cover="true"
						style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><a
							contenteditable="false" class="ic_prototype ic_prototype_trash"
							data-content-protect-cover="true"
							data-component-delete-button="true"></a></span>
					</span>
					<!-- 휴지통 컴포넌트 End-->
					<!-- 결재선 1 End-->
					<!-- 결재선 2 Start-->
					<span unselectable="on" contenteditable="false" class="comp_wrap"
						data-wrapper=""
						style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<!-- 결재선 타입, 결재자 수 -->
						<span class="sign_type1_inline" data-group-seq="1"
						data-group-name="승인" data-group-max-count="3"
						data-group-type="type1" data-is-reception=""
						style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
							<!-- 결재선 이름 -->
							<span class="sign_tit_wrap"
							style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
								class="sign_tit"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><strong>승인</strong></span></span>
						<!-- 결재방 Start-->
							<!-- 결재방 1EA Start -->
							<span class="sign_member_wrap"
							style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
								class="sign_member"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
									class="sign_rank_wrap test2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_rank"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span
									class="sign_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span
									class="sign_date_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_date"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span>
						<!-- 결재방 1EA End-->
							<!-- 결재방 1EA Start -->
							<span class="sign_member_wrap"
							style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
								class="sign_member"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
									class="sign_rank_wrap test2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_rank"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span
									class="sign_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span
									class="sign_date_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_date"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span>
						<!-- 결재방 1EA End-->
							<!-- 결재방 1EA Start -->
							<span class="sign_member_wrap"
							style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
								class="sign_member"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
									class="sign_rank_wrap test2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_rank"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span
									class="sign_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span
									class="sign_date_wrap"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span
										class="sign_date"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span>
						<!-- 결재방 1EA End-->
							<!-- 결재방 End-->
							<!-- 휴지통 컴포넌트 Start-->
					</span><span contenteditable="false" class="comp_hover"
						data-content-protect-cover="true"
						style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><a
							contenteditable="false" class="ic_prototype ic_prototype_trash"
							data-content-protect-cover="true"
							data-component-delete-button="true"></a></span>
					</span>
					<!-- 휴지통 컴포넌트 End-->
					<!-- 결재선 2 End-->
				</div>
				<!-- 2.2 Draft Line (end) -->
			</div>
			<!-- 2. Draft Section (end) -->
			<!-- 3. Detail Section (start) : 내용이 작성되는 영역입니다. -->
			<table class="detailSection">
				<colgroup>
					<!-- ### 테이블의 컬럼 너비는 colGroup을 통해 지정합니다. td에 지정 X ### -->
					<col width="100">
					<col width="100">
					<col width="200">
					<col width="100">
					<col width="300">
				</colgroup>

				<tbody>
					<tr>
						<td rowspan="2"
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							인적사항</td>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							성 명</td>
						<td
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<span unselectable="on" contenteditable="false" class="comp_wrap"
							data-cid="4" data-dsl="{{text}}" data-wrapper=""
							style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
							data-value="" data-autotype=""><input class="ipt_editor"
								type="text"><span contenteditable="false"
								class="comp_active"
								style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<span class="Active_dot1"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									<span class="Active_dot3"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot4"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							</span> <span contenteditable="false" class="comp_hover"
								data-content-protect-cover="true" data-origin="4"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<a contenteditable="false"
									class="ic_prototype ic_prototype_trash"
									data-content-protect-cover="true"
									data-component-delete-button="true"></a>
							</span> </span>
						</td>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							주민등록번호</td>
						<td
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<p
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
								<span unselectable="on" contenteditable="false"
									class="comp_wrap" data-cid="6" data-dsl="{{text}}"
									data-wrapper=""
									style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"
									data-value="" data-autotype=""><input class="ipt_editor"
									type="text"><span contenteditable="false"
									class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="6"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</p>
						</td>
					</tr>
					<tr>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							주 소</td>
						<td colspan="3"
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<p
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
								<span unselectable="on" contenteditable="false"
									class="comp_wrap" data-cid="5" data-dsl="{{text}}"
									data-wrapper=""
									style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"
									data-value="" data-autotype=""><input class="ipt_editor"
									type="text"><span contenteditable="false"
									class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="5"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</p>
						</td>
					</tr>
					<tr>
						<td rowspan="3"
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							재직사항</td>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							소 속</td>
						<td colspan="3"
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<p
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
								<span unselectable="on" contenteditable="false"
									class="comp_wrap" data-cid="7" data-dsl="{{text}}"
									data-wrapper=""
									style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"
									data-value="" data-autotype=""><input class="ipt_editor"
									type="text"><span contenteditable="false"
									class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="7"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</p>
						</td>
					</tr>
					<tr>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							직 위</td>
						<td colspan="3"
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<p
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
								<span unselectable="on" contenteditable="false"
									class="comp_wrap" data-cid="8" data-dsl="{{text}}"
									data-wrapper=""
									style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"
									data-value="" data-autotype=""><input class="ipt_editor"
									type="text"><span contenteditable="false"
									class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="8"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</p>
						</td>
					</tr>
					<tr>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							재직기간</td>
						<td colspan="3"
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<p
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
								<span unselectable="on" contenteditable="false"
									class="comp_wrap" data-cid="9" data-dsl="{{period}}"
									data-wrapper=""
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"
									data-value="" data-autotype=""><input
									class="ipt_editor ipt_editor_date" type="text"> ~ <input
									class="ipt_editor ipt_editor_date" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="9"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</p>
						</td>
					</tr>
					<tr>
						<td
							class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							발급용도</td>
						<td colspan="4"
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<p
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
								<span unselectable="on" contenteditable="false"
									class="comp_wrap" data-cid="10" data-dsl="{{text}}"
									data-wrapper=""
									style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"
									data-value="" data-autotype=""><input class="ipt_editor"
									type="text"><span contenteditable="false"
									class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="10"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</p>
						</td>
					</tr>
					<tr>
						<td colspan="5"
							class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							위와 같이 재직하고 있음을 증명합니다.<br>
						<br>
						<br>
						<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp;20<span unselectable="on"
							contenteditable="false" class="comp_wrap" data-cid="11"
							data-dsl="{{text$width:20$}}" data-wrapper=""
							style="width: 20px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
							data-value="" data-autotype=""><input class="ipt_editor"
								type="text"><span contenteditable="false"
								class="comp_active"
								"="" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<span class="Active_dot1"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									<span class="Active_dot3"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot4"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							</span> <span contenteditable="false" class="comp_hover"
								data-content-protect-cover="true" data-origin="11"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<a contenteditable="false"
									class="ic_prototype ic_prototype_trash"
									data-content-protect-cover="true"
									data-component-delete-button="true"></a>
							</span> </span>년 <span unselectable="on" contenteditable="false"
							class="comp_wrap" data-cid="12" data-dsl="{{text$width:20$}}"
							data-wrapper=""
							style="width: 20px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
							data-value="" data-autotype=""><input class="ipt_editor"
								type="text"><span contenteditable="false"
								class="comp_active"
								"="" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<span class="Active_dot1"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									<span class="Active_dot3"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot4"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							</span> <span contenteditable="false" class="comp_hover"
								data-content-protect-cover="true" data-origin="12"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<a contenteditable="false"
									class="ic_prototype ic_prototype_trash"
									data-content-protect-cover="true"
									data-component-delete-button="true"></a>
							</span> </span>월 <span unselectable="on" contenteditable="false"
							class="comp_wrap" data-cid="13" data-dsl="{{text$width:20$}}"
							data-wrapper=""
							style="width: 20px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
							data-value="" data-autotype=""><input class="ipt_editor"
								type="text"><span contenteditable="false"
								class="comp_active"
								"="" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<span class="Active_dot1"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot2"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									<span class="Active_dot3"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
									class="Active_dot4"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							</span> <span contenteditable="false" class="comp_hover"
								data-content-protect-cover="true" data-origin="13"
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
									<a contenteditable="false"
									class="ic_prototype ic_prototype_trash"
									data-content-protect-cover="true"
									data-component-delete-button="true"></a>
							</span> </span>일<br>
						<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>
						<br>
						<br>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 3. Detail Section (end) -->
		</div>
		<!-- Page Wrapping (end) -->

		<!----------------------------------------Style Start---------------------------------------->
		<!-- Common style (Don't modify) -->
		<style type="text/css">
/* 1. Essential style : 반드시 적용되어야 하는 스타일입니다. 문서작성 시, Sample에서 제거불가 한 스타일 */
#divCustomWrapper {
	word-break: break-all;
	font-family: malgun gothic, dotum, arial, tahoma;
	font-size: 9pt;
	width: 800px !important;
}

#divCustomWrapper * {
	max-width: 800px !important;
}
/* (1) Section(제목, 결재선, 내용) */
#divCustomWrapper #titleSection, #divCustomWrapper #draftSection,
	#divCustomWrapper .detailSection {
	width: 800px !important;
	clear: both;
	margin-top: 20px !important;
	vertical-align: middle;
}

#divCustomWrapper #titleSection {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 30px !important;
	margin-top: 20px !important;
}

#divCustomWrapper #draftSection {
	display: inline-block;
}

#divCustomWrapper .detailSection>* {
	margin-bottom: 10px;
}
/* (2) Table */
#divCustomWrapper table {
	border-collapse: collapse;
	table-layout: fixed;
	word-break: break-all;
}
</style>
		<style type="text/css">
/* 2. Option style : 용도에 따라 적용합니다.*/
/* (1) Table option : 2Type(subject / detail), Affacted elements(td), Range('divCustomWrapper' 하단요소) */
#divCustomWrapper td.subjectColumn {
	border: 1px solid black !important;
	font-size: 9pt !important;
	height: 22px;
	padding: 3px 1px 3px 1px; /*top right bottom left*/
}

#divCustomWrapper td.detailColumn {
	border: 1px solid black !important;
	font-size: 9pt !important;
	height: 22px;
	padding: 3px 5px 3px 5px;
	vertical-align: middle; /*top right bottom left*/
}

#divCustomWrapper td.detailColumn {
	text-align: left;
}

#divCustomWrapper td.subjectColumn {
	background: rgb(221, 221, 221);
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}
/* (2) detailColumn :  3Type(center / right / high), Affacted elements(All), Range('detailColumn' 하단요소) */
/* 설명 : detailColumn 커스텀 시 사용 */
/* 사용방법 : 번호와 중앙정렬 텍스트 작성 시 'centerCol' CLASS 적용, 숫자와 금액 작성 시 'rightCol' CLASS 적용,
   editor 작성 시 'editorCol' CLASS 적용, textarea 작성 시 'areaCol' CLASS 적용 */
#divCustomWrapper td.detailColumn.centerCol {
	text-align: center;
}

#divCustomWrapper td.detailColumn.rightCol {
	text-align: right;
}

#divCustomWrapper td.detailColumn.editorCol {
	height: 300px;
	vertical-align: top;
}

#divCustomWrapper td.detailColumn.areaCol {
	height: 120px;
	vertical-align: top;
}
/* (3) Partition option : 2Type (left / right), Affacted elements(div), Range('partition'div영역 하단요소) */
/* 설명 : 좌,우로 분할되는 레이아웃 작성시 사용, 1라인에 1개 요소만 배치(줄바뀜 동반) */
/* 사용방법 : 분할할 영역에 partition CLASS를 적용 -> 분할배치하고자하는 하위요소에 'left, right' CLASS 적용 */
#divCustomWrapper div.partition .left {
	display: inline-block;
	clear: left;
	float: left;
}

#divCustomWrapper div.partition .right {
	display: inline-block;
	clear: right;
	float: right;
}
/* (4) In a row option : 2Type(left / right), Affacted elements(All), Range('inaRowRight or inRowLeft'div영역 하단요소) */
/* 설명 : 좌,우 끝에 정렬되는 레이아웃 작성 시 사용, 1라인에 여러개 요소 배치, Partition option과 조합(줄바뀜 없이 배치) */
/* 사용방법 : 나란히 정렬하고자 하는 요소들을, 'in a row'div 영역 내에 배치 */
#divCustomWrapper div.inaRowRight {
	text-align: right;
}

#divCustomWrapper div.inaRowLeft {
	text-align: left;
}
/* (5) button :  2Type(td / div), Affacted elements(All) */
/* 설명 : 행 추가, 행 삭제 버튼 작성 시 'viewModeHiddenPart'(기안 시 버튼 가려주는 클래스)와 조합해서 사용 */
/* 사용방법 : 테이블에 한줄로 사용 시 td에 'viewModeHiddenPart .td_button' CLASS 적용 -> 각 버튼에 'button' CLASS 적용 td 내 텍스트 아래에 쓰이거나 테이블 밖에서 사용 시 div에 viewModeHiddenPart .div_button CLASS 적용 -> 각 버튼에 button CLASS 적용 */
#divCustomWrapper .td_button {
	word-break: break-all;
	padding: 3px;
	border: none;
	width: 800px;
	height: 22px;
	text-align: right;
	vertical-align: middle;
}

#divCustomWrapper .div_button {
	word-break: break-all;
	padding: 3px;
	border: none;
	margin-top: 2px;
	margin-bottom: 2px;
	height: 22px;
	vertical-align: middle;
}

#divCustomWrapper a.button {
	background: rgb(102, 102, 102);
	color: rgb(255, 255, 255);
	padding: 2px 5px;
	border-radius: 3px;
	margin-right: 0px;
	margin-left: 0px;
	font-size: 9pt !important;
}
/* (6) p :  2Type(titleP / freeP), Affacted elements(All) */
/* 설명 : 테이블 별 소제목과 테이블 아래 설명 작성 시 사용*/
p.titleP {
	font-weight: bold;
	font-size: 12px;
	margin: 15px 1px 5px 5px; /*top right bottom left*/
}

p.freeP {
	font-weight: normal;
	font-size: 12px;
	margin: 1px 1px 3px 5px; /*top right bottom left*/
}
</style>
		<!-- Common style (Don't modify) -->
		<!-- Print style (Don't modify) -->
		<style type="text/css">
/* 인쇄시에만 적용되는 스타일입니다. 순서대로 1.양식 인쇄 시 중앙으로 위치 2.테이블 테두리 고정 3.버튼 가리기 */
@media print {
	.viewModeHiddenPart {
		display: none;
	}
	h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form,
		fieldset, legend, div, body {
		-webkit-print-color-adjust: exact;
	}
}
</style>
		<!-- Print style (Don't modify)-->
		<style>
<!--
Custom
 
style
 
-->
	/* 추가적인 스타일이 필요한 경우, 하단의 style에서 정의하여야 합니다. 상단의 Common style은 변경하지 않습니다. */
/* (스타일이 중복되는 경우, 기본적으로 하단에 작성한 style이 우선적으로 적용됩니다.) */
</style>
		<!-- Custom style -->
		<p
			style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
			<br>
		</p>
	</div>

	<!----------------------------------------Style Start---------------------------------------->
	<!-- Common style (Don't modify) -->
	<style type="text/css">
/* 1. Essential style : 반드시 적용되어야 하는 스타일입니다. 문서작성 시, Sample에서 제거불가 한 스타일 */
#divCustomWrapper {
	word-break: break-all;
	font-family: malgun gothic, dotum, arial, tahoma;
	font-size: 9pt;
	width: 800px !important;
}

#divCustomWrapper * {
	max-width: 800px !important;
}
/* (1) Section(제목, 결재선, 내용) */
#divCustomWrapper #titleSection, #divCustomWrapper #draftSection,
	#divCustomWrapper .detailSection {
	width: 800px !important;
	clear: both;
	margin-top: 20px !important;
	vertical-align: middle;
}

#divCustomWrapper #titleSection {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 30px !important;
	margin-top: 20px !important;
}

#divCustomWrapper #draftSection {
	display: inline-block;
}

#divCustomWrapper .detailSection>* {
	margin-bottom: 10px;
}
/* (2) Table */
#divCustomWrapper table {
	border-collapse: collapse;
	table-layout: fixed;
	word-break: break-all;
}
</style>
	<style type="text/css">
/* 2. Option style : 용도에 따라 적용합니다.*/
/* (1) Table option : 2Type(subject / detail), Affacted elements(td), Range('divCustomWrapper' 하단요소) */
#divCustomWrapper td.subjectColumn {
	border: 1px solid black !important;
	font-size: 9pt !important;
	height: 22px;
	padding: 3px 1px 3px 1px; /*top right bottom left*/
}

#divCustomWrapper td.detailColumn {
	border: 1px solid black !important;
	font-size: 9pt !important;
	height: 22px;
	padding: 3px 5px 3px 5px;
	vertical-align: middle; /*top right bottom left*/
}

#divCustomWrapper td.detailColumn {
	text-align: left;
}

#divCustomWrapper td.subjectColumn {
	background: rgb(221, 221, 221);
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}
/* (2) detailColumn :  3Type(center / right / high), Affacted elements(All), Range('detailColumn' 하단요소) */
/* 설명 : detailColumn 커스텀 시 사용 */
/* 사용방법 : 번호와 중앙정렬 텍스트 작성 시 'centerCol' CLASS 적용, 숫자와 금액 작성 시 'rightCol' CLASS 적용,
   editor 작성 시 'editorCol' CLASS 적용, textarea 작성 시 'areaCol' CLASS 적용 */
#divCustomWrapper td.detailColumn.centerCol {
	text-align: center;
}

#divCustomWrapper td.detailColumn.rightCol {
	text-align: right;
}

#divCustomWrapper td.detailColumn.editorCol {
	height: 300px;
	vertical-align: top;
}

#divCustomWrapper td.detailColumn.areaCol {
	height: 120px;
	vertical-align: top;
}
/* (3) Partition option : 2Type (left / right), Affacted elements(div), Range('partition'div영역 하단요소) */
/* 설명 : 좌,우로 분할되는 레이아웃 작성시 사용, 1라인에 1개 요소만 배치(줄바뀜 동반) */
/* 사용방법 : 분할할 영역에 partition CLASS를 적용 -> 분할배치하고자하는 하위요소에 'left, right' CLASS 적용 */
#divCustomWrapper div.partition .left {
	display: inline-block;
	clear: left;
	float: left;
}

#divCustomWrapper div.partition .right {
	display: inline-block;
	clear: right;
	float: right;
}
/* (4) In a row option : 2Type(left / right), Affacted elements(All), Range('inaRowRight or inRowLeft'div영역 하단요소) */
/* 설명 : 좌,우 끝에 정렬되는 레이아웃 작성 시 사용, 1라인에 여러개 요소 배치, Partition option과 조합(줄바뀜 없이 배치) */
/* 사용방법 : 나란히 정렬하고자 하는 요소들을, 'in a row'div 영역 내에 배치 */
#divCustomWrapper div.inaRowRight {
	text-align: right;
}

#divCustomWrapper div.inaRowLeft {
	text-align: left;
}
/* (5) button :  2Type(td / div), Affacted elements(All) */
/* 설명 : 행 추가, 행 삭제 버튼 작성 시 'viewModeHiddenPart'(기안 시 버튼 가려주는 클래스)와 조합해서 사용 */
/* 사용방법 : 테이블에 한줄로 사용 시 td에 'viewModeHiddenPart .td_button' CLASS 적용 -> 각 버튼에 'button' CLASS 적용 td 내 텍스트 아래에 쓰이거나 테이블 밖에서 사용 시 div에 viewModeHiddenPart .div_button CLASS 적용 -> 각 버튼에 button CLASS 적용 */
#divCustomWrapper .td_button {
	word-break: break-all;
	padding: 3px;
	border: none;
	width: 800px;
	height: 22px;
	text-align: right;
	vertical-align: middle;
}

#divCustomWrapper .div_button {
	word-break: break-all;
	padding: 3px;
	border: none;
	margin-top: 2px;
	margin-bottom: 2px;
	height: 22px;
	vertical-align: middle;
}

#divCustomWrapper a.button {
	background: rgb(102, 102, 102);
	color: rgb(255, 255, 255);
	padding: 2px 5px;
	border-radius: 3px;
	margin-right: 0px;
	margin-left: 0px;
	font-size: 9pt !important;
}
/* (6) p :  2Type(titleP / freeP), Affacted elements(All) */
/* 설명 : 테이블 별 소제목과 테이블 아래 설명 작성 시 사용*/
p.titleP {
	font-weight: bold;
	font-size: 12px;
	margin: 15px 1px 5px 5px; /*top right bottom left*/
}

p.freeP {
	font-weight: normal;
	font-size: 12px;
	margin: 1px 1px 3px 5px; /*top right bottom left*/
}
</style>
	<!-- Common style (Don't modify) -->
	<!-- Print style (Don't modify) -->
	<style type="text/css">
/* 인쇄시에만 적용되는 스타일입니다. 순서대로 1.양식 인쇄 시 중앙으로 위치 2.테이블 테두리 고정 3.버튼 가리기 */
@media print {
	.viewModeHiddenPart {
		display: none;
	}
	h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form,
		fieldset, legend, div, body {
		-webkit-print-color-adjust: exact;
	}
}
</style>
	<!-- Print style (Don't modify)-->
	<style>
<!--
Custom

 

style

 

-->
	/* 추가적인 스타일이 필요한 경우, 하단의 style에서 정의하여야 합니다. 상단의 Common style은 변경하지 않습니다. */
/* (스타일이 중복되는 경우, 기본적으로 하단에 작성한 style이 우선적으로 적용됩니다.) */
</style>
	<!-- Custom style -->
	<p
		style="font-family: &amp; amp; quot; 맑은 고딕&amp;amp; quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
		<br>
	</p>



</body>
</html>