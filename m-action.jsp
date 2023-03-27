<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//데이터베이스에 수정된 회원정보를 '반영'하는 코드를 작성
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone= request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	//request.setCharacterEncoding("UTF-8");
	try{
		Class.forName("oracle.jdbc.OracleDriver"); //오라클 데이터베이스 드라이버 불러오기
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		//업데이트 문법
		//update 테이블 이름 set 속성명1 = 값1, 속성명2 = 값2........
		String sql = "Update member_tbl_02 "+
		"set custname = ?, phone = ?, address = ?, joindtae = ?, grade = ?,city = ?, where custno = ?";
		PreparedStatement pstmt  = con.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		//두가지 경우가 있다. 데이터베이스에'조회' 할때는
		//ResultSet rs  = pstmt.executeQuery();
		//데이터베이스 '반영'할때는
		//ResultSet rs  = pstmt.executeQuery();
		//rs는 불러와서 표에 반여할때 필요한거
		pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<jsp:forward page="list.jsp"></jsp:forward>
