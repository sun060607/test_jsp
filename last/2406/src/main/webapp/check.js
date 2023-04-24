function Check(){
	if(document.frm.t_no.value.length ==0){
		alert("실패");
		frm.t_no.focus();
		return false;
	}
	if(document.frm.p_code.value.length ==0){
		alert("실패");
		frm.p_code.focus();
		return false;
	}
	if(document.frm.t_type[1].checked==false&&document.frm.t_type[2].checked==false){
		alert("실패");
		frm.t_type.focus();
		return false;
	}
	
	if(document.frm.t_cnt.value.length ==0){
		alert("실패");
		frm.t_cnt.focus();
		return false;
	}
	if(document.frm.t_date.value.length ==0){
		alert("실패");
		frm.t_date.focus();
		return false;
	}
	if(document.frm.c_code.value.length ==0){
		alert("실패");
		frm.c_code.focus();
		return false;
	}
	alert("입출고등록이 완료되었습니다");
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
