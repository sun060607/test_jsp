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
		<h2>과정형평가형 자격 CBQ</h2>
		<%
			request.setCharacterEncoding("UTF-8");
			String cn2 = request.getParameter("cn2");
			String on = request.getParameter("on");
			String et = request.getParameter("et");
			
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				String sql = String.format("update tbl_parking_202301 set departure_time = '%s' where car_number = '%s'",et,cn2);
				stmt.executeUpdate(sql);
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>