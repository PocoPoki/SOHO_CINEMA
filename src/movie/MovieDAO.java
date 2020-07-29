package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class MovieDAO {
	//?
	public int movieselect(int movie_id) {
		String SQL = "SELECT * FROM movie WHERE movie_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, movie_id);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // db오류
	}
	//영화제목 -> 영화번호
	public int getmovieid(String movie_title) {
		String SQL = "SELECT movie_id FROM movie WHERE movie_title = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, movie_title);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 오류
	}
	//영화 등록
	public int movieinsert(MovieDTO movieDTO) {
		String SQL = "INSERT INTO movie VALUES (NULL,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, movieDTO.getMovie_title());
			pstmt.setString(2, movieDTO.getMovie_title_sub());
			pstmt.setInt(3, movieDTO.getMovie_year());
			pstmt.setString(4, movieDTO.getMovie_story());
			pstmt.setString(5, movieDTO.getMovie_director());
			pstmt.setString(6, movieDTO.getMovie_cast());
			pstmt.setString(7, movieDTO.getMovie_genres());
			pstmt.setInt(8, movieDTO.getMovie_runtime());
			pstmt.setString(9, movieDTO.getMovie_country());
			pstmt.setString(10, movieDTO.getMovie_poster());
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
	//영화 수정
	public int movieupdate(int movie_id, String movie_title, String movie_title_sub, int movie_year, String movie_story, String movie_director
			, String movie_cast, String movie_genres, int movie_runtime, String movie_country, String movie_poster) {
		String SQL = "UPDATE movie SET movie_title = ?, movie_title_sub = ?, movie_year = ?, movie_story = ?, movie_director = ?,"
				+ "movie_cast = ?, movie_genres = ?, movie_runtime = ?, movie_country = ?, movie_poster = ? WHERE movie_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, movie_title);
			pstmt.setString(2, movie_title_sub);
			pstmt.setInt(3, movie_year);
			pstmt.setString(4, movie_story);
			pstmt.setString(5, movie_director);
			pstmt.setString(6, movie_cast);
			pstmt.setString(7, movie_genres);
			pstmt.setInt(8, movie_runtime);
			pstmt.setString(9, movie_country);
			pstmt.setString(10, movie_poster);
			pstmt.setInt(11, movie_id);
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
	//영화삭제
	public int moviedelete(int movie_id) {
		String SQL = "DELETE FROM movie WHERE movie_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, movie_id);
			return pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 디비오류
	}
	
	public ArrayList<MovieDTO> movieList(){
		ArrayList<MovieDTO> movielist = new ArrayList<MovieDTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "select * from movie";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setMovie_id(rs.getInt("Movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setMovie_title_sub(rs.getString("Movie_title_sub"));
				dto.setMovie_year(rs.getInt("Movie_year"));
				dto.setMovie_story(rs.getString("Movie_story"));
				dto.setMovie_director(rs.getString("Movie_director"));
				dto.setMovie_cast(rs.getString("Movie_cast"));
				dto.setMovie_genres(rs.getString("Movie_genres"));
				dto.setMovie_runtime(rs.getInt("Movie_runtime"));
				dto.setMovie_counrty(rs.getString("Movie_country"));
				dto.setMovie_poster(rs.getString("Movie_poster"));	
				movielist.add(dto);
			}	
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return movielist;
	}
	
}
