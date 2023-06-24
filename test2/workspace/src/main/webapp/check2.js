function check3(){
	if(document.frm2.cn.value.length==""){
		alert("입력되지 않음1");
		frm2.cn.focus();
		return false;
	}
	if(document.frm2.on.value.length==""){
		alert("입력되지 않음2");
		frm2.on.focus();
		return false;
	}
	if(document.frm2.dt.value.length==""){
		alert("입력되지 않음3");
		frm2.dt.focus();
		return false;
	}
	alert("성공");
	frm2.submit();
	return true;
}