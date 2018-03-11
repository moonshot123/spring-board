<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="/resources/jquery-ui-1.12.1/jquery-ui.css">
<script src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>

<!-- jquery 가 두개를 로드해서 따로 잘못한게 없는데 오류가 생겼었음 이런건 겹치지않도록 조심하자.-->
<!-- <script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(function () {
	$("#sdate").datepicker({
		/* dateFormat: 'yymmdd',
		changeMonth: true, //월변경가능
	    changeYear: true, //년변경가능
		showMonthAfterYear: true, //년 뒤에 월 표시	 */			
	});
		
	$("#ndate").datepicker({
		/* dateFormat: 'yymmdd',
		changeMonth: true, //월변경가능
	    changeYear: true, //년변경가능
		showMonthAfterYear: true, //년 뒤에 월 표시 */
	});
	
	
	$("#serBtn").click(function(){
		$("#serfmt").attr("action","/list.bo");
		$("#serfmt").attr("method","get");
		$("#serfmt").submit();
	})
	
		
})


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

<form id="serfmt" name="serfmt">

	<select name="serselect" id="serselect">
		<option value="all" id="all">선택</option>
		<option value="BOARD_SUBJECT" id="BOARD_SUBJECT">제목</option>
		<option value="BOARD_CONTENT" id="BOARD_CONTENT">내용</option>
		<option value="BOARD_SC" id="BOARD_SC">제목+내용</option>	
	</select>
	
	<input type="text" name="serch" id="serch">
	<input type="button" name="serBtn" id="serBtn"  value="검색">
	
	등록일:<input type="text" name="sdate" id="sdate">
	~<input type="text" name="ndate" id="ndate">
	

</form>



	
	<h3>list.jsp</h3>	
	<input type="button" onclick="gowrite()" value="정보입력" class="btn btn-success">
	<input type="button" onclick="del()" value="정보삭제" class="btn btn-success">
	<form id="delfrm" name="delfrm" >	
	<table class="table table-hover">
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
			<tr><td> <input type="checkbox" name="chk" id="chk" value="${row.SEQ}"></td>
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
	
	<div>
		<a href="/list.bo?pageNo=1">1</a>
		<a href="/list.bo?pageNo=2">2</a>
		<a href="/list.bo?pageNo=3">3</a>		
	</div>
		
</body>
</html>