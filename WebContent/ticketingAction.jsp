<%@page import="seat.SeatDAO"%>
<%@page import="seat.SeatDTO"%>
<%@page import="movie.MovieDAO"%>
<%@page import="ticket.TicketDAO"%>
<%@page import="ticket.TicketDTO"%>
<%@page import="cinema.CinemaDTO"%>
<%@page import="cinema.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	TicketDAO ticketDAO = new TicketDAO();
	MovieDAO movieDAO = new MovieDAO();
	CinemaDAO cinemaDAO = new CinemaDAO();
	SeatDAO seatDAO = new SeatDAO();
	
	String userid = null;
	
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	if(userid == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userlogin.jsp;");
		script.println("</script>");
		script.close();
		return;
	}
	int movieid = 0;
	String movie_title = "";
	String cinema_name = "";
	String time = "";
	int time_i = 0;
	int people = 0;
	String seat_id = "";
	String seat_id_seat = "";
	int price = 0;
	
	if(request.getParameter("movie_title") != null){
		movie_title = request.getParameter("movie_title");
	}
	if(request.getParameter("cinema_name") != null){
		cinema_name = request.getParameter("cinema_name");
	}
	if(request.getParameter("time") != null){
		time = request.getParameter("time");
		if(time.equals("오전")){
			time_i = 0;
		}else if(time.equals("오후")){
			time_i = 1;
		}
		System.out.println("time_i : " + time_i);
	}
	
	if(request.getParameter("selCnt") != null){		
		try{
		people = Integer.parseInt(request.getParameter("selCnt"));
		price = people * 9000;
		}catch(Exception e){
			System.out.println("인원 데이터오류");
		}
	}
	
	//좌석 여부 확인부분
	String seatcheck = null;
	String seatDuplicate = "";
	seatcheck = seatDAO.getseatid(movie_title,cinema_name,time);

	System.out.println("좌석체크(seat테이블) : " + seatcheck);
	if(seatcheck != null){
	String[] seatArray = seatcheck.split(",");
	System.out.println("seatarray : " + seatArray[0]);
		if(request.getParameterValues("seat") != null){
			String[] seat = request.getParameterValues("seat");
			System.out.println("seat : " + seat[0]);
			for(int y=0;y<seatArray.length;y++){
				for(int k=0;k<seat.length;k++){
					if(seatArray[y].equals(seat[k])){
						seatDuplicate += seatArray[y] + " ";
						System.out.println("중복값저장변수 : " + seatDuplicate);
					}
				}
			}
			if(seatDuplicate != ""){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('"+ seatDuplicate + "해당 좌석이 중복됩니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}else if(seat != null) {
		        for(int i=0 ; i<seat.length ; i++) {
		        	if(i == seat.length-1){
		        		seat_id_seat += seat[i] +",";
		        		seat_id += seat[i];
		        	}else{
		        	seat_id_seat += seat[i] + ",";
		        	seat_id += seat[i] + ",";
		        	}
		        	System.out.println("seat_id : " + seat_id);
		        	System.out.println("seat_id_seat : " + seat_id_seat);
		        }
		    }
		}
	}else if(seatcheck == null){
		if(request.getParameterValues("seat") != null){
			String[] seat = request.getParameterValues("seat");
			if(seat != null) {
		        for(int i=0 ; i<seat.length ; i++) {
		        	if(i == seat.length-1){
		        		seat_id_seat += seat[i] +",";
		        		seat_id += seat[i];
		        	}else{
		        	seat_id_seat += seat[i] + ",";
		        	seat_id += seat[i] + ",";
		        	}
		        	System.out.println("seat_id : " + seat_id);
		        }
		    }
		}
	}
	if(movie_title == "" || cinema_name == "" || time == "" || people == 0 || seat_id == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('선택 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	// 좌석테이블 추가 or 업데이트
	int seatselect = seatDAO.seatselect(movie_title, cinema_name, time);
	System.out.println("seatselect : " + seatselect);
	int selectinsert = 0;
	int selectupdate = 0;
	if(seatselect == -1){
		selectinsert = seatDAO.seatinsert(new SeatDTO(0,movie_title, cinema_name, time,seat_id_seat));
		System.out.println("seatinsert : " + selectinsert);
	}else if(seatselect == 0){
		selectupdate = seatDAO.seatupdate(seat_id_seat, movie_title, cinema_name, time);
		System.out.println("seatupdate : " + selectupdate);
	}
	
	movieid = movieDAO.getmovieid(movie_title);
	//티켓추가
	int result = ticketDAO.ticketinsert(new TicketDTO(0,movie_title,cinema_name,time,
			people,seat_id,price,userid));
	int result2 = 0;
	//시네마 인원수 수정
	if(cinema_name.equals("cgv")){
		result2 = cinemaDAO.cgv_seat(people,movieid,time_i);
	}else if(cinema_name.equals("lotte")){
		result2 = cinemaDAO.lotte_seat(people,movieid,time_i);
	}else if(cinema_name.equals("megabox")){
		result2 = cinemaDAO.megabox_seat(people,movieid,time_i);
	}
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예매 실패하였습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else if(result2 == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('좌석수정실패');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예매완료되었습니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>