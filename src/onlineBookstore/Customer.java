package onlineBookstore;

import java.util.*;

//Customer: �� Ŭ����

public class Customer {
	private String cid; //�� �α��� ID
	private String cpw; //�� �α��� PW
	private String cname; //���̸�
	private String cpn; //�� ��ȭ��ȣ
	private java.sql.Date dateJoin; //ȸ��������
	
	public Customer() {
	}
	
	//�� ��ü ���� : ����ȣ�� ���� ��� �ڵ����� ����ȣ�� ����
	public Customer(String cid, String cpw, String cname, String cpn) {
		this.cid = cid; this.cpw = cpw;
		this.cname = cname; this.cpn = cpn;
		
		setJoinDate(); //�� ��ü ������ ���ϳ�¥�� ������
	}
	
	//�� ��ü ����
	public Customer(String cid, String cpw, String cname, String cpn, java.sql.Date dateJoin) {
		this.cid = cid; this.cpw = cpw;
		this.cname = cname; this.cpn = cpn; this.dateJoin = dateJoin;
	}
	
	public void setJoinDate() {
		this.dateJoin = new java.sql.Date((new Date()).getTime());
	}
	
	public void output() {
		System.out.print(" * �� �̸�: " + cname);
	}
	
	
	//***************getter, setter �޼ҵ� ***************
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
