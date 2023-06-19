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
				String cn2 = request.getParameter("cn2");
				String cn3 = request.getParameter("cn3");
				String cn4 = request.getParameter("cn4");
				String cn5 = request.getParameter("cn5");
				String cn6 = request.getParameter("cn6");
				String cn7 = request.getParameter("cn7");
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con =DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						String sql = String.format("insert into tbl_member_202205 values('%s','%s','%s','%s','%s','%s','%s')",cn,cn2,cn3,cn4,cn5,cn6,cn7);
						PreparedStatement stmt = con.prepareStatement(sql);
						ResultSet rs = stmt.executeQuery();
						
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
				<jsp:forward page="insert.jsp"></jsp:forward>
</body>
</html>