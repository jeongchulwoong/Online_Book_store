package onlineBookstore;

import java.sql.ResultSet;
import java.util.*;

//�� ��ü�� ���� ��ü�� ���� Ŭ����
public class Purchase {
	private String purchaseNo; //���Ź�ȣ(primary key)
	private String clientId; //�� ID
	private int  bookNo; //������ȣ
	private java.sql.Date purchaseDate; //���ų�¥
	private int purchaseNum; //���ż���
	private int paymentAmount; //���Ҿ�
	
	public Purchase() {
	}
	
	//���� ��ü ���� : ���Ź�ȣ�� �������� ���� ��� �ڵ����� ����
	public Purchase(String clientId, int bookNo, int purchaseNum, int paymentAmount) {
		this.clientId = clientId; this.bookNo = bookNo;
		this.purchaseNum=purchaseNum; this.paymentAmount=paymentAmount;
		
		setPnoPdate(clientId); //���� ��ü ������ ���Ź�ȣ�� ���ų�¥ �ڵ�����
	}
	
	//���� ��ü ����
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
		System.out.print(" * (����) �� ID: " + clientId + ", ���� ��ȣ: " + bookNo);
	}
	
	
	//***************getter, setter �޼ҵ� ***************
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
