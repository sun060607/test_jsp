<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	<h2>선수등록</h2>
		<form name = "frm" method = "post" action = "action.jsp">
			<%
				
				String id = request.getParameter("id");
				String pid = "";
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select MAX(pid)+1 as pid from giants_player");
					rs.next();
					pid = rs.getString("pid");
					conn.close();
					stmt.close();
				}catch(Exception e){
					e.printStackTrace();
				}
				
			%>
			<table border = "1">
				<tr>
					<td>선수번호</td>
					<td><input type = "text" name = "pid" value = "<%=pid%>" readonly></td>
				</tr>
				<tr>
					<td>선수이름</td>
					<td><input type = "text" name = "pname"></td>
				</tr>
				<tr>
					<td>선수포지션</td>
					<td>
						<select name = "pposition">
							<option value="">포지션선택
							<option value="투수">투수
							<option value="내야수">내야수
							<option value="외야수">외야수
							<option value="포수">포수
						</select>
					</td>
				</tr>
				<tr>
					<td>선수등록일</td>
					<td><input type = "text" name = "pdate"></td>
				</tr>
				<tr>
					<td>선수등급</td>
					<td>
						<input type = "radio" name = "pgrade" value = "S">S
						<input type = "radio" name = "pgrade" value = "A">A
						<input type = "radio" name = "pgrade" value = "B">B
						<input type = "radio" name = "pgrade" value = "C">C
					</td>
				</tr>
				<tr>
					<td>
						<input type = "submit" value = "확인" onclick = "check()">
						<input type = "submit" value = "다시쓰기" onclick = "return alert('정보를 지우고 처음부터 다시 입력합니다');">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>