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
		String td = request.getParameter("td");
		String t_name = request.getParameter("t_name");
		String cd = request.getParameter("cd");
		String ca = request.getParameter("ca");
		String cc = request.getParameter("cc");
		String tu = request.getParameter("tu");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = conn.createStatement();
			String sql = String.format("insert into tbl_class_202201 values('%s','%s','%s','%s','%s')",td,cd,ca,tu,cc);
			ResultSet rs = stmt.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>