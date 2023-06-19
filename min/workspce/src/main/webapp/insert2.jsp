<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>회원등록</h2>
		<form name = "frm" method ="post" action="action1.jsp">
			<table border ="1">
				<tr>
					<td>회원번호(자동생성)</td>
				<%
				request.setCharacterEncoding("UTF-8");
				String cn = request.getParameter("cn");
					try{
						
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con =DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						String sql = String.format("select * from tbl_member_202205 where custno = '%s'",cn);
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						%>
						<td><input type="text" name ="cn" value="<%=rs.getString("custno") %>" readonly></td>
					
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name ="cn2" value="<%=rs.getString("custname") %>" ></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name ="cn3" value="<%=rs.getString("phone") %>" ></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name ="cn4" value="<%=rs.getString("address") %>" ></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name ="cn5" value="<%=rs.getString("joindate") %>" ></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name ="cn6" value="<%=rs.getString("grade") %>" ></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name ="cn7" value="<%=rs.getString("city") %>" ></td>
				</tr>
				<tr>
					
					<td>
						<input type="button" value="수정" onclick = "check()">
						<input type="button" value="조회" onclick = "location.href='list.jsp'">
					</td>
				</tr>
					<%
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