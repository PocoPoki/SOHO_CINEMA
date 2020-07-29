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
	int movie_id = Integer.parseInt(request.getParameter("movie_id"));

	MovieDAO movieDAO = new MovieDAO();
	int result = movieDAO.moviedelete(movie_id);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화삭제실패');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화 삭제 성공');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>