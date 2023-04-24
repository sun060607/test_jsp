<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
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
				<!-- select su.p_code, su.p_name, su1.t_type, su1.t_cnt * (p_outcost - p_incost)
from tbl_product_202002 su, tbl_inout_202002 su1
where su.p_code = su1.p_code and su1.t_type == "O; -->
				<%
					try{
						 	Class.forName("oracle.jdbc.OracleDriver");
						    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						    Statement stmt = con.createStatement();
						    ResultSet rs =stmt.executeQuery("select * from tbl_product_202002,tbl_inout_202002,tbl_company_202002 "+
						    				"where tbl_product_202002.p_code = tbl_inout_202002.p_code and tbl_inout_202002.c_code = tbl_company_202002.c_code");
						    while(rs.next()){
						%>
						
							<tr>
								<td><%=rs.getString("t_no")%></td>
								<td><%=rs.getString("p_code")%></td>
								<td><%=rs.getString("p_name")%></td>
								<td><%=rs.getString("t_type")%></td>
								<td><%=rs.getString("t_cnt")%></td>
								<td><%=rs.getString("c_name")%></td>
								<td><%=rs.getString("t_date")%></td>
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