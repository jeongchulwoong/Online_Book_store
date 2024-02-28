package onlineBookstore;

import java.sql.ResultSet;
import java.util.Date;

public class Enroll {
	private String enrollNo;
	private String managerId;
	private int bookNo;
	private java.sql.Date enrollDate;
	
	public Enroll() {
	}
	
	public Enroll(String managerId, int bookNo) {
		this.managerId=managerId; this.bookNo=bookNo;
		
		setEnrollNoDate(managerId, bookNo);
	}
	
	public Enroll(String enrollNo, String managerId, int bookNo, java.sql.Date enrollDate) {
		this.enrollNo=enrollNo; this.managerId=managerId; this.bookNo=bookNo; this.enrollDate=enrollDate;
	}
	
	public void setEnrollNoDate(String managerId, int bookNo) {
		this.enrollNo = managerId.concat(String.format("%03d", bookNo));
		this.enrollDate = new java.sql.Date((new Date()).getTime());
	}
	
	public void output() {
		System.out.print(" * 도서 등록 번호: " + enrollNo);
	}
	
	
	//***************getter, setter 메소드 ***************
	public String getEnrollNo() {
		return enrollNo;
	}
	public void setEnrollNo(String enrollNo) {
		this.enrollNo=enrollNo;
	}
	
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId=managerId;
	}
	
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo=bookNo;
	}
	
	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate=enrollDate;
	}
}
