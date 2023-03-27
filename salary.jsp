<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='style.css'>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2><b>회원매출조회</b></h2>

<form>
<table border = '1'>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver"); //오라클 데이터베이스 드라이버 불러오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234"); //시스템 계정 연결
	Statement stmt = con.createStatement(); //SQL실행을 위한 stmt를 준비!!
	String sql = "select me.custno, me.custname, me.grade, sum(mo.price) price " +
			"from member_tbl_02 me, money_tbl_02 mo " +
			"where me.custno = mo.custno " +
			"group by me.custno, me.custname, me.grade " +
			"order by price desc";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("custno") %></td>
		<td><%=rs.getString("custname") %></td>
		<td><%=rs.getString("grade") %></td>
		<td><%=rs.getString("price") %></td>
	</tr>
<%
	}
} catch(Exception e) { //실패했을때 exception 예외처리 해줘야함.
	e.printStackTrace();
}

%>

</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>