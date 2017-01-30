<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../include/layoutTop.jsp" flush="true" />

<script>
$(document).ready(function() {
	
});
</script>

<title>세광청년부 - 청년부 교적부</title>
</head>

<body>
	${selectDetail.memberDetailInfo}

	      <div class="row">
	      	<div class="col-md-3">
	      		<img id ="profile-img" src="${pageContext.request.contextPath}/resources/profile/male01.png"></img>
	      	</div>
	      	<div class="col-md-9">
					<div class="col-md-3">생년월일:</div><div id="birthday" class="col-md-9"></div><div class="clearfix">${selectDetail.memberDetailInfo.MEMBER_BIRTHDAY}</div>
					<div class="col-md-3">성별: </div><div id="gender" class="col-md-9"> </div>	<div class="clearfix">${selectDetail.memberDetailInfo.MEMBER_GENDER}</div>
					<div class="col-md-3">마을: </div><div id="village" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.VILLAGE_NAME}</div>
					<div class="col-md-3">E-Mail: </div><div id="e-mail" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.MEMBER_EMAIL}</div>
					<div class="col-md-3">연락처: </div><div id="phoneNumber" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.PHONE_NUMBER}</div>
					<div class="col-md-3">직책: </div><div id="position" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.MEMBER_POSITION}</div>
					<div class="col-md-3">직장: </div><div id="job" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.MEMBER_JOB}</div>			
					<div class="col-md-3">주소: </div><div id="memberAddress" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.MEMBER_ADDRESS}</div>
					
					<div class="col-md-3">신앙 시작일: </div><div id="faithStartDate" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.FAITH_START_DATE}</div>
					<div class="col-md-3">세례: </div><div id="baptismCode" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.BAPTISM_CODE}</div>
					<div class="col-md-3">세례 집례자: </div><div id="officiator" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.OFFICIATOR}</div>
					<div class="col-md-3">출석 교회: </div><div id="baptismCode" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.ATTENDANCE_CHURCH}</div>
					<div class="col-md-3">교회 출석동기: </div><div id="attendanceReason" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.ATTENDANCE_REASON}</div>
					<div class="col-md-3">인도자: </div><div id="leader" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.LEADER}</div>
					
					<br>
					<div class="col-md-3">등록일: </div><div id="registTs" class="col-md-9"> </div> <div class="clearfix">${selectDetail.memberDetailInfo.REGIST_TS}</div>
					
	      	</div>
	      </div>	
	      <div class="row">	      	
	      	<div class="col-md-12">
				
				가족관계
				<table class="table table-hover">
					<thead>
					<tr class="active">
						<td style="width: 30px;">#</td>
						<td style="width: 60px;">관계</td>
						<td style="width: 100px;">이름</td>
						<td>종교</td>
					</tr>
					</thead>
						<c:forEach var="familyRelation" items="${selectDetail.familyRelations}" varStatus="status">
							  <tr>
								<td style="width: 30px; color:#ABABAB;">${status.count}</td>
								<td>${familyRelation.FAMILY_CODE_NAME}</td>
								<td>${familyRelation.FAMILY_NAME}</td>
								<td>${familyRelation.RELIGON_CODE}</td>
								</tr>
						</c:forEach>
				</table>

	      	</div>
          </div><!-- row -->	
	
	        <form class="form-inline" method="post" action ="memberManagementInfo">
		        <button type="button" class="btn btn-default" data-dismiss="modal">목록으로 돌아가기</button>
		        <button type="submit" class="btn btn-primary" id="btnDetail" name="memberSeq" value="">수정</button>
   			</form>		

	
	
</body>

<jsp:include page="../include/layoutBottom.jsp" flush="true" />