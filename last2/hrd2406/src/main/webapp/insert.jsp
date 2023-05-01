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
	<form name = "frm" method = "post" action = "action.jsp">
			<table border = "1">
			<%
			String num = "";
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select MAX(player_id)+1 as player_id from tbl_player_20221205");
				rs.next();
				num = rs.getString("player_id");
				conn.close();
				stmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
				<tr>
					<td>선수ID</td>
					<td><input type = "text" name = "player_id" value ="<%=num%>" readonly></td>
				</tr>
				<tr>
					<td>선수이름</td>
					<td><input type = "text" name = "player_name"></td>
				</tr>
				<tr>
					<td>포지션</td>
					<td>
						<input type = "radio" name = "player_position" value = "GK" checked>골키퍼
						<input type = "radio" name = "player_position" value = "DF">수비수
						<input type = "radio" name = "player_position" value = "MF">미드필더
						<input type = "radio" name = "player_position" value = "FK">공격수
					</td>
				</tr>
				<tr>
					<td>선수등록일</td>
					<td><input type = "text" name = "player_date"></td>
				</tr>
				<tr>
					<td>소속팀</td>
					<td>
						<select name = "team_id">
							<option value = "K00">무소속
							<option value = "K01">울산현대
							<option value = "K02">삼성블루윙즈
							<option value = "K03">스틸러스
							<option value = "K04">유나이티드
							<option value = "K05">현대모터스
							<option value = "K06">FC부산소마고
							<option value = "K07">드래곤즈
							<option value = "K08">일화천마
							<option value = "K09">FC서울
							<option value = "K10">시티즌
							<option value = "K11">경남FC
							<option value = "K12">광주상무
							<option value = "K13">강원FC
							<option value = "K14">제주유나이티드FC
							<option value = "K15">대구FC
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