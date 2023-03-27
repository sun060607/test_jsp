function joinCheck(){
	if(document.frm.custno.value.length ==0){
		alert("회원성명이 입력되지 않았습니다");
		frm.custno.focus();
		return false;
	}
	if(document.frm.custname.value.length ==0){
		alert("회원성명이 입력되지 않았습니다");
		frm.custname.focus();
		return false;
	}
	if(document.frm.phone.value.length ==0){
		alert("회원전화가 입력되지 않았습니다");
		frm.phone.focus();
		return false;
	}
	if(document.frm.address.value.length ==0){
		alert("회원주소가 입력되지 않았습니다");
		frm.address.focus();
		return false;
	}
	if(document.frm.joindate.value.length ==0){
		alert("가일입자가 입력되지 않았습니다");
		frm.joindate.focus();
		return false;
	}
	if(document.frm.grade.value.length ==0){
		alert("고객등급이 입력되지 않았습니다");
		frm.grade.focus();
		return false;
	}
	if(document.frm.city.value.length ==0){
		alert("도서코드가 입력되지 않았습니다");
		frm.city.focus();
		return false;
	}
	alert("회원등록이 완료 되었습니다");
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