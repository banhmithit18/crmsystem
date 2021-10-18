package sopvn.crmsystem.view;

public class serviceCalendarView {
	private String userFullname;
	private String assignedDate;
	private int serviceCalendarId;
	
	
	public int getServiceCalendarId() {
		return serviceCalendarId;
	}
	public void setServiceCalendarId(int serviceCalendarId) {
		this.serviceCalendarId = serviceCalendarId;
	}
	public String getUserFullname() {
		return userFullname;
	}
	public void setUserFullname(String userFullname) {
		this.userFullname = userFullname;
	}
	public String getAssignedDate() {
		return assignedDate;
	}
	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
	}
	
}
