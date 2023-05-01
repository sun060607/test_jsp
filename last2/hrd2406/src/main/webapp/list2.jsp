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
					<td>선수이름</td>
					<td>포지션</td>
					<td>팀이름</td>
					<td>경기장 이름</td>
					<td>좌석 수</td>
				</tr>
				<%
					String num="";
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select su.player_name, su.player_position, su2.team_name, su1.stadium_name,su1.seat_count from tbl_player_20221205 su,tbl_stadium_20221205 su1,tbl_team_20221205 su2  where su.team_id = su2.team_id and su1.stadium_id = su2.stadium_id and su1.seat_count >=30000");
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
										<td><%=rs.getString("player_name") %></td>
										<td><%=num %></td>
										<td><%=rs.getString("team_name") %></td>
										<td><%=rs.getString("stadium_name") %></td>
										<td><%=rs.getString("seat_count") %></td>
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