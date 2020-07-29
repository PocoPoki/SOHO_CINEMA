<%@page import="cinema.CinemaDTO"%>
<%@page import="cinema.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.MovieDTO"%>
<%@ page import="movie.MovieDAO"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = null;

	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	if(userid == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자로 로그인을 해주세요');");
		script.println("location.href = 'userlogin.jsp;");
		script.println("</script>");
		script.close();
		return;
	}
	int movieid = 0;
	String movie_title = null;
	String movie_title_sub = null;
	int movie_year = 0;
	String movie_story = null;
	String movie_director = null;
	String movie_cast = null;
	String movie_genres = null;
	int movie_runtime = 0;
	String movie_country = null;
	String movie_poster = null;
	String fileName = null;		
	String m_fileFullPath = null;
	
	//파일 업로드
	String directory = request.getServletContext().getRealPath("poster");
	int maxSize = 1024 * 1024 * 100;
			
	MultipartRequest mr = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	fileName = mr.getFilesystemName("movie_poster");
	//m_fileFullPath = directory + "\\" + fileName;
	
	if(mr.getParameter("movie_title") != null){
		movie_title = mr.getParameter("movie_title");
	}
	if(mr.getParameter("movie_title_sub") != null){
		movie_title_sub = mr.getParameter("movie_title_sub");
	}
	if(mr.getParameter("movie_year") != null){
		try{
			movie_year = Integer.parseInt(mr.getParameter("movie_year"));
		}catch(Exception e){
			System.out.println("영화년도 데이터오류");
		}
	}
	if(mr.getParameter("movie_story") != null){
		movie_story = mr.getParameter("movie_story");
	}
	if(mr.getParameter("movie_director") != null){
		movie_director = mr.getParameter("movie_director");
	}
	if(mr.getParameter("movie_cast") != null){
		movie_cast = mr.getParameter("movie_cast");
	}
	if(mr.getParameter("movie_genres") != null){
		movie_genres = mr.getParameter("movie_genres");
	}
	if(mr.getParameter("movie_runtime") != null){
		try{
			movie_runtime = Integer.parseInt(mr.getParameter("movie_runtime"));
		}catch(Exception e){
			System.out.println("상영시간 데이터오류");
		}
	}
	if(mr.getParameter("movie_country") != null){
		movie_country = mr.getParameter("movie_country");
	}

	if(mr.getParameter("movie_poster") != null){
		movie_poster = mr.getParameter("movie_poster");
	}
	if(movie_title == "" || movie_title_sub == "" || movie_year == 0 || movie_story == ""||
			movie_director == ""|| movie_director == ""|| movie_cast == ""|| movie_genres == ""||
					movie_runtime == 0 || movie_country == "" || movie_poster == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	MovieDAO movieDAO = new MovieDAO();
	CinemaDAO cinemaDAO = new CinemaDAO();
	int result = movieDAO.movieinsert(new MovieDTO(0,movie_title,movie_title_sub,movie_year,
			movie_story,movie_director,movie_cast,movie_genres,movie_runtime,movie_country,fileName));
	movieid = movieDAO.getmovieid(movie_title);
	System.out.println(movieid);
	int result2 = cinemaDAO.cinemainsert(new CinemaDTO(0,movieid,0,25,25,25));
	int result3 = cinemaDAO.cinemainsert(new CinemaDTO(0,movieid,1,25,25,25));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화등록실패');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else if(result2 == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('시네마 등록 실패');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else if(result3 == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('시네마 등록 실패');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>