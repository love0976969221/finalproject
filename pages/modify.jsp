<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
	String psw1 = request.getParameter("password1");
	String psw2 = request.getParameter("password2");
	if(psw1.equals(psw2))
	{		
		if(request.getParameter("password1") != "" && request.getParameter("phone") != "" && request.getParameter("address") != "")
		{
			PreparedStatement pstmt = null;
			sql = "select `numbers` from `users` where `aname` = '" + (String)session.getAttribute("aname") + "';";  //再拿來找編號
			pstmt=con.prepareStatement(sql);
			ResultSet rs = con.createStatement().executeQuery(sql);
			rs.next();
			int nowNumbers = rs.getInt(1);
			
			
			sql = "Update `users` Set psw = ?, tel = ?, address = ? Where numbers = ?"; //用?取代字串相加
			pstmt=con.prepareStatement(sql);//創造預備敘述
			
			pstmt.setString(1, request.getParameter("password1"));//再一一放入各參數
			pstmt.setString(2, request.getParameter("phone"));
			pstmt.setString(3, request.getParameter("address"));
			pstmt.setInt(4, nowNumbers );
			pstmt.executeUpdate();//輸入完執行
						
		    out.println("<script>alert('修改成功')</script>");
			response.setHeader("refresh","0;URL=index.jsp") ;	
		}
		else{
			response.sendRedirect("register.jsp?inputError=true") ;
		}
	}
	else
		response.sendRedirect("modify.jsp?pswError=true") ;
%>