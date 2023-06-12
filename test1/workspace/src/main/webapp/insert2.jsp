<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check3.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>차량조회</h2>
		<form method="post" name="frm" action = "action2.jsp">
			<table border = "1">
				<tr>
					<td>차량번호</td>
					<td>
						<select name ="cn2">
						<option value = "">차량번호</option>
						<%
						try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							String sql = "select * from tbl_parking_202301 where departure_time is null";
							PreparedStatement ps = conn.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							
							while(rs.next()){
								String num = rs.getString("departure_time");
								%>
									<option value = "<%=rs.getString("car_number") %>"><%=rs.getString("car_number") %></option>
								<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
						%>
						</select>
					</td>	
				</tr>
				<tr>
					<td>소유자이름</td>
					<td>
						<input type = "text" name = "on">예) 백선수
					</td>	
				</tr>
				<tr>
					<td>입차시간</td>
					<td>
						<input type = "text" name = "et">예) 22:22
					</td>	
				</tr>
				<tr>
					<td colsplan="2">
						<input type = "button" value = "출차등록" onclick = "check()">
						<input type = "button" value = "다시쓰기" onclick = "return alert('다시쓰기')">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>