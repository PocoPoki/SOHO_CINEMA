package cinema;

public class CinemaDTO {
	private int cinema_id;
	private int movie_id;
	private int time;
	private int cgv_seat;
	private int lotte_seat;
	private int megabox_seat;
	public int getCinema_id() {
		return cinema_id;
	}
	public void setCinema_id(int cinema_id) {
		this.cinema_id = cinema_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getCgv_seat() {
		return cgv_seat;
	}
	public void setCgv_seat(int cgv_seat) {
		this.cgv_seat = cgv_seat;
	}
	public int getLotte_seat() {
		return lotte_seat;
	}
	public void setLotte_seat(int lotte_seat) {
		this.lotte_seat = lotte_seat;
	}
	public int getMegabox_seat() {
		return megabox_seat;
	}
	public void setMegabox_seat(int megabox_seat) {
		this.megabox_seat = megabox_seat;
	}
	public CinemaDTO(){
		
	}
	public CinemaDTO(int cinema_id, int movie_id, int time, int cgv_seat, int lotte_seat, int megabox_seat) {
		super();
		this.cinema_id = cinema_id;
		this.movie_id = movie_id;
		this.time = time;
		this.cgv_seat = cgv_seat;
		this.lotte_seat = lotte_seat;
		this.megabox_seat = megabox_seat;
	}
	
}

