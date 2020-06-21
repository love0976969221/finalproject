<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="../css/mycss.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<meta charset="UTF-8">
	<title>首頁</title>
	<style>
		/**{
			border: 1px solid black;
		}*/
	</style>

</head>
<body style="background-color:#F0F0F0 ">
	<!-- menu -->
	 <div class="container">
  <nav class="navbar navbar-expand navbar-light">
  <a class="navbar-brand" href="index.jsp"><img class="LOGO" src="../imgs/logo.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link">首頁 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="menu.jsp">菜單</a>
      </li>
	  <%
			if(session.getAttribute("aname") == null)
			{
				%>
      <li>
        <a href="login.jsp" class="nav-link">會員登入/註冊</a>
      </li>
	  <%}
			else{
				String account = (String)session.getAttribute("aname");%>
				<p style="font-size:20px"><%=account%></p>
				<li>
					<a href="member.jsp" class="nav-link">修改資料</a>
				</li>
				<li>
					<a href="order.jsp" class="nav-link">訂單查詢</a>
				</li>
				<li>
					<a href="logout.jsp" class="nav-link">登出</a>
				</li>
				
				
				<%}%>
    </ul>
    
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="Search">
    </form>
    <a href="shoppingcar.jsp" class="nav-link"><img class="car_img" src="../imgs/carcar.png"></a><input  style="width: 30px;" disabled value="0"  >
    
  </div>

</nav>
<hr style="background: blue;height: 5px">
</div>
<!-------------------------------------->
<!-- main -->
  
  <div class="container" style="border: 2px solid black;border-top:0px;">
    <div class="row row-cols-4">
<%
		if(request.getParameter("number") != null)
		{
			String[] number = request.getParameterValues("number");
			
			for(int i = 0; i < number.length; i++)
			{
				sql="SELECT * FROM products";
				ResultSet rs = con.createStatement().executeQuery(sql);
				rs.next();
				%>
				<div class="item">  			
					<img src="../imgs/<%=rs.getString(4)%>" class="card-img-top">
					<br>
					<font size="4"><strong><%=rs.getString(1)%></strong></font><br><br>
					<input type="button" value="點我購買" class="mh1" onclick="location.href='product.jsp?<%=rs.getString(5)%>'">
				</div>
	
		<%	}
		}
		else
		{
			sql = "Select * From products";
			ResultSet rs = con.createStatement().executeQuery(sql);
			
			while(rs.next())
			{%>
				<div class="item">  			
					<img src="../imgs/<%=rs.getString(4)%>" class="card-img-top">
					<br>
					<font size="4"><strong><%=rs.getString(1)%></strong></font><br><br>
					<input type="button" value="點我購買" class="mh1" onclick="location.href='product.jsp?<%=rs.getString(5)%>'">
				</div>
	<%
			}
		}%>  		
      
    </div>
  </div>
  <!--推薦商品-->

<!------------------------------------->

<script>
function ChangeBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;background-color:#4169E1;";
    }
    function ChangeBackBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;";
    }
  </script>
</body>
</html>