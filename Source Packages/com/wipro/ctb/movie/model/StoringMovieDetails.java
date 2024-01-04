package com.wipro.ctb.movie.model;

public class StoringMovieDetails {
	
	
	private static String movieID;
	private static String moviename;
	private static String poster;
	private static String trailer;
	private static String theatre;
	private static String timings;
	private static String description;
	
	public StoringMovieDetails() {
		
	}
	public StoringMovieDetails(String id,String name)
	{
		super();
		this.movieID=id;
		this.moviename=name;
	}
	
	public static String getMovieID() {
		return movieID;
	}
	public void setMovieID(String movieID) {
		StoringMovieDetails.movieID = movieID;
	}
	public static String getMovieName() {
		return moviename;
	}
	public void setMovieName(String moviename) {
		StoringMovieDetails.moviename = moviename;
	}
	public static String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		StoringMovieDetails.poster = poster;
	}
	public static String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		StoringMovieDetails.trailer = trailer;
	}
	public static String getTheatre() {
		return theatre;
	}
	public void setTheatre(String theatre) {
		StoringMovieDetails.theatre = theatre;
	}
	public static String getTimings() {
		return timings;
	}
	public void setTimings(String timings) {
		StoringMovieDetails.timings = timings;
	}
	public static String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		StoringMovieDetails.description = description;
	}
}
