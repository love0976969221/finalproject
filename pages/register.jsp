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
      <li>
        <a href="order.jsp" class="nav-link">會員中心</a>
      </li>
      <li>
        <a href="login.jsp" class="nav-link">會員登入/註冊</a>
      </li>
      
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
	<div class="container">
	  <div class="row">
		<div class="col-4"></div>
		<div class="col-4">
		  <span style="font-weight: bold;font-size: 32px">註冊帳號</span>
		  <form action="create.jsp" method="post">
		  <input style="margin-top: 5px" class="form-control" type="text" name="account" placeholder="請輸入帳號" >
		  <input style="margin-top: 5px" class="form-control" type="password" name="password1" placeholder="請輸入密碼">
		  <input style="margin-top: 5px" class="form-control" type="password" name="password2" placeholder="請再次輸入密碼">
		  <input style="margin-top: 5px" class="form-control" type="text" name="name" placeholder="請輸入姓名" >
		  <input style="margin-top: 5px" class="form-control" type="text" name="tel" placeholder="請輸入電話" >
		  <input style="margin-top: 5px" class="form-control" type="text" name="address" placeholder="請輸入住址" >
		  <input style="margin-top: 5px" class="form-control" type="text" name="mail" placeholder="請輸入信箱" >
		  <input type="submit" class="submit" name="submit" value="送出">
		  <%
		String obj1 = request.getParameter("pswError");
		String obj2 = request.getParameter("inputError");
		if(obj1 != null )
		{
			if(obj1.equals("true"))
			{
				out.println("*密碼不一致，請重新輸入<br>");
			}
		}
		if(obj2 != null)
		{			
			if(obj2.equals("true"))
			{
				out.println("*資料輸入錯誤，請重新輸入<br>");
			}
		}
			%>
		  </form>
		  <a href="login.jsp">已經是會員</a>
		</div>
		<div class="col-4"></div>
	</div>
	</div>
<!------------------------------------->

<script>
function ChangeBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;background-color:#FF7575;";
    }
    function ChangeBackBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;";
    }
  </script>
</body>
</html>