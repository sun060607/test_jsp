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
			String cn = request.getParameter("cn");
			String on = request.getParameter("on");
			String dt = request.getParameter("dt");
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement ps = conn.createStatement();
				String sql = String.format("update tbl_parking_202301 set DEPARTURE_TIME = '%s' where car_number = '%s'",dt,cn);
				ps.executeQuery(sql);
				conn.close();
				ps.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		%>
		<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>