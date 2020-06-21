<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%

if(request.getParameter("aname") !=null && request.getParameter("psw") != null){ 
	String account = request.getParameter("aname");
	String psw = request.getParameter("psw");
	
	if(account.equals("manager") && psw.equals("1234"))
	{
		session.setAttribute("admin", request.getParameter("psw"));
		response.setHeader("refresh","0;URL=manager1.jsp") ;
		return;
	}
    sql = "SELECT * FROM users WHERE aname=? AND psw=?";
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("aname"));
    pstmt.setString(2,request.getParameter("psw"));
	
	ResultSet paperrs = pstmt.executeQuery();
    
    if(paperrs.next()){            
        session.setAttribute("aname",request.getParameter("aname"));
		
		out.println("<script>alert('登入成功!!')</script>");
			response.setHeader("refresh","0;URL=index.jsp") ;	
    }
    else
	{        
		out.println("<script>alert('密碼錯誤!!')</script>");
		response.setHeader("refresh","0;URL=login.jsp") ;
	}
}
else{
	out.print("error");
}
%>
