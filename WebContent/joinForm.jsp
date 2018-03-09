<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
   crossorigin="anonymous"></script>
<script type="text/javascript" src="check.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
   background-color: white;
}
</style>
<script type="text/javascript">
checkResult = {
  idCheck: false,
  pwCheck: false
};
</script>

<body>
   <img src="images/logo.jpg"
      style="position: absolute; top: 0px; right: 10px" width="120px"
      height="80px"></img>

   <form name="joinForm" method="post" action="joinAction.jsp">
      <div style="text-align: center; margin-top: 70px">
         <sapn
            style="font-size: 50px; color:#89D7C0; font:bold;
               font-family:'jeju gothic', serif">JOIN</sapn>
         <br />
      </div>
      <div style="font-family: 'jeju gothic', serif; margin-top: 20px">
         <table style="border: solid #89D7C0; padding: 20px 20px 20px 20px"
            align="center">
            <tr>
               <td>이름</td>
               <td><input type="text" name="name"
                  style="font-size: 25px; margin-left: 10px">
            </tr>

            <tr>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td>아이디</td>
               <td><input type="text" name="id"
                  style="font-size: 25px; margin-left: 10px"> &nbsp;&nbsp; <input
                  type="button" name="overlapId" value="중복확인"
                  style="border-radius: 15px; background-color: #E7E3E3; border-color: #E7E3E3; font-family: 'jeju gothic', serif; width: 70px; height: 25px"
                  onclick="checkId(checkResult);"></td>
            </tr>

            <tr>
               <td></td>
               <td><span
                  style="color: silver; font-size: 10pt; margin-left: 10px">5자
                     이상 12자 이하로 입력해주세요. </span></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td>비밀번호</td>
               <td><input type="password" name="password"
                  style="font-size: 25px; margin-left: 10px"></td>
            </tr>

            <tr>
               <td></td>
               <td><span
                  style="color: silver; font-size: 10pt; margin-left: 10px">영어와
                     숫자를 이용하여 8자 이상 12자 이하로 입력해주세요.</span></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td>비밀번호 확인</td>
               <td><input type="password" name="confirmPassword"
                  style="font-size: 25px; margin-left: 10px"> &nbsp;&nbsp; <input
                  type="button" name="confirm_pw_button" value="확인하기"
                  onclick="checkPw(checkResult)"
                  style="border-radius: 15px; background-color: #E7E3E3; border-color: #E7E3E3; font-family: 'jeju gothic', serif; width: 70px; height: 25px"></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td>이메일</td>
               <td><input type="text" name="email"
                  style="font-size: 25px; width: 150px; margin-left: 10px">
                  @ <select name="url" length="12"
                  style="width: 100px; height: 20px">
                     <option value="" selected>--email--</option>
                     <option value="shku.ac.kr">shku.ac.kr</option>
                     <option value="naver.com">naver.com</option>
                     <option value="daum.net">daum.net</option>
               </select></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td>휴대전화</td>
               <td><input type="text" name="phone"
                  style="font-size: 25px; margin-left: 10px"></td>
            </tr>

            <tr>
               <td></td>
               <td><span
                  style="color: silver; font-size: 10pt; margin-left: 10px">-
                     기호를 제외하고 숫자만 입력해주세요.</span></td>
            </tr>
            <tr>
               <td><span
                  style="font-size: 15px; align: center; padding-top: 10px">&nbsp;</span></td>
            </tr>
            <tr>
               <td>소속</td>
               <td><select name="department" length="12"
                  style="width: 100px; height: 30px; margin-left: 10px">
                     <option value="" selected>--학부--</option>
                     <option value="인문융합 자율학부 ">인문융합 자율학부</option>
                     <option value="사회융합 자율학부">사회융합 자율학부</option>
                     <option value="미디어컨텐츠융합 자율학부">미디어컨텐츠융합 자율학부</option>
                     <option value="IT융합 자율학부">IT융합 자율학부</option>
                     <option value="그 외">그 외</option>
               </select></td>
            </tr>

         </table>
      </div>

      <div
         style="text-align: center; margin-top: 25px; font-family: 'jeju gothic', serif">
         <input type="submit" name="submit" value="가입하기"
            onclick="return checkOk(checkResult);"
            style="width: 100px; height: 40px; font-size: 15px; border-radius: 15px; background-color: #F4C290; border-color: #F4C290; font-family: 'jeju gothic', serif">
      </div>
   </form>
</body>
</html>