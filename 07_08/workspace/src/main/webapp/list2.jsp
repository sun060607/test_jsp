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
						String sql = String.format("select su.cid, su.cname, su.cposition, count(su1.cid) as num, sum(su1.pcost) as num1, avg(su1.pcost) as num2,max(su1.pcost) as num3,min(su1.pcost) as num4 from giants_coach su, giants_money su1, giants_player su2 where su.cid = su1.cid and su1.pid = su2.pid group by su.cid,su.cname,su.cposition order by sum(su1.pcost) desc");
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							%>
								<tr>
									<td><%=rs.getString("cid") %></td>
									<td><%=rs.getString("cname") %></td>
									<td><%=rs.getString("cposition") %></td>
									<td><%=rs.getString("num") %></td>
									<td><%=rs.getString("num1") %></td>
									<td><%=rs.getString("num2") %></td>
									<td><%=rs.getString("num3") %></td>
									<td><%=rs.getString("num4") %></td>
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