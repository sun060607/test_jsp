<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>근무좌석예약</h2>
		<form method = "post" name = "frm1" action="action2.jsp">
			<table border="1">
				<tr>
					<td>사원번호를 입력하세요</td>
					<td><input type ="text" name = "em">예) 202100001</td>
				</tr>
				
				<tr>
					<td>
						<input type ="button" value="등록" onclick= "check2()">
						<input type ="button" value="홈으로" onclick="location.href = 'index.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>