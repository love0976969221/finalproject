<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String psw1 = request.getParameter("password1");
	String psw2 = request.getParameter("password2");
	if(psw1.equals(psw2))
	{
		if(request.getParameter("password1") != "" && request.getParameter("phone") != "" && request.getParameter("username") != "")
		{				
			PreparedStatement pstmt = null;
			//讀出目前的會員編號最大值
			sql = "select numbers from users order by numbers ASC";
			pstmt=con.prepareStatement(sql);
			ResultSet paperrs = pstmt.executeQuery();		
			int nowNumber = 1;
			if(paperrs.last())
				nowNumber = paperrs.getInt(1) + 1;//再加一
		
			out.print(nowNumber);
			String numbers = String.valueOf(nowNumber); 		
			
			sql = "insert into users(numbers ,aname, psw, uname, tel, address, mail) values(?, ?, ?, ?, ?, ?, ?)"; //用?取代字串相加
			pstmt=con.prepareStatement(sql);//創造預備敘述
			pstmt.setInt(1, nowNumber);
			pstmt.setString(2, request.getParameter("account"));//再一一放入各參數
			pstmt.setString(3, request.getParameter("password1")); 
			pstmt.setString(4, request.getParameter("name"));			
			pstmt.setString(5, request.getParameter("tel"));
			pstmt.setString(6, request.getParameter("address"));
			pstmt.setString(7, request.getParameter("mail"));
			pstmt.execute();//輸入完執行
		    out.println("<script>alert('註冊成功')</script>");
			response.setHeader("refresh","0;URL=index.jsp") ;			
		}
		else
			response.sendRedirect("register.jsp?inputError=true") ;
	}
	else
		response.sendRedirect("register.jsp?pswError=true") ;
%>