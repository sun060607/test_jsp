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
		<form name = "frm" method = "post" action = "action2.jsp">
			<%
				
				String id = request.getParameter("id");
				String pid = "";
				String pname = "";
				String pposition = "";
				String pdate = "";
				String pgrade = "";
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = conn.createStatement();
					String sql = String.format("select * from giants_player where pid = '%s'",id);
					ResultSet rs = stmt.executeQuery(sql);
					rs.next();
					pid = rs.getString("pid");
					pname = rs.getString("pname");
					pposition = rs.getString("pposition");
					pdate = rs.getString("pdate");
					pgrade = rs.getString("pgrade");
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
					<td><input type = "text" name = "pname" value = "<%=pname%>"></td>
				</tr>
				<tr>
					<td>선수포지션</td>
					<td>
						<select name = "pposition">
							<option value="">포지션선택
							<option value="투수" <%if(pposition.equals("투수")) out.print("selected"); %>>투수
							<option value="내야수" <%if(pposition.equals("내야수")) out.print("selected"); %>>내야수
							<option value="외야수" <%if(pposition.equals("외야수")) out.print("selected"); %>>외야수
							<option value="포수" <%if(pposition.equals("포수")) out.print("selected"); %>>포수
						</select>
					</td>
				</tr>
				<tr>
					<td>선수등록일</td>
					<td><input type = "text" name = "pdate" value = "<%=pdate%>"></td>
				</tr>
				<tr>
					<td>선수등급</td>
					<td>
						<input type = "radio" name = "pgrade" value = "S" <%if(pgrade.equals("S")) out.print("checked"); %>>S
						<input type = "radio" name = "pgrade" value = "A"<%if(pgrade.equals("A")) out.print("checked"); %>>A
						<input type = "radio" name = "pgrade" value = "B"<%if(pgrade.equals("B")) out.print("checked"); %>>B
						<input type = "radio" name = "pgrade" value = "C"<%if(pgrade.equals("C")) out.print("checked"); %>>C
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