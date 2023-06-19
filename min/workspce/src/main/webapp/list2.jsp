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
		<h2>회원목록조회/목록</h2>
		<form>
			<table border ="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>
				<%
				String grade;
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con =DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						String sql = String.format("select me.custno, me.custname, me.grade, sum(mo.price) price from tbl_member_202205 me, tbl_money_202205 mo where me.custno = mo.custno group by me.custno, me.custname, me.grade order by price desc");
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							grade = rs.getString("grade");
							switch(grade){
							case "A":
								grade = "VIP";
								break;
							
						case "B":
							grade = "일반";
							break;
					case "C":
						grade = "직원";
						break;
							}
							%>
							<tr>
								<td><%=rs.getString("custno") %></td>
								<td><%=rs.getString("custname") %></td>
								<td><%=grade %></td>
								<td><%=rs.getString("price") %></td>
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
</html>2