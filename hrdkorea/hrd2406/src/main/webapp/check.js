function check(){
	if(document.frm.pname.value.length == 0){
		alert("이름이 입력되지 않음");
		frm.pname.focus();
		return false;
	}
	if(document.frm.pposition.value.length == 0){
		alert("포지션이 입력되지 않음");
		frm.pposition.focus();
		return false;
	}
	if(document.frm.pdate.value.length == 0){
		alert("날짜가 입력되지 않음");
		frm.pdate.focus();
		return false;
	}
	if(document.frm.pgrade.value.length == ""){
		alert("등급이 입력되지 않음");
		frm.pgrade.focus();
		return false;
	}
	
	alert("성공");
	return true;
}