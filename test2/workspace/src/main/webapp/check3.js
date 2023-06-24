function check2(){
	if(document.frm1.cn.value.length==""){
		alert("입력되지 않음1");
		frm1.cn.focus();
		return false;
	}
	if(document.frm1.on.value.length==""){
		alert("입력되지 않음2");
		frm1.on.focus();
		return false;
	}
	if(document.frm1.lo.value.length==""){
		alert("입력되지 않음3");
		frm1.lo.focus();
		return false;
	}
	if(document.frm1.et.value.length==""){
		alert("입력되지 않음4");
		frm1.et.focus();
		return false;
	}
	alert("성공");
	frm1.submit();
	return true;
}