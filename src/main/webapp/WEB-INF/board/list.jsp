<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function gowrite(){
	
	location.href="writeform.bo"
	
	}

function del() {
	$("#delfrm").attr("action","/del.bo");
	$("#delfrm").attr("method","get");
	$("#delfrm").submit();
}

</script>


</head>
<body>

<form action="">

	






</form>

	list.jsp	
	<input type="button" onclick="gowrite()" value="정보입력">
	<input type="button" onclick="del()" value="정보삭제">
	<form id="delfrm" name="delfrm" >	
	<table border="1px">
		<tr><th>선택</th>
			<th>번호</th>
			<th>아이디(이름)</th>
			<th>제목</th>
			<th>내용</th>
			<th>등록일</th>
			<th>수정일</th>
			<th>조회수</th>		
		</tr>		
		<c:forEach var="row" items="${list}">			
			<tr><td> <input type="checkbox" name="chk" id="chk" value="${row.SEQ}">  </td>
				<td>${row.SEQ}</td>
				<td>${row.MEM_ID}(${row.MEM_NAME})</td>
				<td>${row.BOARD_SUBJECT}</td>
				<td><a href="update.bo?SEQ=${row.SEQ}">${row.BOARD_CONTENT}</a></td>
				<td><fmt:formatDate value="${row.REG_DATE}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${row.UPT_DATE}" pattern="yyyy-MM-dd"/></td>
				<td>${row.VIEW_CNT}</td>						
			</tr>		
		</c:forEach>	
	</table>
	</form>	
</body>
</html>