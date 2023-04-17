<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<p/><p/>
		강사조회
		<form>
			<table border = "1">
				<tr>
					<td>강사코드</td>
					<td>강의명</td>
					<td>강사명</td>
					<td>총매출</td>
				</tr>
					<%
						try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection
							                 ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							
							String sql = 
									"SELECT te.teacher_code, te.class_name, te.teacher_name, sum(cl.tuition) "+
									"FROM tbl_teacher_202201 te, tbl_class_202201 cl "+
									"WHERE te.teacher_code = cl.teacher_code "+
									"GROUP BY te.teacher_code, te.class_name,te.teacher_name "+
									"ORDER BY te.teacher_code";
							Statement stmt = con.createStatement();
							ResultSet rs =stmt.executeQuery(sql);
						    while(rs.next()){
						    	String sales = rs.getString(4);
						    	%>
						    	<tr>
						    	<td><%=rs.getString(1) %></td>
						    	<td><%=rs.getString(2) %></td>
						    	<td><%=rs.getString(3) %></td>
						    	<td><%=rs.getInt(4)%></td>
						    	</tr>
						    	<%
						    }
						}catch(Exception e){
							e.printStackTrace();
						}
					%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>