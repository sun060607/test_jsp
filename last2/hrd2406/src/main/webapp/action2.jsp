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
	<%
		String player_id = request.getParameter("player_id");
		String player_name = request.getParameter("player_name");
		String player_position = request.getParameter("player_position");
		String player_date = request.getParameter("player_date");
		String team_id = request.getParameter("team_id");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = conn.createStatement();
			String sql = String.format("update tbl_player_20221205 set player_name='%s',player_position='%s',player_date='%s',team_id='%s' where player_id = '%s'",
				player_name,player_position,player_date,team_id,player_id);
			stmt.executeUpdate(sql);
			conn.close();
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<jsp:forward page = "list.jsp"></jsp:forward>
</body>
</html>