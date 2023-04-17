<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<script src="check.js"></script>
<link href="style.css" rel="stylesheet">
</head>
<body onload="document.frm.regist_month.focus();">
<%@ include file="header.jsp" %>
<section>
<form name="frm" action="action.jsp" method="post">
	<div class="title">수강신청</div>
	<div class="wrapper">
	<table border = "1">
		<tr>
			<th>수강월</th>
			<td>
			<input type="text" name="regist_month" maxlength="6">
			</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
			<select name="c_name" onchange="fn_change1();">
			<option value="">회원명</option>
			<option value="10001">홍길동</option>			
			<option value="10002">장발장</option>			
			<option value="10003">임꺽정</option>			
			<option value="20001">성춘향</option>			
			<option value="20002">이몽룡</option>			
			</select>		
			
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="c_no" readonly></td> 
		</tr>
		<tr>
			<th>강의장소</th>
			<td>
			<select name="class_area">
			<option value="">강의장소</option>
			<option value="서울본원">서울본원</option>
			<option value="성남분원">성남분원</option>
			<option value="대전분원">대전분원</option>
			<option value="부산분원">부산분원</option>
			<option value="대구분원">대구분원</option>
			
			</select>
			</td>
		</tr>
		<tr>
			<th>강의명</th>
			<td>
			<select name="teacher_code" onchange="fn_change2();">
			<option value="">강의신청</option>
			<option value="100">초급반</option>
			<option value="200">중급반</option>
			<option value="300">고급반</option>
			<option value="400">심화반</option>
			
			</select>
			</td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="text" name="tuition" readonly>원</td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
			<button class="btn" type="submit" onclick="fn_submit(); return false;">수강신청</button>
			<button class="btn" type="button" onclick="fn_reset();" >다시쓰기</button>
			</td>			
		</tr>		
	</table>
	</div>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>