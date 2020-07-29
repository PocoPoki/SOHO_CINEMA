package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import movie.MovieDTO;
import util.DatabaseUtil;

public class TicketDAO {
	//예매정보입력
	public int ticketinsert(TicketDTO ticket) {
		String SQL = "INSERT INTO ticket VALUES (NULL,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ticket.getMovie_title());
			pstmt.setString(2, ticket.getCinema_name());
			pstmt.setString(3, ticket.getTime());
			pstmt.setInt(4, ticket.getPeople());
			pstmt.setString(5, ticket.getSeat_id());
			pstmt.setInt(6, ticket.getPrice());
			pstmt.setString(7, ticket.getUserid());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 티켓팅실패
	}
	//예매정보 불러오기
    public ArrayList<TicketDTO> ticketlist(String userid) {
        ArrayList<TicketDTO> ticketlist = new ArrayList<TicketDTO>();
        String SQL = "SELECT * FROM ticket WHERE userID = ?";
        Connection conn = null; // DB접속 객체
        PreparedStatement pstmt = null; // SQL실행객체
        ResultSet rs = null; // 결과셋 처리 객체
        try {
        	conn = DatabaseUtil.getConnection();
        	pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            while(rs.next()) {
				TicketDTO dto = new TicketDTO();
				dto.setTicket_id(rs.getInt("ticket_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setCinema_name(rs.getString("cinema_name"));
				dto.setTime(rs.getString("time"));
				dto.setPeople(rs.getInt("people"));
				dto.setSeat_id(rs.getString("seat_id"));
				dto.setPrice(rs.getInt("price"));
				ticketlist.add(dto);
			}
        }catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return ticketlist;
	}
    //좌석 번호 불러오기
	public String getseatid(String movie_title,String cinema_name,String time) {
		String SQL = "SELECT seat_id FROM ticket WHERE movie_title = ? and cinema_name = ? and time = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, movie_title);
			pstmt.setString(2, cinema_name);
			pstmt.setString(3, time);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return null; //데이터베이스 오류
	}
}
