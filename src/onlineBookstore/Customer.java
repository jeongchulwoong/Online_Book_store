package onlineBookstore;

import java.util.*;

//Customer: 고객 클래스

public class Customer {
	private String cid; //고객 로그인 ID
	private String cpw; //고객 로그인 PW
	private String cname; //고객이름
	private String cpn; //고객 전화번호
	private java.sql.Date dateJoin; //회원가입일
	
	public Customer() {
	}
	
	//고객 객체 생성 : 고객번호가 없는 경우 자동으로 고객번호를 생성
	public Customer(String cid, String cpw, String cname, String cpn) {
		this.cid = cid; this.cpw = cpw;
		this.cname = cname; this.cpn = cpn;
		
		setJoinDate(); //고객 객체 생성시 당일날짜를 가져옴
	}
	
	//고객 객체 생성
	public Customer(String cid, String cpw, String cname, String cpn, java.sql.Date dateJoin) {
		this.cid = cid; this.cpw = cpw;
		this.cname = cname; this.cpn = cpn; this.dateJoin = dateJoin;
	}
	
	public void setJoinDate() {
		this.dateJoin = new java.sql.Date((new Date()).getTime());
	}
	
	public void output() {
		System.out.print(" * 고객 이름: " + cname);
	}
	
	
	//***************getter, setter 메소드 ***************
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public String getCpn() {
		return cpn;
	}
	public void setCpn(String cpn) {
		this.cpn = cpn;
	}
	
	public java.sql.Date getDateJoin() {
		return dateJoin;
	}
	public void setDateJoin(java.sql.Date dateJoin) {
		this.dateJoin = dateJoin;
	}
}
