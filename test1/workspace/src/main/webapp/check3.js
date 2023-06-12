function check(){
	if(document.frm.on.value.length==0){
		alert("이름");
		frm.on.focus();
		return false;
	}if(document.frm.et.value.length==0){
		alert("이름");
		frm.et.focus();
		return false;
	}
	else{
		frm.submit();
	alert("성공");
	return true;
	}
	
}