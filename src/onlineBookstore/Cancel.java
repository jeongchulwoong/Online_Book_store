package onlineBookstore;

import java.sql.ResultSet;
import java.util.Date;

public class Cancel {

	private String cancelNo;
	private String purchaseNo;
	private String clientId;
	private String reason;
	private java.sql.Date cancelDate;
	
	public Cancel() {
		
	}
	
	public Cancel(String purchaseNo, String clientId, String reason) {
		this.purchaseNo=purchaseNo; this.clientId=clientId; this.reason=reason;
		
		setCancelNoDate(purchaseNo);
	}
	
	public Cancel(String cancelNo, String purchaseNo, String clientId, String reason, java.sql.Date cancelDate) {
		this.cancelNo=cancelNo; this.purchaseNo=purchaseNo; this.clientId=clientId; this.reason=reason; this.cancelDate=cancelDate;
	}
	
	public void setCancelNoDate(String purchaseNo) {
		this.cancelNo="c" + purchaseNo;
		this.cancelDate = new java.sql.Date((new Date()).getTime());
	}
	
	public void output() {
		System.out.print(" * 취소 번호: " + cancelNo);
	}
	
	
	//***************getter, setter 메소드 ***************
	public String getCancelNo() {
		return cancelNo;
	}
	public void setCancelNo(String cancelNo) {
		this.cancelNo = cancelNo;
	}
	
	public String getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId=clientId;
	}
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public java.sql.Date getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(java.sql.Date cancelDate) {
		this.cancelDate = cancelDate;
	}
}
