package onlineBookstore;

import java.sql.ResultSet;

public class Event {

	private int eventNo; //책 일련번호
	private int managerNo;
	private java.sql.Date dateStart;
	private java.sql.Date dateEnd;
	private int discountRate;
	
	public Event() {
		
	}
	
	public Event(int eventNo, int managerNo, java.sql.Date dateStart, java.sql.Date dateEnd, int discountRate) {
		this.eventNo = eventNo;
		this.managerNo = managerNo;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.discountRate = discountRate;
	}
	public Event(int managerNo, java.sql.Date dateStart, java.sql.Date dateEnd, int discountRate) {
		this.managerNo = managerNo;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.discountRate = discountRate;
		
		setEventNoForEnrol();
	}
	public void setEventNoForEnrol() {
		ResultSet rs = DB.getAllEventRS();
		this.eventNo = DB.getNextSerial(rs);
	}
	
	public void output() {
		System.out.print(" * 이벤트의 일련번호 : " + eventNo);
	}

	
	
	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public java.sql.Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(java.sql.Date dateStart) {
		this.dateStart = dateStart;
	}

	public java.sql.Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(java.sql.Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	
}
