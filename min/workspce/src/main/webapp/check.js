function check(){
	if(document.frm.cn2.value.length == ""){
		alert("입력1");
		frm.cn2.focus();
		return false;
	}
	if(document.frm.cn3.value.length == ""){
		alert("입력2");
		frm.cn3.focus();
		return false;
	}
	if(document.frm.cn4.value.length == ""){
		alert("입력3");
		frm.cn4.focus();
		return false;
	}
	if(document.frm.cn5.value.length == ""){
		alert("입력4");
		frm.cn5.focus();
		return false;
	}
	if(document.frm.cn6.value.length == ""){
		alert("입력5");
		frm.cn6.focus();
		return false;
	}
	if(document.frm.cn7.value.length == ""){
		alert("입력6");
		frm.cn7.focus();
		return false;
	}
	alert("성공");
	frm.submit();
	return true;
}