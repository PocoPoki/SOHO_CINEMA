package seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class SeatDAO {
	//�¼� �ִ��� �˻�
	public int seatselect(String movie_title, String cinema_name, String time) {
		String SQL = "SELECT seat_id FROM seat WHERE movie_title = ? and cinema_name = ? and time = ?";
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
				return 0;
			}else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // �����ͺ��̽� ����
	}
	//�¼��߰�(ó����)
	public int seatinsert(SeatDTO seatDTO) {
		String SQL = "INSERT INTO seat VALUES (NULL,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatDTO.getMovie_title());
			pstmt.setString(2, seatDTO.getCinema_name());
			pstmt.setString(3, seatDTO.getTime());
			pstmt.setString(4, seatDTO.getSeat_id());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // �����ͺ��̽� ����
	}
	//�¼� ������Ʈ
	public int seatupdate(String seat_id, String movie_title, String cinema_name, String time) {
		String SQL = "UPDATE seat SET seat_id = CONCAT(seat_id,?) WHERE movie_title = ? and cinema_name = ? and time = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seat_id);
			pstmt.setString(2, movie_title);
			pstmt.setString(3, cinema_name);
			pstmt.setString(4, time);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // �����ͺ��̽� ����
	}
	//�¼���ȣ �ҷ�����
	public String getseatid(String movie_title,String cinema_name,String time) {
		String SQL = "SELECT seat_id FROM seat WHERE movie_title = ? and cinema_name = ? and time = ?";
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
		return null; //�����ͺ��̽� ����
	}
}
