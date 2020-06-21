<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@include file="config.jsp" %>

<%
	if(request.getParameter("name") != "" && request.getParameter("price") != "" && request.getParameter("stock") != "")
		{
			PreparedStatement pstmt = null;
			
			String location="product="+request.getParameter("num");
			
			sql = "insert into products(num ,introduce, price, photo, location, stock, no) values(?, ?, ?, ?, ?, ?, ?)"; //用?取代字串相加
			pstmt=con.prepareStatement(sql);//創造預備敘述
			pstmt.setString(1, request.getParameter("num"));//再一一放入各參數
			pstmt.setString(2, request.getParameter("introduce")); 
			pstmt.setInt(3, Integer.parseInt(request.getParameter("price")));			
			pstmt.setString(4, request.getParameter("photo"));
			pstmt.setString(5, location);
			pstmt.setInt(6, Integer.parseInt(request.getParameter("stock")));
			pstmt.setInt(7, Integer.parseInt(request.getParameter("no")));
			pstmt.execute();//輸入完執行
		    out.println("<script>alert('新增成功')</script>");
			response.setHeader("refresh","0;URL=manager2.jsp") ;
		}
%>