<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{
	
	}
	
	table {
		border : 1px solid black;
		
	}
	tr, td { 
		padding : 3px; 
	}
	
	
</style>
<title>세광청년부 - 청년 조회</title>
</head>
<body>

<div>
	이름: <input type="text"/> <br>
	소속 마을:
<select>
	<option value="">전체선택</option>
<c:forEach var="codeList" items="${selectList.codeListAC}">
  <option value="${CODE_NO}">${codeList.CODE_NAME}</option>
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
</div> <br>

조회 결과 (${fn:length(selectList.memberList)}명)
<table>
	<tr>
		<td>소속마을</td>
		<td>이름</td>
		<td>직책</td>
		
	</tr>
<c:forEach var="member" items="${selectList.memberList}">
	<tr>
		<td>${member.VILLAGE_CODE}마을</td>
		<td>${member.MEMBER_NAME}</td>
		<td>${member.MEMBER_POSITION}</td>
	</tr>
</c:forEach>
</table>

각 마을별 전체 인원
<table>
<c:forEach var="memberCnt" items="${selectList.memberCount}">
	<tr>
		<td>${memberCnt.VILLAGE_NAME}마을 : ${memberCnt.VILLAGE_CNT}명</td>		
	</tr>
</c:forEach>
</table>


</body>
</html>