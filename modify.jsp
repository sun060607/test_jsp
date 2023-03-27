<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = 'stylesheet' href = 'style.css'>
<script type="text/javascript" src = "check.js"></script>
</head>
<body>
<jsp:include page = "header.jsp"></jsp:include>
<section>
<h2 style = "display:flex; justify-content:center; align-items:center;"><b>회원매출조회</b></h2>
<%
request.setCharacterEncoding("UTF-8");
String custno = request.getParameter("custno");
try{
Class.forName("oracle.jdbc.OracleDriver"); //오라클 데이터베이스 드라이버 불러오기
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234"); //시스템 계정 연결

String sql = "select * from member_tbl_02 " +
"where custno = ?";
PreparedStatement pstmt = con.prepareStatement(sql); //SQL실행을 위한 stmt를 준비!!
pstmt.setString(1, custno);
ResultSet rs = pstmt.executeQuery();
rs.next();//한줄 불러옴 이제 밑에서 rs를 이용해서 값을 넣어주됨<td>
%>
<!-- 폼테그에 action.jsp 파일로 데이터를 전송하기위한 기초작업 -->
<!-- method = 'post' 전송할때 개인정보를 가리면서 전송 -->
<form method = 'post' action = 'm-action.jsp' name = 'frm2'>
<table border = '1'>
<tr>
<td>회원번호</td>
<td><input type = "text" name = "custno" value = "<%=rs.getString(1) %>"readonly></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type = "text" name = "custname" value = "<%=rs.getString(2) %>"></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type = "text" name = "phone" value = "<%=rs.getString(3) %>"></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type = "text" name = "address" value = "<%=rs.getString(4) %>"></td>

</tr>
<tr>
<td>가입일자</td>
<td><input type = "text" name = "joindate" value = "<%=rs.getDate(5) %>"></td>
</tr>
<tr>
<td>고객등급[A:VIP, B:일반, C:직원]</td>
<td><input type = "text" name = "grade" value = "<%=rs.getString(6) %>"></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type = "text" name = "city" value = "<%=rs.getString(7) %>"></td>
</tr>
<tr>
<td colspan = '2'>
<input type = 'button' value = '수정' onclick = "return_modify()">
<input type = 'button' value = '조회' onclick = "windew.location = 'list.jsp'">
</td>
</tr>



<%
}catch(Exception e){
e.printStackTrace();

}

%>
</table>

</form>

</section>
<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>
