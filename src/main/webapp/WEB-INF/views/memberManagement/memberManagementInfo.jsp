<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../include/layoutTop.jsp" flush="true" />

<script>
$(document).ready(function() {
	
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20+obj.scrollHeight)+"px";
    }
	

	
	// 이미지 파일 셋팅
	var image_path = "${pageContext.request.contextPath}/resources/images/profile/"
	var image_name = "question_mark.png";
	
	if ("남" === "${selectDetail.memberDetailInfo.MEMBER_GENDER}") {
		image_name = "male01.png";
	}else if ("여" === "${selectDetail.memberDetailInfo.MEMBER_GENDER}"){
		image_name = "female01.png";
	}
	$("#profile-img").attr("src",image_path + image_name);

	
	// 뒤로가기 버튼
	$("#btnBack").on("click",function(){
	    window.history.back();
	});
	
	
	// 삭제 버튼
	$("#btnDelete").on("click",function(){
		// 정말로 삭제하시겠습니까? 물어 본 후 삭제.
		
		// form.method=delete 날리기.
		// 성공하면 조회 목록으로.  
	});
	
	
	// 저장 버튼
	$("#btnSave").on("click",function(){
		var memberForm = $("#memberForm").serialize();
	    var memberSeq = $("input[name=memberSeq]").val();
// 	    var memberForm = JSON.stringify(memberForm);
	    alert("MemberForm ::::" + memberForm);
	    
		$.ajax({
			url:"${pageContext.request.contextPath}/members/" + memberSeq,
			type:"PUT",
			data: JSON.stringify(memberForm),
			dataType:"json",
			contentType : 'application/json; charset=utf-8' ,
			accept : "application/json",
			success: function(data){
// 				window.location.reload(true);
			},
			error: function(error){
				alert("회원 상세 정보를 불러오는데 실패했습니다." + error.status);
			}
		});

	    
	});
	
	// 수정 버튼
	$("#btnModify").on("click",function(){
	    alert("수정   " + $("input[name=memberBirthday]").val());
	});
	
	// 가족 추가 버튼
	$("#btnAddFamily").on("click",function(){
		// 한 줄 넣기. 어떻게 만들지 생각
		alert("추가");
	});

	// 가족 삭제 버튼
	$("#btnDeleteFamily").on("click",function(){
		// 안에 내용이 있으면 삭제하겠냐고 물어본 후 삭제
		// 내용 없으면 그냥 삭제
		alert("삭제");
		
	});

		
		
});
</script>

<title>세광청년부 - 청년부 교적부</title>
</head>

<body>
	<div class="constraint">
	
	<form class="form-group" id="memberForm">
	
		      <div class="row">
		      
		      	<div class="col-md-12">
		      	
		      		<h3>청년 정보</h3>
					<table class="table">
						<tr>
							<td rowspan="4" style="width: 100px;">
								<img id ="profile-img" src="${pageContext.request.contextPath}/resources/images/profile/question_mark.png"></img>
							</td>
							<th style="width: 180px;">이름</th>
							<td colspan="2">
								<input type="hidden" name="memberSeq" value="${selectDetail.memberDetailInfo.MEMBER_SEQ}"/>
								<input type="text" class="form-control" name="memberName" value="${selectDetail.memberDetailInfo.MEMBER_NAME}"/>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td colspan="2">
								<input type="date" class="form-control" name="memberBirthday" value="${selectDetail.memberDetailInfo.MEMBER_BIRTHDAY}"/>
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td colspan="2">
								<div id="gender">
									<select class="form-control" name="memberGenderCode">
										<c:forEach var="codeListAF" items="${selectDetail.codeListAF}">
										<option value="${codeListAF.CODE_NO}" ${ codeListAF.CODE_NO == selectDetail.memberDetailInfo.MEMBER_GENDER_CODE ?  'selected="selected"' : ' '}>
											${codeListAF.CODE_NAME}
										</option>
										</c:forEach>
									</select>									
								</div>
							</td>
						</tr>
						<tr>
							<th>마을</th>
							<td colspan="2">
								<select class="form-control" name="villageSeq">
									<c:forEach var="villageList" items="${selectDetail.villageAllList}">
									<option value="${villageList.VILLAGE_SEQ}" ${ villageList.VILLAGE_SEQ == selectDetail.memberDetailInfo.VILLAGE_SEQ ?  'selected="selected"' : ' '}>
										${villageList.VILLAGE_NAME}
									</option>
									</c:forEach>
								</select>		
							</td>
						</tr>
						<tr>
							<th colspan="1">연락처</th>
							<td colspan="3">
								<input type="text" class="form-control" name="phoneNumber" value="${selectDetail.memberDetailInfo.PHONE_NUMBER}"/>		
							</td>
						</tr>
						<tr>
							<th>직책</th>
							<td colspan="3">
								<select class="form-control" name="memberPosition">
									<c:forEach var="codeListAA" items="${selectDetail.codeListAA}">
									<option value="${codeListAA.CODE_NO}" ${ codeListAA.CODE_NO == selectDetail.memberDetailInfo.MEMBER_POSITION ?  'selected="selected"' : ' '}>
										${codeListAA.CODE_NAME}
									</option>
									</c:forEach>
								</select>		
							</td>
						</tr>
						<tr>
							<th>직장</th>
							<td colspan="3">
								<input type="text" class="form-control" name="memberJob" value="${selectDetail.memberDetailInfo.MEMBER_JOB}"/>
							</td>
						</tr>
						<tr>
							<th>신앙 시작일</th>
							<td colspan="3">
								<input type="date" class="form-control" name="faithStartDate" value="${selectDetail.memberDetailInfo.FAITH_START_DATE}"/>		
							</td>
						</tr>
						
						<tr>
							<th>세례</th>
							<td colspan="3">
								<select class="form-control" name=baptismCode>
									<c:forEach var="codeListAE" items="${selectDetail.codeListAE}">
									<option value="${codeListAE.CODE_NO}" ${ codeListAE.CODE_NO == selectDetail.memberDetailInfo.BAPTISM_CODE ?  'selected="selected"' : ' '}>
										${codeListAE.CODE_NAME}
									</option>
									</c:forEach>
								</select>		
							</td>
						</tr>
						<tr>
							<th>세례 집례자</th>
							<td colspan="3">
								<input type="text" class="form-control" name="officiator" value="${selectDetail.memberDetailInfo.OFFICIATOR}"/>		
							</td>
						</tr>
						<tr>
							<th>출석 교회</th>
							<td colspan="3">
								<input type="text" class="form-control" name="attendanceChurch" value="${selectDetail.memberDetailInfo.ATTENDANCE_CHURCH}"/>		
							</td>
						</tr>
						<tr>
							<th>교회 출석 동기</th>
							<td colspan="3">
								<textarea class="form-control" style="max-width: 100%" name="attendanceReason">${selectDetail.memberDetailInfo.ATTENDANCE_REASON}</textarea>		
							</td>
						</tr>
						<tr>
							<th>인도자</th>
							<td colspan="3">
								<input type="text" class="form-control" name="leader" value="${selectDetail.memberDetailInfo.LEADER}"/>		
							</td>
						</tr>
						<tr>
							<th>마지막 수정일</th>
							<td colspan="3">
								${selectDetail.memberDetailInfo.UPDATE_TS}		
							</td>
						</tr>
					</table>
		      	</div> <!--  col-md-9 -->
		      </div> <!-- row -->
		      
		      <div class="row">	      	
		      	<div class="col-md-12">
					
					<h3>가족관계</h3>
					<button type="button" id="btnAddFamily" class="btn btn-warning btn-xs">추가</button>
					<button type="button" id="btnDeleteFamily" class="btn btn-danger btn-xs">삭제</button>
					
					<table class="table table-hover">
						<thead>
						<tr class="active">
							<td style="width: 30px;">#</td>
							<td style="width: 60px;">관계</td>
							<td style="width: 100px;">이름</td>
							<td>종교</td>
							<td>메모</td>
						</tr>
						</thead>
						<tbody id="family-tbody">
							<c:forEach var="familyRelation" items="${selectDetail.familyRelations}" varStatus="status">
								  <tr>
									<td style="width: 30px; color:#ABABAB;">${status.count} <input type="hidden" class="form-control" name="memberSeq" value="${familyRelation.codeListAD}"/></td>
									<td><input type="text" class="form-control" name="familyCode" value="${familyRelation.FAMILY_CODE_NAME}"/></td>
									<td><input type="text" class="form-control" name="familyName" value="${familyRelation.FAMILY_NAME}"/></td>
									<td>
									<select class="form-control" name=relginCode>
										<c:forEach var="codeListAD" items="${selectDetail.codeListAD}">
											<option value="${codeListAD.CODE_NO}" ${ codeListAD.CODE_NO == familyRelation.RELIGON_CODE ?  'selected="selected"' : ' '}>
												${codeListAD.CODE_NAME}
											</option>
										</c:forEach>
									</select>
									</td>
									<td><input type="text" class="form-control" name="remark" value="${familyRelation.REMARK}"/></td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
	
		      	</div>
	          </div><!-- row -->	
	          <div class="btn-bottom-group">
			        <button type="button" class="btn btn-default" id="btnBack">뒤로가기</button>
			        <button type="button" class="btn btn-info" id="btnModify" value="">수정</button>
			        <button type="button" class="btn btn-warning" id="btnSave" value="">저장</button>
<!-- 	        <form:form method="post"> -->
	        		<input type="hidden" name = "_method" value="delete">
			        <button type="button" class="btn btn-danger" id="btnDelete" value="">삭제</button>
<!-- 	        </form:form> -->
	          </div>
	   			</form>		
	</div> <!-- constraint -->
</body>

<jsp:include page="../include/layoutBottom.jsp" flush="true" />