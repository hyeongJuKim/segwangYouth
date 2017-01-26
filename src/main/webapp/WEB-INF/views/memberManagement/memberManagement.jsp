<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<!-- jQuery -->
<script src="./webjars/jquery/3.1.1/dist/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="./webjars/bootstrap/3.3.5/css/bootstrap.min.css">

<link rel="stylesheet" href="./webjars/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<!-- Bootstrap Core JavaScript -->
<script src="./webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">
body{
	font-size: 12px;
/* 	background-color: #F7F7F7;  */
	background-color: #fff; 
}

.table-search{
    height: 420px !important;
    overflow: scroll;
}

.villageGroupCountBox {
	display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    width: 100px;
    white-space: nowrap;
    border: 1px solid transparent;
    border-color: #ccc;
    border-radius: 4px;
    color: #333;
}

.modal-title {
/* 	font-size: 15px; */
margin: 10px;
}

.modal-body {
font-size: 17px;
/* margin: 10px; */

}

.modal-body-row {
	margin-top: 10px;
}

#profile-img {
	width: 180px;
}


</style>

<script>
$(document).ready(function() {

	// 청년 상세화면
	$(".memberDetail").on("click",function(){
		var memberSeq = $(this).attr("value");
		$.ajax({
			url:"/segwangYouth/memberManagementDetail",
			method:"POST",
			data:{
				memberSeq : memberSeq
			},
			dataType:"json",
			success: function(data){
				
				$("#name").text(data.MEMBER_NAME);
				$("#gender").text(data.MEMBER_GENDER);
				$("#birthday").text(data.MEMBER_BIRTHDAY);
				$("#village").text(data.VILLAGE_NAME);
				$("#phoneNumber").text(data.PHONE_NUMBER);
				$("#position").text(data.MEMBER_POSITION);
				$("#job").text(data.MEMBER_JOB);
				$("#e-mail").text(data.MEMBER_EMAIL);
				$("#memberAddress").text(data.MEMBER_ADDRESS);
				
		 		$('#myModal').modal('show'); 
			},
			error: function(error){
				alert("회원 상세 정보를 불러오는데 실패했습니다." + error.status);
			} 
		});		
		
		
	});
	
	
	
});
</script>

<title>세광청년부 - 청년부 교적부</title>
</head>

<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="name"></span></h4>
      </div>
      <div class="modal-body">
	      <div class="row">
	      	<div class="col-md-3">
	      		<img id ="profile-img" src="${pageContext.request.contextPath}/resources/profile/male01.png"></img>
	      	</div>
	      	<div class="col-md-9">
				<div class="col-md-3">생년월일:</div>	<div id="birthday" class="col-md-9"></div>
				<div class="col-md-3">성별: </div>	<div id="gender" class="col-md-9"></div>	
				<div class="col-md-3">마을: </div>	<div id="village" class="col-md-9"></div>
				<div class="col-md-3">E-Mail: </div>	<div id="e-mail" class="col-md-9"></div>
				<div class="col-md-3">연락처: </div>	<div id="phoneNumber" class="col-md-9"></div>			
				<div class="col-md-3">직책: </div>	<div id="position" class="col-md-9"></div>
				<div class="col-md-3">직장: </div>	<div id="job" class="col-md-9"></div>			
				<div class="col-md-3">주소: </div>	<div id="memberAddress" class="col-md-9"></div>
	      	</div>
	      </div>	
	      <div class="row">	      	
	      	<div class="col-md-12">
				<!-- 여기에 교가족관계 table, 신상사항 밑 data넣기 -->	      	
				
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
					<tbody class="table-search">
				<c:forEach var="member" items="${selectList.memberList}" varStatus="status">
					<tr>
						<td style="width: 30px; color:#ABABAB;">1</td>
						<td>부</td>
						<td>김태영</td>
						<td>기독교</td>
					</tr>
					<tr>
						<td style="width: 30px; color:#ABABAB;">2</td>
						<td>모</td>
						<td>김경복</td>
						<td>기독교</td>
					</tr>
					<tr>
						<td style="width: 30px; color:#ABABAB;">3</td>
						<td>형</td>
						<td>김범주</td>
						<td>기독교</td>
					</tr>
				</c:forEach>
					</tbody>
				</table>

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
					<tbody class="table-search">
				<c:forEach var="member" items="${selectList.memberList}" varStatus="status">
					<tr>
						<td style="width: 30px; color:#ABABAB;">1</td>
						<td>부</td>
						<td>김태영</td>
						<td>기독교</td>
					</tr>
					<tr>
						<td style="width: 30px; color:#ABABAB;">2</td>
						<td>모</td>
						<td>김경복</td>
						<td>기독교</td>
					</tr>
					<tr>
						<td style="width: 30px; color:#ABABAB;">3</td>
						<td>형</td>
						<td>김범주</td>
						<td>기독교</td>
					</tr>
				</c:forEach>
					</tbody>
				</table>

	      	</div>
          </div><!-- row -->
      </div><!-- modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">수정</button>
      </div>
    </div>
  </div>
</div>


<div class="container">

	<div class="row">
<!-- 		<div class="panel panel-default"> -->
<!-- 		  <div class="panel-heading"> -->
<!-- 		    <h3 class="panel-title">SegwangYouth Member</h3> -->
<!-- 		  </div> -->
<!-- 		  <div class="panel-body"> -->
			<form class="form-inline" method="post" action ="/segwangYouth/memberManagement">
			<div class="form-group">
				이름: <input type="text" name="name"/>
				마을:
				<select class="form-control" name="village">
					<option value="">전체</option>
					<c:forEach var="villageList" items="${selectList.villageAllList}">
					<option value="${villageList.VILLAGE_SEQ}">${villageList.VILLAGE_NAME}</option>
					</c:forEach>
				</select>
				직책:
				<select class="form-control" name="memberPosition">
					<option value="">전체</option>
					<c:forEach var="codeList" items="${selectList.codeListAA}">
					<option value="${codeList.CODE_NO}">${codeList.CODE_NAME}</option>
					</c:forEach>
				</select>
				<button type="submit" class="btn btn-default">조회</button>  <br><br> 		
			</div>
			</form>
			<div class="table-search">
				<h3 class="panel-title">SegwangYouth Member: ${fn:length(selectList.memberList)}명</h3>	
				<table class="table table-hover">
					<thead>
					<tr class="active">
						<td style="width: 30px;">#</td>
						<td style="width: 80px;">이름</td>
						<td style="width: 50px;">성별</td>
						<td>생년월일</td>
						<td>마을</td>
						<td>직책</td>
						<td>연락처</td>
						<td>직업</td>
					</tr>
					</thead>
					<tbody class="table-search">
				<c:forEach var="member" items="${selectList.memberList}" varStatus="status">
					<tr style="cursor: pointer;" class="memberDetail" value="${member.MEMBER_SEQ}">
						<td style="width: 30px; color:#ABABAB;">${status.count}</td>
						<td>${member.MEMBER_NAME}</td>
						<td>${member.MEMBER_GENDER}</td>
						<td>${member.MEMBER_BIRTHDAY}</td>
						<td>${member.VILLAGE_NAME}</td>
						<td>${member.MEMBER_POSITION}</td>
						<td>${member.PHONE_NUMBER}</td>
						<td>${member.MEMBER_JOB}</td>
					</tr>
				</c:forEach>
					</tbody>
				</table>
			</div><!--  class="table-search" -->		  
<!-- 		  </div> -->
<!-- 		</div> -->
	</div> <!-- row -->

	<div class="row">

			<h3 class="panel-title">Member Count</h3>
			<c:forEach var="total" items="${selectList.statistics}">
			<span class="villageGroupCountBox">
				남: ${total.MALE_COUNT}		
			</span>
			<span class="villageGroupCountBox">
				여: ${total.FEMALE_COUNT}		
			</span>
			<span class="villageGroupCountBox">
				합계: ${total.TOTAL_COUNT}		
			</span>
			</c:forEach>  
			<br>
			<c:forEach var="memberCnt" items="${selectList.memberCount}" varStatus="status">
			<span class="villageGroupCountBox">
				${memberCnt.VILLAGE_NAME}<c:if test="${status.index != 0}">마을</c:if> : ${memberCnt.VILLAGE_CNT}명		
			</span>
			</c:forEach>  
			
	</div>
</div>
</body>
</html>