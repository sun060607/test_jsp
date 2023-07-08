function check(){
	if(document.frm.pi.value.length == 0){
		alert("입력되지 않음1");
		frm.pi.focus();
		return false;
	}
	if(document.frm.pn.value.length == 0){
		alert("입력되지 않음2");
		frm.pn.focus();
		return false;
	}
	if(document.frm.pp.value.length == 0){
		alert("입력되지 않음3");
		frm.pp.focus();
		return false;
	}
	if(document.frm.pd.value.length == 0){
		alert("입력되지 않음4");
		frm.pd.focus();
		return false;
	}
	if(document.frm.pg.value.length == 0){
		alert("입력되지 않음5");
		frm.pg.focus();
		return false;
	}
	alert("성공");
	frm.submit();
	return true;
}