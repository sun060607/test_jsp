<%@page import="java.sql.*"%>
<%@page import="java.net.ConnectException"%>
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
		String re = request.getParameter("re");
		String em = request.getParameter("em");
		String res = request.getParameter("res");
		String se = request.getParameter("se");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = String.format("insert into tbl_resv_202108 values('%s','%s','%s','%s')",re,em,res,se);
			ResultSet rs = stmt.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>