<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

String regist_month = request.getParameter("regist_month");
String c_no = request.getParameter("c_no");
String class_area = request.getParameter("class_area");
String tuition = request.getParameter("tuition");
String teacher_code = request.getParameter("teacher_code");
int result = 0;
try{
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			         ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

	String sql = "INSERT INTO TBL_CLASS_202201 ";
	       sql+= "VALUES (?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, regist_month);
	pstmt.setString(2, c_no);
	pstmt.setString(3, class_area);
	pstmt.setInt(4, Integer.parseInt(tuition));
	pstmt.setString(5, teacher_code);
			
	result = pstmt.executeUpdate();
	
	con.close();
	pstmt.close();
	
}catch(Exception e){}		

if(result == 1){
%>
	<script>
	alert("수강신청이 정상적으로 완료되었습니다!");
	location = "index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("수강신청 실패! \n 메인화면으로 이동합니다");
	location = "index.jsp";
	</script>
<%
}
%>