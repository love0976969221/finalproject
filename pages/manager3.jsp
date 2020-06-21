<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
  <a class="navbar-brand"><img class="LOGO" src="../imgs/logo.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="manager1.jsp">瀏覽訂單</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="manager2.jsp">瀏覽商品</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="manager3.jsp">新增商品</a>
      </li>
	  <li>
		<a href="managerout.jsp" class="nav-link">登出</a>
	  </li>
    </ul>
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
      <span style="font-weight: bold;font-size: 32px">新增商品</span>
      <form action="add.jsp" method="get">
      商品名稱<input style="margin-top: 5px" class="form-control" type="text" name="num" required>
      介紹<input style="margin-top: 5px" class="form-control" type="text" name="introduce" required>
      價格<input style="margin-top: 5px" class="form-control" type="text" name="price" required>
      照片檔名<input style="margin-top: 5px" class="form-control" type="text" name="photo" required>
	  庫存<input style="margin-top: 5px" class="form-control" type="text" name="stock" required>
	  商品編號<input style="margin-top: 5px" class="form-control" type="text" name="no" required>
      <input type="submit" class="submit_button" name="submit" value="送出">
      </form>
    </div>
    <div class="col-4"></div>
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