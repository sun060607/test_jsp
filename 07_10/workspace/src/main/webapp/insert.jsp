<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>수강신청</h2>
		<form name = "frm" method="post" action = "action.jsp">
			<table border = "1">
				<tr>
					<td>수강월</td>
					<td><input type = "text" name="td">2022년03월 예)202203</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td>
						<select name = "t_name" onchange= num(this.value)>
							<option value = "">회원명
							<option value = "10001">홍길동
							<option value = "10002">장발장
							<option value = "10003">임꺽정
							<option value = "20001">성춘향
							<option value = "20001">성춘향
						</select>
					</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input type = "text" name="cd" value ="" readonly> 예)10001</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td>
						<select name = "ca">
							<option value = "">강의장소
							<option value = "서울본원">서울본원
							<option value = "성남분원">성남분원
							<option value = "대전분원">대전분원
							<option value = "부산분원">부산분원
							<option value = "대구분원">대구분원
						</select>
					</td>
				</tr>
				<tr>
					<td>강의명</td>
					<td>
						<select name = "cc" onchange=num2(this.value)>
							<option value = "">강의신청
							<option value = "100">초급반
							<option value = "200">중급반
							<option value = "300">고급반
							<option value = "400">심화반
						</select>
					</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input type = "text" name="tu" value ="" readonly> 원</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<input type = "button" value ="수강신청" onclick="check()">
						<input type = "reset" value ="취소하기" onclick="return alert('다시쓰기')">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>