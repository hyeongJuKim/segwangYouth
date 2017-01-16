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
	background-color: #F7F7F7; 
}

.table-search{
    height: 258px !important;
    overflow: scroll;
}

.villageGroupCount {
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
	background: #fff;
	padding: 10px 17px;
	border: 1px solid #E6E9ED;
}



</style>
<title>세광청년부 - 청년부 교적부</title>
</head>


<body>
<div class="container">
	
	<div class="row">
	<div class="customDiv">
		이름: <input type="text"/> <br>
		마을:
	<select>
		<option value="">전체선택</option>
	<c:forEach var="codeList" items="${selectList.codeListAC}">
	  <option value="${CODE_NO}">(${codeList.CODE_NO}) ${codeList.CODE_NAME}</option>
	  </c:forEach>
	</select> <br>
		직책:
	<select>
		<option value="">전체선택</option>
	<c:forEach var="codeList" items="${selectList.codeListAA}">
	  <option value="${CODE_NO}">${codeList.CODE_NAME}</option>
	  </c:forEach>
	</select> <br>
	
		<button type="button">조회</button>
	</div> 
	
<br>
	
	<div class="table-search customDiv">
	조회 결과 (${fn:length(selectList.memberList)}명)
		<table class="table table-bordered table-hover table-condensed">
			<thead>
			<tr class="active">
				<td>이름</td>
				<td style="width: 50px;">성별</td>
				<td>마을</td>
				<td>직책</td>
				<td>직업</td>
			</tr>
			</thead>
		<c:forEach var="member" items="${selectList.memberList}">
			<tr>
				<td>${member.MEMBER_NAME}</td>
				<td>${member.MEMBER_GENDER}</td>
				<td>${member.VILLAGE_CODE}마을</td>
				<td>${member.MEMBER_POSITION}</td>
				<td>${member.MEMBER_JOB}</td>
			</tr>
		</c:forEach>
		</table>
	</div><!--  c;ass="table-search" -->
	</div><!-- div class="row" -->
	
<br>
	
	<div class="row customDiv">
		마을별 전체 인원 <br>
		<c:forEach var="memberCnt" items="${selectList.memberCount}" varStatus="status">
		<span class="villageGroupCount">
			${memberCnt.VILLAGE_NAME}<c:if test="${status.index != 0}">마을</c:if> : ${memberCnt.VILLAGE_CNT}명		
		</span>
		</c:forEach>
	</div>
	

<!-- jQuery -->
<script src="./webjars/jquery/3.0.0-alpha1/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>