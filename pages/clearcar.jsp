<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%


try{
	if(session.getAttribute("aname")==null)
	{
		out.println("<script>alert('您尚未登入')</script>");
		response.setHeader("refresh","0;URL=index.jsp") ;
	}
	else
	{
		request.setCharacterEncoding("UTF-8");
		String fuck=request.getParameter("fuck");
		String num=request.getParameter("num");
		 request.setCharacterEncoding("UTF-8");
		sql = "Delete FROM car WHERE id='" +fuck+"' and num='"+num+"'";
        con.createStatement().execute(sql);

		  response.sendRedirect("shoppingcar.jsp"); 
			
	}

%>

	<%
	
	}
	

catch(SQLException s)
{
	out.print(s.toString());
}
	
%>