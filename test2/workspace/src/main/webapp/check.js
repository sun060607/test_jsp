function check(){
	if(document.frm.cn.value.length==""){
		alert("입력되지 않음");
		frm.cn.focus();
		return false;
	}
	frm.submit();
	return true;
}

