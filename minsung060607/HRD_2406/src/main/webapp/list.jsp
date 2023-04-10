<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<form>
			<table border ='1'>
				<tr>
					<td>과목코드</td>
					<td>과목명</td>
					<td>학점</td>
					<td>담당교사</td>
					<td>요일</td>
					<td>시작시간</td>
					<td>종료시간</td>
					<td>삭제</td>
				</tr>
				<%
				String week = "";
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select * from course_tbl"); 
						while (rs.next()){
							week = rs.getString("week");
							switch (week){
								case "1":
									week = "월요일";
									break;
								case "2":
									week = "화요일";
									break;
								case "3":
									week = "수요일";
									break;
								case "4":
									week = "목요일";
									break;
								case "5":
									week = "금요일";
									break;
							}
						%>
							<tr>
								<td><a href = "modify.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("id")%></a></td>
								<td><%=rs.getString("name") %></td>
								<td><%=rs.getString("credit") %></td>
								<td><%=rs.getString("lecturer") %></td>
								<td><%=week %></td>
								<td><%=rs.getString("start_hour") %></td>
								<td><%=rs.getString("end_hour") %></td>
								<td><a href="u-action.jsp?id=<%=rs.getString("id")%>&mode=delete">삭제</a></td>
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