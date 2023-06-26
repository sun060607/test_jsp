<%@page import="java.sql.*"%>
<%@page import="java.net.ConnectException"%>
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
		String em = request.getParameter("em");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = String.format("select su2.empno, empname, resvdate, su2.seatno, office, callno from tbl_emp_202108 su, tbl_seat_202108 su1,tbl_resv_202108 su2 where su.empno = su2.empno and su1.seatno = su2.seatno and su2.empno = '%s'",em);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				%>
				<table border = "1">
					<tr>
						<td><%=rs.getString("empno") %></td>
						<td><%=rs.getString("empname") %></td>
						<td><%=rs.getString("resvdate").substring(0,4) %>년<%=rs.getString("resvdate").substring(4,6) %>월<%=rs.getString("resvdate").substring(6)%>일</td>
						<td><%=rs.getString("seatno") %></td>
						<td><%=rs.getString("office") %></td>
						<td><%=rs.getString("callno") %></td>
					</tr>
				</table>
			<%
				while(rs.next()){
					%>
						<table border = "1">
							<tr>
								<td><%=rs.getString("empno") %></td>
								<td><%=rs.getString("empname") %></td>
								<td><%=rs.getString("resvdate").substring(0,4) %>년<%=rs.getString("resvdate").substring(4,6) %>월<%=rs.getString("resvdate").substring(6) %>일</td>
								<td><%=rs.getString("seatno") %></td>
								<td><%=rs.getString("office") %></td>
								<td><%=rs.getString("callno") %></td>
							</tr>
						</table>
					<%
				}
			}else{
				%>
				<h2>좌석예매 정보가 존재하지 않습니다</h2>
				<% 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%></section>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>