package seat;

public class SeatDTO {
	int seat_number;
	String movie_title;
	String cinema_name;
	String time;
	String seat_id;
	public int getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(int seat_number) {
		this.seat_number = seat_number;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getCinema_name() {
		return cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(String seat_id) {
		this.seat_id = seat_id;
	}
	public SeatDTO() {
		
	}
	public SeatDTO(int seat_number, String movie_title, String cinema_name, String time, String seat_id) {
		super();
		this.seat_number = seat_number;
		this.movie_title = movie_title;
		this.cinema_name = cinema_name;
		this.time = time;
		this.seat_id = seat_id;
	}
}
