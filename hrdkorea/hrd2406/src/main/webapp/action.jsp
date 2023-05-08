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
		request.setCharacterEncoding("UTF-8");
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String pposition = request.getParameter("pposition");
		String pdate = request.getParameter("pdate");
		String pgrade = request.getParameter("pgrade");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = conn.createStatement();
			String sql = String.format("insert into giants_player values('%s','%s','%s','%s','%s')",pid,pname,pposition,pdate,pgrade);
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