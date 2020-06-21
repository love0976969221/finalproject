<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<% //把account 的值傳過來了
	
	if(session.getAttribute("admin") != null)
	{
		session.removeAttribute("admin");		
	}
	response.sendRedirect("index.jsp");
%>