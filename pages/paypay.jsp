<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%
	if(request.getParameter("address") != "" && request.getParameter("phone") != ""){
		ResultSet rs,rs1,rs2;
		
		request.setCharacterEncoding("UTF-8");
		String address = request.getParameter("address");
		String tel = request.getParameter("phone");
		Integer stock = 0;
		Integer amount = 0;
		Integer res = 0;
		String sql2 = "";
		   
		
			sql = "select * from car where id =";
			sql += "'"+session.getAttribute("aname")+"'";
			rs = con.createStatement().executeQuery(sql);
			while(rs.next())
			{
				sql= "insert into detail SET id =('"+(String)session.getAttribute("aname")+"'),address =('"+address+"'),phone = ('"+tel+"'),num = ('"+rs.getString(2)+"'),amount = ('"+rs.getString(3)+"'),price=('"+rs.getString(4)+"')";
				
				con.createStatement().execute(sql);
			}
			sql = "Select * from car where id =";
			sql += "'"+session.getAttribute("aname")+"'";
			rs1 = con.createStatement().executeQuery(sql);
			while(rs1.next())
			{
				amount = Integer.parseInt(rs1.getString(3));
				sql = "select * from products where num ='"+rs1.getString(1)+"'";
				rs2 = con.createStatement().executeQuery(sql);
				while(rs2.next())
				{
					stock = Integer.parseInt(rs2.getString(6));
					res = stock - amount ;
					sql2 = "UPDATE products SET stock ='"+res+"'WHERE num='"+(rs2.getString(1))+"'";	
					con.createStatement().execute(sql2);
				}
				
			}
			sql = "DELETE FROM car WHERE id = '"+session.getAttribute("aname")+"'";
			con.createStatement().execute(sql);
			out.println("<script>alert('購買成功!!')</script>");
			response.setHeader("refresh","0;URL=shoppingcar.jsp") ;
		
	}
	else{
		request.setCharacterEncoding("UTF-8");
		out.print("<script>alert('資料不完整')</script>");
		response.setHeader("refresh","0;URL=pay.jsp");
	}
%>