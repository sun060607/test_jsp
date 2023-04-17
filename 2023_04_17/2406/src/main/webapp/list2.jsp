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
					<td>수강일</td>
					<td>회원번호</td>
					<td>회원명</td>
					<td>강의명</td>
					<td>강의장소</td>
					<td>수강료</td>
					<td>등급</td>
				</tr>
					<%
						try{
						    Class.forName("oracle.jdbc.OracleDriver");
						    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						    Statement stmt = con.createStatement();
						    ResultSet rs =stmt.executeQuery("select regist_month,cl.c_no, c_name,class_name,class_area,tuition,grade "
						    		+"from tbl_class_202201 cl,tbl_member_202201 me,tbl_teacher_202201 te "
						    		+"where cl.c_no =me.c_no and cl.teacher_code =te.teacher_code");

						    while(rs.next()){
						    	%>
						    	<tr>
						    	<td><%=rs.getString("regist_month") %></td>
						    	<td><%=rs.getString("c_no") %></td>
						    	<td><%=rs.getString("c_name") %></td>
						    	<td><%=rs.getString("class_name") %></td>
						    	<td><%=rs.getString("class_area") %></td>
						    	<td><%=rs.getString("tuition") %></td>
						    	<td><%=rs.getString("grade") %></td>
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