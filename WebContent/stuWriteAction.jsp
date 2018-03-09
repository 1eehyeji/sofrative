<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sofrative.message.MessageDB"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sofrative</title>
</head>
<%    
        request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String name_encoded = URLEncoder.encode(name);
        String memberid = request.getParameter("memberid");
        String message = (String)request.getParameter("message");
        
         boolean result = false;
         int value = -1; //정규식에서 걸렸으면(null이거나 스페이스 바 쳤을 때) -1 아니면 1
         
         String regex = "[ ]+";
         boolean reg = message.matches(regex);
         
         MessageDB mdb = MessageDB.getInstance();
         
         if((mdb.loginValue(memberid)).equals("1")){//교수님이 로그인이 되어있음 
            
        	 if(reg == false){ //교수님 로그인 + 좋은 메세지
               result = mdb.messageInsert(memberid, message);
            //전송되었습니다.
%>
		<script>
      		alert("전송 되었습니다.");
      		location.href="stuWriteForm.jsp?name=<%=name_encoded%>&memberid=<%=memberid %>";
		</script>
<%   
     		} else {
            //메세지를 다시 입력해주세요
%>
		<script>
 			alert("메세지를 다시 입력해주세요.");
      		location.href="stuWriteForm.jsp?name=<%=name_encoded%>&memberid=<%=memberid %>";
		</script>
<%
        	}
        } else {
            //현재 교수님이 로그아웃 중입니다. 
%>
		<script>
      		alert("현재 해당 교수님이 로그아웃 중입니다.");  
      		document.location.href="DepartmentSelect.jsp";
   		</script>
<%          
   		}       
%>
<body>

</body>
</html>