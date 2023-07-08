<%@page import="java.sql.*"%>
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
		<h2>선수 정보 수정</h2>
		<form method="post" name = "frm" action = "action.jsp">
			<table border = "1">
				<%
					request.setCharacterEncoding("UTF-8");
					String pid = request.getParameter("pid");
					String num;
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						String sql = String.format("select * from giants_player where pid = '%s'",pid);
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						num = rs.getString("pposition");
						%>
						<tr>
							<td>선수번호</td>
							<td><input type="text" name ="pi" value="<%=rs.getString("pid")%>" readonly></td>
						</tr>
						<tr>
							<td>선수이름</td>
							<td><input type="text" name ="pn" value="<%=rs.getString("pname")%>"></td>
						</tr>
						<tr>
							<td>선수포지션</td>
							<td>
								<select name ="pp">
									<option value="투수"<%if(num.equals("투수"))out.print("selected"); %>>투수
									<option value="내야수"<%if(num.equals("내야수"))out.print("selected"); %>>내야수
									<option value="외야수"<%if(num.equals("외야수"))out.print("selected"); %>>외야수
									<option value="포수"<%if(num.equals("포수"))out.print("selected"); %>>포수
								</select>
							</td>
						</tr>
						<tr>
							<td>선수등록일</td>
							<td><input type="text" name ="pd" value="<%=rs.getString("pdate")%>"></td>
						</tr>
						<tr>
							<td>선수등급</td>
							<td>
								<input type="radio" name ="pg" value="S" <%if(rs.getString("pgrade").equals("S")) out.println("checked"); %>>S
								<input type="radio" name ="pg" value="A" <%if(rs.getString("pgrade").equals("A")) out.println("checked"); %>>A
								<input type="radio" name ="pg" value="B" <%if(rs.getString("pgrade").equals("B")) out.println("checked"); %>>B
								<input type="radio" name ="pg" value="C" <%if(rs.getString("pgrade").equals("C")) out.println("checked"); %>>C
							</td>
						</tr>
						<tr>
							<td>
								<input type="button" value="수정" onclick="check()">
								<input type="button" value="취소" onclick="location.href='list.jsp'">
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
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>