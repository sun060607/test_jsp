function check(){
	if(document.frm.cn1.value.length==0){
		alert("차량번호");
		frm.cn1.focus();
		return false;
	}else if(document.frm.on.value.length==0){
		alert("이름");
		frm.on.focus();
		return false;
	}
	else{
		frm.submit();
	alert("성공");
	return true;
	}
	
}