function listCheck(){
	if(document.frm.id.value.length ==0){
		alert("교과목이 입력되지 않았습니다");
		frm.id.focus();
		return false;
	}
	if(document.frm.name.value.length ==0){
		alert("교과목명이 입력되지 않았습니다");
		frm.name.focus();
		return false;
	}
	if(document.frm.credit.value.length ==0){
		alert("학점이 입력되지 않았습니다");
		frm.credit.focus();
		return false;
	}
	if(document.frm.lecturer.value.length ==0){
		alert("담당강사가 입력되지 않았습니다");
		frm.lecturer.focus();
		return false;
	}
	if(document.frm.week[0].checked==false&&document.frm.week[1].checked==false
	&&document.frm.week[2].checked==false&&document.frm.week[3].checked==false
	&&document.frm.week[4].checked==false){
		alert("요일이 입력되지 않았습니다");
		frm.week.focus();
		return false;
	}
	if(document.frm.start_hour.value.length ==0){
		alert("시작시간이 입력되지 않았습니다");
		frm.start_hour.focus();
		return false;
	}
	if(document.frm.end_hour.value.length ==0){
		alert("종료시간 입력되지 않았습니다");
		frm.end_hour.focus();
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