<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<section>
		<h2>(제품별)출고매출이익통계</h2>
		<form>
			<table border = "1">
				<tr>
					<td>제품코드</td>
					<td>제품명</td>
					<td>출고수량</td>
					<td>출고매출이익</td>
				</tr>
				<%
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select su.p_code as p_code, su.p_name as p_name, su1.t_cnt as t_cnt, su1.t_cnt * (su.p_outcost - su.p_incost) as num from tbl_product_202002 su, tbl_inout_202002 su1 where su.p_code = su1.p_code and su1.t_type like 'O'");
						while(rs.next()){
							%>
							<tr>
								<td><%=rs.getString("p_code") %></td>
								<td><%=rs.getString("p_name") %></td>
								<td><%=rs.getString("t_cnt") %></td>
								<td><%=rs.getString("num") %></td>
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