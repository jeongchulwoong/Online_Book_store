package onlineBookstore;

import java.sql.ResultSet;

public class Review {
	private String reviewNo;
	private String purchaseNo;
	private int bookNo;
	private int starPoint;
	
	public Review() {
	}
	
	public Review(String purchaseNo, int bookNo, int starPoint) {
		this.purchaseNo=purchaseNo; this.bookNo=bookNo; this.starPoint=starPoint;
		
		setReviewNoAfterReview(purchaseNo, bookNo);
	}
	
	public Review(String reviewNo, String purchaseNo, int bookNo, int starPoint) {
		this.reviewNo=reviewNo; this.purchaseNo=purchaseNo; this.bookNo=bookNo; this.starPoint=starPoint;
	}
	
	public void setReviewNoAfterReview(String purchaseNo, int bookNo) {
		//Purchase p = DB.getPurchaseByPurchaseNoRS(purchaseNo);
		String bookNoS = String.format("%03d", bookNo);
		this.reviewNo = bookNoS.concat(purchaseNo);
	}
	
	public void output() {
		System.out.print(" * 리뷰 번호: " + reviewNo + ", 구매 번호: " + purchaseNo);
	}
	
	
	//***************getter, setter 메소드 ***************
	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo=reviewNo;
	}
	
	public String getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo=purchaseNo;
	}
	
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo=bookNo;
	}
	
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint=starPoint;
	}
}
