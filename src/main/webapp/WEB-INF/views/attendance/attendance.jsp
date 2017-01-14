<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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

청년부 전체 리스트
<table>
	<tr>
		<td>소속마을</td>
		<td>이름</td>
		<td>직책</td>
	</tr>
<c:forEach var="member" items="${memberList}">
	<tr>
		<td>${member.VILLAGE_CODE}마을</td>
		<td>${member.MEMBER_NAME}</td>
		<td>${member.MEMBER_POSITION}</td>
	</tr>
</c:forEach>
</table>


</body>
</html>