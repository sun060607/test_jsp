<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='check2.js'></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>차량 조회</h2>
		<form method = 'post' name ='frm2' action='action2.jsp'>
			<table border = "1">
				<tr>
					<td>차량번호</td>
					<td>
						<select name ="cn">
						<option value="">차량번호선택</option>
							<%
							String num="A";
								try{
									Class.forName("oracle.jdbc.OracleDriver");
									Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									Statement ps = conn.createStatement();
									String sql = String.format("select * from tbl_parking_202301");
									ResultSet rs = ps.executeQuery(sql);
									while(rs.next()){
										if(rs.getString("DEPARTURE_TIME")!=null){
											
										}else{
											%>
											<option value="<%=rs.getString("car_number")%>"><%=rs.getString("car_number")%></option>
											<%
										}
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
					<td><input type="text" name = "on">예) 백선수</td>
				</tr>
				<tr>
					<td>입차시간</td>
					<td><input type="text" name = "dt">예) 22:22</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value ="입차등록" onclick = "check3()">
					<input type="reset" value ="돌아가기" onclick = "return alert('다시쓰기')"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>