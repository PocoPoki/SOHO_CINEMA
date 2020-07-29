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
	String passwordcheck = null;
	if(request.getParameter("password") != null){
		password = request.getParameter("password");
	}
	if(request.getParameter("passwordcheck") != null){
		passwordcheck = request.getParameter("passwordcheck");
	}
	
	if(password == "" || passwordcheck == ""){
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
	int result = userDAO.changePassword(userid,password);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력하신 비밀번호가 변경되었습니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>