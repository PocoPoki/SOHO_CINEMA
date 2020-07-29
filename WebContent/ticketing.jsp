<%@page import="java.util.ArrayList"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "movie.MovieDTO" %>
<%@ page import = "movie.MovieDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLEncoder" %>

<!DOCTYPE html>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name = "viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>영화 예매 사이트</title>
	<!-- 부트스트랩 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = null;
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	
	if(userid == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
%>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="
    padding-top: 7px;
    padding-bottom: 0px;">
		<a class = "navbar-brand" href="index.jsp"><h1>SOHO CINEMA</h1></a>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="index.jsp"><h2>영화</h2></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="ticketing.jsp"><h2>예매</h2></a>
				</li>
<%
	if(userid == null) {
%>
				<li class="nav-item">
					<a class="nav-link" href="userlogin.jsp"><h2>로그인</h2></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="userJoin.jsp"><h2>회원가입</h2></a>
				</li>
<%
	} else if ("root@root".equals(userid)){
%>
				<li class="nav-item">
					<a class="nav-link" href="movieinsert.jsp"><h2>영화등록</h2></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="userLogout.jsp"><h2>로그아웃</h2></a>
				</li>
<%
	} else{
%>
				<li class="nav-item">
					<a class="nav-link" href="mypage.jsp"><h2>마이페이지</h2></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="userLogout.jsp"><h2>로그아웃</h2></a>
				</li>
<%
	}
%>
			</ul>
	</nav>
<div class="container"style="width:100%;">
<form method="post" action = "./ticketingAction.jsp">
<table class="table table-bordered">
        <span style="font-weight: bold;
        font-size: 2em;line-height: 2em;">영화선택
		</span>
    <tbody>
       <tr>
           <td>
           <%
				MovieDAO dao = new MovieDAO();
				ArrayList<MovieDTO>list = dao.movieList();
				for(MovieDTO dto:list){
			%>
			<input name="movie_title" type ="radio" value="<%=dto.getMovie_title() %>">
           <img src="./poster/<%=dto.getMovie_poster()%>" width="175" height="250"/>
           <%} %>
		   </td>
       </tr>
    </tbody>
</table>
<table class="table table-bordered">
        <span style="font-weight: bold;
        font-size: 2em;line-height: 2em;">극장선택
		</span>
    <tbody>
       <tr>
           <td>
			<input name="cinema_name" type ="radio" value="cgv">
           <img src="./poster/CGV.jpg" width="250" height="175"/>
           <input name="cinema_name" type ="radio" value="lotte">
           <img src="./poster/lottecinema.jpg" width="250" height="175"/>
           <input name="cinema_name" type ="radio" value="megabox">
           <img src="./poster/megabox.jpg" width="250" height="175"/>
		   </td>
       </tr>
    </tbody>
</table>
<table class="table table-bordered">
        <span style="font-weight: bold;
        font-size: 2em;line-height: 2em;">시간선택
		</span>
    <tbody>
       <tr>
           <td>
			<input name="time" type ="radio" value="오전">오전타임
            <input name="time" type="radio" value="오후" style="margin-left: 20px;">오후타임
		   </td>
       </tr>
    </tbody>
</table>



<script>
jQuery(document).ready(function($) {
    $("input[name=seat]:checkbox").change(function() {// 체크박스들이 변경됬을때
        var cnt = $("#selCnt").val();
        if( cnt==$("input[name=seat]:checkbox:checked").length ) {
            $(":checkbox:not(:checked)").attr("disabled", "disabled");
        } else {
            $("input[name=seat]:checkbox").removeAttr("disabled");
        }
    });

    $("#selCnt").change(function() {
        $("input[name=seat]:checkbox").removeAttr("checked");
        $("input[name=seat]:checkbox").removeAttr("disabled");
    });
});
function getSelectValue(frm)
{
 frm.optionValue.value = frm.selCnt.options[frm.selCnt.selectedIndex].value*9000;
}
</script>
<table class="table table-bordered">
        <span style="font-weight: bold;
        font-size: 2em;line-height: 2em;">인원선택
		</span>
    <tbody>
       <tr>
           <td><h2>
           	인원을 선택하세요.  
       	   <form name="form">
				<select name="selCnt" id="selCnt" onChange="getSelectValue(this.form);">         
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
		   		</select> 예상금액 : <input type="text" name="optionValue">
		   </form>
		   </h2></td>
       </tr>
    </tbody>
</table>
		<table>
        <span style="font-weight: bold;
        font-size: 2em;line-height: 2em;">좌석선택
		</span>
    <tbody>
    
    <tr>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="A1">A1</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="A2">A2</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="A3">A3</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="A4">A4</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="A5">A5</label></td>
    </tr>
    <tr>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="B1">B1</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="B2">B2</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="B3">B3</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="B4">B4</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="B5">B5</label></td>
    </tr>
    <tr>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="C1">C1</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="C2">C2</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="C3">C3</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="C4">C4</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="C5">C5</label></td>
    </tr>
    <tr>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="D1">D1</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="D2">D2</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="D3">D3</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="D4">D4</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="D5">D5</label></td>
    </tr>
    <tr>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="E1">E1</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="E2">E2</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="E3">E3</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="E4">E4</label></td>
        <td><label style="padding-right: 10px;padding-bottom: 1px;"><input type="checkbox" name="seat" value="E5">E5</label></td>
    </tr>
</tbody>
</table>

<table class="table table-bordered">
    <span style="font-weight: bold;
    font-size: 2em;line-height: 2em;">예매하기
    <tbody>
	<section class = "container mt-4" style = "max-width:560px;margin-left: 1px;">
			<button type="submit" class="btn dattai">예매완료</button>
		</form>
	</section>
    </tbody>
</table>
</div>
<!-- FOOTER!! -->
	<div class="mt-5 pt-5 pb-5 footer">
		<div class="container">
		  <div class="row">
		  <div class="col-lg-5 col-xs-12 about-company" style="padding-left: 150px;">
		      <h1>SOHO CINEMA</h1>
		      <p class="pr-5 text-white-50" style="font-size : 25px;">[SO-HA!!]</p>
		      <p class=""><small class="text-white-50">© 2019. All Rights Reserved.</small></p>
		    </div>
		    <div class="col-lg-3 col-xs-12 links">
		      <h4 class="mt-lg-0 mt-sm-3">CINEMA</h4>
		        <ul class="m-0 p-0">
		          <li>- <a href="http://www.cgv.co.kr/">CGV</a></li>
		          <li>- <a href="http://www.lottecinema.co.kr/">Lotte CINEMA</a></li>
		          <li>- <a href="http://www.megabox.co.kr/">Mega BOX</a></li>
		          <li>- <a href="https://www.cineq.co.kr/">Cine Q</a></li>
		          <li>- <a href="https://www.tohotheater.jp/">TOHO CINEMA</a></li>
		          
		        </ul>
		    </div>
		    <div class="col-lg-4 col-xs-12 location">
		      <h4 class="mt-lg-0 mt-sm-4">Location</h4>
		      <p>802-0014 Fukuoka, Kitakyushu, Kokurakita Ward, Sunatsu, 3</p>
		      <p class="mb-0"><i class="fa fa-phone mr-3"></i>(570)-783-460</p>
		      <p><i class="fa fa-envelope-o mr-3"></i>jeewoo197@gmail.com</p>
		    </div>
		  </div>
		</div>
		</div>
</body>
</html>