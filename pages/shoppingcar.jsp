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
    <div class="container">
    <table class="shoppingcar">
		 <%ResultSet rs;
								 sql = "select * from car where id =";
								 sql+= "'"+session.getAttribute("aname")+"'";
								 rs=con.createStatement().executeQuery(sql);
								 int sum=0;
								 while(rs.next())
								 {%>
      <tr style="border-bottom: 1px solid gray;">
    <!-- 圖片 -->
    <td style="width: 20%">
	<%=rs.getString(2)%>
    </td>
    <!-- ------------------ -->
    <!-- 物品名稱 -->
    <td style="width: 40%">
      <%=rs.getString(3)%>
    </td>
    <!-- ------------------- -->
    <!-- 價格 -->
    <td style="width: 20%">
      <%=rs.getString(4)%>
    </td>
	<form action="clearcar.jsp" method="post">
	<td style="width: 20%">
      <%=Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4))%>
    </td>
	    
    <!-- ---------------- -->
    <!-- 按鈕 -->
    <td style="width: 20%">
      <button class="btn btn-danger">刪除</button>
	 <input type="hidden" name="num" value="<%=rs.getString(2)%>">
	 <input type="hidden" name="fuck" value="<%=(String)session.getAttribute("aname")%>">
    </td>
	</form>
    </tr>
	<%}%>
	
<!-- 物品二 -->
    <tr>
      <td> 
        
      </td>
      <td style="text-align: right;">
        總金額：
      </td>
      <td>
	<%
								 sql = "select * from car where id =";
								 sql+= "'"+session.getAttribute("aname")+"'";
								 rs=con.createStatement().executeQuery(sql);
								 int summ=0;
								 while(rs.next())
								 {summ=summ+(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)));}
									 %>	

        <%out.print(summ);%> 
      </td>
      <td>
        <button class="btn btn-success" onclick="javascript:location.href='pay.jsp'">結帳</button>
      </td>
    </tr>
    <!-- -------- -->
 </table>
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