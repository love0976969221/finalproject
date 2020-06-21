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
		String price=request.getParameter("price");
		int amount=Integer.parseInt(request.getParameter("amount"));
		request.setCharacterEncoding("UTF-8");
		sql="select * from products where num='"+num+"'";
		ResultSet rs=con.createStatement().executeQuery(sql);
		int left=0;
		while(rs.next())
		{
			left=Integer.parseInt(rs.getString("stock"));
		}
		if(left>=amount){
		sql="insert car (id,num,amount,price) values('"+fuck+"' , '"+num+"', "+amount+" , "+price+ " )";
		con.createStatement().execute(sql);
			
		response.sendRedirect("shoppingcar.jsp"); 			
		}
		else{
			request.setCharacterEncoding("UTF-8");
			out.print("<script>alert('庫存不足')</script>");
			response.setHeader("refresh","0;URL=menu.jsp");
		}
		

	}


%>

	

	<%
	
	}
	

catch(SQLException s)
{
	out.print(s.toString());
}
	
%>