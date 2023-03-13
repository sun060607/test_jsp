<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = 'stylesheet' href = 'style.css'>
<script type="text/javascript" src='check.js'></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<h2><b>홈쇼핑 화면 등록</b></h2><br>
		<form name='frm'>
			<table border = '1'>
<%
String custno = "";
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select max(custno)+1 as custno from member_tbl2_02");
	rs.next();
	custno = rs.getString("custno");
	stmt.close();
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type='text' name = 'custno'  value = '<%=custno%>' readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type='text' name = 'custname'></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type='text' name = 'phone'></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type='text' name = 'address'></td>
				</tr>
				
				<tr>
					<td>가일일자</td>
					<td><input type='text' name = 'joindate'></td>
				</tr>
				
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type='text' name = 'grade'></td>
			    </tr>
			    
				<tr>
					<td>도시코드</td>
					<td><input type='text' name = 'city'></td>
				</tr>
				<tr>
					<td colspan = "2">
					<input type  = "submit" value='등록' onclick='return joinCheck()'/>	<!-- 데이터베이스에 전송가능 -->
					<input type  = "submit" value='조회' onclick='search()'>	<!-- 그냥 버튼 클릭 이벤트 -->
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>