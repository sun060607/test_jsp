let num1;
function num(t_name){
	frm.cd.value = t_name;
	num1 = t_name;
}
function num2(ca){
	let su = parseInt(ca)*100;
	if(num1>20000){
		frm.tu.value = su*10/2;
	}else{
		frm.tu.value = su*10;
	}
}
function check(){
	if(document.frm.td.value.length ==""){
		alert("입력되지 않음1");
		frm.td.focus();
		return false;
	}
	if(document.frm.t_name.value.length ==""){
		alert("입력되지 않음2");
		frm.t_name.focus();
		return false;
	}
	if(document.frm.cd.value.length ==""){
		alert("입력되지 않음3");
		frm.cd.focus();
		return false;
	}
	if(document.frm.ca.value.length ==0){
		alert("입력되지 않음4");
		frm.ca.focus();
		return false;
	}
	if(document.frm.cc.value.length ==""){
		alert("입력되지 않음5");
		frm.cc.focus();
		return false;
	}
	if(document.frm.tu.value.length ==""){
		alert("입력되지 않음6");
		frm.tu.focus();
		return false;
	}
	alert("성공");
	frm.submit();
	return true;
}