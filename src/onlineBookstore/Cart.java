package onlineBookstore;

import java.sql.ResultSet;

public class Cart {
	private String cartNo;
	private String clientId;
	private int bookNo;
	private int saleAmount; //���ż���
	
	public Cart() {
	}
	
	public Cart(String clientId, int bookNo, int saleAmount) {
		this.clientId=clientId; this.bookNo=bookNo; this.saleAmount=saleAmount;
		
		setCartNoForAdd(clientId);
	}
	
	public Cart(String cartNo, String clientId, int bookNo, int saleAmount) {
		this.cartNo=cartNo; this.clientId=clientId; this.bookNo=bookNo; this.saleAmount=saleAmount;
	}
	
	public void setCartNoForAdd(String clientId) {
		ResultSet rs = DB.getAllCartsOfIdRS(clientId);
		int n = DB.getNextSerial(rs);
		this.cartNo = clientId.concat(String.format("%04d", n));
	}
	
	public void output() {
		System.out.print(" * (��ٱ���) �� ID: " + clientId + ", ���� ��ȣ: " + bookNo);
	}
	
	//***************getter, setter �޼ҵ� ***************
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo=cartNo;
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
	
	public int getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(int saleAmount) {
		this.saleAmount=saleAmount;
	}
}
