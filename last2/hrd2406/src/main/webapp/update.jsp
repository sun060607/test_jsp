<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "check.js">
	
</script>
</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<section><h2>선수 등록</h2>
	<form name = "frm" method = "post" action = "action2.jsp">
			<table border = "1">
			<%
			String player_id = request.getParameter("id");
			String player_name = "";
			String player_position = "";
			String player_date = "";
			String team_id = "";
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = conn.createStatement();
				String sql = String.format("select * from tbl_player_20221205 where player_id = '%s'",player_id);
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				player_name = rs.getString("player_name");
				player_position = rs.getString("player_position");
				player_date = rs.getString("player_date");
				team_id = rs.getString("team_id");
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			%>
				<tr>
					<td>선수ID</td>
					<td><input type = "text" name = "player_id" value ="<%=player_id%>" readonly></td>
				</tr>
				<tr>
					<td>선수이름</td>
					<td><input type = "text" name = "player_name" value ="<%=player_name%>"></td>
				</tr>
				<tr>
					<td>포지션</td>
					<td>
						<input type = "radio" name = "player_position" value = "GK" <%if(player_position.equals("GK")) out.print("checked"); %>>골키퍼
						<input type = "radio" name = "player_position" value = "DF" <%if(player_position.equals("DF")) out.print("checked"); %>>수비수
						<input type = "radio" name = "player_position" value = "MF" <%if(player_position.equals("MF")) out.print("checked"); %>>미드필더
						<input type = "radio" name = "player_position" value = "FK" <%if(player_position.equals("FK")) out.print("checked"); %>>공격수
					</td>
				</tr>
				<tr>
					<td>선수등록일</td>
					<td><input type = "text" name = "player_date" value ="<%=player_date%>"></td>
				</tr>
				<tr>
					<td>소속팀</td>
					<td>
						<select name = "team_id">
							<option value = "K00"<%if(team_id.equals("K00")) out.print("selected"); %>>무소속
							<option value = "K01"<%if(team_id.equals("K01")) out.print("selected"); %>>울산현대
							<option value = "K02"<%if(team_id.equals("K02")) out.print("selected"); %>>삼성블루윙즈
							<option value = "K03"<%if(team_id.equals("K03")) out.print("selected"); %>>스틸러스
							<option value = "K04"<%if(team_id.equals("K04")) out.print("selected"); %>>유나이티드
							<option value = "K05"<%if(team_id.equals("K05")) out.print("selected"); %>>현대모터스
							<option value = "K06"<%if(team_id.equals("K06")) out.print("selected"); %>>FC부산소마고
							<option value = "K07"<%if(team_id.equals("K07")) out.print("selected"); %>>드래곤즈
							<option value = "K08"<%if(team_id.equals("K08")) out.print("selected"); %>>일화천마
							<option value = "K09"<%if(team_id.equals("K09")) out.print("selected"); %>>FC서울
							<option value = "K10"<%if(team_id.equals("K10")) out.print("selected"); %>>시티즌
							<option value = "K11"<%if(team_id.equals("K11")) out.print("selected"); %>>경남FC
							<option value = "K12"<%if(team_id.equals("K12")) out.print("selected"); %>>광주상무
							<option value = "K13"<%if(team_id.equals("K13")) out.print("selected"); %>>강원FC
							<option value = "K14"<%if(team_id.equals("K14")) out.print("selected"); %>>제주유나이티드FC
							<option value = "K15"<%if(team_id.equals("K15")) out.print("selected"); %>>대구FC
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type = "submit" value = "확인" onclick = "check()">
						<input type = "submit"  value = "취소" onclick = "return alert('취소')">
					</td>
				</tr>
			</table>
	</form>
	</section>
	<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>