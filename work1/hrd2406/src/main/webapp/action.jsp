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
		request.setCharacterEncoding("UTF-8");//데이터베이스와 연동하는 코드에서 한글 혹시나 안 될 수 있으니
		String v_jumin = request.getParameter("v_jumin");//join.jsp파일에서 custno 란에 입력된 값을 불러옴
		String v_name = request.getParameter("v_jumin");
		String v_number = request.getParameter("v_number");
		String v_time = request.getParameter("v_time");
		String v_price = request.getParameter("v_price");
		String check = request.getParameter("check");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = String.format(
					"insert into TBL_VOTE_202005 values('%s','%s','%s','%s','%s','%s')",
					v_jumin,v_jumin,v_number,v_time,v_price,check);
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<jsp:forward page="vote.jsp"></jsp:forward>
</body>