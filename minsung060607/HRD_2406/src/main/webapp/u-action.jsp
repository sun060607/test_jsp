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
<%
request.setCharacterEncoding("UTF-8");
Connection con = null;
Statement stmt = null;
String mode=request.getParameter("mode");
String id = request.getParameter("id");
String name = request.getParameter("name");
int credit=0;
int lecturer=0;
int week=0;
int start_hour=0;
int end_hour=0;
try {
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
	stmt = con.createStatement();
	String sql = "";
	switch(mode) {
	case "delete":
		sql = "delete from course_tbl where id = '"+id+"'";
		stmt.executeUpdate(sql);
%>
		<jsp:forward page="list.jsp"></jsp:forward>
<%
		break;

	}
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>