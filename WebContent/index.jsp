<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "movie.MovieDTO" %>
<%@ page import = "movie.MovieDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name = "viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>영화 예매 사이트</title>
	<!-- 부트스트랩 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/custom.css">
	<style>
  table, th, td {
    border: 1px solid #bcbcbc;
  }
  table {
    margin-left: auto;
    margin-right: auto;
  }
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = null;
	String usertype = null;
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	/*
	if(userid != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	*/
%>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="
    padding-top: 7px;
    padding-bottom: 0px;">
		<a class = "navbar-brand" href="index.jsp"><h1>SOHO CINEMA</h1></a>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp"><h2>영화</h2></a>
				</li>
				<li class="nav-item">
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
				<li class="nav-item">
					<a class="nav-link" href="findPassword.jsp"><h2>비밀번호찾기</h2></a>
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
<% 
	int movie_id = 0;
	MovieDAO dao = new MovieDAO();
	ArrayList<MovieDTO>list = dao.movieList();
	for(MovieDTO dto:list){
%>
	<div class="container">
      <div class="movies__list">
        <div class="movie">
          <div class="movie__poster">
	    <img src="./poster/<%=dto.getMovie_poster()%>"/>
          </div>
          <div class="movie__info">
            <h1 class="movie__title">
              <%=dto.getMovie_title()%> <span class="year"><%=dto.getMovie_year()%></span>
            </h1>
            <h5 class="movie__subtitle"><%=dto.getMovie_title_sub()%></h5>

            <p class="movie__des">
              <%=dto.getMovie_story()%>
            </p>
            <ul class="movie__details">
              <li><strong>Director</strong>: <%=dto.getMovie_director()%></li>
              <li><strong>Cast</strong>: <%=dto.getMovie_cast()%></li>
              <li><strong>Genres</strong>: <%=dto.getMovie_genres()%></li>
              <li><strong>Runtime</strong>: <%=dto.getMovie_runtime()%>Minutes</li>
              <li><strong>Country</strong>: <%=dto.getMovie_country()%></li>
            </ul>

            <div class="options">
            <%
				if("root@root".equals(userid)) {
			%>
			  <button type="button" class="btn download" onclick = "location.href='./movieupdate.jsp?movie_id=<%=dto.getMovie_id() %>'">수정</button>
              <button type="button" class="btn dattai" onclick = "location.href='./moviedeleteAction.jsp?movie_id=<%=dto.getMovie_id() %>'">삭제</button>
            <%
				}else{
            %>
              <button type="button" class="btn watch" onclick = "location.href='./ticketing.jsp?movie_id=<%=dto.getMovie_id() %>'">예매하기</button>
            <%
				}
            %>
            </div>
          </div>
        </div>
      </div>
   	</div>
<%
	}
%>	
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
	<!-- 제이쿼리,파퍼,부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>