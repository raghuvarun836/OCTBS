package com.wipro.ctb.theatre.model;

public class StoringTheatreDetails {
	private static String theatreID;
	private static String theatreName;
	private static String theatreLocation;
	
	public static String getTheatreID() {
		return theatreID;
	}
	public void setTheatreID(String theatreID) {
		this.theatreID = theatreID;
	}
	public static String getTheatreName() {
		return theatreName;
	}
	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
	}
	public static String getTheatreLocation() {
		return theatreLocation;
	}
	public void setTheatreLocation(String theatreLocation) {
		this.theatreLocation = theatreLocation;
	}
}