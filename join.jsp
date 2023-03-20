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
		<form method = 'post' action='i-action.jsp' name='frm' >
			<table border = '1'>
<%// 자바 코드
String custno = "";
try{//성공했을때
	Class.forName("oracle.jdbc.OracleDriver");//오라클 데이터베이스 드라이브 불러오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();//sql 실행을 위한 stmt를 준비
	ResultSet rs = stmt.executeQuery("select max(custno)+1 as custno from member_tbl2_02");
	rs.next();//1개의 결과물 출력 만약 한개만 출력하지 않고 여러개 출력할거면 while(re.next()) 활용하면 됨
	custno = rs.getString("custno");
	stmt.close();
	con.close();
}catch(Exception e){//실패했을때 exception 예외처리 해줘야함
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