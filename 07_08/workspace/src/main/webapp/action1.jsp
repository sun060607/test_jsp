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
		String pi= request.getParameter("pi");
		String pn= request.getParameter("pn");
		String pp= request.getParameter("pp");
		String pd= request.getParameter("pd");
		String pg= request.getParameter("pg");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = conn.createStatement();
			String sql = String.format("insert into giants_player values('%s','%s','%s','%s','%s')",pi,pn,pp,pd,pg);
			ResultSet rs = stmt.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>