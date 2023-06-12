<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check2.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>차량조회</h2>
		<form method="post" name="frm" action = "action1.jsp">
			<table border = "1">
				<tr>
					<td>차량번호</td>
					<td>
						<input type = "text" name = "cn1">예) 22가1111
					</td>	
				</tr>
				<tr>
					<td>소유자이름</td>
					<td>
						<input type = "text" name = "on">예) 백선수
					</td>	
				</tr>
				<tr>
					<td>주차위치선택</td>
					<td>
						<input type = "radio" name = "lo" value = "A001">A001
						<input type = "radio" name = "lo" value = "A002">A002
						<input type = "radio" name = "lo" value = "A003">A003
						<input type = "radio" name = "lo" value = "A004">A004
						<input type = "radio" name = "lo" value = "A005">A005
					</td>	
				</tr>
				<tr>
					<td>입차시간</td>
					<td>
						<input type = "text" name = "et">예) 22:22
					</td>	
				</tr>
				<tr>
					<td colsplan="2">
						<input type = "button" value = "입차등록" onclick = "check()">
						<input type = "button" value = "다시쓰기" onclick = "return alert('다시쓰기')">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>