<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>   
<%@ page import="java.io.PrintWriter"%>
<%

	String userid = null;
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	request.setCharacterEncoding("UTF-8");
	String password = null;
	if(request.getParameter("password") != null){
		password = request.getParameter("password");
	}

	if(password == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호를 입력해주세요');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	//삭제
	UserDAO userDAO = new UserDAO();
	int result = userDAO.delete(userid,password);

	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		session.invalidate();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원탈퇴가 완료되었습니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>