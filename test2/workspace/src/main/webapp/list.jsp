<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='check.js'></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>차량 조회</h2>
		<form method = 'post' name ='frm' action='action.jsp'>
			<table border = "1">
				<tr>
					<td>차량번호</td>
					<td><input type="text" name = "cn"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value ="조회하기" onclick = "check()">
					<input type="button" value ="돌아가기" onclick = "location.href = 'index.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>