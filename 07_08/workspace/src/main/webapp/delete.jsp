<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String pi= request.getParameter("pid");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = conn.createStatement();
			String sql = String.format("delete from giants_player where pid = '%s'",pi);
			ResultSet rs = stmt.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>