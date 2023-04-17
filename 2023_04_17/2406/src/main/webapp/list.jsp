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
					<td>강사명</td>
					<td>강의명</td>
					<td>수강료</td>
					<td>강사자격취득일</td>
				</tr>
					<%
						try{
						    Class.forName("oracle.jdbc.OracleDriver");
						    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						    Statement stmt = con.createStatement();
						    ResultSet rs =stmt.executeQuery("select * from TBL_TEACHER_202201");
						    while(rs.next()){
						    	%>
						    	<tr>
						    	<td><%=rs.getString("TEACHER_CODE") %></td>
						    	<td><%=rs.getString("TEACHER_NAME") %></td>
						    	<td><%=rs.getString("CLASS_NAME") %></td>
						    	<td><%=rs.getString("CLASS_PRICE") %></td>
						    	<td><%=rs.getString("TEACHER_REGIST_DATE") %></td>
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