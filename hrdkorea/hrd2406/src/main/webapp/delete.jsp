<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = conn.createStatement();
			String sql = String.format("delete from giants_player where pid = '%s'",id);
			ResultSet rs = stmt.executeQuery(sql);
			conn.close();
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	%>
	<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>