<%@page import="sfr.user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	UserDAO dao = new UserDAO();
	String r = "[^ ]+[a-z0-9]+";

	if (id.matches(r) && 5 <= id.length() && id.length() <= 12) {
		if (dao.overlapId(id) == 1) {
			out.print("1");
		} else {
			out.print("0");
		}
	} else {
		out.print("-1");
	}
%>
