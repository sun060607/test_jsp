<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "style.css" rel = "stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>투표검수조회</h2> 
<table border = "1">
<!--  v_name v_jumin (생년월일 ,나이) m_no v_time v_confirm -->
<tr><td>성명</td><td>생년월일</td><td>나이</td><td>성별</td>
<td>후보번호</td><td>투표시간</td><td>유권자확인</td></tr>
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select v_name, v_jumin, m_no, v_time, v_confirm "+
		     "from tbl_vote_202005"); 
	
	while(rs.next()){
	System.out.println(rs.getString(1)+rs.getString(2));
	String jumin = rs.getString(2); //990201 2589547
	String check = jumin.substring(6,7);
	Integer year = 0;
	String birth;
	Integer month = Integer.parseInt(jumin.substring(2,4));
	Integer age;
	String gender;
	if (check.equals("1") ||check.equals("2")) {
		year = Integer.parseInt(jumin.substring(0,2))+ 1900;	
	}
	else if (check.equals("3") ||check.equals("4")){
		year = Integer.parseInt(jumin.substring(0,2))+2000;
	}
	birth = year.toString() +"년" + month.toString()+ "월" +jumin.substring(4,6)+"일";
	age = 2020- year;
	if (month > 5) {
		age = age - 1;
	}
	if (check.equals("1") ||check.equals("3")) {
		gender = "남";
		
	}
	else {
		gender = "여";
	}
	
	
	%>
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=birth %></td>	
	<td><%="만 "+ age.toString()+"세" %></td>
	<td><%=gender %></td>
	<td><%=rs.getString(3) %></td>	
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	</tr>
	
<% 
	}
}
catch(Exception e){
	System.out.println("connect fail!!");
	e.printStackTrace();

}


%>

</table>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>