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
		<h2>롯데자이언츠 선수 목록</h2>
		<form>
			<table border = "1">
			<tr>
				<td>선수번호</td>
				<td>선수이름</td>
				<td>선수포지션</td>
				<td>선수등록일</td>
				<td>선수등급</td>
				<td>삭제</td>
			</tr>
				<%
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						String sql = String.format("select * from giants_player");
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							%>
								<tr>
									<td><a href="update.jsp?pid=<%=rs.getString("pid") %>"><%=rs.getString("pid") %></a></td>
									<td><%=rs.getString("pname") %></td>
									<td><%=rs.getString("pposition") %></td>
									<td><%=rs.getString("pdate").substring(0,4) %>년<%=rs.getString("pdate").substring(4,6) %>월<%=rs.getString("pdate").substring(6) %>일</td>
									<td><%=rs.getString("pgrade") %></td>
									<td><a href="delete.jsp?pid=<%=rs.getString("pid") %>">삭제</a></td>
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