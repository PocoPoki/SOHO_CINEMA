package ticket;

public class TicketDTO {
	int ticket_id;
	String movie_title;
	String cinema_name;
	String time;
	int people;
	String seat_id;
	int price;
	String userid;
	
	public int getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
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
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(String seat_id) {
		this.seat_id = seat_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public TicketDTO() {
		
	}
	public TicketDTO(int ticket_id, String movie_title, String cinema_name, String time, int people, String seat_id,
			int price, String userid) {
		super();
		this.ticket_id = ticket_id;
		this.movie_title = movie_title;
		this.cinema_name = cinema_name;
		this.time = time;
		this.people = people;
		this.seat_id = seat_id;
		this.price = price;
		this.userid = userid;
	}
}
