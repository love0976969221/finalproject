<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
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
	  <li class="nav-item">
        <a class="nav-link" href="aboutus.jsp">關於我們</a>
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
					<a href="membership.jsp" class="nav-link">會員資料</a>
				</li>
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

<!-- 廣告牆-->
<div class="container">
 <div class="swiper-container" style="text-align:center;">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="../imgs/food1.jpg" alt="item1">
          </div>
          <div class="swiper-slide">
            <img src="../imgs/food2.jpg" alt="item2">
          </div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
      </div>
  </div>
  <!--推薦商品-->
  <div class="container">
    <span style="font-size:3em;">熱賣商品</span>
  </div>
  <div class="container">
  	<div class="row" style="border:1px solid black">
  	<div class="col-sm-3" >
  		
      <div class="row" >
        <a style="padding:5px;height: 20em;width: 100%;background-color:#F0F0F0;" id="recommendproduct1" onmouseover="ChangeBgColor(1)" onmouseleave="ChangeBackBgColor(1)"  href="product.jsp?product=花生培根卡拉雞腿堡餐">
      <div class="col" style="height:80%;width:100%"><img style="height:100%;width:100%" src="../imgs/food1.jpg"></div>
       <div class="col" style="text-align: center;"><span class="recommendtext">前往購買</span> </div>
      
      </a> 
      </div>
      
  		<a>花生培根卡拉雞腿堡餐</a>
  	</div>
  	<div class="col-sm-3">
  		<div class="row">
        <a style="padding: 5px ;height: 20em;width: 100%;" id="recommendproduct2" onmouseover="ChangeBgColor(2)" onmouseleave="ChangeBackBgColor(2)" href="product.jsp?product=金沙黑爵士卡拉雞腿堡餐">
      <div class="col" style="height:80%;width:100%"><img style="height:100%;width:100%" src="../imgs/food2.jpg"></div>
       <div class="col" style="text-align: center;"><span class="recommendtext">前往購買</span> </div>   
      </a></div>
  		<a>金沙黑爵士卡拉雞腿堡餐</a>
  	</div>
  	<div class="col-sm-3">
  		<div class="row">
        <a style="padding: 5px ;height: 20em;width: 100%" id="recommendproduct3" onmouseover="ChangeBgColor(3)" onmouseleave="ChangeBackBgColor(3)" href="product.jsp?product=吮指雙雞XL餐">
      <div class="col" style="height:80%;width:100%"><img style="height:100%;width:100%" src="../imgs/food3.jpg"></div>
       <div class="col" style="text-align: center;"><span class="recommendtext">前往購買</span> </div>   
      </a></div>
  		<a>吮指雙雞XL套餐</a>
  	</div>
  	<div class="col-sm-3">
  		<div class="row">
        <a style="padding: 5px ;height: 20em;width: 100%" id="recommendproduct4" onmouseover="ChangeBgColor(4)" onmouseleave="ChangeBackBgColor(4)" href="product.jsp?product=點心盒套餐">
      <div class="col" style="height:80%;width:100%"><img style="height:100%;width:100%" src="../imgs/food7.jpg"></div>
       <div class="col" style="text-align: center;"><span class="recommendtext">前往購買</span> </div>   
      </a></div>
  		<a>點心盒套餐</a>
  	</div>
  	
  </div>
</div>

<footer>
	<%out.print("第" +count +"位訪客");%>
</footer>

<!------------------------------------->

<script>
    // SWIPER 初始化
    // 可參考: https://idangero.us/swiper/demos/
    const swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });


    function ChangeBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;background-color:#4169E1;";
    }
    function ChangeBackBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;";
    }
  </script>
</body>
</html>