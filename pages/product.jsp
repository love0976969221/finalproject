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
<link rel="stylesheet" type="text/css" href="../css/111.css">

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
  <nav class="navbar navbar-expand navbar-light ">
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
					<a href="order.jsp" class="nav-link">會員中心</a>
				</li>
				<li>
					<a href="logout.jsp" class="nav-link">登出</a>
				</li>
				
				
				<%}%>
    </ul>
    
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="Search">
    </form>
    <a href="shoppingcar.jsp" class="nav-link"><img class="car_img" src="../imgs/carcar.png"></a>
    
  </div>

</nav>
<hr style="background: blue;height: 5px">
</div>
<!-------------------------------------->
<!-- main -->
<div class="container" style="margin-top: 3em">
      
    </div><%
    String product = request.getParameter("product");
	sql="SELECT * FROM `products` WHERE `num` = '" + product + "'";
	ResultSet rs = con.createStatement().executeQuery(sql);
	rs.next();
%> 
<div class="container" style="margin-top: 3em">
  <!--圖片-->
  <div class="row">
    <div class="col-4"></div>
    <div class="col-4" ><img src="../imgs/<%=rs.getString(4)%>" style="width: 400px"></div>
    <div class="col-4"></div>
    </div>
  <!----------------->
  <!--商品資訊-->
    <div class="row">
    <div class="col-2"></div>
    <div class="col-8">
    <h3 style="color: red; font-weight: bold">商品介紹</h3><br>
      <div class="" <%=rs.getString(1)%>></div><br>
      <%=rs.getString(2)%>
	   <form action="car.jsp" method="POST">
	          		    <h5>數量:</h5><select size="1" name="amount">
        			    <option>1</option> 
        			    <option>2</option> 
        			    <option>3</option> 
        			    <option>4</option>
        			    <option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
        		    </select><br>
    <input type="hidden" name="num" value="<%=rs.getString(1)%>">
	<input type="hidden" name="price" value="<%=rs.getString(3)%>">
	<input type="hidden" name="fuck" value="<%=(String)session.getAttribute("aname")%>">
	
	
    
        <button class="btn btn-success" type="submit" >加入購物車</button>
        </form>

    </div>
    <div class="col-2"></div>
  </div>
   
  <!--留言區-->
  
  <div class="row" style="margin-top: 5em">
    <div class="col-2"></div>
    <div class="col-8"><h3 style="color: red; font-weight: bold">我要評論</h3></div>
    <div class="col-2"></div>
  </div>
  
  <div class="row">
    <div class="col-2"></div>
    <div class="col-8">
    <form action="comment.jsp?num=<%=rs.getString(1)%>">
      <table>
	  <div class="rating"> <!--星星評分-->
		<input type="radio" id="star5" name="rating" value="5" hidden>
		<label for="star5"></label>
		<input type="radio" id="star4" name="rating" value="4" hidden>
		<label for="star4"></label>
		<input type="radio" id="star3" name="rating" value="3" hidden>
		<label for="star3"></label>
		<input type="radio" id="star2" name="rating" value="2" hidden>
		<label for="star2"></label>
		<input type="radio" id="star1" name="rating" value="1" hidden>
		<label for="star1"></label>
	</div>
        <tr>
          <td><input type="" name="comment" placeholder="評語"style="width: 400px"></td>
        </tr>
		<%
		if(session.getAttribute("aname") != null)
		{%>
        <tr><td><button class="btn btn-success" type="submit">送出</button></td></tr>
		<%}
		else
			out.print("尚未登入，無法填寫");%>
      </table>
    </form>
  </div>
    <div class="col-2"></div>
  </div>
</div>
<!--評論-->

  <div class="row" style="margin-top: 5em">
    <div class="col-2"></div>
    <div class="col-8"><h3 style="color: red; font-weight: bold">評論</h3></div>
    <div class="col-2"></div>
  </div>

  <div class="row">
    <div class="col-2"></div>
    <div class="col-8">
    <table class="comment_table" style="width: 100%">
      <tr>
        <td>會員名稱</td>
        <td>星級</td>
        <td>日期</td>
        <td>評語</td>
      </tr>
	  <%
		sql="SELECT * FROM board WHERE num = '" + product + "'";
		rs = con.createStatement().executeQuery(sql);
		while(rs.next())
		{%>
      <tr>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getInt(3)%>★</td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(4)%></td>
      </tr>
	  <%}
			%>
    </table>
    </div>
    <div class="col-2"></div>
  </div>
<!------------------------------------->

<script>
  function ChangeStar(num){
    for (var i = 1; i <= num; i++) {
      document.getElementById("star-"+i).src="../imgs/star_selected.png";
    }
    for (var i = 5; i >num; i--) {
      document.getElementById("star-"+i).src="../imgs/star.png";
    }
  }
function ChangeBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;background-color:#FF7575;";
    }
    function ChangeBackBgColor(num){
      document.getElementById("recommendproduct"+num).style="padding:5px;height: 20em;width: 100%;";
    }
  </script>
</body>
</html>