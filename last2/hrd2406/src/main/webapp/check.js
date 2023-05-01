function check(){
	if(document.frm.player_id.value.length == 0){
		alert("선수id");
		frm.palyer_id.focus();
		return false;
	}
	if(document.frm.player_name.value.length == 0){
		alert("선수이름");
		frm.player_name.focus();
		return false;
	}
	if(document.frm.player_position.value.length == 0){
		alert("포지션");
		frm.player_position.focus();
		return false;
	}
	if(document.frm.player_date.value.length == 0){
		alert("등록 날짜");
		frm.player_date.focus();
		return false;
	}
	if(document.frm.team_id.value.length == 0){
		alert("팀 선택");
		frm.team_id.focus();
		return false;
	}
	alert("성공");
	return true;
}