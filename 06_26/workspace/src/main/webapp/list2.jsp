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
<table border = "1">
<tr>
						<td>사원번호</td>
						<td>이름</td>
						<td>부서명</td>
						<td>근무일수</td>
					</tr>
	<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = String.format("select su.empno, empname,deptcode,count(su1.empno) as num from tbl_emp_202108 su, tbl_resv_202108 su1 where su.empno = su1.empno group by su.empno,empname,deptcode");
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String num = rs.getString("deptcode");
				switch(num){
				case "10":
					num = "영업팀";
					break;
				case "20":
					num = "총무팀";
					break;
				case "30":
					num = "구매팀";
					break;
				}
				%>
				
					<tr>
						<td><%=rs.getString("empno") %></td>
						<td><%=rs.getString("empname") %></td>
						<td><%=num %></td>
						<td><%=rs.getString("num") %></td>
					</tr>
				
				<% 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%></table>
	</section>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>