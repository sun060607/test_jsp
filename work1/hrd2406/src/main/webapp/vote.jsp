<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check.js"></script>
<link rel = "stylesheet" href = "style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2><b>교과목 추가</b></h2><br>

<form method="post" action="action.jsp" name="frm">
<table border = '1'>
	<tr>
		<td>주민번호</td>
		<td><input type="text" name="v_jumin"></td>
	</tr>
	<tr>
		<td>성명</td>
		<td><input type="text" name="v_name"></td>
	</tr>
	<tr>
		<td>투표번호</td>
		<td>
		<select name="v_number">
			<option value="0">
			<option value="1">[1]김후보
			<option value="2">[2]이후보
			<option value="3">[3]박후보
			<option value="4">[4]조후보
			<option value="5">[5]최후보
			<option value="6">[6]임교수
		</select>
		</td>
	</tr>
	<tr>
		<td>투표시간</td>
		<td><input type="text" name="v_time"></td>
	</tr>
	
	<tr>
		<td>투표장소</td>
		<td><input type="text" name="v_price"></td>
	</tr>
	<tr>
		<td>확인</td>
		<td>
			<input type="radio" name="check" value="Y" > <label>확인</label>
			<input type="radio" name="check" value="N" > <label>미확인</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="투표하기" onclick="return listCheck()">
			<input type="reset" value="다시하기" onclick="return alert('교과목 추가가 취소되었습니다.')">
		</td>
	</tr>
</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>