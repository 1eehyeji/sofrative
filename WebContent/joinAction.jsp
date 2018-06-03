<%@page import="sfr.DB.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="sfr.user.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf-8");
      
      String email = request.getParameter("email") + "@";
      String url= request.getParameter("url");
      
      UserVO user = new UserVO(
            request.getParameter("id"), request.getParameter("password"),
            request.getParameter("name"), request.getParameter("confirmPassword"),
            request.getParameter("department"), email, url,
            request.getParameter("phone"), 0);
      
      JoinDao dao = new JoinDao();
      
      
      if (member.nameIsEmpty()) {
   %>
   <script>
            alert("이름을 입력해주세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.ngap()){//이름에 공백 사용하지 않기
   %>
   <script>
            alert("이름에 공백을 사용할 수 없습니다.");
            history.go(-1);
         </script>
   <%
      }else if(member.nlength()){//이름 길이 체크 (2자이상)
   %>
   <script>
            alert("이름을 2자이상 입력해주세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.idIsEmpty()) {
   %>
   <script>
            alert("아이디를 입력하세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.idregEngNum()){ //영소문자,숫자만 허용
   %>
   <script>
            alert("아이디는 소문자 또는 숫자 입력가능합니다.");
            history.go(-1);
         </script>
   <%      
      }else if(member.idgap()){//공백 사용하지 않기
   %>
   <script>
            alert("아이디에 공백을 사용할 수 없습니다.");
            history.go(-1);
         </script>
   <%         
      }else if(member.idlength()){//길이 체크
   %>
   <script>
            alert("아이디를 5~12자까지 입력해주세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.passwordIsEmpty()){
   %>
   <script>
            alert("비밀번호를 입력하세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.pwregEngNum()){
   %>
   <script>
            alert("비밀번호는 소문자+숫자만 입력가능합니다.");
            history.go(-1);
         </script>
   <%
      }else if(member.pwgap()){
   %>
   <script>
            alert("비밀번호에 공백을 사용할 수 없습니다.");
            history.go(-1);
         </script>
   <% 
      }else if(member.pwlength()){
   %>
   <script>
            alert("비밀번호를 8~12자까지 입력하세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.cpregEngNum()){
   %>
   <script>
            alert("비밀번호는 소문자+숫자만 입력가능합니다.");
            history.go(-1);
         </script>
   <%
      }else if(member.cpwgap()){
   %>
   <script>
            alert("비밀번호에 공백을 사용할 수 없습니다.");
            history.go(-1);
         </script>
   <%
      }else if(member.cpwlength()){
   %>
   <script>
            alert("비밀번호를 8~12자까지 입력해주세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.urlIsEmpty()){
   %>
      <script>
            alert("이메일 주소를 선택하세요.");
            history.go(-1);
         </script>
   <%
      }else if(member.ckphone()){
    %>
       <script>
            alert("올바른 전화번호 양식이 아닙니다.");
            history.go(-1);
         </script>  
      }
    <%  
      }else if(member.departmentIsEmpty()){
   %>
   <script>
            alert("학부를 선택하세요.");
            history.go(-1);
         </script>
   <%
      }else {
         dao.insert(DBUtil.getConnection(), member);
   %>
   <script>
            alert("회원가입을 축하합니다!");
            location.href="loginForm.jsp";
         </script>
   <%          
      }
   %>
</body>
</html>