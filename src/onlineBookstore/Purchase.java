package onlineBookstore;

import java.sql.ResultSet;
import java.util.*;

//고객 객체가 도서 객체를 구매 클래스
public class Purchase {
	private String purchaseNo; //구매번호(primary key)
	private String clientId; //고객 ID
	private int  bookNo; //도서번호
	private java.sql.Date purchaseDate; //구매날짜
	private int purchaseNum; //구매수량
	private int paymentAmount; //지불액
	
	public Purchase() {
	}
	
	//구매 객체 생성 : 구매번호와 구매일이 없는 경우 자동으로 생성
	public Purchase(String clientId, int bookNo, int purchaseNum, int paymentAmount) {
		this.clientId = clientId; this.bookNo = bookNo;
		this.purchaseNum=purchaseNum; this.paymentAmount=paymentAmount;
		
		setPnoPdate(clientId); //구매 객체 생성시 구매번호와 구매날짜 자동저장
	}
	
	//구매 객체 생성
	public Purchase(String purchaseNo, String clientId, int bookNo, java.sql.Date purchaseDate, int purchaseNum, int paymentAmount) {
		this.purchaseNo=purchaseNo; this.clientId = clientId; this.bookNo = bookNo;
		this.purchaseDate=purchaseDate; this.purchaseNum=purchaseNum; this.paymentAmount=paymentAmount;
	}
	
	public void setPnoPdate(String clientId) {
		ResultSet rs = DB.getAllPurchaseOfIdRS(clientId);
		ResultSet rs2 = DB.getAllCancelOfIdRS(clientId);
		int n = DB.getNextSerial(rs) + DB.getNoTuplesRS(rs2);
		this.purchaseNo = clientId.concat(String.format("%03d", n));
		this.purchaseDate = new java.sql.Date((new Date()).getTime());
	}
	
	public void output() {
		System.out.print(" * (구매) 고객 ID: " + clientId + ", 도서 번호: " + bookNo);
	}
	
	
	//***************getter, setter 메소드 ***************
	public String getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo=purchaseNo;
	}
	
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId=clientId;
	}
	
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo=bookNo;
	}
	
	public java.sql.Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(java.sql.Date purchaseDate) {
		this.purchaseDate=purchaseDate;
	}
	
	public int getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(int purchaseNum) {
		this.purchaseNum=purchaseNum;
	}
	
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
}
