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

<link rel="stylesheet" href="./webjars/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="./webjars/bootstrap/3.3.5//css/bootstrap.min.css">

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

/* 각 컴포넌트별 구분 */
.customDiv {
/* 	background: #fff; */
	/* padding: 10px 17px; */
	/* border: 1px solid #E6E9ED; */
}

</style>
<title>세광청년부 - 청년부 교적부</title>
</head>


<body>
<div class="container">

	<br>
	
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
						<td>마을</td>
						<td>직책</td>
						<td>연락처</td>
						<td>직업</td>
					</tr>
					</thead>
					<tbody class="table-search">
				<c:forEach var="member" items="${selectList.memberList}" varStatus="status">
					<tr>
						<td style="width: 30px; color:#ABABAB;">${status.count}</td>
						<td>${member.MEMBER_NAME}</td>
						<td>${member.MEMBER_GENDER}</td>
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
<!-- 		<div class="panel panel-default"> -->
<!-- 		<div class="panel-heading"> -->
<!-- 			<h3 class="panel-title">Village Member</h3> -->
<!-- 		</div> -->
<!-- 		<div class="panel-body"> -->

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
			
<!-- 		</div> -->
<!-- 		</div> -->
	</div>
	
	
	
<%-- 	<div class="row customDiv">
		마을별 전체 인원 <br>
		<c:forEach var="memberCnt" items="${selectList.memberCount}" varStatus="status">
		<span class="villageGroupCount">
			${memberCnt.VILLAGE_NAME}<c:if test="${status.index != 0}">마을</c:if> : ${memberCnt.VILLAGE_CNT}명		
		</span>
		</c:forEach>
	</div> --%>
	

<!-- jQuery -->
<script src="./webjars/jquery/3.0.0-alpha1/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>