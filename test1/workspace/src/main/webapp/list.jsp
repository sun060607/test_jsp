<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>차량조회</h2>
		<form method="post" name="frm" action = "action.jsp">
			<table border = "1">
				<tr>
					<td>차량번호를 입력하세요</td>
					<td>
						<input type = "text" name = "cn">
					</td>	
				</tr>
				<tr>
					<td colsplan="2">
						<input type = "button" value = "차량조회" onclick = "check()">
						<input type = "button" value = "홈으로" onclick = "location.href='index.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>