<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
					String t_no = request.getParameter("t_no");
					String p_code = request.getParameter("p_code");
					String t_type = request.getParameter("t_type");
					String t_cnt = request.getParameter("t_cnt");
					String t_date = request.getParameter("t_date");
					String c_code = request.getParameter("c_code");
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						String sql = String.format(
								"insert into TBL_INOUT_202002 values('%s','%s','%s','%s','%s','%s')",
								t_no,p_code,t_type,t_cnt,t_date,c_code);
						stmt.executeUpdate(sql);
						stmt.close();
						con.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
				<jsp:forward page="insert.jsp"></jsp:forward>
</body>
</html>