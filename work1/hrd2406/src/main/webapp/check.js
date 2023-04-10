function listCheck(){
	if(document.frm.v_jumin.value.length ==0){
		alert("주민번호가 입력되지 않았습니다");
		frm.v_jumin.focus();
		return false;
	}
	if(document.frm.v_name.value.length ==0){
		alert("성명이 입력되지 않았습니다");
		frm.v_name.focus();
		return false;
	}
	if(document.frm.v_number.value.length ==0){
		alert("담당강사가 입력되지 않았습니다");
		frm.v_number.focus();
		return false;
	}
	
	if(document.frm.v_time.value.length ==0){
		alert("시간이 입력되지 않았습니다");
		frm.v_time.focus();
		return false;
	}
	if(document.frm.v_price.value.length ==0){
		alert("투표장소가 입력되지 않았습니다");
		frm.v_price.focus();
		return false;
	}
	if(document.frm.check[1].checked==false&&document.frm.check[2].checked==false){
		alert("요일이 입력되지 않았습니다");
		frm.check.focus();
		return false;
	}
	alert("교과목 등록이 완료 되었습니다");
	return true;
}

function search(){
	window.location = 'list.jsp';
}

function modify(){
	alert("회원정보 수정이 완료되었습니다");
	document.frm2.submit();
	return True;
}
function res(){
	alert("회원정보 수정이 완료되었습니다");
	document.frm2.reset();
	return True;
}