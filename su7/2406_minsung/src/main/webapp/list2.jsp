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
		<h2>입출고내역조회</h2>
		<form>
			<table border = "1">
				<tr>
				 	<td>입출고 번호</td>
				 	<td>제품코드</td>
				 	<td>제품명</td>
				 	<td>입출고구분</td>
				 	<td>수량</td>
				 	<td>거래처</td>
				 	<td>거래일자</td>
				 </tr>
				 	<%
				 		String num = "";
				 		try{
				 			Class.forName("oracle.jdbc.OracleDriver");
				 			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				 			Statement stmt = conn.createStatement();
				 			ResultSet rs = stmt.executeQuery("select * from tbl_product_202002 ,tbl_company_202002,tbl_inout_202002 where tbl_product_202002.p_code = tbl_inout_202002.p_code and tbl_company_202002.c_code = tbl_inout_202002.c_code");
				 			while(rs.next()){
				 				num = rs.getString("t_type");
				 				switch(num){
				 				case "I":
				 					num = "입고";
				 					break;
				 				case "O":
				 					num = "출고";
				 					break;
				 				}
				 				%>
				 				<tr>
				 					<td><%=rs.getString("t_no") %></td>
				 					<td><%=rs.getString("p_code") %></td>
				 					<td><%=rs.getString("p_name") %></td>
				 					<td><%=num%></td>
				 					<td><%=rs.getString("t_cnt") %></td>
				 					<td><%=rs.getString("c_name") %></td>
				 					<td><%=rs.getString("t_date") %></td>
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