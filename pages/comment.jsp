<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%
	String URL = request.getParameter("URL");
	String product = request.getParameter("num");
	if((String)session.getAttribute("aname")!= null)
	{
		String aname = (String)session.getAttribute("aname");
		int star = Integer.parseInt(request.getParameter("rating"));
		String comment = request.getParameter("comment");
		
		sql = "Insert Into `board`(`num`, `aname`, `star`, `comment`) values(?, ?, ?, ?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, product);
		pst.setString(2, aname);
		pst.setInt(3, star);
		pst.setString(4, comment);
		pst.execute();
		
		out.print("<script>alert('留言成功')</script>");	
		response.setHeader("refresh","0;URL=menu.jsp") ;  
	}
	else
	{
		out.print("<script>alert('留言失敗')</script>");	
		response.setHeader("refresh","0;URL=menu.jsp") ;  
	}
	
	
%>	