<%@page import="sofrative.join.JoinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	JoinDao dao = new JoinDao();
	String r = "[^ ]+[a-z0-9]+";

	if (request.getParameter("id").matches(r) && 5 <= request.getParameter("id").length()
			&& request.getParameter("id").length() <= 12) {

		if (dao.overlapId(request.getParameter("id")) == 1) {
			//session.setAttribute("id", request.getParameter("id"));
			out.print("1");
		} else {
			//session.setAttribute("id", request.getParameter("id"));
			out.print("0");
		}
	} else {
		out.print("-1");
	}
%>
