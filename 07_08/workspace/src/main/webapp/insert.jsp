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
		<form method="post" name = "frm" action = "action1.jsp">
			<table border = "1">
				<%
					
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						String sql = String.format("select max(pid)+1 as num from giants_player");
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						%>
						<tr>
							<td>선수번호</td>
							<td><input type="text" name ="pi" value="<%=rs.getString("num")%>" readonly></td>
						</tr>
						
						<%
					}catch(Exception e){
						e.printStackTrace();
					}
					
				%>
				<tr>
							<td>선수이름</td>
							<td><input type="text" name ="pn"></td>
						</tr>
						<tr>
							<td>선수포지션</td>
							<td>
								<select name ="pp">
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
							<td><input type="text" name ="pd"></td>
						</tr>
						<tr>
							<td>선수등급</td>
							<td>
								<input type="radio" name ="pg" value="S" >S
								<input type="radio" name ="pg" value="A" >A
								<input type="radio" name ="pg" value="B" >B
								<input type="radio" name ="pg" value="C" >C
							</td>
						</tr>
						<tr>
							<td>
								<input type="button" value="등록" onclick="check()">
								<input type="reset" value="다시쓰기" onclick="return alert('다시쓰기')">
							</td>
						</tr>
				</table>
			</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>