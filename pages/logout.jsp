<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<% //把account 的值傳過來了
	session.removeAttribute("aname");
	session.removeAttribute("psw");
	
	response.sendRedirect("index.jsp");
%>