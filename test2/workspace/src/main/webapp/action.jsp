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
		<%
			request.setCharacterEncoding("UTF-8");
			String cn = request.getParameter("cn");
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				String sql = String.format("select su1.car_number, su.car_name, owner_name, location, entrance_time, departure_time from tbl_car_202301 su, tbl_parking_202301 su1 where su.car_number = su1.car_number and trim(su1.car_number)= '%s'",cn);
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					String num = rs.getString("departure_time");
					if(num==null){
						num=" ";
					}
					%>
					<h2>차량조회</h2>
						<table border = 1>
							<tr>
								<td>차량번호</td>
								<td>차량종류</td>
								<td>소유자이름</td>
								<td>주차위치</td>
								<td>입차시간</td>
								<td>출차시간</td>
							</tr>
							<tr>
								<td><%=rs.getString("car_number") %></td>
								<td><%=rs.getString("car_name") %></td>
								<td><%=rs.getString("owner_name") %></td>
								<td><%=rs.getString("location") %></td>
								<td><%=rs.getString("entrance_time") %></td>
								<td><%=num %></td>
							</tr>
						</table>
						<table>
						<tr>
							<td><input type="button" value ="돌아가기" onclick = "location.href = 'index.jsp'"></td>
						</tr>
					</table>
					<%
					
				}else{
					%>
					<h2>차량정보가 존재하지 않습니다</h2>
					<table>
						<tr>
							<td><input type="button" value ="돌아가기" onclick = "location.href = 'index.jsp'"></td>
						</tr>
					</table>
					<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
		%>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>