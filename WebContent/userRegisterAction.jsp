<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = null;
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	if(userid != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String username = null;
	String password = null;
	String passwordcheck = null;
	
	if(request.getParameter("userid") != null){
		userid = request.getParameter("userid");
	}
	if(request.getParameter("username") != null){
		username = request.getParameter("username");
	}
	if(request.getParameter("password") != null){
		password = request.getParameter("password");
	}
	if(request.getParameter("passwordcheck") != null){
		passwordcheck = request.getParameter("passwordcheck");
	}
	
	if(userid == "" || username == "" || password == "" || passwordcheck == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if(!password.equals(passwordcheck)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 같지않습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
    }
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userid,username,password));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>