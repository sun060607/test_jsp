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
		<form method = "post" name = "frm" action="action.jsp">
			<table border="1">
				<tr>
					<td>예약번호</td>
					<td><input type ="text" name = "re">예) 202100001</td>
				</tr>
				<tr>
					<td>사원번호</td>
					<td><input type ="text" name = "em">예) 1001</td>
				</tr>
				<tr>
					<td>근무일지</td>
					<td><input type ="text" name = "res">예) 20211231</td>
				</tr>
				<tr>
					<td>좌석번호</td>
					<td><input type ="text" name = "se">예) S001 ~ S009</td>
				</tr>
				<tr>
					<td>
						<input type ="button" value="등록" onclick= "check()">
						<input type ="reset" value="다시쓰기" onclick="return alert('다시쓰기')">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>