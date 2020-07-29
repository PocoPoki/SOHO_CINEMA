package movie;

public class MovieDTO {
	private int movie_id;
	private String movie_title;
	private String movie_title_sub;
	private int movie_year;
	private String movie_story;
	private String movie_director;
	private String movie_cast;
	private String movie_genres;
	private int movie_runtime;
	private String movie_country;
	private String movie_poster;
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_title_sub() {
		return movie_title_sub;
	}
	public void setMovie_title_sub(String movie_title_sub) {
		this.movie_title_sub = movie_title_sub;
	}
	public int getMovie_year() {
		return movie_year;
	}
	public void setMovie_year(int movie_year) {
		this.movie_year = movie_year;
	}
	public String getMovie_story() {
		return movie_story;
	}
	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_cast() {
		return movie_cast;
	}
	public void setMovie_cast(String movie_cast) {
		this.movie_cast = movie_cast;
	}
	public String getMovie_genres() {
		return movie_genres;
	}
	public void setMovie_genres(String movie_genres) {
		this.movie_genres = movie_genres;
	}
	public int getMovie_runtime() {
		return movie_runtime;
	}
	public void setMovie_runtime(int movie_runtime) {
		this.movie_runtime = movie_runtime;
	}
	public String getMovie_country() {
		return movie_country;
	}
	public void setMovie_counrty(String movie_country) {
		this.movie_country = movie_country;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	
	public MovieDTO() {
		
	}
	public MovieDTO(int movie_id, String movie_title, String movie_title_sub, int movie_year, String movie_story,
			String movie_director, String movie_cast, String movie_genres, int movie_runtime, String movie_country,
			String movie_poster) {
		super();
		this.movie_id = movie_id;
		this.movie_title = movie_title;
		this.movie_title_sub = movie_title_sub;
		this.movie_year = movie_year;
		this.movie_story = movie_story;
		this.movie_director = movie_director;
		this.movie_cast = movie_cast;
		this.movie_genres = movie_genres;
		this.movie_runtime = movie_runtime;
		this.movie_country = movie_country;
		this.movie_poster = movie_poster;
	}
	
}
