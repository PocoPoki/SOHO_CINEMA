<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="user.UserDAO"%>
<%@ page import="util.FindUtil" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter"%>
<%
	UserDAO userDAO = new UserDAO();
	FindUtil findUtil = new FindUtil();
	String email = null;
	String name = null;
	String newpassword = findUtil.getNewPwd();;
	if(request.getParameter("email") != null){
		email = request.getParameter("email");
		name = userDAO.getUserName(email);
	}
	
	String host = "http://localhost:8181/SOHO_CINEMA/";
	String from = "jeewoo197@gmail.com";
	String to = email;
	String subject = "[SO-HA!!] 임시 비밀번호 발급 안내 ( ;∀;) ";
	String content = "";
	content += "<div align='center' style='border:1px solid black; font-family:verdana'>";
	content += "<h3 style = 'color:blue;'><strong>" + name;
	content += "님</strong>의 임시 비밀번호 입니다. 로그인후 비밀번호를 변경해주세요(/ω＼)</h3>";
	content += "<p>임시 비밀번호 : <strong>" + newpassword + "</strong></p></div>";
	
	Properties p = new Properties();
	p.put("mail.smtp.user",from);
	p.put("mail.smtp.host","smtp.googlemail.com");
	p.put("mail.smtp.port","465");
	p.put("mail.smtp.starttls.enable","true");
	p.put("mail.smtp.auth","true");
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.socketFactory.port","465");
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
	
	try{
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p,auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO,toAddr);
		msg.setContent(content,"text/html;charset=UTF8");
		Transport.send(msg);
		
		userDAO.changePassword(email,newpassword);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('해당 이메일로 임시 비밀번호를 전송하였습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		
	}catch(Exception e){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>