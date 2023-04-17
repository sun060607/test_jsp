function fn_submit(){
	var fn = document.frm;
	
	if(fn.regist_month.value === ""){
		alert("수강월을 입력해주세요!");
		fn.regist_month.focus();
		return false;
	}
	if(fn.c_no.value === ""){
		alert("회원명을 선택해주세요!");
		fn.c_name.focus();
		return false;
	}
	if(fn.class_area.value === ""){
		alert("강의장소를 선택해주세요!");
		fn.class_area.focus();
		return false;
	}
	if(fn.tuition.value === ""){
		alert("강의명을 선택해주세요!");
		fn.teacher_code.focus();
		return false;
	}
	
	fn.submit();
	
}
function fn_reset(){
	
	if(confirm("정보를 지우고 처음부터 다시 입력합니다!")){
		location="insert.jsp";
	}
}
function fn_change1(){ //회원명 셀렉트박스
	var fn = document.frm;
	fn.tuition.value = ""; //회원별 할인률을 적용해야하므로 수강료 초기화
	fn.teacher_code.options[0].selected = true; //셀렉트박스 초기화
	fn.c_no.value = fn.c_name.value; //회원번호 넣어주기
	
}
function fn_change2(){ //강의신청 셀렉트박스
	var fn = document.frm;
	var price = fn.teacher_code.value * 1000; //수강료
	var c_no = fn.c_no.value; // 회원번호 20000이상 50%할인
	if(c_no >= 20000) price *= 0.5; //50% 할인
	fn.tuition.value = price; //수강료 넣어주기
}