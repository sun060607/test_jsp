<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<section><h2>선수조회</h2>
		<form>
			<table>
				<tr>
					<td>선수ID</td>
					<td>선수이름</td>
					<td>포지션</td>
					<td>선수등록일</td>
					<td>팀 이름</td>
				</tr>
				<%
					request.setCharacterEncoding("UTF-8");
					String num="";
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select * from tbl_player_20221205");
						while(rs.next()){
							num = rs.getString("player_position");
							switch(num){
								case "GK":
									num = "골키퍼";
									break;
								case "DF":
									num = "수비수";
									break;
								case "MF":
									num = "미드필더";
									break;
								case "FW":
									num = "공격수";
									break;
							}
								%>
									<tr>
										<td><a href = "update.jsp?id=<%=rs.getString("player_id") %>"><%=rs.getString("player_id") %></a></td>
										<td><%=rs.getString("player_name") %></td>
										<td><%=num %></td>
										<td><%=rs.getString("player_date") %></td>
										<td><%=rs.getString("team_id") %></td>
									</tr>
								<%
							}
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