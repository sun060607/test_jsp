function Check(){
	if(document.frm.t_no.value.length == 0){
		alert("입출고번호 입력 없음");
		frm.t_no.focus();
		return false;
	}
	if(document.frm.p_code.value.length==0){
		alert("제품코드 입력 없음");
		frm.p_code.focus();
		return false;
	}if(document.frm.t_type.value.length == 0){
		alert("입출고구분 입력 없음");
		frm.t_type.focus();
		return false;
	}if(document.frm.t_cnt.value.length ==0){
		alert("수량 입력 없음");
		frm.t_cnt.focus();
		return false;
	}if(document.frm.t_date.value.length == 0){
		alert("거래일자 입력 없음");
		frm.t_date.focus();
		return false;
	}if(document.frm.c_code.value.length == 0){
		alert("거래처 입력 없음");
		frm.c_code.focus();
		return false;
	}
	alert("입력 완료");
	return true;
	
}