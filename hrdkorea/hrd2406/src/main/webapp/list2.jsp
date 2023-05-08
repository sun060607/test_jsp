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
					<td>코치번호</td>
					<td>코치이름</td>
					<td>코치포지션</td>
					<td>관리선수</td>
					<td>관리선수연봉합계</td>
					<td>관리선수평균연봉</td>
					<td>관리선수최대연봉</td>
					<td>관리선수최소연봉</td>
				</tr>
				<%
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select gc.cid num1,gc.cposition num8, gc.cname num2, count(gp.pposition) num3, sum(gm.pcost) num4, avg(gm.pcost) num5, max(gm.pcost) num6, min(gm.pcost) num7 from giants_player gp, giants_coach gc, giants_money gm where gp.pid = gm.pid and gc.cid = gm.cid group by gc.cposition,gc.cid, gc.cname, gp.pposition order by num4 desc");
						while(rs.next()){
							%>
							<tr>
								<td><%=rs.getString("num1") %></td>
								<td><%=rs.getString("num2") %></td>
								<td><%=rs.getString("num8") %></td>
								<td><%=rs.getString("num3") %>명</td>
								<td><%=rs.getString("num4") %></td>
								<td><%=rs.getString("num5") %></td>
								<td><%=rs.getString("num6") %></td>
								<td><%=rs.getString("num7") %></td>
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