<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = 'stylesheet' href = 'style.css'>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>회원매출조회</b></h2>
		<form>
			<table border = 1>
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>
				<%
					try{
						String grade = "";
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						String sql = "select me.custno,me.custname,me.grade,sum(mo.price) price "+
								"from member_tbl2_02 me,money_tbl_02 mo "+
								"where me.custno = mo.custno "+
								"group by me.custno, me.custname, me.grade "+
								"order by price desc";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
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
								<td><%=rs.getString("grade") %></td>
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
</html>