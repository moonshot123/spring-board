<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="/resources/jquery-ui-1.12.1/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	
	
	$(function() {
		
		$("#wtBtn").click(function(){
			$("#frm").attr("action","boardwrite.bo");
			$("#frm").attr("method","get");
			$("#frm").submit();			
		});
		
		$("#upBtn").click(function(){
			$("#frm").attr("action","boardupdate.bo");
			$("#frm").attr("method","get");
			$("#frm").submit();			
		});
		
		
		
		
	
	});
	
	


</script>

</head>
<body>
	writeform.jsp
		
	<form id="frm" name="frm">
	<table>
		<tr>
			<td>아이디</td>
			<td> <input type="text" name="MEM_ID" id="MEM_ID" value="${board.MEM_ID}"> </td>
		</tr>		
		<tr>
			<td>이름</td>
			<td> <input type="text" name="MEM_NAME" id="MEM_NAME" value="${board.MEM_NAME}"> </td>
		</tr>		
		<tr>
			<td>제목</td>
			<td> <input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT" value="${board.BOARD_SUBJECT}"> </td>
		</tr>		
		<tr>
			<td>아이디</td>
			<td> <textarea name="BOARD_CONTENT" id="BOARD_CONTENT" rows="5" cols="30" >${board.BOARD_CONTENT}</textarea> </td>
		</tr>
	</table>
	<input type="hidden" name="SEQ" id="SEQ" value="${board.SEQ}"> 
	
	<c:set var="board" value="${board}"></c:set>
	
	<c:if test="${empty board.MEM_NAME}" >
	
		<input type="button" name="wtBtn" id="wtBtn" value="글쓰기">
	
	</c:if>
	
	
	<c:if test="${not empty board.MEM_NAME}">
	
		<input type="button" name="upBtn" id="upBtn" value="수정하기"> 
	
	</c:if>
	 
		
	</form>
</body>
</html>