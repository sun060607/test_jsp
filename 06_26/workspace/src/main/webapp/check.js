function check(){
	if(document.frm.re.value.length == ""){
		alert("입력되지 않음1");
		frm.re.focus();
		return false;
	}
	if(document.frm.em.value.length == ""){
		alert("입력되지 않음2");
		frm.em.focus();
		return false;
	}
	if(document.frm.res.value.length == ""){
		alert("입력되지 않음3");
		frm.res.focus();
		return false;
	}
	if(document.frm.se.value.length == ""){
		alert("입력되지 않음4");
		frm.se.focus();
		return false;
	}
	alert("성공");
	frm.submit();
	return true;
}
function check2(){
	if(document.frm1.em.value.length == ""){
		alert("입력되지 않음1");
		frm1.em.focus();
		return false;
	}
	
	alert("성공");
	frm1.submit();
	return true;
}