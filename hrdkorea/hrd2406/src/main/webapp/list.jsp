<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
					String num="";
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select * from giants_player");
						while(rs.next()){
							num = rs.getString("pdate");
							
							%>
							<tr>
								<td><a href = "update.jsp?id=<%=rs.getString("pid")%>"><%=rs.getString("pid") %></a></td>
								<td><%=rs.getString("pname") %></td>
								<td><%=rs.getString("pposition") %></td>
								<td><%=num.substring(0,4)+"년"%><%=num.substring(4,6)+"월"%><%=num.substring(6,8)+"일"%></td>
								<td><%=rs.getString("pgrade") %></td>
								<td><a href = "delete.jsp?id=<%=rs.getString("pid")%>">삭제</a></td>
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