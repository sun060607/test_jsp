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
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>강사조회</h2>
		<form>
			<table border ="1">
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
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						String sql = String.format("select * from tbl_teacher_202201");
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							%>
							<tr>
								<td><%=rs.getString("t_code") %></td>
								<td><%=rs.getString("t_name") %></td>
								<td><%=rs.getString("c_name") %></td>
								<td>￦<%=rs.getString("c_price").substring(0,3) %>,<%=rs.getString("c_price").substring(3) %></td>
								<td><%=rs.getString("t_date").substring(0,4) %>년<%=rs.getString("t_date").substring(4,6) %>월<%=rs.getString("t_date").substring(6) %>일</td>
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