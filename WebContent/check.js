function checkId(checkResult) {
	var value = $("[name=id]").val();   
	$.get( "overlap.jsp?id=" + value, function( data ) {
		checkResult.idCheck = false;
		if (data == 0) {
			alert("사용가능한 아이디입니다.");
			checkResult.idCheck = true;
		} else if(data == 1)
			alert("이미 존재하는 아이디입니다.");
		else 
			alert("아이디가 조건에 맞지 않습니다.");
	});
}

function checkPw(checkResult){
	checkResult.pwCheck = false;
    if($("[name=confirmPassword]").val()){//재비밀번호를 입력하고 비밀번호재확인 버튼을 클릭한 경우
       var pw1,pw2;

       pw1=$("[name=password]").val();
       pw2=$("[name=confirmPassword").val();

       if(pw1!=pw2){
          alert("비밀번호가 다릅니다.");
       }else{
          alert("비밀번호가 같습니다.");
          checkResult.pwCheck = true;
       }

    }else{//재비밀번호를 입력 안하고 비밀번호재확인 버튼을 클릭한 경우
       alert("비밀번호를 입력하세요");
       $("[name=confirmPassword]").focus();
    }
 }

function checkOk(checkResult) {
	if (checkResult.idCheck == false) alert('아이디 중복을 검사하세요');
	if (checkResult.pwCheck == false) alert('비밀번호를 검사하세요');
	return checkResult.idCheck && checkResult.pwCheck;
}