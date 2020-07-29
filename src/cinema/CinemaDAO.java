package cinema;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class CinemaDAO {
	public int cinemainsert(CinemaDTO cinemaDTO) {
		String SQL = "INSERT INTO cinema VALUES (NULL,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cinemaDTO.getMovie_id());
			pstmt.setInt(2, cinemaDTO.getTime());
			pstmt.setInt(3, cinemaDTO.getCgv_seat());
			pstmt.setInt(4, cinemaDTO.getLotte_seat());
			pstmt.setInt(5, cinemaDTO.getMegabox_seat());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 데이터베이스 오류
	}
	//cgv 좌석빼기
	public int cgv_seat(int seat,int movie_id,int time) {
		String SQL = "UPDATE cinema SET cgv_seat = cgv_seat - ? where movie_id = ? and time = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, seat);
			pstmt.setInt(2, movie_id);
			pstmt.setInt(3, time);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 좌석수정실패
	}
	public int lotte_seat(int seat,int movie_id,int time) {
		String SQL = "UPDATE cinema SET lotte_seat = lotte_seat - ? where movie_id = ? and time = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, seat);
			pstmt.setInt(2, movie_id);
			pstmt.setInt(3, time);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 좌석수정실패
	}
	public int megabox_seat(int seat,int movie_id,int time) {
		String SQL = "UPDATE cinema SET megabox_seat = megabox_seat - ? where movie_id = ? and time = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, seat);
			pstmt.setInt(2, movie_id);
			pstmt.setInt(3, time);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 좌석수정실패
	}
}