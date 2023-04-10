<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "style.css">
</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<section>
		<h2><b>후보조회</b></h2>
		<form>
			<table border = "1">
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>소속정당</td>
					<td>학력</td>
					<td>주민번호</td>
					<td>지역구</td>
					<td>대표전화</td>
				</tr>
				<%
				String P_CODE = "";
				String P_SCHOOL = "";
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select * " +
							"from TBL_MEMBER_202005, TBL_PARTY_202005 " +
							"where TBL_MEMBER_202005.P_CODE = TBL_PARTY_202005.P_CODE"); 
					while (rs.next()){
						P_CODE = rs.getString("P_CODE");
						P_SCHOOL = rs.getString("P_SCHOOL");
						switch (P_CODE){
							case "P1":
								P_CODE = "A정당";
								break;
							case "P2":
								P_CODE = "B정당";
								break;
							case "P3":
								P_CODE = "C정당";
								break;
							case "P4":
								P_CODE = "D정당";
								break;
							case "P5":
								P_CODE = "E정당";
								break;
						}
						switch (P_SCHOOL){
							case "1":
								P_CODE = "고졸";
								break;
							case "2":
								P_CODE = "학사";
								break;
							case "3":
								P_CODE = "석사";
								break;
							case "4":
								P_CODE = "박사";
								break;
					}
						%>
							<tr>
								<td><%=rs.getString("M_NO")%></td>
								<td><%=rs.getString("M_NAME") %></td>
								<td><%=P_CODE %></td>
								<td><%=P_SCHOOL %></td>
								<td><%=rs.getString("M_JUMIN") %></td>
								<td><%=rs.getString("M_CITY") %></td>
								<td><%=rs.getString("P_TEL1") %>-<%=rs.getString("P_TEL2") %>-<%=rs.getString("P_TEL3") %></td>
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
	<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>
