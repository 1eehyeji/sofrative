<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SOFRATIVE</title>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{
   background-color : white;
}
</style>
<body>
   <img src="images/logo.jpg"
      style="position: absolute; top: 0px; right: 10px" width="120px"
      height="80px"></img>
      
   <form action="profRegisterAction.jsp" method="post">
      <div
         style="margin-top: 150px; text-align: center; font-size: 25px; color: gray; font: bold; font-family: 'jeju gothic', serif;">
      
      <table
         style="border: solid white; font-family: 'jeju gothic', serif;"
         align="center">
         <tr>
            <td><span
               style="margin-top:10px; text-align: center; fon-size: 20px;font-family: 'jeju gothic', serif">교수 등록을 위한 비밀번호를 입력하세요</span></td>
     	</tr>
     	<tr>
     	<td>&nbsp;</td>
     	</tr>
     	<tr>
            <td><input type="password" name="ProfPw" autocomplete="off" style="font-size:25px"></td>
         </tr>
      </table>   
      </div>
      
      <div
         style="float: midle; text-align: center; margin-left: 25px; margin-top: 35px">
         <input type="submit" value="확인"
            style="width: 100px; height: 40px; background-color: #F4C290; font-size: 22px; border-radius: 15px; border-color: #F4C290; margin-top: 20px; font-family: 'jeju gothic', serif">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </div>
            
      
   </form>
</body>
</html>